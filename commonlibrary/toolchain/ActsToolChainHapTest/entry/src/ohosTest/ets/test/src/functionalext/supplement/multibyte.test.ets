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

export default function multibyte_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_multibyte", () => {
    /**
     * @tc.name   c16rtomb
     * @tc.number SUB_THIRDPARTY_MUSL_C_ONE_SIX_RTOMB_0100
     * @tc.desc   libc-test c16rtomb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("c16rtomb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("c16rtomb");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   c32rtomb
     * @tc.number SUB_THIRDPARTY_MUSL_C_THREE_TWO_RTOMB_0100
     * @tc.desc   libc-test c32rtomb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("c32rtomb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("c32rtomb");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mblen
     * @tc.number SUB_THIRDPARTY_MUSL_MBLEN_0100
     * @tc.desc   libc-test mblen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mblen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mblen");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mbrtoc16
     * @tc.number SUB_THIRDPARTY_MUSL_MBRTOC_ONE_SIX_0100
     * @tc.desc   libc-test mbrtoc16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbrtoc16", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbrtoc16");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mbrtoc32
     * @tc.number SUB_THIRDPARTY_MUSL_MBRTOC_THREE_TWO_0100
     * @tc.desc   libc-test mbrtoc32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbrtoc32", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbrtoc32");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mbsinit
     * @tc.number SUB_THIRDPARTY_MUSL_MBSINIT_0100
     * @tc.desc   libc-test mbsinit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbsinit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbsinit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mbsnrtowcs
     * @tc.number SUB_THIRDPARTY_MUSL_MBSNRTOWCS_0100
     * @tc.desc   libc-test mbsnrtowcs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbsnrtowcs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbsnrtowcs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mbstowcs
     * @tc.number SUB_THIRDPARTY_MUSL_MBSTOWCS_0100
     * @tc.desc   libc-test mbstowcs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbstowcs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbstowcs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mbtowc
     * @tc.number SUB_THIRDPARTY_MUSL_MBTOWC_0100
     * @tc.desc   libc-test mbtowc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbtowc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbtowc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsrtombs
     * @tc.number SUB_THIRDPARTY_MUSL_WCSRTOMBS_0100
     * @tc.desc   libc-test wcsrtombs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsrtombs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsrtombs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstombs
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOMBS_0100
     * @tc.desc   libc-test wcstombs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstombs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstombs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wctob
     * @tc.number SUB_THIRDPARTY_MUSL_WCTOB_0100
     * @tc.desc   libc-test wctob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wctob", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wctob");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wctomb
     * @tc.number SUB_THIRDPARTY_MUSL_WCTOMB_0100
     * @tc.desc   libc-test wctomb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wctomb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wctomb");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsnrtombs
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNRTOMBS_0100
     * @tc.desc   libc-test wcsnrtombs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsnrtombs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsnrtombs");
      expect(result).assertEqual(0);
      done();
    });
  });
}
