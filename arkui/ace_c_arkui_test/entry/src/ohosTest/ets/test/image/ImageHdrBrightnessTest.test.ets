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

export default function imageHdrBrightnessTest() {

  describe('ImageHdrBrightnessTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageHdrBrightness001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_HDRBRIGHTNESS_0100
     * @tc.desc   test the brightness attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageHdrBrightness001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageHdrBrightness001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageHdrBrightness002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_HDRBRIGHTNESS_0200
     * @tc.desc   test the brightness attribute using null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageHdrBrightness002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageHdrBrightness002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageHdrBrightness003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_HDRBRIGHTNESS_0300
     * @tc.desc   test the brightness attribute using outliers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageHdrBrightness003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageHdrBrightness003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageHdrBrightness004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_HDRBRIGHTNESS_0400
     * @tc.desc   test the brightness attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageHdrBrightness004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageHdrBrightness004()).assertEqual(0)
      done()
    })
  })
}
