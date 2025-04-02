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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customComponentTransformTest() {

  describe('CustomComponentTransformTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_TRANSFORM_0100
     * @tc.name       : testCustomComponentTransform001
     * @tc.desc       : testing transform for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentTransform001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentTransform001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_TRANSFORM_0200
     * @tc.name       : testCustomComponentTransform002
     * @tc.desc       : testing transform for common with sixteen zeros
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentTransform002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentTransform002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_TRANSFORM_0300
     * @tc.name       : testCustomComponentTransform003
     * @tc.desc       : testing transform for common with no values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentTransform003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentTransform003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_TRANSFORM_0400
     * @tc.name       : testCustomComponentTransform004
     * @tc.desc       : testing transform for common with default values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentTransform004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentTransform004()).assertEqual(0)
      done()
    })
  })
}
