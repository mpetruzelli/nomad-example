job "branch-pruner" {
  datacenters = ["mgmt"]

  type = "batch"

  group "build-and-run" {
    count = 1
    task "build" {
      driver = "exec"

      config {
        command = "/usr/bin/touch"
        args = ["alloc/testfile"]
      }

      resources {
        cpu = 100 # Mhz
        memory = 128 # MB
      }

      lifecycle {
        hook    = "prestart"
        sidecar = false
      }
    }
    task "run" {
      driver = "exec"

      config {
        command = "/bin/ls"
        args = ["alloc/"]
      }
      resources {
        cpu = 100 # Mhz
        memory = 128 # MB
      }
    }
  }
}
