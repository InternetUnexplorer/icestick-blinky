name := "icestick-blinky"
version := "0.1"
scalaVersion := "2.13.7"

addCompilerPlugin(
  "edu.berkeley.cs" % "chisel3-plugin" % "3.5.0-RC2" cross CrossVersion.full
)

libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.0-RC2"
