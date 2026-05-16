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

export default function imageMatchTextDirectionTest() {

  describe('ImageMatchTextDirectionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageMatchTextDirection001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATCHTEXTDIRECTION_0100
     * @tc.desc   testing imageMatchTextDirection for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatchTextDirection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatchTextDirection001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatchTextDirection002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATCHTEXTDIRECTION_0200
     * @tc.desc   testing imageMatchTextDirection for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatchTextDirection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatchTextDirection002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatchTextDirection003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATCHTEXTDIRECTION_0300
     * @tc.desc   testing imageMatrix for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatchTextDirection003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatchTextDirection003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatchTextDirection004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATCHTEXTDIRECTION_0400
     * @tc.desc   testing imageMatrix for image with set/get attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatchTextDirection004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatchTextDirection004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageMatchTextDirection005
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_MATCHTEXTDIRECTION_0500
     * @tc.desc   testing imageMatrix for image with set/get/reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageMatchTextDirection005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageMatchTextDirection005()).assertEqual(0)
      done()
    })
  })
}
