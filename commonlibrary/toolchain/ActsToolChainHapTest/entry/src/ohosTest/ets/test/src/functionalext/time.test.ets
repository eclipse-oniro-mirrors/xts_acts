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

export default function time_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_time", () => {
    /**
     * @tc.name   ctime
     * @tc.number SUB_THIRDPARTY_MUSL_CTIME_0100
     * @tc.desc   libc-test ctime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ctime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ctime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ctime_r
     * @tc.number SUB_THIRDPARTY_MUSL_CTIME_R_0100
     * @tc.desc   libc-test ctime_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ctime_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ctime_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   asctime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_ASCTIME_0100
     * @tc.desc   libc-test asctime
     */
    it("asctime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asctime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asctime_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_ASCTIME_R_0100
     * @tc.desc   libc-test asctime_r
     */
    it("asctime_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asctime_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   difftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_DIFFTIME_0100
     * @tc.desc   libc-test difftime
     */
    it("difftime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("difftime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   gmtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GMTIME_0100
     * @tc.desc   libc-test gmtime
     */
    it("gmtime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gmtime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   gmtime_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GMTIME_R_0100
     * @tc.desc   libc-test gmtime_r
     */
    it("gmtime_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gmtime_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   localtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_LOCALTIME_0100
     * @tc.desc   libc-test localtime
     */
    it("localtime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("localtime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   localtime_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_LOCALTIME_R_0100
     * @tc.desc   libc-test localtime_r
     */
    it("localtime_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("localtime_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   mktime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_0100
     * @tc.desc   libc-test mktime
     */
    it("mktime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mktime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strftime_ext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_STRFTIME_EXT_0100
     * @tc.desc   libc-test strftime_ext
     */
    it("strftime_ext", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strftime_ext");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_STRFTIME_L_0100
     * @tc.desc   libc-test strftime_l
     */
    it("strftime_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strftime_l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strptime_ext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_STRPTIME_EXT_0100
     * @tc.desc   libc-test strptime_ext
     */
    it("strptime_ext", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strptime_ext");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   timegm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_TIMEGM_0100
     * @tc.desc   libc-test timegm
     */
    it("timegm", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timegm");
      expect(result).assertEqual(0);
      done();
    });

  });
}
