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

export default function locale_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_locale", () => {
    /**
     * @tc.name   duplocale_sup
     * @tc.number SUB_THIRDPARTY_MUSL_DUPLOCALE_SUP_0100
     * @tc.desc   libc-test duplocale_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("duplocale_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("duplocale_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   langinfo_sup
     * @tc.number SUB_THIRDPARTY_MUSL_LANGINFO_SUP_0100
     * @tc.desc   libc-test langinfo_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("langinfo_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("langinfo_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcscoll
     * @tc.number SUB_THIRDPARTY_MUSL_WCSCOLL_0100
     * @tc.desc   libc-test wcscoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcscoll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcscoll");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsxfrm
     * @tc.number SUB_THIRDPARTY_MUSL_WCSXFRM_0100
     * @tc.desc   libc-test wcsxfrm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsxfrm", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsxfrm");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   localeconv_sup
     * @tc.number SUB_THIRDPARTY_MUSL_LOCALECONV_SUP_0100
     * @tc.desc   libc-test localeconv_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("localeconv_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("localeconv_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   newlocale_sup
     * @tc.number SUB_THIRDPARTY_MUSL_NEWLOCALE_SUP_0100
     * @tc.desc   libc-test newlocale_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("newlocale_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("newlocale_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setlocale_sup
     * @tc.number SUB_THIRDPARTY_MUSL_SETLOCALE_SUP_0100
     * @tc.desc   libc-test setlocale_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setlocale_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setlocale_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   uselocale_sup
     * @tc.number SUB_THIRDPARTY_MUSL_USELOCALE_SUP_0100
     * @tc.desc   libc-test uselocale_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("uselocale_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("uselocale_sup");
      expect(result).assertEqual(0);
      done();
    });
  });
}
