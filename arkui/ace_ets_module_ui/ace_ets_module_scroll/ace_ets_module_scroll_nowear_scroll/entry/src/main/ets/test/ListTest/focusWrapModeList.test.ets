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

export default function focusWrapModeList() {
  describe('focusWrapModeList', () => {
    beforeEach(async (done: Function) => {
      console.info('focusWrapModeList beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/focusWrapModeList',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get focusWrapModeList state pages:' + JSON.stringify(pages));
        if (!('focusWrapModeList' == pages.name)) {
          console.info('get focusWrapModeList pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push focusWrapModeList page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push focusWrapModeList page error:' + err);
      }
      console.info('focusWrapModeList beforeEach end');
      done();
    });

    /**
     * @tc.name   focusWrapModeList_0100
     * @tc.number focusWrapModeList_001
     * @tc.desc   Set the focusWrapMode of the List component. Value is FocusWrapMode.WRAP_WITH_ARROW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapModeList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapModeList_0100] START');
      await CommonFunc.sleep(1000);
      let focusWrapMode: string = JSON.parse(getInspectorByKey('list1')).$attrs.focusWrapMode;
      console.info('[focusWrapModeList_0100] value: ' + focusWrapMode);
      expect(focusWrapMode).assertEqual('WRAP_WITH_ARROW');
      console.info('[focusWrapModeList_0100] END');
      done();
    });

    /**
     * @tc.name   focusWrapModeList_0200
     * @tc.number focusWrapModeList_002
     * @tc.desc   Set the focusWrapMode of the List component. Value is FocusWrapMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapModeList_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapModeList_0200] START');
      await CommonFunc.sleep(1000);
      let focusWrapMode: string = JSON.parse(getInspectorByKey('list2')).$attrs.focusWrapMode;
      console.info('[focusWrapModeList_0200] value: ' + focusWrapMode);
      expect(focusWrapMode).assertEqual('DEFAULT');
      console.info('[focusWrapModeList_0200] END');
      done();
    });

    /**
     * @tc.name   focusWrapModeList_0300
     * @tc.number focusWrapModeList_003
     * @tc.desc   Set the focusWrapMode of the List component. Value is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapModeList_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapModeList_0300] START');
      await CommonFunc.sleep(1000);
      let focusWrapMode: string = JSON.parse(getInspectorByKey('list3')).$attrs.focusWrapMode;
      console.info('[focusWrapModeList_0300] value: ' + focusWrapMode);
      expect(focusWrapMode).assertEqual('DEFAULT');
      console.info('[focusWrapModeList_0300] END');
      done();
    });

    /**
     * @tc.name   focusWrapModeList_0400
     * @tc.number focusWrapModeList_004
     * @tc.desc   Set the focusWrapMode of the List component. Value is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapModeList_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapModeList_0400] START');
      await CommonFunc.sleep(1000);
      let focusWrapMode: string = JSON.parse(getInspectorByKey('list4')).$attrs.focusWrapMode;
      console.info('[focusWrapModeList_0400] value: ' + focusWrapMode);
      expect(focusWrapMode).assertEqual('DEFAULT');
      console.info('[focusWrapModeList_0400] END');
      done();
    });

    /**
     * @tc.name   focusWrapModeList_0500
     * @tc.number focusWrapModeList_005
     * @tc.desc   Set the focusWrapMode of the List component. Value is WRAP_WITH_ARROW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapModeList_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapModeList_0500] START');
      let uiDriver: UiDriver = UiDriver.create();
      let driver: Driver = Driver.create();

      let text3IsFocused: boolean = await (await driver.findComponent(ON.id('text3'))).isFocused();
      expect(text3IsFocused).assertEqual(false);
      console.info('[focusWrapModeList_0500] value:' + text3IsFocused);

      await uiDriver.triggerKey(KeyCode.KEYCODE_TAB);
      await CommonFunc.sleep(2000);
      let text3IsFocused2: boolean = await (await driver.findComponent(ON.id('text3'))).isFocused();
      expect(text3IsFocused2).assertEqual(false);
      console.info('[focusWrapModeList_0500] value:' + text3IsFocused2);

      await uiDriver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(2000);
      let text3IsFocused3: boolean = await (await driver.findComponent(ON.id('text3'))).isFocused();
      expect(text3IsFocused3).assertEqual(true);
      console.info('[focusWrapModeList_0500] value: ' + text3IsFocused3);
      console.info('[focusWrapModeList_0500] END');
      done();
    });
  })
}