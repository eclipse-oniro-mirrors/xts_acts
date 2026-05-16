/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function ListItemUndefinedModifierTest() {
  describe('ListItemUndefinedModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ListItemUndefinedModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListItem/listItemUndefinedModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ListItemUndefinedModifierTest state pages:' + JSON.stringify(pages));
        if (!('listItemUndefinedModifier' == pages.name)) {
          console.info('get ListItemUndefinedModifierTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error('push ListItemUndefinedModifierTest page error:' + err);
      }
      console.info('ListItemUndefinedModifierTest beforeEach end');
    });

    /**
     * @tc.number    ListItemUndefinedModifierTest_static_0100
     * @tc.name      ListItemUndefinedModifierTest_static_0100
     * @tc.desc      ListItemUndefinedModifierTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ListItemUndefinedModifierTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListItemUndefinedModifierTest_static_0100] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let selected_action = await driver.findComponent(ON.id('selected_action'))as Component;
      await selected_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('listItem_action');
      console.info('selected true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selected')));
      let selectedValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selected');
      expect(selectedValue.asBoolean()).assertEqual(true);

      await selected_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('listItem_action');
      console.info('selected undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selected')));
      let selectedValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selected');
      expect(selectedValue1.asBoolean()).assertEqual(false);

      console.info('[ListItemUndefinedModifierTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ListItemUndefinedModifierTest_static_0101
     * @tc.name      ListItemUndefinedModifierTest_static_0101
     * @tc.desc      ListItemUndefinedModifierTest_static_0101
     * @tc.level     Level.LEVEL1
     */
    it('ListItemUndefinedModifierTest_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListItemUndefinedModifierTest_static_0101] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let selectable_action = await driver.findComponent(ON.id('selectable_action'))as Component;
      await selectable_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('listItem_action');
      console.info('selectable true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectable')));
      let selectableValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectable');
      expect(selectableValue.asBoolean()).assertEqual(false);

      await selectable_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('listItem_action');
      console.info('selectable undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectable')));
      let selectableValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectable');
      expect(selectableValue1.asBoolean()).assertEqual(true);

      console.info('[ListItemUndefinedModifierTest_static_0101] END');
      done();
    });

    /**
     * @tc.number    ListItemUndefinedModifierTest_static_0102
     * @tc.name      ListItemUndefinedModifierTest_static_0102
     * @tc.desc      ListItemUndefinedModifierTest_static_0102
     * @tc.level     Level.LEVEL1
     */
    it('ListItemUndefinedModifierTest_static_0102', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListItemUndefinedModifierTest_static_0102] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let swipeAction_action = await driver.findComponent(ON.id('swipeAction_action'))as Component;
      await swipeAction_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('listItem_action');
      console.info('swipeAction true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('swipeAction')
        .getElement('edgeEffect')));
      let swipeActionValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('swipeAction')
        .getElement('edgeEffect');
      expect(swipeActionValue.asString()).assertEqual('SwipeEdgeEffect.Spring');

      await swipeAction_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('listItem_action');
      console.info('swipeAction undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('swipeAction')
        .getElement('edgeEffect')));
      let swipeActionValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('swipeAction')
        .getElement('edgeEffect');
      expect(swipeActionValue1.asString()).assertEqual('SwipeEdgeEffect.None');

      console.info('[ListItemUndefinedModifierTest_static_0102] END');
      done();
    });

    /**
     * @tc.number    ListItemUndefinedModifierTest_static_0103
     * @tc.name      ListItemUndefinedModifierTest_static_0103
     * @tc.desc      ListItemUndefinedModifierTest_static_0103
     * @tc.level     Level.LEVEL1
     */
    it('ListItemUndefinedModifierTest_static_0103', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListItemUndefinedModifierTest_static_0103] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onSelect_action = await driver.findComponent(ON.id('onSelect_action'))as Component;
      await onSelect_action.click();
      await CommonFunc.sleep(500);

      let selected_action = await driver.findComponent(ON.id('selected_action'))as Component;
      let selectable_action = await driver.findComponent(ON.id('selectable_action'))as Component;
      await selected_action.click();
      await CommonFunc.sleep(500);
      await selectable_action.click();
      await CommonFunc.sleep(500);

      await selectable_action.click();
      await CommonFunc.sleep(500);
      await selectable_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('onSelectValue');
      console.info('onSelect true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onSelectValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onSelectValue.asString()).assertEqual('UUU');

      await onSelect_action.click();
      await CommonFunc.sleep(500);

      await selectable_action.click();
      await CommonFunc.sleep(500);
      await selectable_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('onSelectValue');
      console.info('onSelect undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onSelectValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onSelectValue1.asString()).assertEqual('UUU');

      console.info('[ListItemUndefinedModifierTest_static_0103] END');
      done();
    });

  })
}
