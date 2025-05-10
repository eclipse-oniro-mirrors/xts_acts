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

export default function customComponentGetPreviousSiblingTest() {

  describe('customComponentGetPreviousSiblingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_GET_PREVIOUS_SIBLING_0001
     * @tc.name       : testCustomComponentGetPreviousSibling001
     * @tc.desc       : testing height for previousSibling with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentGetPreviousSibling001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentGetPreviousSibling001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_GET_PREVIOUS_SIBLING_0002
     * @tc.name       : testCustomComponentGetPreviousSibling002
     * @tc.desc       : testing height for previousSibling with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentGetPreviousSibling002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentGetPreviousSibling002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_GET_PREVIOUS_SIBLING_0003
     * @tc.name       : testCustomComponentGetPreviousSibling003
     * @tc.desc       : testing height for previousSibling with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentGetPreviousSibling003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentGetPreviousSibling003()).assertEqual(0)
      done()
    })                
  })
}
