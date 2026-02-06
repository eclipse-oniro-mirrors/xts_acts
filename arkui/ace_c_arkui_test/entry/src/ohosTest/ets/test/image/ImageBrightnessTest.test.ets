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

export default function imageBrightnessTest() {

  describe('ImageBrightnessTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0100
     * @tc.name       : testImageBrightness001
     * @tc.desc       : testing brightness for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBrightness001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBrightness001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0200
     * @tc.name       : testImageBrightness002
     * @tc.desc       : testing brightness for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBrightness002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBrightness002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0300
     * @tc.name       : testImageBrightness003
     * @tc.desc       : testing brightness for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBrightness003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBrightness003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0400
     * @tc.name       : testImageBrightness004
     * @tc.desc       : testing brightness for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBrightness004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBrightness004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0500
     * @tc.name       : testImageBrightness005
     * @tc.desc       : testing brightness for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBrightness005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBrightness005()).assertEqual(0)
      done()
    })

  })
}
