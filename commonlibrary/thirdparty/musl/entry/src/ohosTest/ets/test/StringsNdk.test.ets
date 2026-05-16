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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import strings from 'libstringsndk.so'

export default function stringsNdkTest() {
  describe('MuslStringsTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStringsStrcasecmp001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0100
     * @tc.desc   test strcasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrcasecmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrcasecmp002
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0200
     * @tc.desc   test strcasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrcasecmp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrcasecmp003
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0300
     * @tc.desc   test strcasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrcasecmp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrcasecmpL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0100
     * @tc.desc   test strcasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrcasecmpL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp_l(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrcasecmpL002
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0200
     * @tc.desc   test strcasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrcasecmpL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp_l(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrcasecmpL003
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0300
     * @tc.desc   test strcasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrcasecmpL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strcasecmp_l(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmp001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0100
     * @tc.desc   test strncasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 10);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmp002
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0200
     * @tc.desc   test strncasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 10);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmp003
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0300
     * @tc.desc   test strncasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 2);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmp004
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0400
     * @tc.desc   test strncasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp(firstParam, secondParam, 10);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmpL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0100
     * @tc.desc   test strncasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmpL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, 0);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmpL002
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0200
     * @tc.desc   test strncasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmpL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, 0);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmpL003
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0300
     * @tc.desc   test strncasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmpL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 2, 0);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmpL004
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0400
     * @tc.desc   test strncasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmpL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, 0);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringsStrncasecmpL005
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0500
     * @tc.desc   test strncasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsStrncasecmpL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "efg"
      let secondParam = "abcd"
      let result:number = strings.strncasecmp_l(firstParam, secondParam, 10, -1);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslStringsIndex001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_INDEX_0100
     * @tc.desc   test index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {

      let param = "ABCDE";
      let result:number = strings.index(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStringsIndex002
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_INDEX_0200
     * @tc.desc   test index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {

      let param = "AB";
      let result:number = strings.index(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStringsFfs001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_FFS_0100
     * @tc.desc   test ffs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsFfs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let result:number = strings.ffs(firstParam);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStringsFfsL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_FFSL_0100
     * @tc.desc   test ffsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsFfsL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 8;
      let result:number = strings.ffsl(firstParam);
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.name   testMuslStringsFfsLL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_FFSLL_0100
     * @tc.desc   test ffsll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsFfsLL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = -2;
      let result:number = strings.ffsll(firstParam);
      expect(result).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMuslStringsBcmp001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_BCMP_0100
     * @tc.desc   test bcmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsBcmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultExcept = 0;
      let resultValue:number = strings.bcmp();
      expect(resultValue).assertEqual(resultExcept);
      done()
    });

    /**
     * @tc.name   testMuslStringsBcopy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_BCOPY_0100
     * @tc.desc   test bcopy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsBcopy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = strings.bcopy();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStringsBzero001
     * @tc.number SUB_THIRDPARTY_MUSL_STRINGS_BZERO_0100
     * @tc.desc   test bzero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringsBzero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = strings.bzero();
      expect(result).assertEqual(0);
      done()
    });

  })
}