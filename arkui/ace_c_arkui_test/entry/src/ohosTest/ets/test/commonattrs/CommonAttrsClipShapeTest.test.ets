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

export default function commonAttrsClipShapeTest() {
    
  describe('CommonAttrsClipShapeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0100
     * @tc.name       : testCommonAttrsClipShape001
     * @tc.desc       : testing clipShape for commonAttrs with valid value RectShape,130,110,30,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0200
     * @tc.name       : testCommonAttrsClipShape002
     * @tc.desc       : testing clipShape for commonAttrs with valid value RectShape,90,110,30,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape002()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0300
     * @tc.name       : testCommonAttrsClipShape003
     * @tc.desc       : testing clipShape for commonAttrs with invalid value RectShape,130,110,-1,-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0400
     * @tc.name       : testCommonAttrsClipShape004
     * @tc.desc       : testing clipShape for commonAttrs with valid value CircleShape,130,110
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0500
     * @tc.name       : testCommonAttrsClipShape005
     * @tc.desc       : testing clipShape for commonAttrs with valid value CircleShape,110,110
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0600
     * @tc.name       : testCommonAttrsClipShape006
     * @tc.desc       : testing clipShape for commonAttrs with invalid value CircleShape,-1,-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0700
     * @tc.name       : testCommonAttrsClipShape007
     * @tc.desc       : testing clipShape for commonAttrs with invalid value EllipseShape,130,110
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0800
     * @tc.name       : testCommonAttrsClipShape008
     * @tc.desc       : testing clipShape for commonAttrs with valid value EllipseShape,110,110
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_0900
     * @tc.name       : testCommonAttrsClipShape009
     * @tc.desc       : testing clipShape for commonAttrs with invalid value EllipseShape,-1,-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1000
     * @tc.name       : testCommonAttrsClipShape010
     * @tc.desc       : testing clipShape for commonAttrs with valid value PathShape,130,110,"M600L120100L0100Z"
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1100
     * @tc.name       : testCommonAttrsClipShape011
     * @tc.desc       : testing clipShape for commonAttrs with invalid value PathShape,-1,-1,"M60 0 L120 100 L0 100 Z"
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1200
     * @tc.name       : testCommonAttrsClipShape012
     * @tc.desc       : testing clipShape for commonAttrs with valid value PathShape,110,110,
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1300
     * @tc.name       : testCommonAttrsClipShape013
     * @tc.desc       : testing clipShape for commonAttrs with invalid value RectShape,130,110,10,10,-2,10,10,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1400
     * @tc.name       : testCommonAttrsClipShape014
     * @tc.desc       : testing clipShape for commonAttrs with valid value RectShape,130,110,30,10,10,0,0,-2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1500
     * @tc.name       : testCommonAttrsClipShape015
     * @tc.desc       : testing clipShape for commonAttrs with invalid value RectShape,130,110,30,10,-1,-1,-1,-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1600
     * @tc.name       : testCommonAttrsClipShape016
     * @tc.desc       : testing clipShape for commonAttrs with invalid value RectShape,-1,130,110,30,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1700
     * @tc.name       : testCommonAttrsClipShape017
     * @tc.desc       : testing clipShape for commonAttrs with invalid value RectShape,4,130,110,30,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1800
     * @tc.name       : testCommonAttrsClipShape018
     * @tc.desc       : testing clipShape for commonAttrs with valid value RectShape,500,300,30,10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_1900
     * @tc.name       : testCommonAttrsClipShape019
     * @tc.desc       : testing clipShape for commonAttrs with valid value CircleShape,500,300
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_2000
     * @tc.name       : testCommonAttrsClipShape020
     * @tc.desc       : testing clipShape for commonAttrs with valid value EllipseShape,500,300
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_CLIPSHAPE_2100
     * @tc.name       : testCommonAttrsClipShape021
     * @tc.desc       : testing clipShape for commonAttrs with valid value PathShape,500,300,"M60 0 L120 100 L0 100 Z"
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsClipShape021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClipShape021()).assertEqual(0)
      done()
    })
  })
}
