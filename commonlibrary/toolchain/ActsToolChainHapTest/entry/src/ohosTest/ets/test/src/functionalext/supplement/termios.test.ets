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

export default function termios_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_termios", () => {
    /**
     * @tc.name   cfgetispeed
     * @tc.number SUB_THIRDPARTY_MUSL_CFGETISPEED_0100
     * @tc.desc   libc-test cfgetispeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cfgetispeed", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cfgetispeed");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cfgetospeed
     * @tc.number SUB_THIRDPARTY_MUSL_CFGETOSPEED_0100
     * @tc.desc   libc-test cfgetospeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cfgetospeed", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cfgetospeed");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cfmakeraw
     * @tc.number SUB_THIRDPARTY_MUSL_CFMAKERAW_0100
     * @tc.desc   libc-test cfmakeraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cfmakeraw", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cfmakeraw");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cfsetispeed
     * @tc.number SUB_THIRDPARTY_MUSL_CFSETISPEED_0100
     * @tc.desc   libc-test cfsetispeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cfsetispeed", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cfsetispeed");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cfsetospeed
     * @tc.number SUB_THIRDPARTY_MUSL_CFSETOSPEED_0100
     * @tc.desc   libc-test cfsetospeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cfsetospeed", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cfsetospeed");
      expect(result).assertEqual(0);
      done();
    });
  });
}
