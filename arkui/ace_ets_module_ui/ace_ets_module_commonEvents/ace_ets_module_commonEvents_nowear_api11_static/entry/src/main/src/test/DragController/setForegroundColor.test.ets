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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function setForegroundColor() {
  describe('setForegroundColor', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.nowear.api11.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/setForegroundColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setForegroundColor state pages: " + JSON.stringify(pages));
        if (!("setForegroundColor" == pages.name)) {
          console.info("get setForegroundColor state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push setForegroundColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setForegroundColor page error: " + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   setForegroundColor_static_0100
     * @tc.name     setForegroundColor_static_0100
     * @tc.desc     setForegroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setForegroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('setForegroundColor_static_0100 START');
      let driver: Driver = Driver.create();
      let button: Component|null = await driver.findComponent(ON.id('TouchParent_id'));
      let text: Component|null = await driver.findComponent(ON.id('setForegroundColor_id'));
      button?.dragTo(text!);
      console.info("[setForegroundColor_static_0100] dragTo ");
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('setForegroundColor_id');
      console.info("[setForegroundColor_static_0100] getInspectorByKey ");
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setForegroundColor_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[setForegroundColor_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFC0CB');
      console.info('[setForegroundColor_static_0100] END');
      done();
    });

    
    
    
/**
     * @tc.number   setForegroundColor_static_0200
     * @tc.name     setForegroundColor_static_0200
     * @tc.desc     setForegroundColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('setForegroundColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('setForegroundColor_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button: Component|null = await driver.findComponent(ON.id('TouchParent_id'));
      let text: Component|null = await driver.findComponent(ON.id('setForegroundColor_id'));
      button?.dragTo(text!);
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('setForegroundColor_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setForegroundColor_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[setForegroundColor_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFC0CB');
      console.info('[setForegroundColor_static_0200] END');
      done();
    });
  })
}

