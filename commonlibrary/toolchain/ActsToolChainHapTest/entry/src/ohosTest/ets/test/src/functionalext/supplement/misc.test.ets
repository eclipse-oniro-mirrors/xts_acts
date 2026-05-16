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

export default function misc_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_misc", () => {
    /**
     * @tc.name   ffs
     * @tc.number SUB_THIRDPARTY_MUSL_FFS_0100
     * @tc.desc   libc-test ffs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ffs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ffs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ffsl
     * @tc.number SUB_THIRDPARTY_MUSL_FFSL_0100
     * @tc.desc   libc-test ffsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ffsl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ffsl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ffsll
     * @tc.number SUB_THIRDPARTY_MUSL_FFSLL_0100
     * @tc.desc   libc-test ffsll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ffsll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ffsll");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getauxval
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0100
     * @tc.desc   libc-test getauxval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getauxval", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getauxval");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getdomainname
     * @tc.number SUB_THIRDPARTY_MUSL_GETDOMAINNAME_0100
     * @tc.desc   libc-test getdomainname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getdomainname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getdomainname");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getentropy
     * @tc.number SUB_THIRDPARTY_MUSL_GETENTROPY_0100
     * @tc.desc   libc-test getentropy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getentropy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getentropy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getopt
     * @tc.number SUB_THIRDPARTY_MUSL_GETOPT_0100
     * @tc.desc   libc-test getopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getopt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getopt");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getopt_long
     * @tc.number SUB_THIRDPARTY_MUSL_GETOPT_LONG_0100
     * @tc.desc   libc-test getopt_long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getopt_long", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getopt_long");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getopt_long_only
     * @tc.number SUB_THIRDPARTY_MUSL_GETOPT_LONG_ONLY_0100
     * @tc.desc   libc-test getopt_long_only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getopt_long_only", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getopt_long_only");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getresuid
     * @tc.number SUB_THIRDPARTY_MUSL_GETRESUID_0100
     * @tc.desc   libc-test getresuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getresuid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getresuid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getrlimit
     * @tc.number SUB_THIRDPARTY_MUSL_GETRLIMIT_0100
     * @tc.desc   libc-test getrlimit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getrlimit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getrlimit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getsubopt
     * @tc.number SUB_THIRDPARTY_MUSL_GETSUBOPT_0100
     * @tc.desc   libc-test getsubopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getsubopt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getsubopt");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hasmntopt
     * @tc.number SUB_THIRDPARTY_MUSL_HASMNTOPT_0100
     * @tc.desc   libc-test hasmntopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hasmntopt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hasmntopt");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   login_tty
     * @tc.number SUB_THIRDPARTY_MUSL_LOGIN_TTY_0100
     * @tc.desc   libc-test login_tty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("login_tty", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("login_tty");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ptsname
     * @tc.number SUB_THIRDPARTY_MUSL_PTSNAME_0100
     * @tc.desc   libc-test ptsname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ptsname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ptsname");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   realpath
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_0100
     * @tc.desc   libc-test realpath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("realpath", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("realpath");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setlogmask
     * @tc.number SUB_THIRDPARTY_MUSL_SETLOGMASK_0100
     * @tc.desc   libc-test setlogmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setlogmask", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setlogmask");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   uname
     * @tc.number SUB_THIRDPARTY_MUSL_UNAME_0100
     * @tc.desc   libc-test uname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("uname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("uname");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   a64l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_A_SIXTY_FOUR_L_BASIC_0100
     * @tc.desc   libc-test a64l
     */
    it("a64l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("a64l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   endmntent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_ENDMNTENT_0100
     * @tc.desc   libc-test endmntent
     */
    it("endmntent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("endmntent");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   forkpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FORKPTY_0100
     * @tc.desc   libc-test forkpty
     */
    it("forkpty", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("forkpty");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getmntent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GETMNTENT_0100
     * @tc.desc   libc-test getmntent
     */
    it("getmntent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getmntent");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getmntent_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GETMNTENT_R_0100
     * @tc.desc   libc-test getmntent_r
     */
    it("getmntent_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getmntent_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getrusage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GETRUSAGE_0100
     * @tc.desc   libc-test getrusage
     */
    it("getrusage", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getrusage");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ioctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_IOCTL_0100
     * @tc.desc   libc-test ioctl
     */
    it("ioctl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ioctl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lockf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_LOCKF_0100
     * @tc.desc   libc-test lockf
     */
    it("lockf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lockf");
      expect(result).assertEqual(0);
      done();
    });

  });
}
