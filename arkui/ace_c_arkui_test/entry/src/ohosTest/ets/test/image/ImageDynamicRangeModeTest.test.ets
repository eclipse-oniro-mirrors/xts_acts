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

export default function imageDynamicRangeModeTest() {

  describe('ImageDynamicRangeModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageDynamicRangeMode001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DYNAMICRANGEMODE_0100
     * @tc.desc   test the dynamic display range attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDynamicRangeMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDynamicRangeMode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageDynamicRangeMode002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DYNAMICRANGEMODE_0200
     * @tc.desc   test the dynamic display range attribute using null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDynamicRangeMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDynamicRangeMode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageDynamicRangeMode003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DYNAMICRANGEMODE_0300
     * @tc.desc   test the dynamic display range attribute using outliers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDynamicRangeMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDynamicRangeMode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageDynamicRangeMode004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DYNAMICRANGEMODE_0400
     * @tc.desc   test the dynamic display range attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDynamicRangeMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDynamicRangeMode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageDynamicRangeMode005
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DYNAMICRANGEMODE_0500
     * @tc.desc   test the dynamic display range attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDynamicRangeMode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDynamicRangeMode005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageDynamicRangeMode006
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DYNAMICRANGEMODE_0600
     * @tc.desc   test the dynamic display range attribute using normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDynamicRangeMode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDynamicRangeMode006()).assertEqual(0)
      done()
    })
  })
}
