'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
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
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { ToggleType } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function ToggleJsunit() {
  describe('ToggleJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("Toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/TogglePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Toggle state pages:" + JSON.stringify(pages));
        if (!("TogglePage" == pages.name)) {
          console.info("get Toggle pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Toggle page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push Toggle page error: " + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   ToggleJsunit_static_0100
     * @tc.name     ToggleJsunit_static_0100
     * @tc.desc     ToggleJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ToggleJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of Toggle component
      console.info('[ToggleJsunit_0100] START');
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ToggleJsunit_0100] type: " + JSON.stringify(obj.getElement('$attrs').getString("type")));
      console.info("[ToggleJsunit_0100] isOn: " + JSON.stringify(obj.getElement('$attrs').getString("isOn")));
      console.info("[ToggleJsunit_0100] .getString(selectedColor): " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString("type")).assertEqual('ToggleType.Checkbox');
      expect(obj.getElement('$attrs').getString("isOn")).assertEqual('true');
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFFF0000');
      let strJson1 = inspector.getInspectorByKey('toggleSwitch');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ToggleJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ToggleJsunit_0100] switchPointColor: " + JSON.stringify(obj1.getElement('$attrs').getString("switchPointColor")));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString("switchPointColor")).assertEqual('#FF008000');

      // Get default value of Toggle component
      console.info("[ToggleJsunit_0100] isOn: " + JSON.stringify(obj1.getElement('$attrs').getString("isOn")));
      expect(obj1.getElement('$attrs').getString("isOn")).assertEqual('false');
      console.info('[ToggleJsunit_0100] END');
      done();
    });

    
/**
     * @tc.number   ToggleJsunit_static_0200
     * @tc.name     ToggleJsunit_static_0200
     * @tc.desc     ToggleJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ToggleJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify switch function of Toggle component
      console.info('[ToggleJsunit_0200] START');
      let driver = Driver.create();
      let switchButton = await driver.findComponent(ON.id('toggleSwitch'));
      await (switchButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(ON.id('text'));
      let switchText = await (textComponent?.getText() as Promise<string>);
      console.info("[ToggleJsunit_0200] switchText: " + JSON.stringify(switchText));
      expect(switchText).assertEqual('switch true');

      let driver1 = Driver.create();
      let switchButton1 = await driver1.findComponent(ON.id('toggleSwitch'));
      await (switchButton1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textComponent1 = await driver1.findComponent(ON.id('text'));
      let switch1 = await (textComponent1?.getText() as Promise<string>);
      console.info("[ToggleJsunit_0200] switch1: " + JSON.stringify(switch1));
      expect(switch1).assertEqual('switch false');
      console.info('[ToggleJsunit_0200] END');
      done();
    });

    
/**
     * @tc.number   ToggleJsunit_static_0300
     * @tc.name     ToggleJsunit_static_0300
     * @tc.desc     ToggleJsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
it('ToggleJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify checkbox function of Toggle component
      console.info('[ToggleJsunit_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let checkboxButton = await driver.findComponent(ON.id('toggleCheckbox'));
      await (checkboxButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(ON.id('text'));
      let checkbox = await (textComponent?.getText() as Promise<string>);
      console.info("[ToggleJsunit_0300] checkbox: " + JSON.stringify(checkbox));
      expect(checkbox).assertEqual('checkbox false');

      await (checkboxButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let checkbox1 = await (textComponent?.getText() as Promise<string>);
      console.info("[ToggleJsunit_0300] checkbox1: " + JSON.stringify(checkbox1));
      expect(checkbox1).assertEqual('checkbox true');
      console.info('[ToggleJsunit_0300] END');
      done();
    });

    
/**
     * @tc.number   ToggleJsunit_static_0400
     * @tc.name     ToggleJsunit_static_0400
     * @tc.desc     ToggleJsunit_static_0400
     * @tc.level    Level.LEVEL2
     */
