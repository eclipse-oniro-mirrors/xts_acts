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

export default function eabi_group_test() {
  describe("ActsToolChainHapTest_src_eabi", () => {
    /**
     * @tc.name   aeabi_memclr
     * @tc.number SUB_THIRDPARTY_MUSL_AEABI_MEMCLR_0100
     * @tc.desc   libc-test __aeabi_memclr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("aeabi_memclr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__aeabi_memclr");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   aeabi_memcpy
     * @tc.number SUB_THIRDPARTY_MUSL_AEABI_MEMCPY_0100
     * @tc.desc   libc-test __aeabi_memcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("aeabi_memcpy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__aeabi_memcpy");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   aeabi_memmove
     * @tc.number SUB_THIRDPARTY_MUSL_AEABI_MEMMOVE_0100
     * @tc.desc   libc-test __aeabi_memmove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("aeabi_memmove", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__aeabi_memmove");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   aeabi_read_tp
     * @tc.number SUB_THIRDPARTY_MUSL_AEABI_READ_TP_0100
     * @tc.desc   libc-test __aeabi_read_tp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("aeabi_read_tp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__aeabi_read_tp");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   gmtime64
     * @tc.number SUB_THIRDPARTY_MUSL_GMTIME_SIX_FOUR_0100
     * @tc.desc   libc-test __gmtime64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gmtime64", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__gmtime64");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sigtimedwait_time64
     * @tc.number SUB_THIRDPARTY_MUSL_SIGTIMEDWAIT_TIME_SIX_FOUR_0100
     * @tc.desc   libc-test __sigtimedwait_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigtimedwait_time64", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__sigtimedwait_time64");
      expect(result).assertEqual(0);
      done();
    });
  });
}
