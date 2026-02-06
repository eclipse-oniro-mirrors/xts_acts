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

export default function imageOrientationTest() {

  describe('ImageOrientationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageOrientation001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ORIENTATION_0100
     * @tc.desc   test the orientation attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageOrientation001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOrientation001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageOrientation002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ORIENTATION_0200
     * @tc.desc   test the orientation attribute using null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageOrientation002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOrientation002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageOrientation003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ORIENTATION_0300
     * @tc.desc   test the orientation attribute using outliers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageOrientation003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOrientation003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageOrientation004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ORIENTATION_0400
     * @tc.desc   test the orientation attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageOrientation004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageOrientation004()).assertEqual(0)
      done()
    })
  })
}
