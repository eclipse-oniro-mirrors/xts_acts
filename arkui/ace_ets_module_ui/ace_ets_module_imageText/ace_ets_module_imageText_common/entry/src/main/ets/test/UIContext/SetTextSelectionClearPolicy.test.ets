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
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SetTextSelectionClearPolicyTest() {
  describe('SetTextSelectionClearPolicyTest', () => {
    let driver: Driver | null = null;
    beforeEach(async (done: Function) => {
      console.info("SetTextSelectionClearPolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/SetTextSelectionClearPolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetTextSelectionClearPolicyTest state pages: " + JSON.stringify(pages));
        if (!("SetTextSelectionClearPolicy" == pages.name)) {
          console.info("get SetTextSelectionClearPolicyTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SetTextSelectionClearPolicyTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetTextSelectionClearPolicyTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   setTextSelectionClearPolicy_clear_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTEXTSELECTIONCLEARPOLICY_CLEAR_0100
     * @tc.desc   Test setTextSelectionClearPolicy with CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH, selection should be cleared on external touch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('setTextSelectionClearPolicy_clear_0100', Level.LEVEL0, async () => {
      console.info('[setTextSelectionClearPolicy_clear_0100] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      // 1. 设置 CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH 策略
      let btnClearPolicy: Component | null = await driver.findComponent(ON.id('btn_clear_policy'));
      if (btnClearPolicy === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] btn_clear_policy not found');
        return;
      }
      await btnClearPolicy.click();
      await CommonFunc.sleep(1000);

      // 2. 验证策略已设置
      let policyText: Component | null = await driver.findComponent(ON.id('text_current_policy'));
      if (policyText === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] text_current_policy not found');
        return;
      }
      let policyContent: string = await policyText.getText();
      expect(policyContent).assertContain('CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH');
      console.info('[setTextSelectionClearPolicy_clear_0100] Policy set: ' + policyContent);

      // 3. 长按 Text 选中文本
      let selectableText: Component | null = await driver.findComponent(ON.id('text_selectable'));
      if (selectableText === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] text_selectable not found');
        return;
      }
      await selectableText.longClick();
      await CommonFunc.sleep(1500);

      // 4. 获取选中后的状态
      let selectionRangeBefore: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeBefore === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] text_selection_range not found');
        return;
      }
      let rangeBefore: string = await selectionRangeBefore.getText();
      console.info('[setTextSelectionClearPolicy_clear_0100] Selection before external touch: ' + rangeBefore);
      expect(rangeBefore).not().assertContain('[-1, -1]');

      // 5. 点击外部区域
      let externalArea: Component | null = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] external_touch_area not found');
        return;
      }
      await externalArea.click();
      await CommonFunc.sleep(1000);

      // 6. 获取点击外部后的状态
      let selectionRangeAfter: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeAfter === null) {
        expect().assertFail();
        return;
      }
      let rangeAfter: string = await selectionRangeAfter.getText();
      console.info('[setTextSelectionClearPolicy_clear_0100] Selection after external touch: ' + rangeAfter);

      // 7. 验证 onTextSelectionChange 是否触发（selectionChangeCount 应增加）
      let countText: Component | null = await driver.findComponent(ON.id('text_selection_count'));
      if (countText === null) {
        expect().assertFail();
        return;
      }
      let countContent: string = await countText.getText();
      console.info('[setTextSelectionClearPolicy_clear_0100] Selection change count: ' + countContent);
      expect(countContent).assertEqual('Change Count: 2');

      console.info('[setTextSelectionClearPolicy_clear_0100] END');
    })

    /**
     * @tc.name   setTextSelectionClearPolicy_keep_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTEXTSELECTIONCLEARPOLICY_KEEP_0100
     * @tc.desc   Test setTextSelectionClearPolicy with KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH, selection should be kept on external touch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('setTextSelectionClearPolicy_keep_0100', Level.LEVEL0, async () => {
      console.info('[setTextSelectionClearPolicy_keep_0100] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      // 1. 设置 KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH 策略
      let btnKeepPolicy: Component | null = await driver.findComponent(ON.id('btn_keep_policy'));
      if (btnKeepPolicy === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_keep_0100] btn_keep_policy not found');
        return;
      }
      await btnKeepPolicy.click();
      await CommonFunc.sleep(1000);

      // 2. 验证策略已设置
      let policyText: Component | null = await driver.findComponent(ON.id('text_current_policy'));
      if (policyText === null) {
        expect().assertFail();
        return;
      }
      let policyContent: string = await policyText.getText();
      expect(policyContent).assertContain('KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH');
      console.info('[setTextSelectionClearPolicy_keep_0100] Policy set: ' + policyContent);

      // 3. 长按 Text 选中文本
      let selectableText: Component | null = await driver.findComponent(ON.id('text_selectable'));
      if (selectableText === null) {
        expect().assertFail();
        return;
      }
      await selectableText.longClick();
      await CommonFunc.sleep(1500);

      // 4. 获取选中后的范围和计数
      let selectionRangeBefore: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeBefore === null) {
        expect().assertFail();
        return;
      }
      let rangeBefore: string = await selectionRangeBefore.getText();
      console.info('[setTextSelectionClearPolicy_keep_0100] Selection before external touch: ' + rangeBefore);

      let countBefore: Component | null = await driver.findComponent(ON.id('text_selection_count'));
      if (countBefore === null) {
        expect().assertFail();
        return;
      }
      let countBeforeStr: string = await countBefore.getText();
      console.info('[setTextSelectionClearPolicy_keep_0100] Count before: ' + countBeforeStr);

      // 5. 点击外部区域
      let externalArea: Component | null = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea === null) {
        expect().assertFail();
        return;
      }
      await externalArea.click();
      await CommonFunc.sleep(1000);

      // 6. 获取点击外部后的范围和计数
      let selectionRangeAfter: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeAfter === null) {
        expect().assertFail();
        return;
      }
      let rangeAfter: string = await selectionRangeAfter.getText();
      console.info('[setTextSelectionClearPolicy_keep_0100] Selection after external touch: ' + rangeAfter);

      let countAfter: Component | null = await driver.findComponent(ON.id('text_selection_count'));
      if (countAfter === null) {
        expect().assertFail();
        return;
      }
      let countAfterStr: string = await countAfter.getText();
      console.info('[setTextSelectionClearPolicy_keep_0100] Count after: ' + countAfterStr);

      // 7. 验证选择保持不变（rangeBefore 和 rangeAfter 相同）
      expect(rangeAfter).assertEqual(rangeBefore);

      console.info('[setTextSelectionClearPolicy_keep_0100] END');
    })

    /**
     * @tc.name   setTextSelectionClearPolicy_null_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTEXTSELECTIONCLEARPOLICY_NULL_0100
     * @tc.desc   Test setTextSelectionClearPolicy with null, should use default KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('setTextSelectionClearPolicy_null_0100', Level.LEVEL0, async () => {
      console.info('[setTextSelectionClearPolicy_null_0100] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      // 1. 设置 null 策略（应恢复默认 KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH）
      let btnNullPolicy: Component | null = await driver.findComponent(ON.id('btn_null_policy'));
      if (btnNullPolicy === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_null_0100] btn_null_policy not found');
        return;
      }
      await btnNullPolicy.click();
      await CommonFunc.sleep(1000);

      // 2. 验证策略已设置为默认值
      let policyText: Component | null = await driver.findComponent(ON.id('text_current_policy'));
      if (policyText === null) {
        expect().assertFail();
        return;
      }
      let policyContent: string = await policyText.getText();
      expect(policyContent).assertContain('null');
      console.info('[setTextSelectionClearPolicy_null_0100] Policy set: ' + policyContent);

      // 3. 长按 Text 选中文本
      let selectableText: Component | null = await driver.findComponent(ON.id('text_selectable'));
      if (selectableText === null) {
        expect().assertFail();
        return;
      }
      await selectableText.longClick();
      await CommonFunc.sleep(1500);

      // 4. 获取选中后的范围
      let selectionRangeBefore: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeBefore === null) {
        expect().assertFail();
        return;
      }
      let rangeBefore: string = await selectionRangeBefore.getText();
      console.info('[setTextSelectionClearPolicy_null_0100] Selection before: ' + rangeBefore);

      // 5. 点击外部区域
      let externalArea: Component | null = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea === null) {
        expect().assertFail();
        return;
      }
      await externalArea.click();
      await CommonFunc.sleep(1000);

      // 6. 获取点击外部后的范围
      let selectionRangeAfter: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeAfter === null) {
        expect().assertFail();
        return;
      }
      let rangeAfter: string = await selectionRangeAfter.getText();
      console.info('[setTextSelectionClearPolicy_null_0100] Selection after: ' + rangeAfter);

      // 7. 验证选择保持不变（默认策略是 KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH）
      expect(rangeAfter).assertEqual(rangeBefore);

      console.info('[setTextSelectionClearPolicy_null_0100] END');
    })

    /**
     * @tc.name   setTextSelectionClearPolicy_undefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTEXTSELECTIONCLEARPOLICY_UNDEFINED_0100
     * @tc.desc   Test setTextSelectionClearPolicy with undefined, should use default KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('setTextSelectionClearPolicy_undefined_0100', Level.LEVEL0, async () => {
      console.info('[setTextSelectionClearPolicy_undefined_0100] START');
      driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      // 1. 设置 undefined 策略（应恢复默认 KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH）
      let btnUndefinedPolicy: Component | null = await driver.findComponent(ON.id('btn_undefined_policy'));
      if (btnUndefinedPolicy === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_undefined_0100] btn_undefined_policy not found');
        return;
      }
      await btnUndefinedPolicy.click();
      await CommonFunc.sleep(1000);

      // 2. 验证策略已设置为默认值
      let policyText: Component | null = await driver.findComponent(ON.id('text_current_policy'));
      if (policyText === null) {
        expect().assertFail();
        return;
      }
      let policyContent: string = await policyText.getText();
      expect(policyContent).assertContain('undefined');
      console.info('[setTextSelectionClearPolicy_undefined_0100] Policy set: ' + policyContent);

      // 3. 长按 Text 选中文本
      let selectableText: Component | null = await driver.findComponent(ON.id('text_selectable'));
      if (selectableText === null) {
        expect().assertFail();
        return;
      }
      await selectableText.longClick();
      await CommonFunc.sleep(1500);

      // 4. 获取选中后的范围
      let selectionRangeBefore: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeBefore === null) {
        expect().assertFail();
        return;
      }
      let rangeBefore: string = await selectionRangeBefore.getText();
      console.info('[setTextSelectionClearPolicy_undefined_0100] Selection before: ' + rangeBefore);

      // 5. 点击外部区域
      let externalArea: Component | null = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea === null) {
        expect().assertFail();
        return;
      }
      await externalArea.click();
      await CommonFunc.sleep(1000);

      // 6. 获取点击外部后的范围
      let selectionRangeAfter: Component | null = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeAfter === null) {
        expect().assertFail();
        return;
      }
      let rangeAfter: string = await selectionRangeAfter.getText();
      console.info('[setTextSelectionClearPolicy_undefined_0100] Selection after: ' + rangeAfter);

      // 7. 验证选择保持不变（默认策略是 KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH）
      expect(rangeAfter).assertEqual(rangeBefore);

      console.info('[setTextSelectionClearPolicy_undefined_0100] END');
    })

  })
}