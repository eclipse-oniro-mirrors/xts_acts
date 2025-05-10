/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


export default function StorageProp22Jsunit() {
  describe('StorageProp22Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageProp22Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageProp22',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageProp22Jsunit state pages: " + JSON.stringify(pages));
        if (!("StorageProp22" == pages.name)) {
          console.info("get StorageProp22Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageProp22Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp22Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('StorageProp22Jsunit_0100', 0, async (done: Function) => {
      console.info('StorageProp22Jsunit_0100 START');
      let strJson = getInspectorByKey('lse1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StorageProp22Jsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StorageProp22Jsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("LocalStorage值为47");
      console.info('[StorageProp22Jsunit_0100] END');
      done();
    });

    it('StorageProp22Jsunit_0200', 0, async (done: Function) => {
      console.info('StorageProp22Jsunit_0200 START');
      let strJson = getInspectorByKey('text_sp');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StorageProp22Jsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StorageProp22Jsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("当前值为47");
      console.info('[StorageProp22Jsunit_0200] END');
      done();
    });

    it('StorageProp22Jsunit_0300', 0, async (done: Function) => {

      console.info('StorageProp22Jsunit_0300 START');
      let strJson = getInspectorByKey('lse2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StorageProp22Jsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StorageProp22Jsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("LocalStorage值为4");
      console.info('[StorageProp22Jsunit_0300] END');
      done();
    });

    it('StorageProp22Jsunit_0400', 0, async (done: Function) => {

      console.info('StorageProp22Jsunit_0400 START');
      let strJson = getInspectorByKey('text_spb');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StorageProp22Jsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StorageProp22Jsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("当前值为4");
      console.info('[StorageProp22Jsunit_0400] END');
      done();
    });

    it('StorageProp22Jsunit_0500', 0, async (done: Function) => {

      console.info('StorageProp22Jsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_lse1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('lse1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp22Jsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp22Jsunit_0500] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值为47");

      let strJson2 = getInspectorByKey('text_sp');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp22Jsunit_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp22Jsunit_0500] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前值为48");
      console.info('[StorageProp22Jsunit_0500] END');
      done();
    });

    it('StorageProp22Jsunit_0600', 0, async (done: Function) => {
      console.info('StorageProp22Jsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_lse1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('lse1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp22Jsunit_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp22Jsunit_0600] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值为47");

      let strJson2 = getInspectorByKey('text_sp');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp22Jsunit_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp22Jsunit_0600] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前值为49");
      console.info('[StorageProp22Jsunit_0600] END');
      done();
    });

    it('StorageProp22Jsunit_0700', 0, async (done: Function) => {

      console.info('StorageProp22Jsunit_0700 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_lse2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('lse2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp22Jsunit_0700] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp22Jsunit_0700] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值为4");

      let strJson2 = getInspectorByKey('text_spb');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp22Jsunit_0700] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp22Jsunit_0700] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前值为5");
      console.info('[StorageProp22Jsunit_0700] END');
      done();
    });

    it('StorageProp22Jsunit_0800', 0, async (done: Function) => {

      console.info('StorageProp22Jsunit_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_lse2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('lse2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp22Jsunit_0800] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp22Jsunit_0800] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值为4");

      let strJson2 = getInspectorByKey('text_spb');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp22Jsunit_0800] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp22Jsunit_0800] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前值为6");
      console.info('[StorageProp22Jsunit_0800] END');
      done();
    });
  })
}
