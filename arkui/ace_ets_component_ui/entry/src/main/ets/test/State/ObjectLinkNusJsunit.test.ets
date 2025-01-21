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
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function ObjectLinkNusJsunit() {
  describe('ObjectLinkNusJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkNusJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkNus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkNusJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkNus" == pages.name)) {
          console.info("get ObjectLinkNusJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkNusJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkNusJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({url:"MainAbility/pages/index/index"});
    });

    it('ObjectLinkNusJsunit_0100', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0100 START');
      let strJson = getInspectorByKey('str_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("hello");
      console.info('[ObjectLinkNusJsunit_0100] END');
      done();
    });

    it('ObjectLinkNusJsunit_0200', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('strBtn_obl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('str_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("harmony");
      console.info('[ObjectLinkNusJsunit_0200] END');
      done();
    });

    it('ObjectLinkNusJsunit_0300', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0300 START');
      let strJson = getInspectorByKey('num_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("0");
      console.info('[ObjectLinkNusJsunit_0300] END');
      done();
    });

    it('ObjectLinkNusJsunit_0400', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('numBtn_obl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('num_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("3");
      console.info('[ObjectLinkNusJsunit_0400] END');
      done();
    });

    it('ObjectLinkNusJsunit_0500', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0500 START');
      let strJson = getInspectorByKey('bon_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0500] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("true");
      console.info('[ObjectLinkNusJsunit_0500] END');
      done();
    });

    it('ObjectLinkNusJsunit_0600', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('bonBtn_obl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('bon_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0600] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("false");
      console.info('[ObjectLinkNusJsunit_0600] END');
      done();
    });

    it('ObjectLinkNusJsunit_0700', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0700 START');
      let strJson = getInspectorByKey('cor_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0700] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0700] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("#ff0000ff");
      console.info('[ObjectLinkNusJsunit_0700] END');
      done();
    });

    it('ObjectLinkNusJsunit_0800', 0, async (done: Function) => {

      console.info('ObjectLinkNusJsunit_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('corBtn_obl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cor_obl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkNusJsunit_0800] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkNusJsunit_0800] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("#ffff0000");
      console.info('[ObjectLinkNusJsunit_0800] END');
      done();
    });
  })
}

