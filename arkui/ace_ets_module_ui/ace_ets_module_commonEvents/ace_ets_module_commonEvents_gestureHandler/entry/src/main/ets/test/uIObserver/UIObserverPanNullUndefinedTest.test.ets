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

export default function uIObserverPanNullUndefinedTest() {
  describe('UIObserverPanNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uIObserver/UIObserverPanPage',
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
     * @tc.name   UIObserver_beforePanStart_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANSTART_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for beforePanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanStart_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanStart_on_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanStart_on_null'));
      console.info('[UIObserver_beforePanStart_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanStart_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanStart_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANSTART_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for beforePanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanStart_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanStart_on_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanStart_on_undefined'));
      console.info('[UIObserver_beforePanStart_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanStart_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanStart_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANSTART_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for beforePanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanStart_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanStart_off_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanStart_off_null'));
      console.info('[UIObserver_beforePanStart_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanStart_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanStart_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANSTART_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for beforePanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanStart_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanStart_off_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanStart_off_undefined'));
      console.info('[UIObserver_beforePanStart_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanStart_off_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanEnd_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANEND_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for beforePanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanEnd_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanEnd_on_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanEnd_on_null'));
      console.info('[UIObserver_beforePanEnd_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanEnd_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanEnd_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANEND_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for beforePanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanEnd_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanEnd_on_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanEnd_on_undefined'));
      console.info('[UIObserver_beforePanEnd_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanEnd_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanEnd_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANEND_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for beforePanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanEnd_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanEnd_off_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanEnd_off_null'));
      console.info('[UIObserver_beforePanEnd_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanEnd_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_beforePanEnd_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_BEFOREPANEND_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for beforePanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_beforePanEnd_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_beforePanEnd_off_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('beforePanEnd_off_undefined'));
      console.info('[UIObserver_beforePanEnd_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_beforePanEnd_off_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanStart_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANSTART_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for afterPanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanStart_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanStart_on_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanStart_on_null'));
      console.info('[UIObserver_afterPanStart_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanStart_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanStart_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANSTART_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for afterPanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanStart_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanStart_on_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanStart_on_undefined'));
      console.info('[UIObserver_afterPanStart_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanStart_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanStart_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANSTART_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for afterPanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanStart_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanStart_off_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanStart_off_null'));
      console.info('[UIObserver_afterPanStart_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanStart_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanStart_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANSTART_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for afterPanStart event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanStart_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanStart_off_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanStart_off_undefined'));
      console.info('[UIObserver_afterPanStart_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanStart_off_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanEnd_on_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANEND_ON_PARAM_NULL_001
     * @tc.desc   Test UIObserver.on with null type for afterPanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanEnd_on_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanEnd_on_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanEnd_on_null'));
      console.info('[UIObserver_afterPanEnd_on_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanEnd_on_null_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanEnd_on_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANEND_ON_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.on with undefined type for afterPanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanEnd_on_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanEnd_on_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanEnd_on_undefined'));
      console.info('[UIObserver_afterPanEnd_on_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanEnd_on_undefined_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanEnd_off_null_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANEND_OFF_PARAM_NULL_001
     * @tc.desc   Test UIObserver.off with null type for afterPanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanEnd_off_null_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanEnd_off_null_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanEnd_off_null'));
      console.info('[UIObserver_afterPanEnd_off_null_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanEnd_off_null_001] END');
    });

    /**
     * @tc.name   UIObserver_afterPanEnd_off_undefined_001
     * @tc.number SUB_ARKUI_UIOBSERVER_AFTERPANEND_OFF_PARAM_UNDEFINED_001
     * @tc.desc   Test UIObserver.off with undefined type for afterPanEnd event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_afterPanEnd_off_undefined_001', Level.LEVEL2, async () => {
      console.info('[UIObserver_afterPanEnd_off_undefined_001] START');
      // 模拟用户拖动区域触发 UIObserver 回调
      let driver = Driver.create();
      let panArea = await driver.findComponent(ON.id('pan_area'));
      let rect = await panArea.getBounds();
      let rectCenter = await panArea.getBoundsCenter();
      await driver.swipe(rect.right, rectCenter.y, rectCenter.x, rectCenter.y);
      await CommonFunc.sleep(500);
      let result = JSON.stringify(AppStorage.get('afterPanEnd_off_undefined'));
      console.info('[UIObserver_afterPanEnd_off_undefined_001] result: ' + JSON.stringify(result));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_afterPanEnd_off_undefined_001] END');
    });
  });
}
