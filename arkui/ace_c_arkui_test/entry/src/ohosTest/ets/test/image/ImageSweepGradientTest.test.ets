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

export default function imageSweepGradientTest() {

  describe('ImageSweepGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SWEEPGRADIENT_0100
     * @tc.name       : testImageSweepGradient001
     * @tc.desc       : testing sweepGradient for image with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSweepGradient001', 0, async (done: Function) => {
      expect(nativeFunc.testImageSweepGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SWEEPGRADIENT_0200
     * @tc.name       : testImageSweepGradient002
     * @tc.desc       : testing sweepGradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSweepGradient002', 0, async (done: Function) => {
      expect(nativeFunc.testImageSweepGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SWEEPGRADIENT_0300
     * @tc.name       : testImageSweepGradient003
     * @tc.desc       : testing sweepGradient for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageSweepGradient003', 0, async (done: Function) => {
      expect(nativeFunc.testImageSweepGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SWEEPGRADIENT_0400
     * @tc.name       : testImageSweepGradient004
     * @tc.desc       : testing sweepGradient for image with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSweepGradient004', 0, async (done: Function) => {
      expect(nativeFunc.testImageSweepGradient004()).assertEqual(0)
      done()
    })

  })
}
