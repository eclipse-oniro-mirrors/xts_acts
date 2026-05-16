/*
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
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
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
import type { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function sideBarModifierUndefined() {
  describe('sideBarModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("sideBarModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("sideBarModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBar/sideBarModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get sideBarModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("sideBarModifierUndefined" == pages.name)) {
          console.info("get sideBarModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sideBarModifierUndefined page error:" + err);
      }
      console.info("sideBarModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   sideBarModifierUndefined_static_0001
     * @tc.name     sideBarModifierUndefined_static_0001
     * @tc.desc     test autoHide
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0001] autoHide: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0001] autoHide: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'))
        .assertEqual('true');
      console.info('[sideBarModifierUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0002
     * @tc.name     sideBarModifierUndefined_static_0002
     * @tc.desc     test controlButton
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_2');
      console.info("[sideBarModifierUndefined_static_0002] Initial state");

      let controlButtonStr = JSON.parseJsonElement(strJson).getElement('$attrs').getString('controlButton');
      console.info("[sideBarModifierUndefined_static_0002] Initial controlButton: " + controlButtonStr);

      expect(controlButtonStr).assertContain('"shown":""');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_2');
      controlButtonStr = JSON.parseJsonElement(strJson).getElement('$attrs').getString('controlButton');
      console.info("[sideBarModifierUndefined_static_0002] After 1st click controlButton: " + controlButtonStr);

      expect(controlButtonStr).assertContain('"shown":"resource');
      expect(controlButtonStr).assertContain('"hidden":"resource');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_2');
      let hasResourceIcon = strJson.indexOf('"shown":"resource') !== -1;
      console.info("[sideBarModifierUndefined_static_0002] After 2nd click hasResourceIcon: " + hasResourceIcon);
      expect(hasResourceIcon).assertEqual(false);
      console.info('[sideBarModifierUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0003
     * @tc.name     sideBarModifierUndefined_static_0003
     * @tc.desc     test maxSideBarWidth
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0003] maxSideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxSideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxSideBarWidth'))
        .assertEqual('280.000000');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0001] maxSideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxSideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxSideBarWidth'))
        .assertEqual('30.000000');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxSideBarWidth'))
        .assertEqual('280.000000');
      console.info('[sideBarModifierUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0004
     * @tc.name     sideBarModifierUndefined_static_0004
     * @tc.desc     test minContentWidth
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0004] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0004] minContentWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth'))
        .assertEqual('360.000000');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0004] minContentWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth'))
        .assertEqual('200.000000');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth'))
        .assertEqual('360.000000');
      console.info('[sideBarModifierUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0005
     * @tc.name     sideBarModifierUndefined_static_0005
     * @tc.desc     test minSideBarWidth
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0005] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0005] minSideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth'))
        .assertEqual('240.000000');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0005] minSideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth'))
        .assertEqual('10.000000');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth'))
        .assertEqual('240.000000');
      console.info('[sideBarModifierUndefined_static_0005] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0006
     * @tc.name     sideBarModifierUndefined_static_0006
     * @tc.desc     test showControlButton
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0006] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0006] showControlButton: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showControlButton'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showControlButton'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn6'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0006] showControlButton: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showControlButton'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showControlButton'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showControlButton'))
        .assertEqual('true');
      console.info('[sideBarModifierUndefined_static_0006] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0007
     * @tc.name     sideBarModifierUndefined_static_0007
     * @tc.desc     test divider
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0007] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0007] divider: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'))
        .assertEqual('{"strokeWidth":"1.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#08000000"}');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn7'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_1');
      console.info("[sideBarModifierUndefined_static_0007] divider: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'))
        .assertEqual('{"strokeWidth":"4.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#08000000"}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'))
        .assertEqual('{"strokeWidth":"1.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#08000000"}');
      console.info('[sideBarModifierUndefined_static_0007] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0008
     * @tc.name     sideBarModifierUndefined_static_0008
     * @tc.desc     test divider null <-> undefined
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0008] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SideBarM_3');
      console.info("[sideBarModifierUndefined_static_0008] divider: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'))
        .assertEqual('{"strokeWidth":"1.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#08000000"}');

      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn8'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_3');
      console.info("[sideBarModifierUndefined_static_0008] divider: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'))
        .assertEqual('{"strokeWidth":"1.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#08000000"}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SideBarM_3');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('divider'))
        .assertEqual('{"strokeWidth":"1.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#08000000"}');
      console.info('[sideBarModifierUndefined_static_0008] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0009
     * @tc.name     sideBarModifierUndefined_static_0009
     * @tc.desc     test sideBarWidth
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 初始状态：isUndefined9=true，sideBarWidth=undefined，使用默认值 240.000000
      let strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0009] Initial sideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarWidth'))
        .assertEqual('240.000000');

      // 第一次点击：isUndefined9 从 true 变为 false，sideBarWidth 变为 150
      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn9'));
      await (changeBtn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0009] After 1st click sideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarWidth'))
        .assertEqual('150.000000');

      // 第二次点击：isUndefined9 从 false 变回 true，sideBarWidth 变回 undefined (默认值 240)
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0009] After 2nd click sideBarWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarWidth'))
        .assertEqual('240.000000');

      console.info('[sideBarModifierUndefined_static_0009] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0010
     * @tc.name     sideBarModifierUndefined_static_0010
     * @tc.desc     test showSideBar
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 初始状态：isUndefined10=true，showSideBar=undefined，使用默认值 true
      let strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0010] Initial showSideBar: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'))
        .assertEqual('true');

      // 第一次点击：isUndefined10 从 true 变为 false，showSideBar 变为 false
      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn10'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0010] After 1st click showSideBar: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'))
        .assertEqual('false');

      // 第二次点击：isUndefined10 从 false 变回 true，showSideBar 变回 undefined (默认值 true)
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0010] After 2nd click showSideBar: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'))
        .assertEqual('true');

      console.info('[sideBarModifierUndefined_static_0010] END');
      done();
    });

    /**
     * @tc.number   sideBarModifierUndefined_static_0011
     * @tc.name     sideBarModifierUndefined_static_0011
     * @tc.desc     test sideBarPosition
     * @tc.level    Level.LEVEL1
     */
    it('sideBarModifierUndefined_static_0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sideBarModifierUndefined_static_0011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 初始状态：isUndefined11=true，sideBarPosition=undefined，使用默认值 SideBarPosition.Start
      let strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0011] Initial sideBarPosition: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition'))
        .assertEqual('SideBarPosition.Start');

      // 第一次点击：isUndefined11 从 true 变为 false，sideBarPosition 变为 SideBarPosition.End
      let changeBtn = await driver.findComponent(ON.id('SideBarM_btn11'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0011] After 1st click sideBarPosition: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition'))
        .assertEqual('SideBarPosition.End');

      // 第二次点击：isUndefined11 从 false 变回 true，sideBarPosition 变回 undefined (默认值 Start)
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SideBarM_4');
      console.info("[sideBarModifierUndefined_static_0011] After 2nd click sideBarPosition: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition'))
        .assertEqual('SideBarPosition.Start');

      console.info('[sideBarModifierUndefined_static_0011] END');
      done();
    });
  })
}