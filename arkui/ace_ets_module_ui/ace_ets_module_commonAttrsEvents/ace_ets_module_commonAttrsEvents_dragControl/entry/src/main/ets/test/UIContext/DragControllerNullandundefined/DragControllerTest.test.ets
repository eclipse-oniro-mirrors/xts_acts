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
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';

export default function dragControllerTest() {
  describe('dragControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('dragControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/DragControllerNullandundefined/UIContextDragControllerTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get dragControllerTest state pages: ' + JSON.stringify(pages));
        if (!('UIContextDragControllerTestPage' == pages.name)) {
          console.info('get dragControllerTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push dragControllerTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push dragControllerTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('dragControllerTest afterEach called');
    });

    /**
     * @tc.name   DragController_execute_drag_null_custom_001
     * @tc.number DragController_execute_drag_null_custom_001
     * @tc.desc   Test executeDrag with null custom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragController_execute_drag_null_custom_001', Level.LEVEL2, async (done: Function) => {
      console.info('[DragController_execute_drag_null_custom_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_execute_drag'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('execute_drag_null_custom'));
      expect(result).assertEqual('"401"');
      console.info('[DragController_execute_drag_null_custom_001] END');
      done();
    });

    /**
     * @tc.name   DragController_execute_drag_undefined_draginfo_002
     * @tc.number DragController_execute_drag_undefined_draginfo_002
     * @tc.desc   Test executeDrag with undefined dragInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragController_execute_drag_undefined_draginfo_002', Level.LEVEL2, async (done: Function) => {
      console.info('[DragController_execute_drag_undefined_draginfo_002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_execute_drag'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('execute_drag_undefined_draginfo'));
      expect(result).assertEqual('"401"');
      console.info('[DragController_execute_drag_undefined_draginfo_002] END');
      done();
    });

    /**
     * @tc.name   DragController_execute_drag_undefined_custom_003
     * @tc.number DragController_execute_drag_undefined_custom_003
     * @tc.desc   Test executeDrag with undefined custom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragController_execute_drag_undefined_custom_003', Level.LEVEL2, async (done: Function) => {
      console.info('[DragController_execute_drag_undefined_custom_003] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_execute_drag'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('execute_drag_undefined_custom'));
      expect(result).assertEqual('"401"');
      console.info('[DragController_execute_drag_undefined_custom_003] END');
      done();
    });

    /**
     * @tc.name   DragController_execute_drag_null_draginfo_004
     * @tc.number DragController_execute_drag_null_draginfo_004
     * @tc.desc   Test executeDrag with null dragInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragController_execute_drag_null_draginfo_004', Level.LEVEL2, async (done: Function) => {
      console.info('[DragController_execute_drag_null_draginfo_004] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_execute_drag'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('execute_drag_null_draginfo'));
      expect(result).assertEqual('"401"');
      console.info('[DragController_execute_drag_null_draginfo_004] END');
      done();
    });

    /**
     * @tc.name   set_drag_event_strict_reporting_enabled_true_005
     * @tc.number set_drag_event_strict_reporting_enabled_true_005
     * @tc.desc   Test setDragEventStrictReportingEnabled with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('set_drag_event_strict_reporting_enabled_true_005', Level.LEVEL1, async (done: Function) => {
      console.info('[set_drag_event_strict_reporting_enabled_true_005] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_set_strict_reporting'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('set_strict_reporting_true'));
      expect(result).assertEqual('"success"');
      console.info('[set_drag_event_strict_reporting_enabled_true_005] END');
      done();
    });

    /**
     * @tc.name   set_drag_event_strict_reporting_enabled_false_006
     * @tc.number set_drag_event_strict_reporting_enabled_false_006
     * @tc.desc   Test setDragEventStrictReportingEnabled with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('set_drag_event_strict_reporting_enabled_false_006', Level.LEVEL1, async (done: Function) => {
      console.info('[set_drag_event_strict_reporting_enabled_false_006] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_set_strict_reporting'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('set_strict_reporting_false'));
      expect(result).assertEqual('"success"');
      console.info('[set_drag_event_strict_reporting_enabled_false_006] END');
      done();
    });

    /**
     * @tc.name   cancel_data_loading_empty_007
     * @tc.number cancel_data_loading_empty_007
     * @tc.desc   Test cancelDataLoading with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('cancel_data_loading_empty_007', Level.LEVEL2, async (done: Function) => {
      console.info('[cancel_data_loading_empty_007] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_cancel_data_loading'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('cancel_data_loading_empty'));
      expect(result).assertEqual('"401"');
      console.info('[cancel_data_loading_empty_007] END');
      done();
    });

    /**
     * @tc.name   cancel_data_loading_null_008
     * @tc.number cancel_data_loading_null_008
     * @tc.desc   Test cancelDataLoading with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('cancel_data_loading_null_008', Level.LEVEL2, async (done: Function) => {
      console.info('[cancel_data_loading_null_008] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_cancel_data_loading'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('cancel_data_loading_null'));
      expect(result).assertEqual('"190004"');
      console.info('[cancel_data_loading_null_008] END');
      done();
    });

    /**
     * @tc.name   cancel_data_loading_undefined_009
     * @tc.number cancel_data_loading_undefined_009
     * @tc.desc   Test cancelDataLoading with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('cancel_data_loading_undefined_009', Level.LEVEL2, async (done: Function) => {
      console.info('[cancel_data_loading_undefined_009] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_cancel_data_loading'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('cancel_data_loading_undefined'));
      expect(result).assertEqual('"190004"');
      console.info('[cancel_data_loading_undefined_009] END');
      done();
    });

    /**
     * @tc.name   enable_drop_disallowed_badge_true_010
     * @tc.number enable_drop_disallowed_badge_true_010
     * @tc.desc   Test enableDropDisallowedBadge with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enable_drop_disallowed_badge_true_010', Level.LEVEL1, async (done: Function) => {
      console.info('[enable_drop_disallowed_badge_true_010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_enable_badge'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('enable_badge_true'));
      expect(result).assertEqual('"success"');
      console.info('[enable_drop_disallowed_badge_true_010] END');
      done();
    });

    /**
     * @tc.name   enable_drop_disallowed_badge_false_011
     * @tc.number enable_drop_disallowed_badge_false_011
     * @tc.desc   Test enableDropDisallowedBadge with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enable_drop_disallowed_badge_false_011', Level.LEVEL1, async (done: Function) => {
      console.info('[enable_drop_disallowed_badge_false_011] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_enable_badge'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('enable_badge_false'));
      expect(result).assertEqual('"success"');
      console.info('[enable_drop_disallowed_badge_false_011] END');
      done();
    });
  });
}
