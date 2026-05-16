'use static';
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function showToastHoverMode() {
  describe('showToastHoverMode', () => {
    beforeAll(() => {
      console.info("showToastHoverMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("showToastHoverMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptActionTest/showToastHoverMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get showToastHoverMode state pages:" + JSON.stringify(pages));
        if (!("showToastHoverMode" == pages.name)) {
          console.info("get showToastHoverMode pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push showToastHoverMode page error:" + err);
      }
      console.info("showToastHoverMode beforeEach end");
    });


    
    
    
/**
     * @tc.number   showToastHoverMode_static_0100
     * @tc.name     showToastHoverMode_static_0100
     * @tc.desc     showToastHoverMode_static_0100
     * @tc.level    Level.LEVEL0
     */
it('showToastHoverMode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastHoverMode_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showToast1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[showToastHoverMode_0100] showToastHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showToastHoverMode_0100] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showToastHoverMode_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode false');
      await CommonFunc.sleep(1000);
      console.info('[showToastHoverMode_0100] END');
      done();
    });
    
    
    
/**
     * @tc.number   showToastHoverMode_static_0200
     * @tc.name     showToastHoverMode_static_0200
     * @tc.desc     showToastHoverMode_static_0200
     * @tc.level    Level.LEVEL0
     */
it('showToastHoverMode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastHoverMode_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let btn = await scrollBar.scrollSearch(ON.id('changeEnableHoverMode'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await scrollBar.scrollSearch(ON.id('showToast1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[showToastHoverMode_0200] showToastHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showToastHoverMode_0200] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showToastHoverMode_0200] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode true');
      await CommonFunc.sleep(1000);
      console.info('[showToastHoverMode_0200] END');
      done();
    });

    
    
    
/**
     * @tc.number   showToastHoverMode_static_0300
     * @tc.name     showToastHoverMode_static_0300
     * @tc.desc     showToastHoverMode_static_0300
     * @tc.level    Level.LEVEL0
     */
it('showToastHoverMode_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastHoverMode_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showToast'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showToastHoverMode_0300] showToastHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showToastHoverMode_0300] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showToastHoverMode_0300] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode false hoverModeArea 0');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0300] END');
      done();
    });
    
    
    
/**
     * @tc.number   showToastHoverMode_static_0400
     * @tc.name     showToastHoverMode_static_0400
     * @tc.desc     showToastHoverMode_static_0400
     * @tc.level    Level.LEVEL0
     */
it('showToastHoverMode_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastHoverMode_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let btn = await scrollBar.scrollSearch(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await scrollBar.scrollSearch(ON.id('changeEnableHoverMode'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await scrollBar.scrollSearch(ON.id('showToast'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showToastHoverMode_0400] showToastHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showToastHoverMode_0400] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showToastHoverMode_0400] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode true hoverModeArea 0');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0400] END');
      done();
    });

    
    
    
/**
     * @tc.number   showToastHoverMode_static_0500
     * @tc.name     showToastHoverMode_static_0500
     * @tc.desc     showToastHoverMode_static_0500
     * @tc.level    Level.LEVEL0
     */
it('showToastHoverMode_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastHoverMode_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let btn = await scrollBar.scrollSearch(ON.id('init'));

      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await scrollBar.scrollSearch(ON.id('changeEnableHoverMode'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await scrollBar.scrollSearch(ON.id('changeHoverModeArea'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let btn3 = await scrollBar.scrollSearch(ON.id('showToast'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showToastHoverMode_0500] showToastHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showToastHoverMode_0500] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showToastHoverMode_0500] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode true hoverModeArea 1');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0500] END');
      done();
    });
    
    
    
/**
     * @tc.number   showToastHoverMode_static_0600
     * @tc.name     showToastHoverMode_static_0600
     * @tc.desc     showToastHoverMode_static_0600
     * @tc.level    Level.LEVEL0
     */
it('showToastHoverMode_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showToastHoverMode_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let btn = await scrollBar.scrollSearch(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await scrollBar.scrollSearch(ON.id('changeHoverModeArea'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn3 = await scrollBar.scrollSearch(ON.id('showToast'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showToastHoverMode_0600] showToastHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showToastHoverMode_0600] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showToastHoverMode_0600] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode false hoverModeArea 1');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0600] END');
      done();
    });

  })
}

