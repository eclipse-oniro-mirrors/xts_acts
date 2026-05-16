/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function imageSourceSizeTest() {

  describe('ImageSourceSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageSourceSize001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_SOURCESIZE_0100
     * @tc.desc   testing imageSourceSize for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSourceSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSourceSize001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSourceSize002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_SOURCESIZE_0200
     * @tc.desc   testing imageSourceSize for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSourceSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSourceSize002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSourceSize003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_SOURCESIZE_0300
     * @tc.desc   testing imageSourceSize for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSourceSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSourceSize003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSourceSize004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_SOURCESIZE_0400
     * @tc.desc   testing imageSourceSize for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSourceSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSourceSize004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSourceSize005
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_SOURCESIZE_0500
     * @tc.desc   testing imageSourceSize for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSourceSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSourceSize005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSourceSize006
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_SOURCESIZE_0600
     * @tc.desc   testing resizable for image with set/get/reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSourceSize006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSourceSize006()).assertEqual(0)
      done()
    })
  })
}
