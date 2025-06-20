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

export default function imageBlurTest() {

  describe('ImageBlurTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0100
     * @tc.name       : testImageBlur001
     * @tc.desc       : testing blur for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBlur001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBlur001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0200
     * @tc.name       : testImageBlur002
     * @tc.desc       : testing blur for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBlur002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBlur002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0300
     * @tc.name       : testImageBlur003
     * @tc.desc       : testing blur for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBlur003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBlur003()).assertEqual(0)
      done()
    })

  })
}
