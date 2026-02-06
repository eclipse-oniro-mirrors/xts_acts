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

export default function imageOpacityTest() {

  describe('ImageOpacityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OPACITY_0100
     * @tc.name       : testImageOpacity001
     * @tc.desc       : testing opacity for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageOpacity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOpacity001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OPACITY_0200
     * @tc.name       : testImageOpacity002
     * @tc.desc       : testing opacity for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageOpacity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOpacity002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OPACITY_0300
     * @tc.name       : testImageOpacity003
     * @tc.desc       : testing opacity for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageOpacity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOpacity003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OPACITY_0400
     * @tc.name       : testImageOpacity004
     * @tc.desc       : testing opacity for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageOpacity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOpacity004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OPACITY_0500
     * @tc.name       : testImageOpacity005
     * @tc.desc       : testing opacity for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageOpacity005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOpacity005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OPACITY_0600
     * @tc.name       : testImageOpacity006
     * @tc.desc       : testing opacity for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageOpacity006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOpacity006()).assertEqual(0)
      done()
    })

  })
}
