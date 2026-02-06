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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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


export default function ObjectLinkSplJsunit() {
  describe('ObjectLinkSplJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkSplJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkSpl',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkSplJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkSpl" == pages.name)) {
          console.info("get ObjectLinkSplJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkSplJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkSplJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ViewAS_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    it('ObjectLinkSplJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkSplJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('adds_state'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('num_state');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSplJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("@State: 6");

      let strJson1 = getInspectorByKey('sNum_olk');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkSplJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkSplJsunit_0100] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ObjectLink: 6");

      let strJson2 = getInspectorByKey('sNum_props');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkSplJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkSplJsunit_0100] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("son_Prop: 6");

      let strJson3 = getInspectorByKey('sNum_links');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[ObjectLinkSplJsunit_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkSplJsunit_0100] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("son_Link: 6");

      console.info('[ObjectLinkSplJsunit_0100] END');
      done();
    });

    it('ObjectLinkSplJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkSplJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_olk'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sNum_olk');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSplJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("ObjectLink: 6");

      let strJson1 = getInspectorByKey('num_state');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkSplJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkSplJsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@State: 6");

      let strJson2 = getInspectorByKey('sNum_props');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkSplJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkSplJsunit_0200] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("son_Prop: 6");

      let strJson3 = getInspectorByKey('sNum_links');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[ObjectLinkSplJsunit_0200] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkSplJsunit_0200] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("son_Link: 6");

      console.info('[ObjectLinkSplJsunit_0200] END');
      done();
    });

    it('ObjectLinkSplJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkSplJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_prop'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sNum_props');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSplJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("son_Prop: 5");

      let strJson1 = getInspectorByKey('num_state');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkSplJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkSplJsunit_0300] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@State: 5");

      let strJson2 = getInspectorByKey('sNum_olk');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkSplJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkSplJsunit_0300] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ObjectLink: 5");

      let strJson3 = getInspectorByKey('sNum_links');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[ObjectLinkSplJsunit_0300] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkSplJsunit_0300] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("son_Link: 5");

      console.info('[ObjectLinkSplJsunit_0300] END');
      done();
    });

    it('ObjectLinkSplJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkSplJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_link'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sNum_links');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSplJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("son_Link: 6");

      let strJson1 = getInspectorByKey('num_state');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkSplJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkSplJsunit_0400] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@State: 6");

      let strJson2 = getInspectorByKey('sNum_olk');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkSplJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkSplJsunit_0400] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ObjectLink: 6");

      let strJson3 = getInspectorByKey('sNum_props');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[ObjectLinkSplJsunit_0400] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkSplJsunit_0400] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("son_Prop: 6");

      console.info('[ObjectLinkSplJsunit_0400] END');
      done();
    });
  })
}

