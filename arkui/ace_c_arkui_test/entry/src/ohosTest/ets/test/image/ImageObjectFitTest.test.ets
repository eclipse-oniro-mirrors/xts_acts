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

  })
}
