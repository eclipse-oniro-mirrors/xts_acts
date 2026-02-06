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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";


export default function RadioJsunit() {
  describe('RadioJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RadioJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/RadioPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RadioJsunit state pages:" + JSON.stringify(pages));
        if (!("RadioPage" == pages.name)) {
          console.info("get RadioJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RadioJsunit page error: " + err);
        expect().assertFail();
      }
    });

    //pass过 注释
    
    /**
     * @tc.number   RadioJsunit_static_0100
     * @tc.name     RadioJsunit_static_0100
     * @tc.desc     RadioJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('RadioJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the information of the Radio component
      console.info('[RadioJsunit_0100] START');
      let strJson1 = inspector.getInspectorByKey('r1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[RadioJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('value')).assertEqual('radio1');
      expect(obj1.getElement('$attrs').getString('checked')).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('r2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[RadioJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('value')).assertEqual('Radio2');
      expect(obj2.getElement('$attrs').getString('checked')).assertEqual('false');
      // Get the text of the Text component
      let driver = Driver.create()
      let textComponent = await driver.findComponent(ON.id('t1'));
      let text = await (textComponent?.getText() as Promise<string>);
      expect(text).assertEqual('radio1');
      console.info('[RadioJsunit_0100] END');
      done();
    });

    
    /**
     * @tc.number   RadioJsunit_static_0200
     * @tc.name     RadioJsunit_static_0200
     * @tc.desc     RadioJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('RadioJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify Radio Components Click to select
      console.info('[RadioJsunit_0200] START');
      // Get the component Radio1 and click
      let driver = Driver.create()
      let textComponent = await driver.findComponent(ON.id('r3'));
      await (textComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // Verify that the component Radio is selected
      let strJson = inspector.getInspectorByKey('r3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RadioJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('checked')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[RadioJsunit_0200] END');
      done();
    });

    
    /**
     * @tc.number   RadioJsunit_static_0300
     * @tc.name     RadioJsunit_static_0300
     * @tc.desc     RadioJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('RadioJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify that the radio components are in the same group Click to select only one of the three
      console.info('[RadioJsunit_0300] START');

      // Get the component Radio2 and click
      let driver = Driver.create()
      let textComponent = await driver.findComponent(ON.id('r2'));
      await (textComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Verify the selected state of component Radio2
      let strJson = inspector.getInspectorByKey('r2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RadioJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('checked')).assertEqual('true');
      await CommonFunc.sleep(1000);

      // Verify the selected state of component Radio1
      let strJson1 = inspector.getInspectorByKey('r1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[RadioJsunit_0300] component obj is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('checked')).assertEqual('false');
      await CommonFunc.sleep(1000);

      // Verify the selected state of component Radio3
      let strJson2 = inspector.getInspectorByKey('r3');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[RadioJsunit_0300] component obj is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('checked')).assertEqual('false');
      console.info('[RadioJsunit_0300] END');
      done();
    });

    
    /**
     * @tc.number   RadioJsunit_static_0400
     * @tc.name     RadioJsunit_static_0400
     * @tc.desc     RadioJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('RadioJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify onChange event of of component Radio
      console.info('[RadioJsunit_0400] START');
      let driver = Driver.create()
      let radio3 = await driver.findComponent(ON.id('r3'));
      await (radio3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let textComponent = await driver.findComponent(ON.id('text'));
      let text = await (textComponent?.getText() as Promise<string>);
      console.info("[RadioJsunit_0400] text: " + JSON.stringify(text));
      expect(text).assertEqual('change succ');
      console.info('[RadioJsunit_0400] END');
      done();
    });
  })
}
