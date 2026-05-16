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

export default function conf_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_conf", () => {
    /**
     * @tc.name   get_avphys_pages
     * @tc.number SUB_THIRDPARTY_MUSL_GET_AVPHYS_PAGES_0100
     * @tc.desc   libc-test get_avphys_pages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("get_avphys_pages", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("get_avphys_pages");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   get_nprocs
     * @tc.number SUB_THIRDPARTY_MUSL_GET_NPROCS_0100
     * @tc.desc   libc-test get_nprocs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("get_nprocs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("get_nprocs");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   get_phys_pages
     * @tc.number SUB_THIRDPARTY_MUSL_GET_PHYS_PAGES_0100
     * @tc.desc   libc-test get_phys_pages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("get_phys_pages", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("get_phys_pages");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fpathconf
     * @tc.number SUB_THIRDPARTY_MUSL_FPATHCONF_0100
     * @tc.desc   libc-test fpathconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fpathconf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fpathconf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pathconf
     * @tc.number SUB_THIRDPARTY_MUSL_PATHCONF_0100
     * @tc.desc   libc-test pathconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pathconf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pathconf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sysconf
     * @tc.number SUB_THIRDPARTY_MUSL_SYSCONF_0100
     * @tc.desc   libc-test sysconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sysconf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sysconf");
      expect(result).assertEqual(0);
      done();
    });
  });
}
