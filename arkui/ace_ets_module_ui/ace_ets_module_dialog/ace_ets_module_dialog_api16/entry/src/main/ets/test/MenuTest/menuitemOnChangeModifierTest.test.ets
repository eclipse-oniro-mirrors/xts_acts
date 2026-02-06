/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { router } from '@kit.ArkUI';

export default function menuitemOnChangeModifierTest() {
  describe('menuitemOnChangeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('menuitemOnChangeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuitemOnChangeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get menuitemOnChangeModifierTest state pages:' + JSON.stringify(pages));
        if (!('menuitemOnChangeModifierTest' == pages.name)) {
          console.info('get menuitemOnChangeModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push menuitemOnChangeModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push menuitemOnChangeModifierTest page error:' + err);
      }
      console.info('menuitemOnChangeModifierTest beforeEach end');
      done();
    });
    /**
     * @tc.number ArkUX_Modifier_MenuItem_OnChange_1001
     * @tc.name Test the properties of components
     * @tc.desc OnChange callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Modifier_MenuItem_OnChange_1001', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Modifier_MenuItem_OnChange_1001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('MenuItemOnButtonID'));
      
      await button.click();
      await CommonFunc.sleep(1000)
      let buttonOnchange = await driver.findComponent(ON.id('MenuItemOnChangeID'));
      await buttonOnchange.click();
      await CommonFunc.sleep(1000)

      let strJsonNew:string = getInspectorByKey('MenuItemOnChangValueKey');
      console.info("ArkUX_Modifier_MenuItem_OnChange_1001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('true');
      console.info('ArkUX_Modifier_MenuItem_OnChange_1001 END');
      done();
    });
    })
}