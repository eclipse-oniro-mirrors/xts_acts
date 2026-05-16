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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
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

export default function navigationModifierUndefined() {
  describe('navigationModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("navigationModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigationModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get navigationModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("navigationModifierUndefined" == pages.name)) {
          console.info("get navigationModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push navigationModifierUndefined page error:" + err);
      }
      console.info("navigationModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   navigationModifierUndefined_static_0001
     * @tc.name     navigationModifierUndefined_static_0001
     * @tc.desc     test titleMode
     * @tc.level    Level.LEVEL1
     */
    it('navigationModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[navigationModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('NavigationM_1');
      console.info("[navigationModifierUndefined_static_0001] titleMode: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'))
        .assertEqual('NavigationTitleMode.Free');

      let changeBtn = await driver.findComponent(ON.id('NavigationM_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('NavigationM_1');
      console.info("[navigationModifierUndefined_static_0001] titleMode: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'))
        .assertEqual('NavigationTitleMode.Full');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('NavigationM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('titleMode'))
        .assertEqual('NavigationTitleMode.Free');
      console.info('[navigationModifierUndefined_static_0001] END');
      done();
    });


    /**
     * @tc.number   navigationModifierUndefined_static_0002
     * @tc.name     navigationModifierUndefined_static_0002
     * @tc.desc     test toolbarConfiguration
     * @tc.level    Level.LEVEL1
     */
    it('navigationModifierUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[navigationModifierUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let textNode = await driver.findComponent(ON.text('toolbar'));
      expect(textNode).assertNull();

      let changeBtn = await driver.findComponent(ON.id('NavigationM_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.text('toolbar'));
      expect(await (textNode?.getText() as Promise<string>)).assertEqual('toolbar');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.text('toolbar'));
      expect(textNode).assertNull();
      console.info('[navigationModifierUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   navigationModifierUndefined_static_0003
     * @tc.name     navigationModifierUndefined_static_0003
     * @tc.desc     test minContentWidth
     * @tc.level    Level.LEVEL1
     */
    it('navigationModifierUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[navigationModifierUndefined_static_0003] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      // 初始状态：isUndefined3=true，minContentWidth=undefined，使用默认值 360
      let strJson = inspector.getInspectorByKey('NavigationM_1');
      await CommonFunc.sleep(1000);

      console.info("[navigationModifierUndefined_static_0003] Initial minContentWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minContentWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"360.00vp\"');

      // 第一次点击：isUndefined3 从 true 变为 false，minContentWidth 变为 150
      let changeBtn = await driver.findComponent(ON.id('NavigationM_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[navigationModifierUndefined_static_0003] click NavigationM_btn3");
      strJson = inspector.getInspectorByKey('NavigationM_1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"150.00vp\"');

      // 第二次点击：isUndefined3 从 false 变回 true，minContentWidth 变回 undefined (默认值 360)
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('NavigationM_1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"360.00vp\"');

      await CommonFunc.sleep(1000);
      console.info('[navigationModifierUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   navigationModifierUndefined_static_0004
     * @tc.name     navigationModifierUndefined_static_0004
     * @tc.desc     test navBarWidthRange
     * @tc.level    Level.LEVEL1
     */
    it('navigationModifierUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[navigationModifierUndefined_static_0004] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      // 初始状态：isUndefined4=true，navBarWidthRange=undefined，使用默认值 [240, 432]
      let strJson = inspector.getInspectorByKey('NavigationM_1');
      await CommonFunc.sleep(1000);

      console.info("[navigationModifierUndefined_static_0004] Initial navBarWidthRange: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('navBarWidthRange')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"240.00vp, 432.00vp\"');

      // 第一次点击：isUndefined4 从 true 变为 false，navBarWidthRange 变为 ["10vp", "500vp"]
      let changeBtn = await driver.findComponent(ON.id('NavigationM_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[navigationModifierUndefined_static_0004] click NavigationM_btn4");
      strJson = inspector.getInspectorByKey('NavigationM_1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"310.00vp, 500.00vp\"');

      // 第二次点击：isUndefined4 从 false 变回 true，navBarWidthRange 变回 undefined (默认值 [240, 432])
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('NavigationM_1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"240.00vp, 432.00vp\"');

      await CommonFunc.sleep(1000);
      console.info('[navigationModifierUndefined_static_0004] END');
      done();
    });
  })
}