it('ToggleJsunit_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify button function of Toggle component
      console.info('[ToggleJsunit_0400] START');
      let driver = Driver.create();
      let buttonComponent = await driver.findComponent(ON.id('toggleButton'));
      await (buttonComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(ON.id('text'));
      let button = await (textComponent?.getText() as Promise<string>);
      console.info("[ToggleJsunit_0400] button: " + JSON.stringify(button));
      expect(button).assertEqual('button true');

      await (buttonComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await (textComponent?.getText() as Promise<string>);
      console.info("[ToggleJsunit_0400] button1: " + JSON.stringify(button1));
      expect(button1).assertEqual('button false');
      console.info('[ToggleJsunit_0400] END');
      done();
    });

    
/**
     * @tc.number   ToggleJsunit_static_0500
     * @tc.name     ToggleJsunit_static_0500
     * @tc.desc     ToggleJsunit_static_0500
     * @tc.level    Level.LEVEL2
     */
it('ToggleJsunit_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the attribute of Toggle component
      console.info('[ToggleJsunit_0500] START');
      AppStorage.get<MessageManager<ToggleType | boolean | string>>("messageManager")!.notify({ name: 'type', value: ToggleType.Switch })
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<ToggleType | boolean | string>>("messageManager")!.notify({ name: 'isOn', value: false })
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<ToggleType | boolean | string>>("messageManager")!.notify({ name: 'selectedColor', value: '#FF008000' })
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<ToggleType | boolean | string>>("messageManager")!.notify({ name: 'switchPointColor', value: '#FFFF0000' })
      await CommonFunc.sleep(5000);

      // Get the attribute of Toggle component
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[ToggleJsunit_0500] type: " + JSON.stringify(obj.getElement('$attrs').getString("type")));
      console.info("[ToggleJsunit_0500] isOn: " + JSON.stringify(obj.getElement('$attrs').getString("isOn")));
      console.info("[ToggleJsunit_0500] selectedColor: " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString("type")).assertEqual('ToggleType.Switch');
      expect(obj.getElement('$attrs').getString("isOn")).assertEqual('false');
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FF008000');
      let strJson1 = inspector.getInspectorByKey('toggleSwitch');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ToggleJsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ToggleJsunit_0500] switchPointColor: " + JSON.stringify(obj1.getElement('$attrs').getString("switchPointColor")));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString("switchPointColor")).assertEqual('#FFFF0000');
      console.info('[ToggleJsunit_0500] END');
      done();
    });

    
/**
     * @tc.number   ToggleJsunit_static_0600
     * @tc.name     ToggleJsunit_static_0600
     * @tc.desc     ToggleJsunit_static_0600
     * @tc.level    Level.LEVEL2
     */
it('ToggleJsunit_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of Toggle component
      console.info('[ToggleJsunit_0600] START');
      AppStorage.get<MessageManager<ToggleType | boolean | string | number>>("messageManager")!.notify({ name: 'type', value: 123 })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ToggleType | boolean | string | number>>("messageManager")!.notify({ name: 'isOn', value: 'aaa' })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ToggleType | boolean | string | number>>("messageManager")!.notify({ name: 'selectedColor', value: 123 })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ToggleType | boolean | string | number>>("messageManager")!.notify({ name: 'switchPointColor', value: 'bbb' })
      await CommonFunc.sleep(2000);

      // Get the attribute of Toggle component
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[ToggleJsunit_0600] type: " + JSON.stringify(obj.getElement('$attrs').getString("type")));
      console.info("[ToggleJsunit_0600] isOn: " + JSON.stringify(obj.getElement('$attrs').getString("isOn")));
      console.info("[ToggleJsunit_0600] selectedColor: " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString("type")).assertEqual('ToggleType.Switch');
      expect(obj.getElement('$attrs').getString("isOn")).assertEqual('false');
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FF00007B');
      let strJson1 = inspector.getInspectorByKey('toggleSwitch');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ToggleJsunit_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ToggleJsunit_0600] switchPointColor: " + JSON.stringify(obj1.getElement('$attrs').getString("switchPointColor")));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString("switchPointColor")).assertEqual('#FFFFFFFF');
      console.info('[ToggleJsunit_0600] END');
      done();
    });
  })
}