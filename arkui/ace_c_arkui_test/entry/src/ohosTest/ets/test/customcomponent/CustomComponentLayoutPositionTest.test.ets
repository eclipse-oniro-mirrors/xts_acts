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

export default function customComponentLayoutPositionTest() {

  describe('customComponentLayoutPositionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUT_POSITON_0001
     * @tc.name       : testCustomComponentLayoutPosition001
     * @tc.desc       : testing height for layoutposition with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentLayoutPosition001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLayoutPosition001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_LAYOUT_POSITON_0002
     * @tc.name       : testCustomComponentLayoutPosition002
     * @tc.desc       : testing height for layoutposition with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentLayoutPosition002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentLayoutPosition002()).assertEqual(0)
      done()
    })               
  })
}
