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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function RadioJsunit() {
  describe('RadioJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RadioJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RadioPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RadioJsunit state pages: " + JSON.stringify(pages));
        if (!("RadioPage" == pages.name)) {
          console.info("get RadioJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RadioJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RadioJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('RadioJsunit_0100', 0, async (done: Function) => {
      // Get the information of the Radio component
      console.info('[RadioJsunit_0100] START');
      let strJson1 = getInspectorByKey('r1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RadioJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.value).assertEqual('radio1');
      expect(obj1.$attrs.checked).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('r2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RadioJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.value).assertEqual('Radio2');
      expect(obj2.$attrs.checked).assertEqual('false');
      // Get the text of the Text component
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('t1'));
      let text = await textComponent.getText();
      expect(text).assertEqual('radio1');
      console.info('[RadioJsunit_0100] END');
      done();
    });

    it('RadioJsunit_0200', 0, async (done: Function) => {
      // Verify Radio Components Click to select
      console.info('[RadioJsunit_0200] START');
      // Get the component Radio1 and click
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('r3'));
      await textComponent.click();
      await CommonFunc.sleep(1000);
      // Verify that the component Radio is selected
      let strJson = getInspectorByKey('r3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RadioJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.checked).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[RadioJsunit_0200] END');
      done();
    });

    it('RadioJsunit_0300', 0, async (done: Function) => {
      // Verify that the radio components are in the same group Click to select only one of the three
      console.info('[RadioJsunit_0300] START');

      // Get the component Radio2 and click
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('r2'));
      await textComponent.click();
      await CommonFunc.sleep(1000);

      // Verify the selected state of component Radio2
      let strJson = getInspectorByKey('r2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RadioJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.checked).assertEqual('true');
      await CommonFunc.sleep(1000);

      // Verify the selected state of component Radio1
      let strJson1 = getInspectorByKey('r1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RadioJsunit_0300] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.checked).assertEqual('false');
      await CommonFunc.sleep(1000);

      // Verify the selected state of component Radio3
      let strJson2 = getInspectorByKey('r3');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RadioJsunit_0300] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.checked).assertEqual('false');
      console.info('[RadioJsunit_0300] END');
      done();
    });

    it('RadioJsunit_0400', 0, async (done: Function) => {
      // Verify onChange event of of component Radio
      console.info('[RadioJsunit_0400] START');
      let driver = await UiDriver.create()
      let radio3 = await driver.findComponent(BY.key('r3'));
      await radio3.click();
      await CommonFunc.sleep(1000);

      let textComponent = await driver.findComponent(BY.key('text'));
      let text = await textComponent.getText();
      console.info("[RadioJsunit_0400] text: " + JSON.stringify(text));
      expect(text).assertEqual('change succ');
      console.info('[RadioJsunit_0400] END');
      done();
    });
  })
}
