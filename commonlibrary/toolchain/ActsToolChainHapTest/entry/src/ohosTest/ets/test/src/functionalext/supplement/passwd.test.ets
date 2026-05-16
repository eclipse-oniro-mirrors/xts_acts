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

export default function FunctionalextSupplementPasswdTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_passwd", () => {
    /**
     * @tc.name   getgrent
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_0100
     * @tc.desc   libc-test getgrent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgrent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgrent");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getgrgid
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRGID_0100
     * @tc.desc   libc-test getgrgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgrgid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgrgid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getgrgid_r
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRGID_R_0100
     * @tc.desc   libc-test getgrgid_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgrgid_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgrgid_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getgrnam
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRNAM_0100
     * @tc.desc   libc-test getgrnam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgrnam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgrnam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getgrnam_r
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRNAM_R_0100
     * @tc.desc   libc-test getgrnam_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgrnam_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgrnam_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getgrouplist
     * @tc.number SUB_THIRDPARTY_MUSL_GETGROUPLIST_0100
     * @tc.desc   libc-test getgrouplist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getgrouplist", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getgrouplist");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setgrent
     * @tc.number SUB_THIRDPARTY_MUSL_SETGRENT_0100
     * @tc.desc   libc-test setgrent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setgrent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setgrent");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setpwent
     * @tc.number SUB_THIRDPARTY_MUSL_SETPWENT_0100
     * @tc.desc   libc-test setpwent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setpwent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setpwent");
      expect(result).assertEqual(0);
      done();
    });
  });
}
