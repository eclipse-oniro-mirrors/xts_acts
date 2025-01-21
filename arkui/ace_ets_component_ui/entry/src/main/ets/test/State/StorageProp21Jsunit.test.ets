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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';


export default function StorageProp21Jsunit() {
  describe('StorageProp21Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageProp21Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageProp21',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageProp21Jsunit state pages: " + JSON.stringify(pages));
        if (!("StorageProp21" == pages.name)) {
          console.info("get StorageProp21Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageProp21Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp21Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('StorageProp21Jsunit_0200', 0, async (done: Function) => {
      console.info('[StorageProp21Jsunit_0200] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('button1'));
      await button_son1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('button1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp21Jsunit_0200] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.label).assertEqual('button1: cd');
      console.info('[StorageProp21Jsunit_0200] END');
      done();
    });

    it('StorageProp21Jsunit_0300', 0, async (done: Function) => {
      console.info('[StorageProp21Jsunit_0300] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('button2'));
      await button_son1.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('button2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp21Jsunit_0300] obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.label).assertEqual('button2: 3');
      console.info('[StorageProp21Jsunit_0300] END');
      done();
    });

    it('StorageProp21Jsunit_0400', 0, async (done: Function) => {
      console.info('[StorageProp21Jsunit_0400] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('button3'));
      await button_son1.click();
      await CommonFunc.sleep(1000);

      let strJson13 = getInspectorByKey('button3');
      let obj13: ESObject = JSON.parse(strJson13);
      console.info("[StorageProp21Jsunit_0400] obj13 is: " + JSON.stringify(obj13));
      await CommonFunc.sleep(1000);
      expect(obj13.$attrs.label).assertEqual('button3: false');
      console.info('[StorageProp21Jsunit_0400] END');
      done();
    });

    it('StorageProp21Jsunit_0500', 0, async (done: Function) => {
      console.info('[StorageProp21Jsunit_0500] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('button4'));
      await button_son1.click();
      await CommonFunc.sleep(1000);

      let strJson24 = getInspectorByKey('button4');
      let obj24: ESObject = JSON.parse(strJson24);
      console.info("[StorageProp21Jsunit_0500] obj24 is: " + JSON.stringify(obj24));
      await CommonFunc.sleep(1000);
      expect(obj24.$attrs.label).assertEqual('button4: 3');
      console.info('[StorageProp21Jsunit_0500] END');
      done();
    });
  })
}
