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

export default function createDragActionAndSpringTest() {
  describe('createDragActionAndSpringTest', () => {
    beforeEach(async (done: Function) => {
      console.info('createDragActionAndSpringTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/CreateDragActionAndSpringNullandundefined/CreateDragActionAndSpringTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get createDragActionAndSpringTest state pages: ' + JSON.stringify(pages));
        if (!('CreateDragActionAndSpringTestPage' == pages.name)) {
          console.info('get createDragActionAndSpringTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push createDragActionAndSpringTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push createDragActionAndSpringTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('createDragActionAndSpringTest afterEach called');
    });

    /**
     * @tc.name   create_drag_action_null_array_001
     * @tc.number create_drag_action_null_array_001
     * @tc.desc   Test createDragAction with null customArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('create_drag_action_null_array_001', Level.LEVEL2, async (done: Function) => {
      console.info('[create_drag_action_null_array_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_create_action_null_array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('create_drag_action_null_array'));
      expect(result).assertEqual('"401"');
      console.info('[create_drag_action_null_array_001] END');
      done();
    });

    /**
     * @tc.name   create_drag_action_undefined_array_002
     * @tc.number create_drag_action_undefined_array_002
     * @tc.desc   Test createDragAction with undefined customArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('create_drag_action_undefined_array_002', Level.LEVEL2, async (done: Function) => {
      console.info('[create_drag_action_undefined_array_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_create_action_undefined_array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('create_drag_action_undefined_array'));
      expect(result).assertEqual('"401"');
      console.info('[create_drag_action_undefined_array_002] END');
      done();
    });

    /**
     * @tc.name   create_drag_action_empty_array_003
     * @tc.number create_drag_action_empty_array_003
     * @tc.desc   Test createDragAction with empty customArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('create_drag_action_empty_array_003', Level.LEVEL2, async (done: Function) => {
      console.info('[create_drag_action_empty_array_003] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_create_action_empty_array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('create_drag_action_empty_array'));
      expect(result).assertEqual('"401"');
      console.info('[create_drag_action_empty_array_003] END');
      done();
    });

    /**
     * @tc.name   create_drag_action_null_draginfo_004
     * @tc.number create_drag_action_null_draginfo_004
     * @tc.desc   Test createDragAction with null dragInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('create_drag_action_null_draginfo_004', Level.LEVEL2, async (done: Function) => {
      console.info('[create_drag_action_null_draginfo_004] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_create_action_null_draginfo'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('create_drag_action_null_draginfo'));
      expect(result).assertEqual('"401"');
      console.info('[create_drag_action_null_draginfo_004] END');
      done();
    });

    /**
     * @tc.name   create_drag_action_undefined_draginfo_005
     * @tc.number create_drag_action_undefined_draginfo_005
     * @tc.desc   Test createDragAction with undefined dragInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('create_drag_action_undefined_draginfo_005', Level.LEVEL2, async (done: Function) => {
      console.info('[create_drag_action_undefined_draginfo_005] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_create_action_undefined_draginfo'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('create_drag_action_undefined_draginfo'));
      expect(result).assertEqual('"401"');
      console.info('[create_drag_action_undefined_draginfo_005] END');
      done();
    });

    /**
     * @tc.name   update_config_null_006
     * @tc.number update_config_null_006
     * @tc.desc   Test SpringLoadingContext.updateConfiguration with null config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('update_config_null_006', Level.LEVEL2, async (done: Function) => {
      console.info('[update_config_null_006] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      // Set test mode to null
      let setNullButton = await driver.findComponent(ON.id('btn_set_test_null'));
      await setNullButton.click();
      await CommonFunc.sleep(500);

      // Perform drag to trigger onDragSpringLoading callback
      let dragImage = await driver.findComponent(ON.id('drag_image'));
      let targetButton = await driver.findComponent(ON.id('target_button'));
      await dragImage.dragTo(targetButton);

      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('update_config_null'));
      expect(result).assertEqual('"success"');
      console.info('[update_config_null_006] END');
      done();
    });

    /**
     * @tc.name   update_config_undefined_007
     * @tc.number update_config_undefined_007
     * @tc.desc   Test SpringLoadingContext.updateConfiguration with undefined config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('update_config_undefined_007', Level.LEVEL2, async (done: Function) => {
      console.info('[update_config_undefined_007] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      // Set test mode to undefined
      let setUndefinedButton = await driver.findComponent(ON.id('btn_set_test_undefined'));
      await setUndefinedButton.click();
      await CommonFunc.sleep(500);

      // Perform drag to trigger onDragSpringLoading callback
      let dragImage = await driver.findComponent(ON.id('drag_image'));
      let targetButton = await driver.findComponent(ON.id('target_button'));
      await dragImage.dragTo(targetButton);

      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('update_config_undefined'));
      expect(result).assertEqual('"success"');
      console.info('[update_config_undefined_007] END');
      done();
    });
  });
}
