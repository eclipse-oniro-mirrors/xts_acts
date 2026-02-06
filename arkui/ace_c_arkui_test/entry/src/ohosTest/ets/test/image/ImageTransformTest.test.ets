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

export default function imageTransformTest() {

  describe('ImageTransformTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageTransform001
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSFORM_0100
     * @tc.desc   testing transform for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTransform001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTransform001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTransform002
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSFORM_0200
     * @tc.desc   testing transform for image with exception value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTransform002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTransform002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTransform003
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSFORM_0300
     * @tc.desc   testing transform for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTransform003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTransform003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTransform004
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSFORM_0400
     * @tc.desc   testing transform for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTransform004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTransform004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTransform005
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSFORM_0500
     * @tc.desc   testing transform for image with boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTransform005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTransform005()).assertEqual(0)
      done()
    })

  })
}
