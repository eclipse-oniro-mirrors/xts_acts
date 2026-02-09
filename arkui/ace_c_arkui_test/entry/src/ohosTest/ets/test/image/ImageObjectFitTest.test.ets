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

export default function imageObjectFitTest() {

  describe('ImageObjectFitTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageObjectFit001
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0100
     * @tc.desc   testing objectfit for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit002
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0200
     * @tc.desc   testing objectfit for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit003
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0300
     * @tc.desc   testing objectfit for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit004
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0400
     * @tc.desc   testing objectfit for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit005
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0500
     * @tc.desc   testing objectfit for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit006
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0600
     * @tc.desc   testing objectfit for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit007
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0700
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit008
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0800
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit009
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0900
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit010
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1000
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit011
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1100
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit012
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1200
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit013
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1300
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit014
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1400
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit015
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1500
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit016
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1600
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit017
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1700
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit018
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1800
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageObjectFit019
     * @tc.number SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1900
     * @tc.desc   testing objectfit for image with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageObjectFit019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit019()).assertEqual(0)
      done()
    })

  })
}
