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

export default function UIContextGetOpacityTest() {
  describe('UIContextGetOpacityTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.XNode.api18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("UIContextGetOpacityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/UIContextGetOpacityTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get UIContextGetOpacityTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIContextGetOpacityTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIContextGetOpacityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextGetOpacityTest page error:" + err);
      }
      console.info("UIContextGetOpacityTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextGetOpacityTest after each called");
    });



    
    
/**
     * @tc.number   UIContextGetOpacityTest_static_0100
     * @tc.name     UIContextGetOpacityTest_static_0100
     * @tc.desc     UIContextGetOpacityTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIContextGetOpacityTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIContextGetOpacityTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_click_id')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = inspector.getInspectorByKey('getOpacityValue1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[UIContextGetOpacityTest_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[UIContextGetOpacityTest_static_0100] content obj1 is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('content')));
      let strJson2: string = inspector.getInspectorByKey('getOpacityValue2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[UIContextGetOpacityTest_static_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[UIContextGetOpacityTest_static_0100] content obj2 is: " + JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('content')));
      let strJson3: string = inspector.getInspectorByKey('getOpacityValue3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[UIContextGetOpacityTest_static_0100] component obj3 is: " + JSON.stringifyJsonElement(obj3));
      console.info("[UIContextGetOpacityTest_static_0100] content obj3 is: " + JSON.stringifyJsonElement(obj3.getElement('$attrs').getElement('content')));
      let strJson4: string = inspector.getInspectorByKey('getOpacityValue4');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[UIContextGetOpacityTest_static_0100] component obj4 is: " + JSON.stringifyJsonElement(obj4));
      console.info("[UIContextGetOpacityTest_static_0100] content obj4 is: " + JSON.stringifyJsonElement(obj4.getElement('$attrs').getElement('content')));
      let strJson5: string = inspector.getInspectorByKey('getOpacityValue5');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[UIContextGetOpacityTest_static_0100] component obj5 is: " + JSON.stringifyJsonElement(obj5));
      console.info("[UIContextGetOpacityTest_static_0100] content obj5 is: " + JSON.stringifyJsonElement(obj5.getElement('$attrs').getElement('content')));
      let strJson6: string = inspector.getInspectorByKey('getTransformValue');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[UIContextGetOpacityTest_static_0100] component obj6 is: " + JSON.stringifyJsonElement(obj6));
      console.info("[UIContextGetOpacityTest_static_0100] content obj6 is: " + JSON.stringifyJsonElement(obj6.getElement('$attrs').getElement('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('0.5');
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[UIContextGetOpacityTest_static_0100] END');
      done();
    });
  })
}