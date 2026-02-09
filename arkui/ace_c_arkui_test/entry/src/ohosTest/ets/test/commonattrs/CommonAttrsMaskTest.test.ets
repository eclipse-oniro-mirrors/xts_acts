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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsMaskTest() {

  describe('CommonAttrsMaskTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsMask001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0100
     * @tc.desc   testing transform for common with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0200
     * @tc.desc   testing transform for common with 'zero' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0300
     * @tc.desc   testing mask for common with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0400
     * @tc.desc   testing mask for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0500
     * @tc.desc   testing mask for common with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0600
     * @tc.desc   testing mask for common with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask007
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0700
     * @tc.desc   testing mask for common with 'zero' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask008
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0800
     * @tc.desc   testing mask for common with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask009
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_0900
     * @tc.desc   testing mask for common with ’zero‘ value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask010
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1000
     * @tc.desc   testing mask for common with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask011
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1100
     * @tc.desc   testing mask for common with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask012
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1200
     * @tc.desc   testing mask for common with 'zero' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask013
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1300
     * @tc.desc   testing mask for common with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask014
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1400
     * @tc.desc   testing mask for common with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask015
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1500
     * @tc.desc   testing mask for common with 'zero' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsMask016
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_MASK_1600
     * @tc.desc   testing mask for common with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsMask016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMask016()).assertEqual(0)
      done()
    })


  })
}
