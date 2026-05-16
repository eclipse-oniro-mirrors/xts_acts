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

export default function sched_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_sched", () => {
    /**
     * @tc.name   sched_cpucount
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_CPUCOUNT_BASIC_0100
     * @tc.desc   libc-test __sched_cpucount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_cpucount", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__sched_cpucount");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sched_getaffinity
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_GETAFFINITY_0100
     * @tc.desc   libc-test sched_getaffinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_getaffinity", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_getaffinity");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sched_rr_get_interval
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_RR_GET_INTERVAL_0100
     * @tc.desc   libc-test sched_rr_get_interval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_rr_get_interval", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_rr_get_interval");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sched_setaffinity
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SETAFFINITY_0100
     * @tc.desc   libc-test sched_setaffinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_setaffinity", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_setaffinity");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sched_yield
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_YIELD_0100
     * @tc.desc   libc-test sched_yield
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_yield", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_yield");
      expect(result).assertEqual(0);
      done();
    });
  });
}
