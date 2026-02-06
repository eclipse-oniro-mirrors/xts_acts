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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
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


export default function ObserverPageId() {
  describe('ObserverPageId', () => {
    beforeAll(() => {
      console.info("ObserverPageId beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.observer12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("ObserverPageId beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverPageId',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObserverPageId state success " + JSON.stringify(pages));
        if (!("ObserverPageId" == pages.name)) {
          console.info("get ObserverPageId state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObserverPageId page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObserverPageId page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ObserverPageId after each called");
    });


    
    
/**
     * @tc.number   ObserverPageId_static_0100
     * @tc.name     ObserverPageId_static_0100
     * @tc.desc     ObserverPageId_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObserverPageId_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ObserverPageId_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('ObserverPageId_getPageId'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('ObserverPageId_text1');
      let obj = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ObserverPageId_0100] obj1 is: " + JSON.stringify(obj));

      let strJson2 = inspector.getInspectorByKey('ObserverPageId_text2');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[ObserverPageId_0100] obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[ObserverPageId_0100] obj content: " + obj.getElement('$attrs').getString('content'));
      console.info("[ObserverPageId_0100] obj2 content: " + obj2.getElement('$attrs').getString('content'));

      expect(obj.getElement('$attrs').getString('content')).assertEqual(obj2.getElement('$attrs').getString('content'));

      console.info('[ObserverPageId_0100] END');
      done();
    });
  })
}

