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

export default function commonAttrsRenderFitTest() {

  describe('CommonAttrsRenderFitTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0100
     * @tc.name       : testCommonAttrsRenderFit001
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0200
     * @tc.name       : testCommonAttrsRenderFit002
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0300
     * @tc.name       : testCommonAttrsRenderFit003
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0400
     * @tc.name       : testCommonAttrsRenderFit004
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0500
     * @tc.name       : testCommonAttrsRenderFit005
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0600
     * @tc.name       : testCommonAttrsRenderFit006
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0700
     * @tc.name       : testCommonAttrsRenderFit007
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0800
     * @tc.name       : testCommonAttrsRenderFit008
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_0900
     * @tc.name       : testCommonAttrsRenderFit009
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1000
     * @tc.name       : testCommonAttrsRenderFit010
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1100
     * @tc.name       : testCommonAttrsRenderFit011
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1200
     * @tc.name       : testCommonAttrsRenderFit012
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1300
     * @tc.name       : testCommonAttrsRenderFit013
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1400
     * @tc.name       : testCommonAttrsRenderFit014
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1500
     * @tc.name       : testCommonAttrsRenderFit015
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1600
     * @tc.name       : testCommonAttrsRenderFit016
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1700
     * @tc.name       : testCommonAttrsRenderFit017
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1800
     * @tc.name       : testCommonAttrsRenderFit018
     * @tc.desc       : testing padding for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_RENDERFIT_1900
     * @tc.name       : testCommonAttrsRenderFit019
     * @tc.desc       : testing resetAttribute padding for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsRenderFit019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsRenderFit019()).assertEqual(0)
      done()
    })
  })
}