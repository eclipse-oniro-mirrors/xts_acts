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

export default function showDialogHoverMode() {
  describe('showDialogHoverMode', () => {
    beforeAll(() => {
      console.info("showDialogHoverMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("showDialogHoverMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptActionTest/showDialogHoverMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get showDialogHoverMode state pages:" + JSON.stringify(pages));
        if (!("showDialogHoverMode" == pages.name)) {
          console.info("get showDialogHoverMode pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push showDialogHoverMode page error:" + err);
      }
      console.info("showDialogHoverMode beforeEach end");
    });


    
    
    
/**
     * @tc.number   showDialogHoverMode_0100
     * @tc.name     showDialogHoverMode_0100
     * @tc.desc     showDialogHoverMode_0100
     * @tc.level    Level.LEVEL0
     */
it('showDialogHoverMode_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogHoverMode_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showDialog1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('button1'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[showDialogHoverMode_0100] showDialogHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0100] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showDialogHoverMode_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode false');
      await CommonFunc.sleep(500);
      console.info('[showDialogHoverMode_0100] END');
      done();
    });
    
    
    
/**
     * @tc.number   showDialogHoverMode_0200
     * @tc.name     showDialogHoverMode_0200
     * @tc.desc     showDialogHoverMode_0200
     * @tc.level    Level.LEVEL0
     */
it('showDialogHoverMode_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogHoverMode_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('changeEnableHoverMode'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showDialog1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('button1'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[showDialogHoverMode_0200] showDialogHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0200] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showDialogHoverMode_0200] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode true');
      await CommonFunc.sleep(500);
      console.info('[showDialogHoverMode_0200] END');
      done();
    });

    
    
    
/**
     * @tc.number   showDialogHoverMode_0300
     * @tc.name     showDialogHoverMode_0300
     * @tc.desc     showDialogHoverMode_0300
     * @tc.level    Level.LEVEL0
     */
it('showDialogHoverMode_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogHoverMode_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showDialog'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('button1'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0300] showDialogHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0300] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showDialogHoverMode_0300] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode false hoverModeArea 0');
      await CommonFunc.sleep(500);
      console.info('[showDialogHoverMode_0300] END');
      done();
    });

    
    
    
/**
     * @tc.number   showDialogHoverMode_0400
     * @tc.name     showDialogHoverMode_0400
     * @tc.desc     showDialogHoverMode_0400
     * @tc.level    Level.LEVEL0
     */
it('showDialogHoverMode_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogHoverMode_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('changeEnableHoverMode'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('showDialog'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.text('button1'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0400] showDialogHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0400] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showDialogHoverMode_0400] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode true hoverModeArea 0');
      await CommonFunc.sleep(1000);
      console.info('[showDialogHoverMode_0400] END');
      done();
    });

    
    
    
/**
     * @tc.number   showDialogHoverMode_0500
     * @tc.name     showDialogHoverMode_0500
     * @tc.desc     showDialogHoverMode_0500
     * @tc.level    Level.LEVEL0
     */
it('showDialogHoverMode_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('changeEnableHoverMode'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('changeHoverModeArea'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('showDialog'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.text('button1'));
      await (btn4?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0500] showDialogHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0500] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showDialogHoverMode_0500] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode true hoverModeArea 1');
      await CommonFunc.sleep(1000);
      console.info('[showDialogHoverMode_0500] END');
      done();
    });
    
    
    
/**
     * @tc.number   showDialogHoverMode_0600
     * @tc.name     showDialogHoverMode_0600
     * @tc.desc     showDialogHoverMode_0600
     * @tc.level    Level.LEVEL0
     */
it('showDialogHoverMode_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogHoverMode_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('changeHoverModeArea'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('showDialog'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.text('button1'));
      await (btn4?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0600] showDialogHoverMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0600] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[showDialogHoverMode_0600] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('enableHoverMode false hoverModeArea 1');
      await CommonFunc.sleep(1000);
      console.info('[showDialogHoverMode_0600] END');
      done();
    });
  })
}

