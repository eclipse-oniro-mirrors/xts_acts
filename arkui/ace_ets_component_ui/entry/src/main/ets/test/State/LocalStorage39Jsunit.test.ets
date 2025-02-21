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


export default function LocalStorage39Jsunit() {
  describe('LocalStorage39Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorage39Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LocalStorage39',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorage39Jsunit state pages: " + JSON.stringify(pages));
        if (!("LocalStorage39" == pages.name)) {
          console.info("get LocalStorage39Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStorage39Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorage39Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('LocalStorage39Jsunit_0200', 0, async (done: Function) => {
      //Size获取AppStorage中存在键值对的个数
      console.info('[LocalStorage39Jsunit_0200] START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('button4'));
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('sizeText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStorage39Jsunit_0200] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('size是：2');

      console.info('[LocalStorage39Jsunit_0200] END');
      done();
    });

    it('LocalStorage39Jsunit_0400', 0, async (done: Function) => {
      console.info('[LocalStorage39Jsunit_0400] START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('button1'));
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('keysText1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStorage39Jsunit_0400] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('Keys：["storage_","propA","propB"]');
      console.info('[LocalStorage39Jsunit_0400] END');
      done();
    });

    it('LocalStorage39Jsunit_0600', 0, async (done: Function) => {
      console.info('[LocalStorage39Jsunit_0600] START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('button2'));
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('getText1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStorage39Jsunit_0600] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('get propA：1');
      console.info('[LocalStorage39Jsunit_0600] END');
      done();
    });

    it('LocalStorage39Jsunit_0800', 0, async (done: Function) => {
      console.info('[LocalStorage39Jsunit_0800] START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('button3'));
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('getText2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStorage39Jsunit_0800] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('get propE：undefined');
      console.info('[LocalStorage39Jsunit_0800] END');
      done();
    });
  })
}
