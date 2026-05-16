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

export default function followTransformOfTargetPopup() {
  describe('followTransformOfTargetPopup', () => {
    beforeAll(() => {
      console.info("followTransformOfTargetPopup beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("followTransformOfTargetPopup beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/followTransformOfTargetPopup",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get followTransformOfTargetPopup state pages:" + JSON.stringify(pages));
        if (!("followTransformOfTargetPopup" == pages.name)) {
          console.info("get followTransformOfTargetPopup pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push followTransformOfTargetPopup page error:" + err);
      }
      console.info("followTransformOfTargetPopup beforeEach end");
    });


    
    
    
/**
     * @tc.number   followTransformOfTargetPopup_static_0010
     * @tc.name     followTransformOfTargetPopup_static_0010
     * @tc.desc     followTransformOfTargetPopup_static_0010
     * @tc.level    Level.LEVEL0
     */
it('followTransformOfTargetPopup_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('followTransformOfTargetPopup_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('popup'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('animationBtn'));
      await (button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('followTransformOfTarget');
      console.info("[followTransformOfTargetPopup_0010] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[followTransformOfTargetPopup_0010] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('followTransformOfTarget: false');
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[followTransformOfTargetPopup_0010] END');
      done();
    });

    
    
    
/**
     * @tc.number   followTransformOfTargetPopup_static_0020
     * @tc.name     followTransformOfTargetPopup_static_0020
     * @tc.desc     followTransformOfTargetPopup_static_0020
     * @tc.level    Level.LEVEL0
     */
it('followTransformOfTargetPopup_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('followTransformOfTargetPopup_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button0 = await driver.findComponent(ON.id('followId'));
      await (button0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('animationBtn'));
      await (button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('followTransformOfTarget');
      console.info("[followTransformOfTargetPopup_0020] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[followTransformOfTargetPopup_0020] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('followTransformOfTarget: true');
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[followTransformOfTargetPopup_0020] END');
      done();
    });
  })
}

