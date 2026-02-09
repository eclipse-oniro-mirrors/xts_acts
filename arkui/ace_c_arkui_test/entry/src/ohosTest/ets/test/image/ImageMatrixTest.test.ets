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

export default function imageMatrixTest() {

  describe('ImageMatrixTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageMatrix001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATRIX_0100
     * @tc.desc   testing imageMatrix for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatrix001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatrix001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatrix002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATRIX_0200
     * @tc.desc   testing imageMatrix for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatrix002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatrix002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatrix003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATRIX_0300
     * @tc.desc   testing imageMatrix for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatrix003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatrix003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatrix004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATRIX_0400
     * @tc.desc   testing imageMatrix for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatrix004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatrix004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatrix005
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATRIX_0500
     * @tc.desc   testing imageMatrix for image with set/reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatrix005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatrix005()).assertEqual(0)
      done()
    })
  })
}
