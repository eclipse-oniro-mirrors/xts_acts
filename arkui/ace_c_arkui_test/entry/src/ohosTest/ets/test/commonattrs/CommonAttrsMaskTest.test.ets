/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsMaskTest() {

  describe('CommonAttrsMaskTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0100
     * @tc.name       : testCommonAttrsMask001
     * @tc.desc       : testing transform for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0200
     * @tc.name       : testCommonAttrsMask002
     * @tc.desc       : testing transform for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0300
     * @tc.name       : testCommonAttrsMask003
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsMask003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0400
     * @tc.name       : testCommonAttrsMask004
     * @tc.desc       : testing mask for common with
     *           'The width of the rectangular corner is greater than the width of
     * the rectangle'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0500
     * @tc.name       : testCommonAttrsMask005
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0600
     * @tc.name       : testCommonAttrsMask006
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsMask006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0700
     * @tc.name       : testCommonAttrsMask007
     * @tc.desc       : testing mask for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0800
     * @tc.name       : testCommonAttrsMask008
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_0900
     * @tc.name       : testCommonAttrsMask009
     * @tc.desc       : testing mask for common with ’zero‘ value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1000
     * @tc.name       : testCommonAttrsMask010
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsMask010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1100
     * @tc.name       : testCommonAttrsMask011
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1200
     * @tc.name       : testCommonAttrsMask012
     * @tc.desc       : testing mask for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1300
     * @tc.name       : testCommonAttrsMask013
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsMask013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1400
     * @tc.name       : testCommonAttrsMask014
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1500
     * @tc.name       : testCommonAttrsMask015
     * @tc.desc       : testing mask for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMask015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MASK_1600
     * @tc.name       : testCommonAttrsMask016
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsMask016', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask016()).assertEqual(0)
      done()
    })


  })
}
