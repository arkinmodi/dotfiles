return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local system = "unix"
		if vim.fn.has("macunix") then
			system = "mac"
		end

		local arch = ""
		if vim.fn.system("uname -p") == "arm\n" then
			arch = "_arm"
		end

		local jdtls_home = vim.fn.glob("~/opt/java/jdtls-*/jdt-language-server-*")
		if jdtls_home == nil or jdtls_home == "" then
			print("failed to find JDTLS install directory")
			return
		end

		local jar = vim.fn.glob(jdtls_home .. "/plugins/org.eclipse.equinox.launcher_*.jar")
		local configuration = vim.fn.glob(jdtls_home .. "/config_" .. system .. arch)

		local cache = vim.fn.stdpath("cache")
		local root_dir_path = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
		local project_name = vim.fn.fnamemodify(root_dir_path, ":p:h:t")
		local data = cache .. "/jdtls/workspace/" .. project_name

		local lombok_java_agent = "-javaagent:" .. vim.fn.glob("~/opt/java/lombok.jar")

		local runtimes = {}
		if os.getenv("JDK8") then
			table.insert(runtimes, { name = "JavaSE-1.8", path = os.getenv("JDK8") })
		end
		if os.getenv("JDK11") then
			table.insert(runtimes, { name = "JavaSE-11", path = os.getenv("JDK11") })
		end
		if os.getenv("JDK17") then
			table.insert(runtimes, { name = "JavaSE-17", path = os.getenv("JDK17") })
		end
		if os.getenv("JDK21") then
			table.insert(runtimes, { name = "JavaSE-21", path = os.getenv("JDK21") })
		end

		local bundles = {
			vim.fn.glob(
				"~/opt/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		}
		vim.list_extend(
			bundles,
			vim.split(vim.fn.glob("~/opt/java/vscode-java-test/server/*.jar", 1), "\n")
		)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ConfigJDTLS", { clear = true }),
			pattern = "java",
			callback = function()
				require("jdtls").start_or_attach({
					cmd = {
						"java",
						"-Declipse.application=org.eclipse.jdt.ls.core.id1",
						"-Dosgi.bundles.defaultStartLevel=4",
						"-Declipse.product=org.eclipse.jdt.ls.core.product",
						"-Dlog.protocol=true",
						"-Dlog.level=ALL",
						"-Xmx1g",
						"--add-modules=ALL-SYSTEM",
						"--add-opens",
						"java.base/java.util=ALL-UNNAMED",
						"--add-opens",
						"java.base/java.lang=ALL-UNNAMED",
						lombok_java_agent,
						"-jar",
						jar,
						"--jvm-arg=" .. lombok_java_agent,
						"-configuration",
						configuration,
						"-data",
						data,
					},

					settings = {
						java = {
							configuration = {
								runtimes = runtimes,
							},
						},
					},

					init_options = {
						bundles = bundles,
					},
				})
			end,
		})
	end,
}
