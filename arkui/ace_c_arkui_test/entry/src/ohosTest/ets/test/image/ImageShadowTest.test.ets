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

export default function imageShadowTest() {

  describe('ImageShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SHADOW_0100
     * @tc.name       : testImageShadow001
     * @tc.desc       : testing shadow for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageShadow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SHADOW_0200
     * @tc.name       : testImageShadow002
     * @tc.desc       : testing shadow for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageShadow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SHADOW_0300
     * @tc.name       : testImageShadow003
     * @tc.desc       : testing shadow for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageShadow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageShadow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SHADOW_0400
     * @tc.name       : testImageShadow004
     * @tc.desc       : testing shadow for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageShadow004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageShadow004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SHADOW_0500
     * @tc.name       : testImageShadow005
     * @tc.desc       : testing shadow for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageShadow005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageShadow005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SHADOW_0600
     * @tc.name       : testImageShadow006
     * @tc.desc       : testing shadow for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageShadow006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageShadow006()).assertEqual(0)
      done()
    })

  })
}
