'use static'
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function SetTextSelectionClearPolicyTest() {
  describe('SetTextSelectionClearPolicyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SetTextSelectionClearPolicyTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      console.info("SetTextSelectionClearPolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/SetTextSelectionClearPolicy',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SetTextSelectionClearPolicyTest state pages: ' + JSON.stringify(pages));
        if (!("SetTextSelectionClearPolicy" == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push SetTextSelectionClearPolicyTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   setTextSelectionClearPolicy_clear_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTEXTSELECTIONCLEARPOLICY_CLEAR_0100
     * @tc.desc   Test setTextSelectionClearPolicy with CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH, selection should be cleared on external touch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('setTextSelectionClearPolicy_clear_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[setTextSelectionClearPolicy_clear_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      // 1. 设置 CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH 策略
      let btnClearPolicy = await driver.findComponent(ON.id('btn_clear_policy'));
      if (btnClearPolicy === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] btn_clear_policy not found');
        return;
      }
      await (btnClearPolicy?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 2. 验证策略已设置
      let policyText = await driver.findComponent(ON.id('text_current_policy'));
      if (policyText === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] text_current_policy not found');
        return;
      }
      let policyContent = await (policyText?.getText() as Promise<string>);
      expect(policyContent).assertContain('CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH');
      console.info('[setTextSelectionClearPolicy_clear_0100] Policy set: ' + policyContent);

      // 3. 长按 Text 选中文本
      let selectableText = await driver.findComponent(ON.id('text_selectable'));
      if (selectableText === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] text_selectable not found');
        return;
      }
      await (selectableText?.longClick() as Promise<void>);
      await CommonFunc.sleep(1500);

      // 4. 获取选中后的状态
      let selectionRangeBefore = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeBefore === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] text_selection_range not found');
        return;
      }
      let rangeBefore = await (selectionRangeBefore?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_clear_0100] Selection before external touch: ' + rangeBefore);
      expect(rangeBefore).not().assertContain('[-1, -1]');

      // 5. 点击外部区域
      let externalArea = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_clear_0100] external_touch_area not found');
        return;
      }
      await (externalArea?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 6. 获取点击外部后的状态
      let selectionRangeAfter = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeAfter === null) {
        expect().assertFail();
        return;
      }
      let rangeAfter = await (selectionRangeAfter?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_clear_0100] Selection after external touch: ' + rangeAfter);

      // 7. 验证 onTextSelectionChange 是否触发（selectionChangeCount 应增加）
      let countText = await driver.findComponent(ON.id('text_selection_count'));
      if (countText === null) {
        expect().assertFail();
        return;
      }
      let countContent = await (countText?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_clear_0100] Selection change count: ' + countContent);
      expect(countContent).assertEqual('Change Count: 2');

      console.info('[setTextSelectionClearPolicy_clear_0100] END');
      done();
    })

    /**
     * @tc.name   setTextSelectionClearPolicy_keep_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTEXTSELECTIONCLEARPOLICY_KEEP_0100
     * @tc.desc   Test setTextSelectionClearPolicy with KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH, selection should be kept on external touch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('setTextSelectionClearPolicy_keep_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[setTextSelectionClearPolicy_keep_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        return;
      }

      // 1. 设置 KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH 策略
      let btnKeepPolicy = await driver.findComponent(ON.id('btn_keep_policy'));
      if (btnKeepPolicy === null) {
        expect().assertFail();
        console.error('[setTextSelectionClearPolicy_keep_0100] btn_keep_policy not found');
        return;
      }
      await (btnKeepPolicy?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 2. 验证策略已设置
      let policyText = await driver.findComponent(ON.id('text_current_policy'));
      if (policyText === null) {
        expect().assertFail();
        return;
      }
      let policyContent: string = await (policyText?.getText() as Promise<string>);
      expect(policyContent).assertContain('KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH');
      console.info('[setTextSelectionClearPolicy_keep_0100] Policy set: ' + policyContent);

      // 3. 长按 Text 选中文本
      let selectableText = await driver.findComponent(ON.id('text_selectable'));
      if (selectableText === null) {
        expect().assertFail();
        return;
      }
      await (selectableText?.longClick() as Promise<void>);
      await CommonFunc.sleep(1500);

      // 4. 获取选中后的范围和计数
      let selectionRangeBefore = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeBefore === null) {
        expect().assertFail();
        return;
      }
      let rangeBefore: string = await (selectionRangeBefore?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_keep_0100] Selection before external touch: ' + rangeBefore);

      let countBefore = await driver.findComponent(ON.id('text_selection_count'));
      if (countBefore === null) {
        expect().assertFail();
        return;
      }
      let countBeforeStr: string = await (countBefore?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_keep_0100] Count before: ' + countBeforeStr);

      // 5. 点击外部区域
      let externalArea = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea === null) {
        expect().assertFail();
        return;
      }
      await (externalArea?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 6. 获取点击外部后的范围和计数
      let selectionRangeAfter = await driver.findComponent(ON.id('text_selection_range'));
      if (selectionRangeAfter === null) {
        expect().assertFail();
        return;
      }
      let rangeAfter: string = await (selectionRangeAfter?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_keep_0100] Selection after external touch: ' + rangeAfter);

      let countAfter = await driver.findComponent(ON.id('text_selection_count'));
      if (countAfter === null) {
        expect().assertFail();
        return;
      }
      let countAfterStr: string = await (countAfter?.getText() as Promise<string>);
      console.info('[setTextSelectionClearPolicy_keep_0100] Count after: ' + countAfterStr);

      // 7. 验证选择保持不变（rangeBefore 和 rangeAfter 相同）
      expect(rangeAfter).assertEqual(rangeBefore);

      console.info('[setTextSelectionClearPolicy_keep_0100] END');
      done();
    })
  })
}