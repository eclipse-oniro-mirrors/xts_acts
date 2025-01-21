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
import  CommonFunc from '../../MainAbility/utils/Common'


export default function PropInit1Jsunit() {
  describe('PropInit1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropInit1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropInit1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropInit1Jsunit state pages: " + JSON.stringify(pages));
        if (!("PropInit1" == pages.name)) {
          console.info("get PropInit1Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PropInit1Jsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropInit1Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      let driver = await UiDriver.create()
      router.back({url:"MainAbility/pages/index/index"});
    });

    it('PropInit1Jsunit_0200', 0, async (done: Function) => {

      console.info('PropInit1Jsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sub_prop1_S'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sub_prop1_S');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropInit1Jsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropInit1Jsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('子组件Prop:888');

      let strJson1 = getInspectorByKey('prop_Object1_A');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropInit1Jsunit_0300] component obj is: " + JSON.stringify(obj1));
      console.info("[PropInit1Jsunit_0300] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Change father: 666');
      console.info('[PropInit1Jsunit_0200] END');
      done();
    });

    it('PropInit1Jsunit_0400', 0, async (done: Function) => {

      console.info('PropInit1Jsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('prop_Object1_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('prop_Object1_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropInit1Jsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropInit1Jsunit_0400] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Change father: 111');

      let strJson1 = getInspectorByKey('sub_prop1_S');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropInit1Jsunit_0200] component obj is: " + JSON.stringify(obj1));
      console.info("[PropInit1Jsunit_0200] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('子组件Prop:111');
      console.info('[PropInit1Jsunit_0400] END');
      done();
    });
  })
}

