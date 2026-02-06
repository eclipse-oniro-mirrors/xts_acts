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

export default function imageFitOriginalSizeTest() {

  describe('ImageFitOriginalSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_FIT_ORIGINAL_SIZE_0100
     * @tc.name       : testImageFitOriginalSize001
     * @tc.desc       : testing fitOriginalSize for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageFitOriginalSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageFitOriginalSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_FIT_ORIGINAL_SIZE_0200
     * @tc.name       : testImageFitOriginalSize002
     * @tc.desc       : testing fitOriginalSize for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageFitOriginalSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageFitOriginalSize002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_FIT_ORIGINAL_SIZE_0300
     * @tc.name       : testImageFitOriginalSize003
     * @tc.desc       : testing fitOriginalSize for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageFitOriginalSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageFitOriginalSize003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_FIT_ORIGINAL_SIZE_0400
     * @tc.name       : testImageFitOriginalSize004
     * @tc.desc       : testing fitOriginalSize for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageFitOriginalSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageFitOriginalSize004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_FIT_ORIGINAL_SIZE_0500
     * @tc.name       : testImageFitOriginalSize005
     * @tc.desc       : testing fitOriginalSize for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageFitOriginalSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageFitOriginalSize005()).assertEqual(0)
      done()
    })

  })
}
