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


export default function ObjectLinkFarJsunit() {
  describe('ObjectLinkFarJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkFarJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkFar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkFarJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkFar" == pages.name)) {
          console.info("get ObjectLinkFarJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkFarJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkFarJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ObjectLinkFarClassAAA_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    it('ObjectLinkFarJsunit_0100', 0, async (done: Function) => {

      console.info('ObjectLinkFarJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('farClassAAA'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('farClassAAA');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkFarJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkFarJsunit_0100] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ClassAAA的numA值: 1");

      let strJson2 = getInspectorByKey('sonClassBBB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkFarJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkFarJsunit_0100] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ClassBBB的numB值: 5");

      console.info('[ObjectLinkFarJsunit_0100] END');
      done();
    });

    it('ObjectLinkFarJsunit_0200', 0, async (done: Function) => {

      console.info('ObjectLinkFarJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('farClassBBB'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('farClassBBB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkFarJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkFarJsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ClassAAA的classBBB: 5");

      let strJson2 = getInspectorByKey('sonClassBBB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkFarJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkFarJsunit_0200] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ClassBBB的numB值: 6");

      console.info('[ObjectLinkFarJsunit_0200] END');
      done();
    });

    it('ObjectLinkFarJsunit_0300', 0, async (done: Function) => {

      console.info('ObjectLinkFarJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sonClassBBB'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('sonClassBBB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkFarJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkFarJsunit_0300] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ClassBBB的numB值: 6");

      let strJson2 = getInspectorByKey('farClassAAA');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkFarJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkFarJsunit_0300] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ClassAAA的numA值: 0");

      let strJson3 = getInspectorByKey('farClassBBB');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[ObjectLinkFarJsunit_0300] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkFarJsunit_0300] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("ClassAAA的classBBB: 5");

      console.info('[ObjectLinkFarJsunit_0300] END');
      done();
    });
  })
}

