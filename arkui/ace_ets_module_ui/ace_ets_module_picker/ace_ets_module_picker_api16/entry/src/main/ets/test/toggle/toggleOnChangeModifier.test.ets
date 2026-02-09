/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { router } from '@kit.ArkUI';

export default function toggleOnChangeModifierTest() {
  describe('toggleOnChangeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('toggleOnChangeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toggle/toggleOnChangeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get toggleOnChangeModifier state pages: ' + JSON.stringify(pages));
        if (!('toggleOnChangeModifier' == pages.name)) {
          console.info('get toggleOnChangeModifier pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push toggleOnChangeModifier page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('toggleOnChangeModifier beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('toggleOnChangeModifier after each called');
    })
   
    /**
     * @tc.name   ArkUX_Modifier_Toggle_OnChange_1001
     * @tc.number ArkUX_Modifier_Toggle_OnChange_1001
     * @tc.desc   OnChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Modifier_Toggle_OnChange_1001', Level.LEVEL1, async (done: Function) => {
        console.info('ArkUX_Modifier_Toggle_OnChange_1001 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ToggleOne'));
        await button.click();
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = getInspectorByKey('mToggleOneKey');
        console.info("ArkUX_Modifier_Toggle_OnChange_1001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('false');
        console.info('ArkUX_Modifier_Toggle_OnChange_1001 END');
        done();
      });
  
      /**
       * @tc.name   ArkUX_Modifier_Toggle_OnChange_1002
       * @tc.number ArkUX_Modifier_Toggle_OnChange_1002
       * @tc.desc   OnChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('ArkUX_Modifier_Toggle_OnChange_1002', Level.LEVEL1, async (done: Function) => {
        console.info('ArkUX_Modifier_Toggle_OnChange_1002 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ToggleTwo'));
        await button.click();
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = getInspectorByKey('mToggleTwoKey');
        console.info("ArkUX_Modifier_Toggle_OnChange_1002 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('false');
        console.info('ArkUX_Modifier_Toggle_OnChange_1002 END');
        done();
      });
  
      /**
       * @tc.name   ArkUX_Modifier_Toggle_OnChange_1003
       * @tc.number ArkUX_Modifier_Toggle_OnChange_1003
       * @tc.desc   OnChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('ArkUX_Modifier_Toggle_OnChange_1003', Level.LEVEL1, async (done: Function) => {
        console.info('ArkUX_Modifier_Toggle_OnChange_1003 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('ToggleThree'));
        await button.click();
        await CommonFunc.sleep(2000)
  
        let strJsonNew:string = getInspectorByKey('mToggleThreeKey');
        console.info("ArkUX_Modifier_Toggle_OnChange_1003 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('false');
        console.info('ArkUX_Modifier_Toggle_OnChange_1003 END');
        done();
      });

  })
}
