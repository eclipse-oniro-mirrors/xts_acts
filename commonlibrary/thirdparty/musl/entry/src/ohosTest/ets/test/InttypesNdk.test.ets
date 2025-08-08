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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import inttypes from 'libinttypesndk.so'

export default function inttypesNdkTest() {
  describe('MuslInttypesTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOIMAX_0100
     * @tc.name       : testMuslInttypesStrtoimax001
     * @tc.desc       : test strtoimax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoimax001', 0, async (done: Function) => {
      let a = '1000xyz';
      let b = 'a';
      let c = 10;
      let strtoimaxResult: number = inttypes.strtoimax(a, b, c);
      console.info("Test strtoimaxResult= " + strtoimaxResult);
      expect(strtoimaxResult).assertEqual(1000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOIMAX_0200
     * @tc.name       : testMuslInttypesStrtoimax002
     * @tc.desc       : test strtoimax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoimax002', 0, async (done: Function) => {
      let a = 'ff';
      let b = 'xyz';
      let c = 16;
      let strtoimaxResult: number = inttypes.strtoimax(a, b, c);
      console.info("Test strtoimaxResult= " + strtoimaxResult);
      expect(strtoimaxResult).assertEqual(255);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOUMAX_0100
     * @tc.name       : testMuslInttypesStrtoumax001
     * @tc.desc       : test strtoumax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoumax001', 0, async (done: Function) => {
      let a = '1000xyz';
      let b = 'a';
      let c = 10;
      let strtoumaxResult: number = inttypes.strtoumax(a, b, c);
      console.info("Test strtoumaxResult= " + strtoumaxResult);
      expect(strtoumaxResult).assertEqual(1000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOUMAX_0200
     * @tc.name       : testMuslInttypesStrtoumax002
     * @tc.desc       : test strtoimax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoumax002', 0, async (done: Function) => {
      let a = 'ff';
      let b = 'xyz';
      let c = 16;
      let strtoumaxResult: number = inttypes.strtoumax(a, b, c);
      console.info("Test strtoumaxResult= " + strtoumaxResult);
      expect(strtoumaxResult).assertEqual(255);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_IMAXDIV_0100
     * @tc.name       : testMuslInttypesImaxdiv001
     * @tc.desc       : test imaxdiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesImaxdiv001', 0, async (done: Function) => {
      let result: object = inttypes.imaxdiv(5, 2);
      expect(result['quot']).assertEqual(2);
      expect(result['rem']).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_IMAXDIV_0200
     * @tc.name       : testMuslInttypesImaxdiv002
     * @tc.desc       : test imaxdiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesImaxdiv002', 0, async (done: Function) => {
      let result: object = inttypes.imaxdiv(4, 2);
      expect(result['quot']).assertEqual(2);
      expect(result['rem']).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_IMAXABS_0100
     * @tc.name       : testMuslInttypesImaxabs001
     * @tc.desc       : test imaxabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesImaxabs001', 0, async (done: Function) => {
      let result: number = inttypes.imaxabs(1)
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_IMAXABS_0200
     * @tc.name       : testMuslInttypesImaxabs002
     * @tc.desc       : test imaxabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesImaxabs002', 0, async (done: Function) => {
      let result: number = inttypes.imaxabs(-1)
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_WCSTOIMAX_0100
     * @tc.name       : testMuslInttypesWcstoimax001
     * @tc.desc       : test wcstoimax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslInttypesWcstoimax001', 0, async (done: Function) => {
      let param = 10;
      let wcstoimaxResult: number = inttypes.wcstoimax(param);
      console.info("Test wcstoimaxResult= " + wcstoimaxResult);
      expect(wcstoimaxResult).assertEqual(1000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_WCSTOIMAX_0200
     * @tc.name       : testMuslInttypesWcstoimax002
     * @tc.desc       : test wcstoimax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslInttypesWcstoimax002', 0, async (done: Function) => {
      let param = 0;
      let wcstoimaxResult: number = inttypes.wcstoimax(param);
      console.info("Test wcstoimaxResult= " + wcstoimaxResult);
      expect(wcstoimaxResult).assertEqual(255);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_WCSTOUMAX_0100
     * @tc.name       : testMuslInttypesWcstoumax001
     * @tc.desc       : test wcstoumax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslInttypesWcstoumax001', 0, async (done: Function) => {
      let param = 10;
      let wcstoumaxResult: number = inttypes.wcstoumax(param);
      console.info("Test wcstoumaxResult= " + wcstoumaxResult);
      expect(wcstoumaxResult).assertEqual(1000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_WCSTOUMAX_0200
     * @tc.name       : testMuslInttypesWcstoumax002
     * @tc.desc       : test wcstoumax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslInttypesWcstoumax002', 0, async (done: Function) => {
      let param = 0;
      let wcstoumaxResult: number = inttypes.wcstoumax(param);
      console.info("Test wcstoumaxResult= " + wcstoumaxResult);
      expect(wcstoumaxResult).assertEqual(255);
      done();
    });

  })

}