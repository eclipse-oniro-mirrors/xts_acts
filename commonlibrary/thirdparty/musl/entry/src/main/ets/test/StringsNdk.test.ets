/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import strings from 'libstringsndk.so'

export default function stringsNdkTest() {
  describe('MuslStringsTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0100
     * @tc.name       : testMuslStringsStrcasecmp001
     * @tc.desc       : test strcasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmp001', 0, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0200
     * @tc.name       : testMuslStringsStrcasecmp002
     * @tc.desc       : test strcasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmp002', 0, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0300
     * @tc.name       : testMuslStringsStrcasecmp003
     * @tc.desc       : test strcasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmp003', 0, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0100
     * @tc.name       : testMuslStringsStrcasecmpL001
     * @tc.desc       : test strcasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmpL001', 0, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp_l(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0200
     * @tc.name       : testMuslStringsStrcasecmpL002
     * @tc.desc       : test strcasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmpL002', 0, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp_l(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0300
     * @tc.name       : testMuslStringsStrcasecmpL003
     * @tc.desc       : test strcasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmpL003', 0, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp_l(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0100
     * @tc.name       : testMuslStringsStrncasecmp001
     * @tc.desc       : test strncasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp001', 0, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 10);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0200
     * @tc.name       : testMuslStringsStrncasecmp002
     * @tc.desc       : test strncasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp002', 0, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 10);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0300
     * @tc.name       : testMuslStringsStrncasecmp003
     * @tc.desc       : test strncasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp003', 0, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 2);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0400
     * @tc.name       : testMuslStringsStrncasecmp004
     * @tc.desc       : test strncasecmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp004', 0, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 10);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0100
     * @tc.name       : testMuslStringsStrncasecmpL001
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL001', 0, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, 0);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0200
     * @tc.name       : testMuslStringsStrncasecmpL002
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL002', 0, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, 0);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0300
     * @tc.name       : testMuslStringsStrncasecmpL003
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL003', 0, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 2, 0);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0400
     * @tc.name       : testMuslStringsStrncasecmpL004
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL004', 0, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, 0);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0500
     * @tc.name       : testMuslStringsStrncasecmpL005
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL005', 0, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, -1);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_INDEX_0100
     * @tc.name       : testMuslStringsIndex001
     * @tc.desc       : test index
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsIndex001', 0, async (done:Function) => {

      let param = "ABCDE";
      let result:number = strings.index(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_INDEX_0200
     * @tc.name       : testMuslStringsIndex002
     * @tc.desc       : test index
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsIndex002', 0, async (done:Function) => {

      let param = "AB";
      let result:number = strings.index(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_FFS_0100
     * @tc.name       : testMuslStringsFfs001
     * @tc.desc       : test ffs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStringsFfs001', 0, async (done: Function) => {
      let firstParam = 1;
      let result:number = strings.ffs(firstParam);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_FFSL_0100
     * @tc.name       : testMuslStringsFfsL001
     * @tc.desc       : test ffsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStringsFfsL001', 0, async (done: Function) => {
      let firstParam = 8;
      let result:number = strings.ffsl(firstParam);
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_FFSLL_0100
     * @tc.name       : testMuslStringsFfsLL001
     * @tc.desc       : test ffsll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStringsFfsLL001', 0, async (done: Function) => {
      let firstParam = -2;
      let result:number = strings.ffsll(firstParam);
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_BCMP_0100
     * @tc.name       : testMuslStringsBcmp001
     * @tc.desc       : test bcmp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStringsBcmp001', 0, async (done: Function) => {
      let resultExcept = 0;
      let resultValue:number = strings.bcmp();
      expect(resultValue).assertEqual(resultExcept);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_BCOPY_0100
     * @tc.name       : testMuslStringsBcopy001
     * @tc.desc       : test bcopy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsBcopy001', 0, async (done: Function) => {
      let result:number = strings.bcopy();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_BZERO_0100
     * @tc.name       : testMuslStringsBzero001
     * @tc.desc       : test bzero
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsBzero001', 0, async (done: Function) => {
      let result:number = strings.bzero();
      expect(result).assertEqual(0);
      done()
    });

  })
}