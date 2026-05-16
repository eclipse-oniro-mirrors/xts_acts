/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiDragAndDrop() {
  describe('DragAndDrop (drag_and_drop)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_001
     * @tc.name    TestArkUICapi_001
     * @tc.desc    Case: TestArkUICapi_001. API: OH_ArkUI_NotifySuggestedDropOperation, ArkUI_DropOperation. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_001', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_002
     * @tc.name    TestArkUICapi_002
     * @tc.desc    Case: TestArkUICapi_002. API: OH_ArkUI_NotifyDisableDefaultDropAnimation. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_002', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_002()).assertEqual(0)
      done()
    })

  });
}
