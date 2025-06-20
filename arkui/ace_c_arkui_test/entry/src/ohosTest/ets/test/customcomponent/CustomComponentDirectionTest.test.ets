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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customComponentDirectionTest() {

  describe('CustomComponentDirectionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_DIRECTION_0100
     * @tc.name       : testCustomComponentDirection001
     * @tc.desc       : testing direction for row with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentDirection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentDirection001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_DIRECTION_0200
     * @tc.name       : testCustomComponentDirection002
     * @tc.desc       : testing direction for row with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentDirection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentDirection002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_DIRECTION_0300
     * @tc.name       : testCustomComponentDirection003
     * @tc.desc       : testing direction for row with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentDirection003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentDirection003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_DIRECTION_0400
     * @tc.name       : testCustomComponentDirection004
     * @tc.desc       : testing direction for row with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentDirection004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentDirection004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_DIRECTION_0500
     * @tc.name       : testCustomComponentDirection005
     * @tc.desc       : testing direction for row with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentDirection005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentDirection005()).assertEqual(0)
      done()
    })

  })
}
