/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function ToggleJsunit() {
  describe('ToggleJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/TogglePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Toggle state pages: " + JSON.stringify(pages));
        if (!("TogglePage" == pages.name)) {
          console.info("get Toggle state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Toggle page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Toggle page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ToggleJsunit_0100', 0, async (done: Function) => {
      // Get the information of Toggle component
      console.info('[ToggleJsunit_0100] START');
      let strJson = getInspectorByKey('toggleCheckbox');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ToggleJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ToggleJsunit_0100] type: " + JSON.stringify(obj.$attrs.type));
      console.info("[ToggleJsunit_0100] isOn: " + JSON.stringify(obj.$attrs.isOn));
      console.info("[ToggleJsunit_0100] selectedColor: " + JSON.stringify(obj.$attrs.selectedColor));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.type).assertEqual('ToggleType.Checkbox');
      expect(obj.$attrs.isOn).assertEqual('true');
      expect(obj.$attrs.selectedColor).assertEqual('#FFFF0000');
      let strJson1 = getInspectorByKey('toggleSwitch');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ToggleJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ToggleJsunit_0100] switchPointColor: " + JSON.stringify(obj1.$attrs.switchPointColor));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.switchPointColor).assertEqual('#FF008000');

      // Get default value of Toggle component
      console.info("[ToggleJsunit_0100] isOn: " + JSON.stringify(obj1.$attrs.isOn));
      expect(obj1.$attrs.isOn).assertEqual('false');
      console.info('[ToggleJsunit_0100] END');
      done();
    });

    it('ToggleJsunit_0200', 0, async (done: Function) => {
      // Verify switch function of Toggle component
      console.info('[ToggleJsunit_0200] START');      
      let driver = await UiDriver.create();
      let switchButton = await driver.findComponent(BY.key('toggleSwitch'));
      await switchButton.click();
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(BY.key('text'));
      let switchText = await textComponent.getText();
      console.info("[ToggleJsunit_0200] switchText: " + JSON.stringify(switchText));
      expect(switchText).assertEqual('switch true');

      let driver1 = await UiDriver.create();
      let switchButton1 = await driver1.findComponent(BY.key('toggleSwitch'));
      await switchButton1.click();
      await CommonFunc.sleep(1000);
      let textComponent1 = await driver1.findComponent(BY.key('text'));
      let switch1 = await textComponent1.getText();
      console.info("[ToggleJsunit_0200] switch1: " + JSON.stringify(switch1));
      expect(switch1).assertEqual('switch false');
      console.info('[ToggleJsunit_0200] END');
      done();
    });

    it('ToggleJsunit_0300', 0, async (done: Function) => {
      // Verify checkbox function of Toggle component
      console.info('[ToggleJsunit_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create();
      let checkboxButton = await driver.findComponent(BY.key('toggleCheckbox'));
      await checkboxButton.click();
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(BY.key('text'));
      let checkbox = await textComponent.getText();
      console.info("[ToggleJsunit_0300] checkbox: " + JSON.stringify(checkbox));
      expect(checkbox).assertEqual('checkbox false');

      await checkboxButton.click();
      await CommonFunc.sleep(1000);
      let checkbox1 = await textComponent.getText();
      console.info("[ToggleJsunit_0300] checkbox1: " + JSON.stringify(checkbox1));
      expect(checkbox1).assertEqual('checkbox true');
      console.info('[ToggleJsunit_0300] END');
      done();
    });

    it('ToggleJsunit_0400', 0, async (done: Function) => {
      // Verify button function of Toggle component
      console.info('[ToggleJsunit_0400] START');
      let driver = await UiDriver.create();
      let buttonComponent = await driver.findComponent(BY.key('toggleButton'));
      await buttonComponent.click();
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(BY.key('text'));
      let button = await textComponent.getText();
      console.info("[ToggleJsunit_0400] button: " + JSON.stringify(button));
      expect(button).assertEqual('button true');

      await buttonComponent.click();
      await CommonFunc.sleep(1000);
      let button1 = await textComponent.getText();
      console.info("[ToggleJsunit_0400] button1: " + JSON.stringify(button1));
      expect(button1).assertEqual('button false');
      console.info('[ToggleJsunit_0400] END');
      done();
    });

    it('ToggleJsunit_0500', 0, async (done: Function) => {
      // Modify the attribute of Toggle component
      console.info('[ToggleJsunit_0500] START');
      globalThis.value.message.notify({name:'type',value:ToggleType.Switch})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'isOn',value:'false'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectedColor',value:'#FF008000'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'switchPointColor',value:'#FFFF0000'})
      await CommonFunc.sleep(5000);

      // Get the attribute of Toggle component
      let strJson = getInspectorByKey('toggleCheckbox');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ToggleJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[ToggleJsunit_0500] type: " + JSON.stringify(obj.$attrs.type));
      console.info("[ToggleJsunit_0500] isOn: " + JSON.stringify(obj.$attrs.isOn));
      console.info("[ToggleJsunit_0500] selectedColor: " + JSON.stringify(obj.$attrs.selectedColor));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.type).assertEqual('ToggleType.Switch');
      expect(obj.$attrs.isOn).assertEqual('false');
      expect(obj.$attrs.selectedColor).assertEqual('#FF008000');
      let strJson1 = getInspectorByKey('toggleSwitch');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ToggleJsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ToggleJsunit_0500] switchPointColor: " + JSON.stringify(obj1.$attrs.switchPointColor));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.switchPointColor).assertEqual('#FFFF0000');
      console.info('[ToggleJsunit_0500] END');
      done();
    });

    it('ToggleJsunit_0600', 0, async (done: Function) => {
      // Illegal modification of properties of Toggle component
      console.info('[ToggleJsunit_0600] START');
      globalThis.value.message.notify({name:'type',value:123})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'isOn',value:'aaa'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'selectedColor',value:123})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'switchPointColor',value:'bbb'})
      await CommonFunc.sleep(2000);

      // Get the attribute of Toggle component
      let strJson = getInspectorByKey('toggleCheckbox');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ToggleJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[ToggleJsunit_0600] type: " + JSON.stringify(obj.$attrs.type));
      console.info("[ToggleJsunit_0600] isOn: " + JSON.stringify(obj.$attrs.isOn));
      console.info("[ToggleJsunit_0600] selectedColor: " + JSON.stringify(obj.$attrs.selectedColor));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.type).assertEqual('ToggleType.Switch');
      expect(obj.$attrs.isOn).assertEqual('false');
      expect(obj.$attrs.selectedColor).assertEqual('#FF00007B');
      let strJson1 = getInspectorByKey('toggleSwitch');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ToggleJsunit_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ToggleJsunit_0600] switchPointColor: " + JSON.stringify(obj1.$attrs.switchPointColor));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.switchPointColor).assertEqual('#FFFFFFFF');
      console.info('[ToggleJsunit_0600] END');
      done();
    });
  })
}