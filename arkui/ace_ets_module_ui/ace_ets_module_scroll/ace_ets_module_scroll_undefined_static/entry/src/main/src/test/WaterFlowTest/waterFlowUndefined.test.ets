'use static'
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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function WaterFlowUndefinedTest() {
  describe('WaterFlowUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("WaterFlowUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("WaterFlowUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/waterFlowUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowUndefined state pages:" + JSON.stringify(pages));
        if (!("waterFlowUndefined" == pages.name)) {
          console.info("get WaterFlowUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowEventPage page error:" + err);
      }
      console.info("WaterFlowUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0100
     * @tc.name     WaterFlowUndefinedTest_static_0100
     * @tc.desc     WaterFlowUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0100] friction: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('friction')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('friction')))
        .assertEqual('20');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_friction'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[WaterFlowUndefinedTest_static_0100] click WaterFlow_friction");
      strJson = inspector.getInspectorByKey('WaterFlow');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('friction')) !== "20.0")
        .assertTrue();
      console.info('[WaterFlowUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0200
     * @tc.name     WaterFlowUndefinedTest_static_0200
     * @tc.desc     WaterFlowUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0200] enableScrollInteraction: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableScrollInteraction')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableScrollInteraction')))
        .assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_enableScrollInteraction'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0200] click WaterFlow_enableScrollInteraction");
      strJson = inspector.getInspectorByKey('WaterFlow');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableScrollInteraction')))
        .assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0300
     * @tc.name     WaterFlowUndefinedTest_static_0300
     * @tc.desc     WaterFlowUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0300] layoutDirection: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutDirection')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutDirection')))
        .assertEqual('\"FlexDirection.Row\"');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_layoutDirection'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0300] click WaterFlow_layoutDirection");
      strJson = inspector.getInspectorByKey('WaterFlow');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutDirection')))
        .assertEqual('\"FlexDirection.Column\"');
      console.info('[WaterFlowUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0400
     * @tc.name     WaterFlowUndefinedTest_static_0400
     * @tc.desc     WaterFlowUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0400] rowsGap: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsGap')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsGap')))
        .assertEqual('\"10.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_rowsGapValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0400] click WaterFlow_rowsGapValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsGap')))
        .assertEqual('\"0.00vp\"');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0500
     * @tc.name     WaterFlowUndefinedTest_static_0500
     * @tc.desc     WaterFlowUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0500] columnsGap: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsGap')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsGap')))
        .assertEqual('\"10.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_columnsGapValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0500] click WaterFlow_columnsGapValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsGap')))
        .assertEqual('\"0.00vp\"');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0600
     * @tc.name     WaterFlowUndefinedTest_static_0600
     * @tc.desc     WaterFlowUndefinedTest_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0600] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0600] rowsTemplate: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsTemplate')));
      let changeBtn_layoutDirection = await driver.findComponent(ON.id('WaterFlow_layoutDirection'));
      await (changeBtn_layoutDirection?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsTemplate')))
        .assertEqual('\"1fr 1fr\"');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_rowsTemplateValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0600] click WaterFlow_rowsTemplateValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsTemplate')))
        .assertEqual('\"\"');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0700
     * @tc.name     WaterFlowUndefinedTest_static_0700
     * @tc.desc     WaterFlowUndefinedTest_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0700] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0700] columnsTemplate: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsTemplate')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsTemplate')))
        .assertEqual('\"1fr 1fr\"');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_columnsTemplateValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0700] click WaterFlow_columnsTemplateValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsTemplate')))
        .assertEqual('\"\"');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0700] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0800
     * @tc.name     WaterFlowUndefinedTest_static_0800
     * @tc.desc     WaterFlowUndefinedTest_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0800] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0800] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0800] itemConstraintSize: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemConstraintSize')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemConstraintSize')))
        .assertEqual('\"{\\"minWidth\\":\\"100.00vp\\",\\"minHeight\\":\\"100.00vp\\",\\"maxWidth\\":\\"100.00vp\\",\\"maxHeight\\":\\"100.00vp\\"}\"');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_itemConstraintSizeValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0800] click WaterFlow_itemConstraintSizeValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemConstraintSize')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0800] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_0900
     * @tc.name     WaterFlowUndefinedTest_static_0900
     * @tc.desc     WaterFlowUndefinedTest_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_0900] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_0900] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_0900] nestedScroll: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')))
        .assertEqual('{"scrollForward":"NestedScrollMode.SELF_FIRST","scrollBackward":"NestedScrollMode.SELF_FIRST"}');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_nestedScrollValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_0900] click WaterFlow_nestedScrollValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('nestedScroll')))
        .assertEqual('{"scrollForward":"NestedScrollMode.SELF_ONLY","scrollBackward":"NestedScrollMode.SELF_ONLY"}');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_0900] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_1000
     * @tc.name     WaterFlowUndefinedTest_static_1000
     * @tc.desc     WaterFlowUndefinedTest_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_1000] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('WaterFlow');

      console.info("[WaterFlowUndefinedTest_static_1000] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[WaterFlowUndefinedTest_static_1000] cachedCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')))
        .assertEqual('2');

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_cachedCountValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_1000] click WaterFlow_cachedCountValue");
      strJson = inspector.getInspectorByKey('WaterFlow');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')))
        .assertEqual('1');
      await CommonFunc.sleep(1000);
      console.info('[WaterFlowUndefinedTest_static_1000] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_1100
     * @tc.name     WaterFlowUndefinedTest_static_1100
     * @tc.desc     WaterFlowUndefinedTest_static_1100
     * @tc.level    Level.LEVEL1
    */
    it('WaterFlowUndefinedTest_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_1100] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('WaterFlow_resetText'));
      let waterFlow = await driver.findComponent(ON.type('WaterFlow'));

      let changeBtn_bottom = await driver.findComponent(ON.id('WaterFlow_toBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('WaterFlow_toTop'));
      let text = await driver.findComponent(ON.id('WaterFlow_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onReachStart');
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onReachEnd');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let changeBtn_start = await driver.findComponent(ON.id('WaterFlow_onReachStart'));
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_1100] click WaterFlow_onReachStart");
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      await CommonFunc.sleep(1000);

      let changeBtn_end = await driver.findComponent(ON.id('WaterFlow_onReachEnd'));
      await (changeBtn_end?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[WaterFlowUndefinedTest_static_1100] click WaterFlow_onReachEnd");
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[WaterFlowUndefinedTest_static_1100] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_1200
     * @tc.name     WaterFlowUndefinedTest_static_1200
     * @tc.desc     WaterFlowUndefinedTest_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_1200] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('WaterFlow_resetText'));
      let waterFlow = await driver.findComponent(ON.type('WaterFlow'));
      let changeBtn = await driver.findComponent(ON.id('WaterFlow_onScrollIndexValue'));
      await (changeBtn?.click() as Promise<void>);

      let changeBtn_bottom = await driver.findComponent(ON.id('WaterFlow_toBottom'));
      let changeBtn_top = await driver.findComponent(ON.id('WaterFlow_toTop'));
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('WaterFlow_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollIndex');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await (changeBtn?.click() as Promise<void>);
      console.info("[WaterFlowUndefinedTest_static_1200] click WaterFlow_onScrollIndexValue");
      await (changeBtn_bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[WaterFlowUndefinedTest_static_1200] END');
      done();
    });

    /**
     * @tc.number   WaterFlowUndefinedTest_static_1300
     * @tc.name     WaterFlowUndefinedTest_static_1300
     * @tc.desc     WaterFlowUndefinedTest_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('WaterFlowUndefinedTest_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[WaterFlowUndefinedTest_static_1300] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('WaterFlow_resetText'));
      let waterFlow = await driver.findComponent(ON.type('WaterFlow'));

      let changeBtn_top = await driver.findComponent(ON.id('WaterFlow_flingTop'));
      await (changeBtn_top?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('WaterFlow_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollFrameBegin');
      await (resetTextBtn?.click() as Promise<void>);

      let changeBtn = await driver.findComponent(ON.id('WaterFlow_onScrollFrameBeginValue'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info("[WaterFlowUndefinedTest_static_1300] click WaterFlow_onScrollFrameBeginValue");
      await (changeBtn_top?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[WaterFlowUndefinedTest_static_1300] END');
      done();
    });

  })
}