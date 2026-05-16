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

export default function focusControllerTest() {
  describe('focusControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('focusControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/FocusControllerNullandundefined/UIContextFocusControllerTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get focusControllerTest state pages: ' + JSON.stringify(pages));
        if (!('UIContextFocusControllerTestPage' == pages.name)) {
          console.info('get focusControllerTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push focusControllerTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push focusControllerTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('focusControllerTest afterEach called');
    });

    /**
     * @tc.name   request_focus_empty_001
     * @tc.number request_focus_empty_001
     * @tc.desc   Test requestFocus with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_focus_empty_001', Level.LEVEL2, async (done: Function) => {
      console.info('[request_focus_empty_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_request_focus_empty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('request_focus_empty'));
      expect(result).assertEqual('"150003"');
      console.info('[request_focus_empty_001] END');
      done();
    });

    /**
     * @tc.name   request_focus_null_002
     * @tc.number request_focus_null_002
     * @tc.desc   Test requestFocus with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_focus_null_002', Level.LEVEL2, async (done: Function) => {
      console.info('[request_focus_null_002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_request_focus_null'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('request_focus_null'));
      expect(result).assertEqual('"unknown"');
      console.info('[request_focus_null_002] END');
      done();
    });

    /**
     * @tc.name   request_focus_undefined_003
     * @tc.number request_focus_undefined_003
     * @tc.desc   Test requestFocus with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_focus_undefined_003', Level.LEVEL2, async (done: Function) => {
      console.info('[request_focus_undefined_003] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_request_focus_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('request_focus_undefined'));
      expect(result).assertEqual('"unknown"');
      console.info('[request_focus_undefined_003] END');
      done();
    });

    /**
     * @tc.name   set_auto_focus_transfer_true_004
     * @tc.number set_auto_focus_transfer_true_004
     * @tc.desc   Test setAutoFocusTransfer with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('set_auto_focus_transfer_true_004', Level.LEVEL1, async (done: Function) => {
      console.info('[set_auto_focus_transfer_true_004] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_set_auto_focus_true'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('set_auto_focus_true'));
      expect(result).assertEqual('"success"');
      console.info('[set_auto_focus_transfer_true_004] END');
      done();
    });

    /**
     * @tc.name   set_auto_focus_transfer_false_005
     * @tc.number set_auto_focus_transfer_false_005
     * @tc.desc   Test setAutoFocusTransfer with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('set_auto_focus_transfer_false_005', Level.LEVEL1, async (done: Function) => {
      console.info('[set_auto_focus_transfer_false_005] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_set_auto_focus_false'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('set_auto_focus_false'));
      expect(result).assertEqual('"success"');
      console.info('[set_auto_focus_transfer_false_005] END');
      done();
    });

    /**
     * @tc.name   set_key_processing_mode_null_006
     * @tc.number set_key_processing_mode_null_006
     * @tc.desc   Test setKeyProcessingMode with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('set_key_processing_mode_null_006', Level.LEVEL2, async (done: Function) => {
      console.info('[set_key_processing_mode_null_006] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_set_key_mode_null'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('set_key_mode_null'));
      expect(result).assertEqual('"success"');
      console.info('[set_key_processing_mode_null_006] END');
      done();
    });

    /**
     * @tc.name   set_key_processing_mode_undefined_007
     * @tc.number set_key_processing_mode_undefined_007
     * @tc.desc   Test setKeyProcessingMode with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('set_key_processing_mode_undefined_007', Level.LEVEL2, async (done: Function) => {
      console.info('[set_key_processing_mode_undefined_007] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_set_key_mode_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('set_key_mode_undefined'));
      expect(result).assertEqual('"success"');
      let FocusControllerClearFocus = await driver.findComponent(ON.id('FocusControllerClearFocus'));
      await FocusControllerClearFocus.click();
      await CommonFunc.sleep(1000);
      console.info('[set_key_processing_mode_undefined_007] END');
      done();
    });
  });
}
