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
  describe("ActsToolChainHapTest_src_functionalext_locale", () => {
    /**
     * @tc.name   localeconv
     * @tc.number SUB_THIRDPARTY_MUSL_LOCALECONV_0100
     * @tc.desc   libc-test localeconv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("localeconv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("localeconv");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   localeconv_multithread
     * @tc.number SUB_THIRDPARTY_MUSL_LOCALECONV_MULTITHREAD_0100
     * @tc.desc   libc-test localeconv_multithread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("localeconv_multithread", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("localeconv_multithread");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   newlocale
     * @tc.number SUB_THIRDPARTY_MUSL_NEWLOCALE_0100
     * @tc.desc   libc-test newlocale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("newlocale", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("newlocale");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setlocale
     * @tc.number SUB_THIRDPARTY_MUSL_SETLOCALE_0100
     * @tc.desc   libc-test setlocale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setlocale", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setlocale");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strtod_l
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOD_L_0100
     * @tc.desc   libc-test strtod_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtod_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtod_l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   uselocale
     * @tc.number SUB_THIRDPARTY_MUSL_USELOCALE_0100
     * @tc.desc   libc-test uselocale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("uselocale", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("uselocale");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstod_l
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOD_L_0100
     * @tc.desc   libc-test wcstod_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstod_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstod_l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   duplocale
     * @tc.number SUB_THIRDPARTY_MUSL_DUPLOCALE_0100
     * @tc.desc   libc-test duplocale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("duplocale", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("duplocale");
      expect(result).assertEqual(0);
      done();
    });
  });
}
