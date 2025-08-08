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

export default function imageObjectFitTest() {

  describe('ImageObjectFitTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0100
     * @tc.name       : testImageObjectFit001
     * @tc.desc       : testing objectfit for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectFit001', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0200
     * @tc.name       : testImageObjectFit002
     * @tc.desc       : testing objectfit for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectFit002', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0300
     * @tc.name       : testImageObjectFit003
     * @tc.desc       : testing objectfit for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectFit003', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0400
     * @tc.name       : testImageObjectFit004
     * @tc.desc       : testing objectfit for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectFit004', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0500
     * @tc.name       : testImageObjectFit005
     * @tc.desc       : testing objectfit for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectFit005', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0600
     * @tc.name       : testImageObjectFit006
     * @tc.desc       : testing objectfit for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectFit006', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0700
     * @tc.name       : testImageObjectFit007
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit007', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0800
     * @tc.name       : testImageObjectFit008
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit008', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_0900
     * @tc.name       : testImageObjectFit009
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit009', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1000
     * @tc.name       : testImageObjectFit010
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit010', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1100
     * @tc.name       : testImageObjectFit011
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit011', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1200
     * @tc.name       : testImageObjectFit012
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit012', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1300
     * @tc.name       : testImageObjectFit013
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit013', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1400
     * @tc.name       : testImageObjectFit014
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit014', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1500
     * @tc.name       : testImageObjectFit015
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit015', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1600
     * @tc.name       : testImageObjectFit016
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit016', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1700
     * @tc.name       : testImageObjectFit017
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit017', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTFIT_1800
     * @tc.name       : testImageObjectFit018
     * @tc.desc       : testing objectfit for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectFit018', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectFit018()).assertEqual(0)
      done()
    })

  })
}
