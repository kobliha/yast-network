# encoding: utf-8

# ***************************************************************************
#
# Copyright (c) 2012 Novell, Inc.
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.   See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail,
# you may find current contact information at www.novell.com
#
# **************************************************************************
# A basic syntax check
module Yast
  class IncludeClient < Client
    def main
      Yast.import "UI"
      # wonderful, isn't it? Believe me, you can't live without that.
      # At least if you need Encoding.ycp which is included from somewhere.
      Yast.import "Testsuite"

      @READ = { "probe" => { "architecture" => "i386" } }

      @EXEC = {
        "target" => {
          "bash_output" => { "stdout" => "", "stderr" => "", "exit" => 0 }
        }
      }

      Testsuite.Init([@READ, {}, @EXEC], nil)

      Yast.include self, "network/lan/hardware.rb"

      nil
    end
  end
end

Yast::IncludeClient.new.main
