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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollEnableScrollInteractionTest() {

  describe('ScrollEnableScrollInteractionTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_ENABLESCROLLINTERACTION_0100
     * @tc.name       : testScrollEnableScrollInteraction001
     * @tc.desc       : testing enable scroll interaction for scroll with true value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollEnableScrollInteraction001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollEnableScrollInteraction001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_ENABLESCROLLINTERACTION_0200
     * @tc.name       : testScrollEnableScrollInteraction002
     * @tc.desc       : testing enable scroll interaction for scroll with false value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollEnableScrollInteraction002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollEnableScrollInteraction002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_ENABLESCROLLINTERACTION_0300
     * @tc.name       : testScrollEnableScrollInteraction003
     * @tc.desc       : testing enable scroll interaction for scroll with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testScrollEnableScrollInteraction003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollEnableScrollInteraction003()).assertEqual(0)
      done();
    });

  })
}
