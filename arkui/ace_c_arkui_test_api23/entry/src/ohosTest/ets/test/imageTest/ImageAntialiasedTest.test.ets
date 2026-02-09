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

export default function ImageAntialiasedTest() {

  describe('ImageAntialiasedTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number     SUB_ARKUI_CAPI_NODE_IMAGE_ANTIALIASED_0100
     * @tc.name       testImageAntialiased001
     * @tc.desc       testing ImageAntialiased for image with normal value
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testImageAntialiased001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAntialiased001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number     SUB_ARKUI_CAPI_NODE_IMAGE_ANTIALIASED_0200
     * @tc.name       testImageAntialiased002
     * @tc.desc       testing ImageAntialiased for image with normal value
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testImageAntialiased002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAntialiased002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number     SUB_ARKUI_CAPI_NODE_IMAGE_ANTIALIASED_0300
     * @tc.name       testImageAntialiased003
     * @tc.desc       testing ImageAntialiased for image with illegal value
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testImageAntialiased003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAntialiased003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number     SUB_ARKUI_CAPI_NODE_IMAGE_ANTIALIASED_0400
     * @tc.name       testImageAntialiased004
     * @tc.desc       testing ImageAntialiased for image with set/get attribute
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testImageAntialiased004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAntialiased004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number     SUB_ARKUI_CAPI_NODE_IMAGE_ANTIALIASED_0500
     * @tc.name       testImageAntialiased005
     * @tc.desc       testing ImageAntialiased for image with set/get/reset attribute
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testImageAntialiased005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAntialiased005()).assertEqual(0)
      done()
    })
  })
}
