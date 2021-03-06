defmodule NervesSystemRpi3Sdr.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_rpi3_sdr,
     version: @version,
     elixir: "~> 1.5",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]]
  end

  def application do
   []
  end

  defp deps do
    [{:nerves, "~> 0.7", runtime: false },
     {:nerves_system_br, "~> 0.13.0", runtime: false },
     {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 0.10.0", runtime: false}]
  end

  defp description do
   """
   Nerves custom system for SDR on Raspberry Pi 3
   """
  end

  defp package do
   [maintainers: ["Jeff Smith"],
    files: ["LICENSE", "mix.exs", "nerves_defconfig", "nerves.exs", "README.md", "VERSION", "rootfs-additions", "fwup.conf", "cmdline.txt", "linux-4.4.defconfig", "config.txt", "post-createfs.sh", "package", "external.mk", "Config.in"],
    licenses: ["Apache 2.0"],
    links: %{"Github" => "https://github.com/electricshaman/nerves_system_rpi3_sdr"}]
  end
end
