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

export default function ScrollUndefinedModifierTest() {
  describe('ScrollUndefinedModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ScrollUndefinedModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollUndefinedModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ScrollUndefinedModifierTest state pages:' + JSON.stringify(pages));
        if (!('scrollUndefinedModifier' == pages.name)) {
          console.info('get ScrollUndefinedModifierTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ScrollUndefinedModifierTest page error:' + err);
      }
      console.info('ScrollUndefinedModifierTest beforeEach end');
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0100
     * @tc.name      ScrollUndefinedModifierTest_static_0100
     * @tc.desc      ScrollUndefinedModifierTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0100] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('edgeEffect true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect')));
      let edgeEffectValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect');
      expect(edgeEffectValue.asString()).assertEqual('EdgeEffect.Spring');

      let driver = Driver.create();
      let edgeEffect_action = await driver.findComponent(ON.id('edgeEffect_action')) as Component;
      await edgeEffect_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('edgeEffect undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('edgeEffect')));
      let edgeEffectValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('edgeEffect');
      expect(edgeEffectValue1.asString()).assertEqual('EdgeEffect.None');

      console.info('[ScrollUndefinedModifierTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0101
     * @tc.name      ScrollUndefinedModifierTest_static_0101
     * @tc.desc      ScrollUndefinedModifierTest_static_0101
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0101] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('initialOffset undefined value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('initialOffset').getElement('xOffset')) + JSON.stringifyJsonElement(
        JSON.parseJsonElement(strJson).getElement('$attrs').getElement('initialOffset').getElement('yOffset')));
      let initialXOffsetValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('initialOffset')
        .getElement('xOffset');
      let initialYOffsetValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('initialOffset')
        .getElement('yOffset');
      expect(initialXOffsetValue.asString()).assertEqual('0.00px');
      expect(initialYOffsetValue.asString()).assertEqual('0.00px');

      console.info('[ScrollUndefinedModifierTest_static_0101] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0102
     * @tc.name      ScrollUndefinedModifierTest_static_0102
     * @tc.desc      ScrollUndefinedModifierTest_static_0102
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0102', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0102] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('enablePaging true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enablePaging')));
      let enablePagingValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enablePaging');
      expect(enablePagingValue.asBoolean()).assertEqual(true);

      let driver = Driver.create();
      let enablePaging_action = await driver.findComponent(ON.id('enablePaging_action')) as Component;
      await enablePaging_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('enablePaging undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('enablePaging')));
      let enablePagingValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('enablePaging');
      expect(enablePagingValue1.asBoolean()).assertEqual(false);

      console.info('[ScrollUndefinedModifierTest_static_0102] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0103
     * @tc.name      ScrollUndefinedModifierTest_static_0103
     * @tc.desc      ScrollUndefinedModifierTest_static_0103
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0103', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0103] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('scrollSnap true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollSnap')
        .getElement('enableSnapToStart')));
      let scrollSnapValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollSnap')
        .getElement('enableSnapToStart');
      expect(scrollSnapValue.asBoolean()).assertEqual(false);

      let driver = Driver.create();
      let scrollSnap_action = await driver.findComponent(ON.id('scrollSnap_action')) as Component;
      await scrollSnap_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('scrollSnap undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollSnap')
        .getElement('enableSnapToStart')));
      let scrollSnapValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollSnap')
        .getElement('enableSnapToStart');
      expect(scrollSnapValue1.asBoolean()).assertEqual(true);

      console.info('[ScrollUndefinedModifierTest_static_0103] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0104
     * @tc.name      ScrollUndefinedModifierTest_static_0104
     * @tc.desc      ScrollUndefinedModifierTest_static_0104
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0104', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0104] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onWillScroll_action = await driver.findComponent(ON.id('onWillScroll_action')) as Component;
      await onWillScroll_action.click();
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let toBottom = await driver1.findComponent(ON.id('toBottom')) as Component;
      await toBottom.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('eventValue');
      console.info('onWillScrollValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onWillScrollValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onWillScrollValue.asString()).assertEqual('onWillScrollValue');

      await onWillScroll_action.click();
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let resetValue = await driver2.findComponent(ON.id('resetValue')) as Component;
      await resetValue.click();
      await CommonFunc.sleep(500);

      let driver3 = Driver.create();
      let toTop = await driver3.findComponent(ON.id('toTop')) as Component;
      await toTop.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('eventValue');
      console.info('onWillScrollValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onWillScrollValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onWillScrollValue1.asString()).assertEqual('value');

      console.info('[ScrollUndefinedModifierTest_static_0104] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0105
     * @tc.name      ScrollUndefinedModifierTest_static_0105
     * @tc.desc      ScrollUndefinedModifierTest_static_0105
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0105', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0105] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onDidScroll_action = await driver.findComponent(ON.id('onDidScroll_action')) as Component;
      await onDidScroll_action.click();
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let toBottom = await driver1.findComponent(ON.id('toBottom')) as Component;
      await toBottom.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('eventValue');
      console.info('onDidScrollValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onDidScrollValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onDidScrollValue.asString()).assertEqual('onDidScrollValue');

      await onDidScroll_action.click();
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let resetValue = await driver2.findComponent(ON.id('resetValue')) as Component;
      await resetValue.click();
      await CommonFunc.sleep(500);

      let driver3 = Driver.create();
      let toTop = await driver3.findComponent(ON.id('toTop')) as Component;
      await toTop.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('eventValue');
      console.info('onDidScrollValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onDidScrollValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onDidScrollValue1.asString()).assertEqual('value');

      console.info('[ScrollUndefinedModifierTest_static_0105] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0106
     * @tc.name      ScrollUndefinedModifierTest_static_0106
     * @tc.desc      ScrollUndefinedModifierTest_static_0106
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0106', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0106] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onScrollFrameBegin_action = await driver.findComponent(ON.id('onScrollFrameBegin_action')) as Component;
      await onScrollFrameBegin_action.click();
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let toBottom = await driver1.findComponent(ON.id('toBottom')) as Component;
      await toBottom.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('eventValue');
      console.info('onScrollFrameBeginValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onScrollFrameBeginValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onScrollFrameBeginValue.asString()).assertEqual('onScrollFrameBeginValue');

      await onScrollFrameBegin_action.click();
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let resetValue = await driver2.findComponent(ON.id('resetValue')) as Component;
      await resetValue.click();
      await CommonFunc.sleep(500);

      let driver3 = Driver.create();
      let toTop = await driver3.findComponent(ON.id('toTop')) as Component;
      await toTop.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('eventValue');
      console.info('onScrollFrameBeginValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onScrollFrameBeginValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onScrollFrameBeginValue1.asString()).assertEqual('value');

      console.info('[ScrollUndefinedModifierTest_static_0106] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0107
     * @tc.name      ScrollUndefinedModifierTest_static_0107
     * @tc.desc      ScrollUndefinedModifierTest_static_0107
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0107', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0107] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onScrollStop_action = await driver.findComponent(ON.id('onScrollStop_action')) as Component;
      await onScrollStop_action.click();
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let toBottom = await driver1.findComponent(ON.id('toBottom')) as Component;
      await toBottom.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('eventValue');
      console.info('onScrollStopValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onScrollStopValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onScrollStopValue.asString()).assertEqual('onScrollStopValue');

      await onScrollStop_action.click();
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let resetValue = await driver2.findComponent(ON.id('resetValue')) as Component;
      await resetValue.click();
      await CommonFunc.sleep(500);

      let driver3 = Driver.create();
      let toTop = await driver3.findComponent(ON.id('toTop')) as Component;
      await toTop.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('eventValue');
      console.info('onScrollStopValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onScrollStopValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onScrollStopValue1.asString()).assertEqual('value');

      console.info('[ScrollUndefinedModifierTest_static_0107] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0108
     * @tc.name      ScrollUndefinedModifierTest_static_0108
     * @tc.desc      ScrollUndefinedModifierTest_static_0108
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0108', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0108] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onScrollStart_action = await driver.findComponent(ON.id('onScrollStart_action')) as Component;
      await onScrollStart_action.click();
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let toBottom = await driver1.findComponent(ON.id('toBottom')) as Component;
      await toBottom.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('eventValue');
      console.info('onScrollStartValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onScrollStartValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onScrollStartValue.asString()).assertEqual('onScrollStartValue');

      await onScrollStart_action.click();
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let resetValue = await driver2.findComponent(ON.id('resetValue')) as Component;
      await resetValue.click();
      await CommonFunc.sleep(500);

      let driver3 = Driver.create();
      let toTop = await driver3.findComponent(ON.id('toTop')) as Component;
      await toTop.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('eventValue');
      console.info('onScrollStartValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onScrollStartValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onScrollStartValue1.asString()).assertEqual('value');

      console.info('[ScrollUndefinedModifierTest_static_0108] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0109
     * @tc.name      ScrollUndefinedModifierTest_static_0109
     * @tc.desc      ScrollUndefinedModifierTest_static_0109
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0109', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0109] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onScrollEdge_action = await driver.findComponent(ON.id('onScrollEdge_action')) as Component;
      await onScrollEdge_action.click();
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let toBottom = await driver1.findComponent(ON.id('toBottom')) as Component;
      await toBottom.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('eventValue');
      console.info('onScrollEdgeValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let onScrollEdgeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onScrollEdgeValue.asString()).assertEqual('onScrollEdgeValue');

      await onScrollEdge_action.click();
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let resetValue = await driver2.findComponent(ON.id('resetValue')) as Component;
      await resetValue.click();
      await CommonFunc.sleep(500);

      let driver3 = Driver.create();
      let toTop = await driver3.findComponent(ON.id('toTop')) as Component;
      await toTop.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('eventValue');
      console.info('onScrollEdgeValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      let onScrollEdgeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onScrollEdgeValue1.asString()).assertEqual('value');

      console.info('[ScrollUndefinedModifierTest_static_0109] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0110
     * @tc.name      ScrollUndefinedModifierTest_static_0110
     * @tc.desc      ScrollUndefinedModifierTest_static_0110
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0110', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0110] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let nestedScroll_action = await driver.findComponent(ON.id('nestedScroll_action')) as Component;
      await nestedScroll_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('nestedScrollValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollForward')) +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollBackward')));
      let nestedScrollValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollForward');
      let nestedScrollValue0 = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollBackward');
      expect(nestedScrollValue.asString()).assertEqual('NestedScrollMode.PARENT_FIRST');
      expect(nestedScrollValue0.asString()).assertEqual('NestedScrollMode.SELF_FIRST');

      await nestedScroll_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('nestedScrollValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollForward')) +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollBackward')));
      let nestedScrollValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollForward');
      let nestedScrollValue2 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('nestedScroll')
        .getElement('scrollBackward');
      expect(nestedScrollValue1.asString()).assertEqual('NestedScrollMode.SELF_ONLY');
      expect(nestedScrollValue2.asString()).assertEqual('NestedScrollMode.SELF_ONLY');

      console.info('[ScrollUndefinedModifierTest_static_0110] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0111
     * @tc.name      ScrollUndefinedModifierTest_static_0111
     * @tc.desc      ScrollUndefinedModifierTest_static_0111
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0111', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0111] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let enableScrollInteraction_action = await driver.findComponent(ON.id('enableScrollInteraction_action')) as Component;
      await enableScrollInteraction_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('enableScrollInteractionValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableScrollInteraction')));
      let enableScrollInteractionValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableScrollInteraction');
      expect(enableScrollInteractionValue.asBoolean()).assertEqual(false);

      await enableScrollInteraction_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('enableScrollInteractionValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('enableScrollInteraction')));
      let enableScrollInteractionValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('enableScrollInteraction');
      expect(enableScrollInteractionValue1.asBoolean()).assertEqual(true);

      console.info('[ScrollUndefinedModifierTest_static_0111] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0112
     * @tc.name      ScrollUndefinedModifierTest_static_0112
     * @tc.desc      ScrollUndefinedModifierTest_static_0112
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0112', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0112] START');
      await CommonFunc.sleep(500);

      let strJsonDefault  = inspector.getInspectorByKey('scroll_action');
      let frictionDefaultValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonDefault).getElement('$attrs')
        .getElement('friction'));

      let driver = Driver.create();
      let friction_action = await driver.findComponent(ON.id('friction_action')) as Component;
      await friction_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('frictionValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('friction')));
      let frictionValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')
        .getElement('friction'));
      expect(frictionValue).assertEqual('100');

      await friction_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('frictionValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('friction')));
      let frictionValue1 = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs')
        .getElement('friction'));
      expect(frictionValue1).assertEqual(frictionDefaultValue);

      console.info('[ScrollUndefinedModifierTest_static_0112] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0113
     * @tc.name      ScrollUndefinedModifierTest_static_0113
     * @tc.desc      ScrollUndefinedModifierTest_static_0113
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0113', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0113] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let scrollable_action = await driver.findComponent(ON.id('scrollable_action')) as Component;
      await scrollable_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('scrollableValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollable')));
      let scrollableValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollable');
      expect(scrollableValue.asString()).assertEqual('ScrollDirection.None');

      await scrollable_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('scrollableValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollable')));
      let scrollableValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollable');
      expect(scrollableValue1.asString()).assertEqual('ScrollDirection.Vertical');

      console.info('[ScrollUndefinedModifierTest_static_0113] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0114
     * @tc.name      ScrollUndefinedModifierTest_static_0114
     * @tc.desc      ScrollUndefinedModifierTest_static_0114
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0114', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0114] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let scrollBar_action = await driver.findComponent(ON.id('scrollBar_action')) as Component;
      await scrollBar_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('scrollBarValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBar')));
      let scrollBarValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBar');
      expect(scrollBarValue.asString()).assertEqual('BarState.On');

      await scrollBar_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('scrollBarValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollBar')));
      let scrollBarValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollBar');
      expect(scrollBarValue1.asString()).assertEqual('BarState.Auto');

      console.info('[ScrollUndefinedModifierTest_static_0114] END');
      done();
    });

    /**
     * @tc.number    ScrollUndefinedModifierTest_static_0115
     * @tc.name      ScrollUndefinedModifierTest_static_0115
     * @tc.desc      ScrollUndefinedModifierTest_static_0115
     * @tc.level     Level.LEVEL1
     */
    it('ScrollUndefinedModifierTest_static_0115', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollUndefinedModifierTest_static_0115] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let scrollBarWidth_action = await driver.findComponent(ON.id('scrollBarWidth_action')) as Component;
      await scrollBarWidth_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('scroll_action');
      console.info('scrollBarWidthValue true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarWidth')));
      let scrollBarWidthValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollBarWidth');
      expect(scrollBarWidthValue.asString()).assertEqual('10.00vp');

      await scrollBarWidth_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('scroll_action');
      console.info('scrollBarWidthValue undefined value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollBarWidth')));
      let scrollBarWidthValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollBarWidth');
      expect(scrollBarWidthValue1.asString()).assertEqual('4.00vp');

      console.info('[ScrollUndefinedModifierTest_static_0115] END');
      done();
    });

  })
}
