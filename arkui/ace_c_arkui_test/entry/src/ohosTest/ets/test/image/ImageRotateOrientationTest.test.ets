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

export default function imageRotateOrientationTest() {

  describe('ImageRotateOrientationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageRotateOrientation001
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0100
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation002
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0200
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation003
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0300
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation004
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0400
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation005
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0500
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation006
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0600
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation007
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0700
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation008
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0800
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation009
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_0900
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation010
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_1000
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation011
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_1100
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageRotateOrientation012
     * @tc.number SUB_ARKUI_CAPI_IMAGE_ROTATEORIENTATION_1200
     * @tc.desc   testing rotateorientation for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageRotateOrientation012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageRotateOrientation012()).assertEqual(0)
      done()
    })

  })
}
