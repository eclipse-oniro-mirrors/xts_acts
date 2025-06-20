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

export default function customComponentHeightTest() {

  describe('CustomComponentHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_HEIGHT_0100
     * @tc.name       : testCustomComponentHeight001
     * @tc.desc       : testing height for customComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentHeight001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_HEIGHT_0200
     * @tc.name       : testCustomComponentHeight002
     * @tc.desc       : testing height for customComponent with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentHeight002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_HEIGHT_0300
     * @tc.name       : testCustomComponentHeight003
     * @tc.desc       : testing height for customComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level2
     */
    it('testCustomComponentHeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentHeight003()).assertEqual(0)
      done()
    })
  })
}
