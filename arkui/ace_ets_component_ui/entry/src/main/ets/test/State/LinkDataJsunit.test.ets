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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function LinkDataJsunit() {
  describe('LinkDataJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkDataJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LinkData',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkDataJsunit state pages: " + JSON.stringify(pages));
        if (!("LinkData" == pages.name)) {
          console.info("get LinkDataJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkDataJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkDataJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('LinkDataJsunit_0100', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0100 START');
      let strJson = getInspectorByKey('link_str');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("string: hello");
      console.info('[LinkDataJsunit_0100] END');
      done();
    });

    it('LinkDataJsunit_0200', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('strBtn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('link_str');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("string: harmony");
      console.info('[LinkDataJsunit_0200] END');
      done();
    });

    it('LinkDataJsunit_0300', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0300 START');
      let strJson = getInspectorByKey('link_num');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("number: 0");
      console.info('[LinkDataJsunit_0300] END');
      done();
    });

    it('LinkDataJsunit_0400', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('numBtn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('link_num');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("number: 1");
      console.info('[LinkDataJsunit_0400] END');
      done();
    });

    it('LinkDataJsunit_0500', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0500 START');
      let strJson = getInspectorByKey('link_bon');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0500] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("boolean: true");
      console.info('[LinkDataJsunit_0500] END');
      done();
    });

    it('LinkDataJsunit_0600', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('bonBtn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('link_bon');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0600] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("boolean: false");
      console.info('[LinkDataJsunit_0600] END');
      done();
    });

    it('LinkDataJsunit_0700', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0700 START');
      let strJson = getInspectorByKey('link_enum');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0700] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0700] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("enum: 1");
      console.info('[LinkDataJsunit_0700] END');
      done();
    });

    it('LinkDataJsunit_0800', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('enumBtn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('link_enum');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0800] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0800] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("enum: 2");
      console.info('[LinkDataJsunit_0800] END');
      done();
    });

    it('LinkDataJsunit_0900', 0, async (done: Function) => {

      console.info('LinkDataJsunit_0900 START');
      let strJson = getInspectorByKey('link_cla');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_0900] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_0900] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("class: Hello World");
      console.info('[LinkDataJsunit_0900] END');
      done();
    });

    it('LinkDataJsunit_1000', 0, async (done: Function) => {

      console.info('LinkDataJsunit_1000 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('claBtn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('link_cla');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_1000] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_1000] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("class: Hi ArkUI");
      console.info('[LinkDataJsunit_1000] END');
      done();
    });

    it('LinkDataJsunit_1100', 0, async (done: Function) => {

      console.info('LinkDataJsunit_1100 START');
      let strJson = getInspectorByKey('link_strArr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_1100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_1100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("array: First,Second,Third");
      console.info('[LinkDataJsunit_1100] END');
      done();
    });

    it('LinkDataJsunit_1200', 0, async (done: Function) => {

      console.info('LinkDataJsunit_1200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sArrBtn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('link_strArr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkDataJsunit_1200] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_1200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("array: A,B,C");
      console.info('[LinkDataJsunit_1200] END');
      done();
    });
  })
}

