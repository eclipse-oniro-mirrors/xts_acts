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

export default function imageLinearGradientTest() {

  describe('ImageLinearGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageLinearGradient001
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0100
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient002
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0200
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient003
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0300
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient004
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0400
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient005
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0500
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient006
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0600
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient007
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0700
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient008
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0800
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient009
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_0900
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient010
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1000
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient011
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1100
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient012
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1200
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient013
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1300
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient014
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1400
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient015
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1500
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient016
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1600
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient017
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1700
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient018
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_ANGLE_VALUE0
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient019
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_1900
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient020
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_2000
     * @tc.desc   testing lineargradient for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageLinearGradient021
     * @tc.number SUB_ARKUI_CAPI_IMAGE_LINEARGRADIENT_2100
     * @tc.desc   testing lineargradient for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageLinearGradient021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageLinearGradient021()).assertEqual(0)
      done()
    })


  })
}
