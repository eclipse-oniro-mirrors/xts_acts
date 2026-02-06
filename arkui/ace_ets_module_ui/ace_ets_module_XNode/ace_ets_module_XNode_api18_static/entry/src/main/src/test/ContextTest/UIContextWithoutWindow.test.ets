'use static';
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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function UIContextWithoutWindowTest() {
  describe('UIContextWithoutWindowTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.XNode.api18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("UIContextWithoutWindowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/UIContextWithoutWindowTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get UIContextWithoutWindowTest state pages:" + JSON.stringify(pages));
        if (!("UIContextWithoutWindowTest" == pages.name)) {
          console.info("get UIContextWithoutWindowTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIContextWithoutWindowTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextWithoutWindowTest page error:" + err);
      }
      console.info("UIContextWithoutWindowTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextWithoutWindowTest after each called");
    });



    
    
/**
     * @tc.number   UIContextWithoutWindowTest_static_0100
     * @tc.name     UIContextWithoutWindowTest_static_0100
     * @tc.desc     UIContextWithoutWindowTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIContextWithoutWindowTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIContextWithoutWindowTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('create_context_id')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('check_error_id')) as Component;
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('destroy_context_id')) as Component;
      await button3.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = inspector.getInspectorByKey('create_str_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[UIContextWithoutWindowTest_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[UIContextWithoutWindowTest_static_0100] content obj1 is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('content')));
      let strJson2: string = inspector.getInspectorByKey('check_str_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[UIContextWithoutWindowTest_static_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[UIContextWithoutWindowTest_static_0100] content obj2 is: " + JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('content')));
      let strJson3: string = inspector.getInspectorByKey('destroy_str_id');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[UIContextWithoutWindowTest_static_0100] component obj3 is: " + JSON.stringifyJsonElement(obj3));
      console.info("[UIContextWithoutWindowTest_static_0100] content obj3 is: " + JSON.stringifyJsonElement(obj3.getElement('$attrs').getElement('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('{"instanceId_":900000}');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('401');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('UIContext destroyed');
      console.info('[UIContextWithoutWindowTest_static_0100] END');
      done();
    });
  })
}