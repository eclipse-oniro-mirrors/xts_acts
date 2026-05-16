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

export default function ctype_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_ctype", () => {
    /**
     * @tc.name   ctype_get_mb_cur_max
     * @tc.number SUB_THIRDPARTY_MUSL_CTYPE_GET_MB_CUR_MAX_0100
     * @tc.desc   libc-test __ctype_get_mb_cur_max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ctype_get_mb_cur_max", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__ctype_get_mb_cur_max");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isalnum
     * @tc.number SUB_THIRDPARTY_MUSL_ISALNUM_0100
     * @tc.desc   libc-test isalnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isalnum", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isalnum");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isalpha
     * @tc.number SUB_THIRDPARTY_MUSL_ISALPHA_0100
     * @tc.desc   libc-test isalpha
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isalpha", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isalpha");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isascii
     * @tc.number SUB_THIRDPARTY_MUSL_ISASCII_0100
     * @tc.desc   libc-test isascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isascii", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isascii");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isblank
     * @tc.number SUB_THIRDPARTY_MUSL_ISBLANK_0100
     * @tc.desc   libc-test isblank
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isblank", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isblank");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iscntrl
     * @tc.number SUB_THIRDPARTY_MUSL_ISCNTRL_0100
     * @tc.desc   libc-test iscntrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iscntrl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iscntrl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isdigit
     * @tc.number SUB_THIRDPARTY_MUSL_ISDIGIT_0100
     * @tc.desc   libc-test isdigit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isdigit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isdigit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isgraph
     * @tc.number SUB_THIRDPARTY_MUSL_ISGRAPH_0100
     * @tc.desc   libc-test isgraph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isgraph", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isgraph");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   islower
     * @tc.number SUB_THIRDPARTY_MUSL_ISLOWER_0100
     * @tc.desc   libc-test islower
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("islower", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("islower");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isprint
     * @tc.number SUB_THIRDPARTY_MUSL_ISPRINT_0100
     * @tc.desc   libc-test isprint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isprint", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isprint");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ispunct
     * @tc.number SUB_THIRDPARTY_MUSL_ISPUNCT_0100
     * @tc.desc   libc-test ispunct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ispunct", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ispunct");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isspace
     * @tc.number SUB_THIRDPARTY_MUSL_ISSPACE_0100
     * @tc.desc   libc-test isspace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isspace", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isspace");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isupper
     * @tc.number SUB_THIRDPARTY_MUSL_ISUPPER_0100
     * @tc.desc   libc-test isupper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isupper", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isupper");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswalhpa
     * @tc.number SUB_THIRDPARTY_MUSL_ISWALHPA_0100
     * @tc.desc   libc-test iswalhpa
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswalhpa", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswalhpa");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswalnum
     * @tc.number SUB_THIRDPARTY_MUSL_ISWALNUM_0100
     * @tc.desc   libc-test iswalnum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswalnum", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswalnum");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswctype
     * @tc.number SUB_THIRDPARTY_MUSL_ISWCTYPE_0100
     * @tc.desc   libc-test iswctype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswctype", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswctype");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isxdigit
     * @tc.number SUB_THIRDPARTY_MUSL_ISXDIGIT_0100
     * @tc.desc   libc-test isxdigit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isxdigit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isxdigit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   toascii
     * @tc.number SUB_THIRDPARTY_MUSL_TOASCII_0100
     * @tc.desc   libc-test toascii
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("toascii", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("toascii");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   towctrans
     * @tc.number SUB_THIRDPARTY_MUSL_TOWCTRANS_0100
     * @tc.desc   libc-test towctrans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("towctrans", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("towctrans");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcswidth
     * @tc.number SUB_THIRDPARTY_MUSL_WCSWIDTH_0100
     * @tc.desc   libc-test wcswidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcswidth", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcswidth");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wctrans
     * @tc.number SUB_THIRDPARTY_MUSL_WCTRANS_0100
     * @tc.desc   libc-test wctrans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wctrans", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wctrans");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wctype
     * @tc.number SUB_THIRDPARTY_MUSL_WCTYPE_0100
     * @tc.desc   libc-test wctype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wctype", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wctype");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcwidth
     * @tc.number SUB_THIRDPARTY_MUSL_WCWIDTH_0100
     * @tc.desc   libc-test wcwidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcwidth", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcwidth");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswblank
     * @tc.number SUB_THIRDPARTY_MUSL_ISWBLANK_0100
     * @tc.desc   libc-test iswblank
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswblank", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswblank");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswcntrl
     * @tc.number SUB_THIRDPARTY_MUSL_ISWCNTRL_0100
     * @tc.desc   libc-test iswcntrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswcntrl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswcntrl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswdigit
     * @tc.number SUB_THIRDPARTY_MUSL_ISWDIGIT_0100
     * @tc.desc   libc-test iswdigit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswdigit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswdigit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswlower
     * @tc.number SUB_THIRDPARTY_MUSL_ISWLOWER_0100
     * @tc.desc   libc-test iswlower
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswlower", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswlower");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswpunct
     * @tc.number SUB_THIRDPARTY_MUSL_ISWPUNCT_0100
     * @tc.desc   libc-test iswpunct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswpunct", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswpunct");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswspace
     * @tc.number SUB_THIRDPARTY_MUSL_ISWSPACE_0100
     * @tc.desc   libc-test iswspace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswspace", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswspace");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswupper
     * @tc.number SUB_THIRDPARTY_MUSL_ISWUPPER_0100
     * @tc.desc   libc-test iswupper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswupper", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswupper");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswxdigit
     * @tc.number SUB_THIRDPARTY_MUSL_ISWXDIGIT_0100
     * @tc.desc   libc-test iswxdigit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswxdigit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswxdigit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   towlower
     * @tc.number SUB_THIRDPARTY_MUSL_TOWLOWER_0100
     * @tc.desc   libc-test towlower
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("towlower", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("towlower");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   towupper
     * @tc.number SUB_THIRDPARTY_MUSL_TOWUPPER_0100
     * @tc.desc   libc-test towupper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("towupper", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("towupper");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   towupper_l
     * @tc.number SUB_THIRDPARTY_MUSL_TOWUPPER_L_0100
     * @tc.desc   libc-test towupper_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("towupper_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("towupper_l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   iswprint
     * @tc.number SUB_THIRDPARTY_MUSL_ISWPRINT_0100
     * @tc.desc   libc-test iswprint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswprint", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswprint");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   iswalpha
     * @tc.number SUB_THIRDPARTY_MUSL_ISWALPHA_0100
     * @tc.desc   libc-test iswalpha
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('iswalpha', Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest('iswalpha');
      expect(result).assertEqual(0);
      done();
    })
  });
}
