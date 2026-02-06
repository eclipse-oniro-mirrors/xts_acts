/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { CustomComponentLifecycleState } from '@kit.ArkUI';


export default function Enum001() {
  describe('Enum001', () => {
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Enum001 after each called");
    });

    /**
     * @tc.name   Enum001_001
     * @tc.number Enum001_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Enum001_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Enum001_001] START');
      await CommonFunc.sleep(1000);
      console.info('[Enum001_001] LayoutDirection.Auto:' + LayoutDirection.Auto);
      expect(LayoutDirection.Auto).assertUndefined();
      await CommonFunc.sleep(1000);
      console.info('[Enum001_001] END');
      done();
    });

    /**
     * @tc.name   Enum001_002
     * @tc.number Enum001_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Enum001_002', Level.LEVEL0, async (done: Function) => {
      console.info('[Enum001_001] START');
      await CommonFunc.sleep(1000);
      console.info('[Enum001_002] SystemProperties.BREAK_POINT:' + SystemProperties.BREAK_POINT);
      expect(SystemProperties.BREAK_POINT).assertEqual('system.arkui.breakpoint');
      await CommonFunc.sleep(1000);
      console.info('[Enum001_002] END');
      done();
    });

        /**
     * @tc.name   Enum001_003
     * @tc.number Enum001_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Enum001_003', Level.LEVEL0, async (done: Function) => {
      console.info('[Enum001_001] START');
      await CommonFunc.sleep(1000);
      console.info('[Enum001_003] CustomComponentLifecycleState.INIT:' + CustomComponentLifecycleState.INIT);
      expect(CustomComponentLifecycleState.INIT).assertEqual(0);
      expect(CustomComponentLifecycleState.APPEARED).assertEqual(1);
      expect(CustomComponentLifecycleState.BUILT).assertEqual(2);
      expect(CustomComponentLifecycleState.RECYCLED).assertEqual(3);
      expect(CustomComponentLifecycleState.DISAPPEARED).assertEqual(4);
      await CommonFunc.sleep(1000);
      console.info('[Enum001_003] END');
      done();
    });
  })
}