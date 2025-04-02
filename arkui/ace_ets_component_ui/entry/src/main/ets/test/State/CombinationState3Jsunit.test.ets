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
import CommonFunc from '../../MainAbility/utils/Common';


export default function CombinationState3Jsunit() {
  describe('CombinationState3Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("CombinationState3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CombinationState3Jsunit state pages: " + JSON.stringify(pages));
        if (!("CombinationState3" == pages.name)) {
          console.info("get CombinationState3Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CombinationState3Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState3Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    // afterEach(async () => {
    //   await CommonFunc.sleep(1000);
    //   let driver = await UiDriver.create()
    //   await driver.pressBack();
    // });

    it('CombinationState3Jsunit_0100', 0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState3Jsunit_0100] START');
      let driver = await UiDriver.create()
      let qrComponent = await driver.findComponent(BY.key('change_ClassA'));
      await qrComponent.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildPropState1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState3Jsunit_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('子组件ChildPropState1: 1');

      let strJson1 = getInspectorByKey('ChildPropState2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[CombinationState3Jsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('子组件ChildPropState2: 5');
      console.info('[CombinationState3Jsunit_0100] END');
      done();
    });

    it('CombinationState3Jsunit_0200', 0, async (done: Function) => {
      // Click and get the value of State component
      console.info('[CombinationState3Jsunit_0200] START');
      let driver = await UiDriver.create()
      let qrComponent = await driver.findComponent(BY.key('change_ClassA'));
      await qrComponent.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ChildProvide1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState3Jsunit_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('子组件ChildProvide1: 1');

      let strJson1 = getInspectorByKey('ChildProvide2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[CombinationState3Jsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('子组件ChildProvide2: 5');
      console.info('[CombinationState3Jsunit_0200] END');
      done();
    });

    it('CombinationState3Jsunit_0300', 0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState3Jsunit_0300] START');
      let driver = await UiDriver.create()
      let qrComponent = await driver.findComponent(BY.key('change_ClassA'));
      await qrComponent.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildLink1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState3Jsunit_0300] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('子组件ChildLink1: 2');

      let strJson1 = getInspectorByKey('ChildLink2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[CombinationState3Jsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('子组件ChildLink2: 6');
      console.info('[CombinationState3Jsunit_0300] END');
      done();
    });

    it('CombinationState3Jsunit_0400', 0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState3Jsunit_0400] START');
      let driver = await UiDriver.create()
      let qrComponent = await driver.findComponent(BY.key('change_ClassA'));
      await qrComponent.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildProp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState3Jsunit_0400] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('子组件ChildProp1: 2');

      let strJson1 = getInspectorByKey('ChildProp2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[CombinationState3Jsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('子组件ChildProp2: 6');
      console.info('[CombinationState3Jsunit_0400] END');
      done();
    });
  })
}
