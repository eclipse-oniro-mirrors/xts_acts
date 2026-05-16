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

export default function dragActionAndPreviewTest() {
  describe('dragActionAndPreviewTest', () => {
    beforeEach(async (done: Function) => {
      console.info('dragActionAndPreviewTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/DragActionAndPreviewNullandundefined/DragActionAndPreviewTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get dragActionAndPreviewTest state pages: ' + JSON.stringify(pages));
        if (!('DragActionAndPreviewTestPage' == pages.name)) {
          console.info('get dragActionAndPreviewTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push dragActionAndPreviewTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push dragActionAndPreviewTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('dragActionAndPreviewTest afterEach called');
    });

    /**
     * @tc.name   DragAction_on_null_type_001
     * @tc.number DragAction_on_null_type_001
     * @tc.desc   Test DragAction.on with null type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragAction_on_null_type_001', Level.LEVEL2, async (done: Function) => {
      console.info('[DragAction_on_null_type_001] START');
      // Test runs in aboutToAppear, just wait and check AppStorage
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_action_on_null'));
      expect(result).assertEqual('"401"');
      console.info('[DragAction_on_null_type_001] END');
      done();
    });

    /**
     * @tc.name   DragAction_on_undefined_type_002
     * @tc.number DragAction_on_undefined_type_002
     * @tc.desc   Test DragAction.on with undefined type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragAction_on_undefined_type_002', Level.LEVEL2, async (done: Function) => {
      console.info('[DragAction_on_undefined_type_002] START');
      // Test runs in aboutToAppear, just wait and check AppStorage
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_action_on_undefined'));
      expect(result).assertEqual('"401"');
      console.info('[DragAction_on_undefined_type_002] END');
      done();
    });

    /**
     * @tc.name   DragAction_off_null_type_003
     * @tc.number DragAction_off_null_type_003
     * @tc.desc   Test DragAction.off with null type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragAction_off_null_type_003', Level.LEVEL2, async (done: Function) => {
      console.info('[DragAction_off_null_type_003] START');
      // Test runs in aboutToAppear, just wait and check AppStorage
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_action_off_null'));
      expect(result).assertEqual('"401"');
      console.info('[DragAction_off_null_type_003] END');
      done();
    });

    /**
     * @tc.name   DragAction_off_undefined_type_004
     * @tc.number DragAction_off_undefined_type_004
     * @tc.desc   Test DragAction.off with undefined type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragAction_off_undefined_type_004', Level.LEVEL2, async (done: Function) => {
      console.info('[DragAction_off_undefined_type_004] START');
      // Test runs in aboutToAppear, just wait and check AppStorage
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_action_off_undefined'));
      expect(result).assertEqual('"401"');
      console.info('[DragAction_off_undefined_type_004] END');
      done();
    });

    /**
     * @tc.name   DragPreview_set_foreground_null_005
     * @tc.number DragPreview_set_foreground_null_005
     * @tc.desc   Test DragPreview.setForegroundColor with null color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragPreview_set_foreground_null_005', Level.LEVEL2, async (done: Function) => {
      console.info('[DragPreview_set_foreground_null_005] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      // Click test mode button to set testPreviewNull flag
      let setModeButton = await driver.findComponent(ON.id('btn_test_preview_null'));
      await setModeButton.click();
      await CommonFunc.sleep(500);

      // Perform drag to trigger onDragEnter callback
      let dragImage = await driver.findComponent(ON.id('drag_image'));
      let targetButton = await driver.findComponent(ON.id('target_button'));
      await dragImage.dragTo(targetButton);

      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_preview_set_foreground_null'));
      expect(result).assertEqual('"success"');
      console.info('[DragPreview_set_foreground_null_005] END');
      done();
    });

    /**
     * @tc.name   DragPreview_set_foreground_undefined_006
     * @tc.number DragPreview_set_foreground_undefined_006
     * @tc.desc   Test DragPreview.setForegroundColor with undefined color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragPreview_set_foreground_undefined_006', Level.LEVEL2, async (done: Function) => {
      console.info('[DragPreview_set_foreground_undefined_006] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      // Click test mode button to set testPreviewUndefined flag
      let setModeButton = await driver.findComponent(ON.id('btn_test_preview_undefined'));
      await setModeButton.click();
      await CommonFunc.sleep(500);

      // Perform drag to trigger onDragEnter callback
      let dragImage = await driver.findComponent(ON.id('drag_image'));
      let targetButton = await driver.findComponent(ON.id('target_button'));
      await dragImage.dragTo(targetButton);

      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_preview_set_foreground_undefined'));
      expect(result).assertEqual('"success"');
      console.info('[DragPreview_set_foreground_undefined_006] END');
      done();
    });

    /**
     * @tc.name   DragPreview_animate_null_007
     * @tc.number DragPreview_animate_null_007
     * @tc.desc   Test DragPreview.animate with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragPreview_animate_null_007', Level.LEVEL2, async (done: Function) => {
      console.info('[DragPreview_animate_null_007] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      // Click test mode button to set testAnimateNull flag
      let setModeButton = await driver.findComponent(ON.id('btn_test_animate_null'));
      await setModeButton.click();
      await CommonFunc.sleep(500);

      // Perform drag to trigger onDragEnter callback
      let dragImage = await driver.findComponent(ON.id('drag_image'));
      let targetButton = await driver.findComponent(ON.id('target_button'));
      await dragImage.dragTo(targetButton);

      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_preview_animate_null'));
      expect(result).assertEqual('"success"');
      console.info('[DragPreview_animate_null_007] END');
      done();
    });

    /**
     * @tc.name   DragPreview_animate_undefined_008
     * @tc.number DragPreview_animate_undefined_008
     * @tc.desc   Test DragPreview.animate with undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragPreview_animate_undefined_008', Level.LEVEL2, async (done: Function) => {
      console.info('[DragPreview_animate_undefined_008] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      // Click test mode button to set testAnimateUndefined flag
      let setModeButton = await driver.findComponent(ON.id('btn_test_animate_undefined'));
      await setModeButton.click();
      await CommonFunc.sleep(500);

      // Perform drag to trigger onDragEnter callback
      let dragImage = await driver.findComponent(ON.id('drag_image'));
      let targetButton = await driver.findComponent(ON.id('target_button'));
      await dragImage.dragTo(targetButton);

      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('drag_preview_animate_undefined'));
      expect(result).assertEqual('"success"');
      console.info('[DragPreview_animate_undefined_008] END');
      done();
    });
  });
}
