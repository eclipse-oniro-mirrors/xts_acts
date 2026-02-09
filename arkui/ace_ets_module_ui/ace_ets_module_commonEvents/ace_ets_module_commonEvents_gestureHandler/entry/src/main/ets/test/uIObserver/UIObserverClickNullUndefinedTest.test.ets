/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';

export default function uIObserverClickNullUndefinedTest() {
  describe('UIObserverClickNullUndefinedTest', () => {

    beforeEach(async (done: Function) => {

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uIObserver/UIObserverClickPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIObserverEventTest state pages: " + JSON.stringify(pages));
        if (!("UIObserverEventTest" == pages.name)) {
          console.info("get UIObserverEventTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push UIObserverEventTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIObserverEventTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIObserverEventTest after each called");
    });

    /**
     * @tc.name   UIObserver_willClick_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for willClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_on_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500); // 等待回调执行完成

      let result = JSON.stringify(AppStorage.get('willClick_gesture_on_null'));
      console.info('[UIObserver_willClick_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for willClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_on_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_gesture_on_undefined'));
      console.info('[UIObserver_willClick_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for willClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_off_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_gesture_off_null'));
      console.info('[UIObserver_willClick_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for willClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_off_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_gesture_off_undefined'));
      console.info('[UIObserver_willClick_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_off_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for didClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_on_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_gesture_on_null'));
      console.info('[UIObserver_didClick_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for didClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_on_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_gesture_on_undefined'));
      console.info('[UIObserver_didClick_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for didClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_off_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_gesture_off_null'));
      console.info('[UIObserver_didClick_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for didClick event (GestureEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_off_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_gesture_off_undefined'));
      console.info('[UIObserver_didClick_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_off_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_click_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_CLICK_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for willClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_click_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_click_on_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_click_on_null'));
      console.info('[UIObserver_willClick_click_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_click_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_click_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_CLICK_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for willClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_click_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_click_on_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_click_on_undefined'));
      console.info('[UIObserver_willClick_click_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_click_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_click_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_CLICK_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for willClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_click_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_click_off_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_click_off_null'));
      console.info('[UIObserver_willClick_click_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_click_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_willClick_click_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_WILLCLICK_CLICK_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for willClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_willClick_click_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_willClick_click_off_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('willClick_click_off_undefined'));
      console.info('[UIObserver_willClick_click_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_willClick_click_off_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_click_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_CLICK_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for didClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_click_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_click_on_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_click_on_null'));
      console.info('[UIObserver_didClick_click_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_click_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_click_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_CLICK_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for didClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_click_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_click_on_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_click_on_undefined'));
      console.info('[UIObserver_didClick_click_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_click_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_click_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_CLICK_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for didClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_click_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_click_off_null_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_click_off_null'));
      console.info('[UIObserver_didClick_click_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_click_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_didClick_click_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_DIDCLICK_CLICK_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for didClick event (ClickEventListenerCallback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_didClick_click_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_didClick_click_off_undefined_001] START');
      // 模拟用户点击按钮触发 UIObserver 回调
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('test_button'));
      await button.click();
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('didClick_click_off_undefined'));
      console.info('[UIObserver_didClick_click_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_didClick_click_off_undefined_001] END');
    });
  });
}
