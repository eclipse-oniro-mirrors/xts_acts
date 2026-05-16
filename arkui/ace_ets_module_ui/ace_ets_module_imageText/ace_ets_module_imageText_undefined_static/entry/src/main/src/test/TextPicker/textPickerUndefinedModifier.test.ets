'use static';
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function TextPickerUndefinedModifierTest() {
  describe('TextPickerUndefinedModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextPickerUndefinedModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/textPickerUndefinedModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerUndefinedModifierTest state pages:' + JSON.stringify(pages));
        if (!('textPickerUndefinedModifier' == pages.name)) {
          console.info('get TextPickerUndefinedModifierTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextPickerUndefinedModifierTest page error:' + err);
      }
      console.info('TextPickerUndefinedModifierTest beforeEach end');
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0100
     * @tc.name      TextPickerUndefinedModifierTest_static_0100
     * @tc.desc      TextPickerUndefinedModifierTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let disableTextStyleAnimation_action = await driver.findComponent(ON
        .id('disableTextStyleAnimation_action_modifier'))as Component;
      await disableTextStyleAnimation_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let disableTextStyleAnimationValue = JSON.parseJsonElement(strJson).getElement('$attrs')
        .getElement('disableTextStyleAnimation');
      expect(disableTextStyleAnimationValue.asString()).assertEqual('true');

      await disableTextStyleAnimation_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let disableTextStyleAnimationValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs')
        .getElement('disableTextStyleAnimation');
      expect(disableTextStyleAnimationValue1.asString()).assertEqual('false');

      console.info('[TextPickerUndefinedModifierTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0101
     * @tc.name      TextPickerUndefinedModifierTest_static_0101
     * @tc.desc      TextPickerUndefinedModifierTest_static_0101
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0101] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let disableTextStyleAnimation_action = await driver.findComponent(ON
        .id('disableTextStyleAnimation_action_modifier')) as Component;
      await disableTextStyleAnimation_action.click();
      await CommonFunc.sleep(1000);

      let driver1 = Driver.create();
      let defaultTextStyle_action = await driver1.findComponent(ON.id('defaultTextStyle_action_modifier')) as Component;
      await defaultTextStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let defaultTextStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('defaultTextStyle')
        .getElement('font').getElement('size');
      expect(defaultTextStyleValue.asString()).assertEqual('30.00fp');

      await defaultTextStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let defaultTextStyleValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('defaultTextStyle')
        .getElement('font').getElement('size');
      expect(defaultTextStyleValue1.asString()).assertEqual('16.00fp');
      await disableTextStyleAnimation_action.click();

      console.info('[TextPickerUndefinedModifierTest_static_0101] END');
      done();
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0102
     * @tc.name      TextPickerUndefinedModifierTest_static_0102
     * @tc.desc      TextPickerUndefinedModifierTest_static_0102
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0102', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0102] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let selectedTextStyle_action = await driver.findComponent(ON.id('selectedTextStyle_action_modifier')) as Component;
      await selectedTextStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let selectedTextStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedTextStyle')
        .getElement('font').getElement('size');
      expect(selectedTextStyleValue.asString()).assertEqual('30.00fp');

      await selectedTextStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let selectedTextStyleValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectedTextStyle')
        .getElement('font').getElement('size');
      expect(selectedTextStyleValue1.asString()).assertEqual('20.00fp');

      console.info('[TextPickerUndefinedModifierTest_static_0102] END');
      done();
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0103
     * @tc.name      TextPickerUndefinedModifierTest_static_0103
     * @tc.desc      TextPickerUndefinedModifierTest_static_0103
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0103', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0103] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let textStyle_action = await driver.findComponent(ON.id('textStyle_action_modifier')) as Component;
      await textStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let textStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textStyle')
        .getElement('font').getElement('size');
      expect(textStyleValue.asString()).assertEqual('30.00fp');

      await textStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let textStyleValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('textStyle')
        .getElement('font').getElement('size');
      expect(textStyleValue1.asString()).assertEqual('16.00fp');

      console.info('[TextPickerUndefinedModifierTest_static_0103] END');
      done();
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0104
     * @tc.name      TextPickerUndefinedModifierTest_static_0104
     * @tc.desc      TextPickerUndefinedModifierTest_static_0104
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0104', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0104] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let disappearTextStyle_action = await driver.findComponent(ON.id('disappearTextStyle_action_modifier')) as Component;
      await disappearTextStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let disappearTextStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('disappearTextStyle')
        .getElement('font').getElement('size');
      expect(disappearTextStyleValue.asString()).assertEqual('30.00fp');

      await disappearTextStyle_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let disappearTextStyleValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('disappearTextStyle')
        .getElement('font').getElement('size');
      expect(disappearTextStyleValue1.asString()).assertEqual('14.00fp');

      console.info('[TextPickerUndefinedModifierTest_static_0104] END');
      done();
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0105
     * @tc.name      TextPickerUndefinedModifierTest_static_0105
     * @tc.desc      TextPickerUndefinedModifierTest_static_0105
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0105', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0105] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let canLoop_action = await driver.findComponent(ON.id('canLoop_action_modifier')) as Component;
      await canLoop_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let canLoopValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('canLoop');
      expect(canLoopValue.asString()).assertEqual('false');

      await canLoop_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let canLoopValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('canLoop');
      expect(canLoopValue1.asString()).assertEqual('true');

      console.info('[TextPickerUndefinedModifierTest_static_0105] END');
      done();
    });

    /**
     * @tc.number    TextPickerUndefinedModifierTest_static_0106
     * @tc.name      TextPickerUndefinedModifierTest_static_0106
     * @tc.desc      TextPickerUndefinedModifierTest_static_0106
     * @tc.level     Level.LEVEL1
     */
    it('TextPickerUndefinedModifierTest_static_0106', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TextPickerUndefinedModifierTest_static_0106] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let defaultPickerItemHeight_action = await driver.findComponent(ON.id('defaultPickerItemHeight_action_modifier')) as Component;
      await defaultPickerItemHeight_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textPicker_action_modifier');
      let defaultPickerItemHeightValue = JSON.parseJsonElement(strJson).getElement('$attrs')
        .getElement('defaultPickerItemHeight')
      expect(defaultPickerItemHeightValue.asString()).assertEqual('20.00vp');

      await defaultPickerItemHeight_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('textPicker_action_modifier');
      let defaultPickerItemHeightValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs')
        .getElement('defaultPickerItemHeight');
      expect(defaultPickerItemHeightValue1.asString()).assertEqual('0.00px');

      console.info('[TextPickerUndefinedModifierTest_static_0106] END');
      done();
    });

  })
}
