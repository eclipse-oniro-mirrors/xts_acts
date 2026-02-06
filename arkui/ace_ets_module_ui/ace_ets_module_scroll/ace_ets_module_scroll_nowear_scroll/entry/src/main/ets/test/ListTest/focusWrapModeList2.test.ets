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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON, UiDriver } from '@kit.TestKit';
import { KeyCode } from '@kit.InputKit';

export default function focusWrapModeList2() {
  describe('focusWrapModeList2', () => {
    beforeEach(async (done: Function) => {
      console.info('focusWrapModeList2 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/focusWrapModeList2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get focusWrapModeList2 state pages:' + JSON.stringify(pages));
        if (!('focusWrapModeList2' == pages.name)) {
          console.info('get focusWrapModeList2 pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push focusWrapModeList2 page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push focusWrapModeList2 page error:' + err);
      }
      console.info('focusWrapModeList2 beforeEach end');
      done();
    });

    /**
     * @tc.name   focusWrapModeList2_0100
     * @tc.number focusWrapModeList2_001
     * @tc.desc   Set the focusWrapMode of the List component. Value is FocusWrapMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapModeList2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapModeList2_0100] START');
      let uiDriver: UiDriver = UiDriver.create();
      let driver: Driver = Driver.create();

      let text3IsFocused: boolean = await (await driver.findComponent(ON.id('text3'))).isFocused();
      expect(text3IsFocused).assertEqual(false);
      console.info('[focusWrapModeList2_0100] value:' + text3IsFocused);

      await uiDriver.triggerKey(KeyCode.KEYCODE_TAB);
      await CommonFunc.sleep(2000);
      let text3IsFocused2: boolean = await (await driver.findComponent(ON.id('text3'))).isFocused();
      expect(text3IsFocused2).assertEqual(false);
      console.info('[focusWrapModeList2_0100] value:' + text3IsFocused2);

      await uiDriver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(2000);
      let text3IsFocused3: boolean = await (await driver.findComponent(ON.id('text3'))).isFocused();
      expect(text3IsFocused3).assertEqual(false);
      let text1IsFocused: boolean = await (await driver.findComponent(ON.id('text1'))).isFocused();
      expect(text1IsFocused).assertEqual(true);

      console.info('[focusWrapModeList2_0100] END');
      done();
    });
  })
}