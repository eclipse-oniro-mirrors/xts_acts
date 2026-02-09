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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const waitUiReadyMs = 1000;


export default function ObserverApi() {
  describe('ObserverApi', () => {
    beforeAll(() => {
      console.info("ObserverApi beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.observer.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverApi',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObserverApi state success " + JSON.stringify(pages));
        if (!("ObserverApi" == pages.name)) {
          console.info("get ObserverApi state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObserverApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObserverApi page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ObserverApi after each called");
    });

    
    /**
     * @tc.number   ObserverApi_static_001
     * @tc.name     ObserverApi_static_001
     * @tc.desc     ObserverApi_static_001
     * @tc.level    Level.LEVEL0
     */
it('ObserverApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ObserverApi_001] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ObserverApi_ObserverOn'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn1")

      let btn2 = await driver.findComponent(ON.id('ObserverApi_pushToPageTwo'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn2")

      let btn3 = await driver.findComponent(ON.id('ObserverApi2_getText'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn3")

      let strJson = inspector.getInspectorByKey('ObserverApi2_text');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ObserverApi_001] obj is: " + strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HideAppearShow');

      let btn4 = await driver.findComponent(ON.id('ObserverApi2_backToPageOne'));
      await (btn4?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn4")

      let btn5 = await driver.findComponent(ON.id('ObserverApi_getText1'));
      await (btn5?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn5")

      let strJson2 = inspector.getInspectorByKey('ObserverApi_text1');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      // console.info("[ObserverApi_001] obj2 is: " + strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Disappear');

      let btn6 = await driver.findComponent(ON.id('ObserverApi_ObserverOff'));
      await (btn6?.click() as Promise<void>)
      await CommonFunc.sleep(2000);

      console.info('[ObserverApi_001] END');
      done();

    });


    
    /**
     * @tc.number   ObserverApi_static_002
     * @tc.name     ObserverApi_static_002
     * @tc.desc     ObserverApi_static_002
     * @tc.level    Level.LEVEL0
     */
it('ObserverApi_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ObserverApi_002] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ObserverApi_ObserverOn'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn1")

      let btn2 = await driver.findComponent(ON.id('ObserverApi_pushToPageTwo'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn2")

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn3")

      let btn4 = await driver.findComponent(ON.id('ObserverApi_getText2'));
      await (btn4?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn4")

      let strJson = inspector.getInspectorByKey('ObserverApi_text2');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ObserverApi_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Back');

      let btn5 = await driver.findComponent(ON.id('ObserverApi_ObserverOff'));
      await (btn5?.click() as Promise<void>)
      await CommonFunc.sleep(2000);

      console.info('[ObserverApi_002] END');
      done();

    });

  })
}



