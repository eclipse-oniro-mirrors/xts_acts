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

export default function imageRadialGradientTest() {

  describe('ImageRadialGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_RADIALGRADIENT_0100
     * @tc.name       : testImageRadialGradient001
     * @tc.desc       : testing radialgradient for image with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageRadialGradient001', 0, async (done: Function) => {
      expect(nativeFunc.testImageRadialGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_RADIALGRADIENT_0200
     * @tc.name       : testImageRadialGradient002
     * @tc.desc       : testing radialgradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageRadialGradient002', 0, async (done: Function) => {
      expect(nativeFunc.testImageRadialGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_RADIALGRADIENT_0300
     * @tc.name       : testImageRadialGradient003
     * @tc.desc       : testing radialgradient for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageRadialGradient003', 0, async (done: Function) => {
      expect(nativeFunc.testImageRadialGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_RADIALGRADIENT_0400
     * @tc.name       : testImageRadialGradient004
     * @tc.desc       : testing radialgradient for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageRadialGradient004', 0, async (done: Function) => {
      expect(nativeFunc.testImageRadialGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_RADIALGRADIENT_0500
     * @tc.name       : testImageRadialGradient005
     * @tc.desc       : testing radialgradient for image with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageRadialGradient005', 0, async (done: Function) => {
      expect(nativeFunc.testImageRadialGradient005()).assertEqual(0)
      done()
    })

  })
}
