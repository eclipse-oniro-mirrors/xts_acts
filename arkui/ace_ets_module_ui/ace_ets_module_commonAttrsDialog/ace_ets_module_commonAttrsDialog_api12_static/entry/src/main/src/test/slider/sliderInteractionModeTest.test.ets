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
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function sliderInteractionModeTest() {
  describe('sliderInteractionModeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("sliderInteractionModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/sliderInteractionModeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sliderInteractionModeTest state pages:" + JSON.stringify(pages));
        if (!("sliderInteractionModeTest" == pages.name)) {
          console.info("get sliderInteractionModeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sliderInteractionModeTest page error:" + err);
      }
      console.info("sliderInteractionModeTest beforeEach end");
    });

    
    
    /**
     * @tc.number   sliderInteractionModeTest_static_0100
     * @tc.name     sliderInteractionModeTest_static_0100
     * @tc.desc     sliderInteractionModeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('sliderInteractionModeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sliderInteractionModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('slider1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let slider = inspector.getInspectorByKey('slider1');
      console.info("[sliderInteractionModeTest_0100] sliderInteractionModeTest_0100 JSON.parseJsonElement(slider) is: " +
      JSON.stringify(slider));
      console.info("[sliderInteractionModeTest_0100] component JSON.parseJsonElement(slider) is: " +
      JSON.stringify(JSON.parseJsonElement(slider)));
      console.info("[sliderInteractionModeTest_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(slider).getElement('$attrs').getString('sliderInteractionMode')));
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('sliderInteractionMode'))
        .assertEqual('SliderInteraction.SLIDE_AND_CLICK');
      await CommonFunc.sleep(1000);
      console.info('[sliderInteractionModeTest_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   sliderInteractionModeTest_static_0200
     * @tc.name     sliderInteractionModeTest_static_0200
     * @tc.desc     sliderInteractionModeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('sliderInteractionModeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sliderInteractionModeTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('slider2'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let slider = inspector.getInspectorByKey('slider2');
      console.info("[sliderInteractionModeTest_0200] sliderInteractionModeTest_0200 JSON.parseJsonElement(slider) is: " +
      JSON.stringify(slider));
      console.info("[sliderInteractionModeTest_0200] component JSON.parseJsonElement(slider) is: " +
      JSON.stringify(JSON.parseJsonElement(slider)));
      console.info("[sliderInteractionModeTest_0200] title: " +
      JSON.stringify(JSON.parseJsonElement(slider).getElement('$attrs').getString('sliderInteractionMode')));
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('sliderInteractionMode'))
        .assertEqual('SliderInteraction.SLIDE_ONLY');
      await CommonFunc.sleep(1000);
      console.info('[sliderInteractionModeTest_0200] END');
      done();
    });

    
    
    /**
     * @tc.number   sliderInteractionModeTest_static_0300
     * @tc.name     sliderInteractionModeTest_static_0300
     * @tc.desc     sliderInteractionModeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('sliderInteractionModeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sliderInteractionModeTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('slider3'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let slider = inspector.getInspectorByKey('slider3');
      console.info("[sliderInteractionModeTest_0300] sliderInteractionModeTest_0300 JSON.parseJsonElement(slider) is: " +
      JSON.stringify(slider));
      console.info("[sliderInteractionModeTest_0300] component JSON.parseJsonElement(slider) is: " +
      JSON.stringify(JSON.parseJsonElement(slider)));
      console.info("[sliderInteractionModeTest_0300] title: " +
      JSON.stringify(JSON.parseJsonElement(slider).getElement('$attrs').getString('sliderInteractionMode')));
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('sliderInteractionMode'))
        .assertEqual('SliderInteraction.SLIDE_AND_CLICK_UP');
      await CommonFunc.sleep(1000);
      console.info('[sliderInteractionModeTest_0300] END');
      done();
    });
  })
}

