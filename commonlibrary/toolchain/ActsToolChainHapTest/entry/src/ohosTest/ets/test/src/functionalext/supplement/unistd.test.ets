/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function unistd_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_unistd", () => {
    /**
     * @tc.name   alarm
     * @tc.number SUB_THIRDPARTY_MUSL_ALARM_0100
     * @tc.desc   libc-test alarm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("alarm", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("alarm");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   chdir
     * @tc.number SUB_THIRDPARTY_MUSL_CHDIR_0100
     * @tc.desc   libc-test chdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("chdir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("chdir");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ctermid
     * @tc.number SUB_THIRDPARTY_MUSL_CTERMID_0100
     * @tc.desc   libc-test ctermid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ctermid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ctermid");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getcwd
     * @tc.number SUB_THIRDPARTY_MUSL_GETCWD_0100
     * @tc.desc   libc-test getcwd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getcwd", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getcwd");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getgroups
     * @tc.number SUB_THIRDPARTY_MUSL_GETGROUPS_0100
     * @tc.desc   libc-test getgroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgroups", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgroups");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getlogin
     * @tc.number SUB_THIRDPARTY_MUSL_GETLOGIN_0100
     * @tc.desc   libc-test getlogin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getlogin", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getlogin");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getlogin_r
     * @tc.number SUB_THIRDPARTY_MUSL_GETLOGIN_R_0100
     * @tc.desc   libc-test getlogin_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getlogin_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getlogin_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getpgid
     * @tc.number SUB_THIRDPARTY_MUSL_GETPGID_0100
     * @tc.desc   libc-test getpgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getpgid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getpgid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getpgrp
     * @tc.number SUB_THIRDPARTY_MUSL_GETPGRP_0100
     * @tc.desc   libc-test getpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getpgrp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getpgrp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getppid
     * @tc.number SUB_THIRDPARTY_MUSL_GETPPID_0100
     * @tc.desc   libc-test getppid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getppid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getppid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getsid
     * @tc.number SUB_THIRDPARTY_MUSL_GETSID_0100
     * @tc.desc   libc-test getsid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getsid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getsid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   link
     * @tc.number SUB_THIRDPARTY_MUSL_LINK_0100
     * @tc.desc   libc-test link
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("link", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("link");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pause
     * @tc.number SUB_THIRDPARTY_MUSL_PAUSE_0100
     * @tc.desc   libc-test pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pause", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pause");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pipe2
     * @tc.number SUB_THIRDPARTY_MUSL_PIPE_TWO_0100
     * @tc.desc   libc-test pipe2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pipe2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pipe2");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setsid
     * @tc.number SUB_THIRDPARTY_MUSL_SETSID_0100
     * @tc.desc   libc-test setsid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setsid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setsid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sleep
     * @tc.number SUB_THIRDPARTY_MUSL_SLEEP_0100
     * @tc.desc   libc-test sleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sleep", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sleep");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   usleep
     * @tc.number SUB_THIRDPARTY_MUSL_USLEEP_0100
     * @tc.desc   libc-test usleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("usleep", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("usleep");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   writev
     * @tc.number SUB_THIRDPARTY_MUSL_WRITEV_0100
     * @tc.desc   libc-test writev
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("writev", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("writev");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   write
     * @tc.number SUB_THIRDPARTY_MUSL_WRITE_0100
     * @tc.desc   libc-test write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("write", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("write");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   dup3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_DUP_THREE_BASIC_0100
     * @tc.desc   libc-test dup3
     */
    it("dup3", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dup3");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   faccessat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FACCESSAT_0100
     * @tc.desc   libc-test faccessat
     */
    it("faccessat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("faccessat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fchown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FCHOWN_0100
     * @tc.desc   libc-test fchown
     */
    it("fchown", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fchown");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fchownat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FCHOWNAT_0100
     * @tc.desc   libc-test fchownat
     */
    it("fchownat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fchownat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fdatasync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FDATASYNC_0100
     * @tc.desc   libc-test fdatasync
     */
    it("fdatasync", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdatasync");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FSYNC_0100
     * @tc.desc   libc-test fsync
     */
    it("fsync", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fsync");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ftruncate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FTRUNCATE_0100
     * @tc.desc   libc-test ftruncate
     */
    it("ftruncate", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ftruncate");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_READ_0100
     * @tc.desc   libc-test read
     */
    it("read", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("read");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   readv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_READV_0100
     * @tc.desc   libc-test readv
     */
    it("readv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("readv");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   renameat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RENAMEAT_0100
     * @tc.desc   libc-test renameat
     */
    it("renameat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("renameat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   symlinkat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SYMLINKAT_0100
     * @tc.desc   libc-test symlinkat
     */
    it("symlinkat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("symlinkat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ttyname_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_TTYNAME_R_0100
     * @tc.desc   libc-test ttyname_r
     */
    it("ttyname_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ttyname_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   unlink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_UNLINK_0100
     * @tc.desc   libc-test unlink
     */
    it("unlink", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("unlink");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   unlinkat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_UNLINKAT_0100
     * @tc.desc   libc-test unlinkat
     */
    it("unlinkat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("unlinkat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fchdir
     * @tc.number SUB_THIRDPARTY_MUSL_FCHDIR_0100
     * @tc.desc   libc-test fchdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fchdir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fchdir");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   nice
     * @tc.number SUB_THIRDPARTY_MUSL_NICE_0100
     * @tc.desc   libc-test nice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nice", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nice");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   access
     * @tc.number SUB_THIRDPARTY_MUSL_ACCESS_0100
     * @tc.desc   libc-test access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("access", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("access");
      expect(result).assertEqual(0);
      done();
    });

  });
}
