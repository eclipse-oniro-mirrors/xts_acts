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

export default function customComponentConstraintSizeTest() {

  describe('CustomComponentConstraintSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONSTRAINTSIZE_0100
     * @tc.name       : testCustomComponentConstraintSize001
     * @tc.desc       : testing constraintSize for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentConstraintSize001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentConstraintSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONSTRAINTSIZE_0200
     * @tc.name       : testCustomComponentConstraintSize002
     * @tc.desc       : testing constraintSize for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentConstraintSize002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentConstraintSize002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONSTRAINTSIZE_0300
     * @tc.name       : testCustomComponentConstraintSize003
     * @tc.desc       : testing constraintSize for column with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentConstraintSize003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentConstraintSize003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONSTRAINTSIZE_0400
     * @tc.name       : testCustomComponentConstraintSize004
     * @tc.desc       : testing constraintSize for column with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentConstraintSize004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentConstraintSize004()).assertEqual(0)
      done()
    })
  })
}
