# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GetRobotCode < Formula
    desc ""
    homepage ""
    version "latest"
    url "file:///dev/null"
    sha256 ""
    license ""

    depends_on "wget"
  
    # depends_on "cmake" => :build
  
    def install
      (bin+"mmm-get-robot-code").write <<-END_FILE.unindent
            #!/usr/bin/env bash
            echo Initializing adb
            adb devices
            echo Downloading
            wget -O TeamCode.apk https://github.com/ManchesterMachineMakers/FreightFrenzy/releases/download/latest/TeamCode-release-FULL_ROBOT.apk
            echo Uninstalling previous version
            adb uninstall com.qualcomm.ftcrobotcontroller
            echo Installing new version
            adb install ./TeamCode.apk
            echo Done
            END_FILE
    end
  
    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test get-robot-code`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "true"
    end
  end
  