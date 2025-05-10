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

export default function imageLinearGradientTest() {

  describe('ImageLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0100
     * @tc.name       : testImageLinearGradient001
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient001', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0200
     * @tc.name       : testImageLinearGradient002
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient002', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0300
     * @tc.name       : testImageLinearGradient003
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient003', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0400
     * @tc.name       : testImageLinearGradient004
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient004', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0500
     * @tc.name       : testImageLinearGradient005
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient005', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0600
     * @tc.name       : testImageLinearGradient006
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient006', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0700
     * @tc.name       : testImageLinearGradient007
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient007', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0800
     * @tc.name       : testImageLinearGradient008
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient008', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0900
     * @tc.name       : testImageLinearGradient009
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient009', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1000
     * @tc.name       : testImageLinearGradient010
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient010', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1100
     * @tc.name       : testImageLinearGradient011
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient011', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1200
     * @tc.name       : testImageLinearGradient012
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient012', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1300
     * @tc.name       : testImageLinearGradient013
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient013', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1400
     * @tc.name       : testImageLinearGradient014
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient014', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1500
     * @tc.name       : testImageLinearGradient015
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient015', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1600
     * @tc.name       : testImageLinearGradient016
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient016', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1700
     * @tc.name       : testImageLinearGradient017
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient017', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_ANGLE_VALUE0
     * @tc.name       : testImageLinearGradient018
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient018', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1900
     * @tc.name       : testImageLinearGradient019
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient019', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_2000
     * @tc.name       : testImageLinearGradient020
     * @tc.desc       : testing lineargradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageLinearGradient020', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_2100
     * @tc.name       : testImageLinearGradient021
     * @tc.desc       : testing lineargradient for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageLinearGradient021', 0, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient021()).assertEqual(0)
      done()
    })


  })
}
