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

export default function menuBindMenuModifierTest() {
  describe('menuBindMenuModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('menuBindMenuModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuBindMenuModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get menuBindMenuModifier state pages:' + JSON.stringify(pages));
        if (!('menuBindMenuModifier' == pages.name)) {
          console.info('get menuBindMenuModifier pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push menuBindMenuModifier page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push menuBindMenuModifier page error:' + err);
      }
      console.info('menuBindMenuModifier beforeEach end');
      done();
    });
    /* *
        * @tc.number: TimePickerOnChange_0001
        * @tc.name  : TimePickerOnChange_001_001
        * @tc.desc  : To test the enableCascade interface true
        * @tc.level : Level 3
        * @tc.type
        * @tc.size
        */
    it('MenuBindMenu_0001', Level.LEVEL2, async (done: Function) => {
      console.info('MenuBindMenu_0001 START');
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('btnModifier1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn22: Component = await driver.findComponent(ON.id('btnModifier2'));
      await btn22.click();
      await CommonFunc.sleep(1000);
      await btn22.click();
      await CommonFunc.sleep(1000);
      let btn33: Component = await driver.findComponent(ON.id('btnModifier3'));
      await btn33.click();
      await CommonFunc.sleep(1000);
      await btn33.click();
      await CommonFunc.sleep(1000);
      let btn44: Component = await driver.findComponent(ON.id('btnModifier4'));
      await btn44.click();
      await CommonFunc.sleep(1000);
      done();
    });
    })
}
