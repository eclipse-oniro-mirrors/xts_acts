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


export default function StorageProp25Jsunit() {
  describe('StorageProp25Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageProp25Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AppStorage/StorageProp25',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageProp25Jsunit state pages: " + JSON.stringify(pages));
        if (!("StorageProp25" == pages.name)) {
          console.info("get StorageProp25Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageProp25Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp25Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0100
     * @tc.number StorageProp25Jsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0100 START');
      let strJson1 = getInspectorByKey('lseA');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0100] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值为47");

      let strJson2 = getInspectorByKey('sPropA');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0100] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前PropA值为47");

      console.info('[StorageProp25Jsunit_0100] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0200
     * @tc.number StorageProp25Jsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0200 START');
      let strJson1 = getInspectorByKey('lseB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值为9");

      let strJson2 = getInspectorByKey('sPropB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0200] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前PropB值为9");

      console.info('[StorageProp25Jsunit_0200] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0300
     * @tc.number StorageProp25Jsunit_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0300 START');
      let strJson1 = getInspectorByKey('lsePropB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0300] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值PropB为0");

      let strJson2 = getInspectorByKey('sonPropB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0300] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("子组件当前PropB值为11");

      console.info('[StorageProp25Jsunit_0300] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0400
     * @tc.number StorageProp25Jsunit_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0400 START');
      let strJson1 = getInspectorByKey('sonPropC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0400] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("子组件PropC: 11");

      let strJson2 = getInspectorByKey('sPropC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0400] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("父组件ProC: 11");

      console.info('[StorageProp25Jsunit_0400] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0500
     * @tc.number StorageProp25Jsunit_0500
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0500', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn1_sto'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('sPropA');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0500] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("当前PropA值为48");

      let strJson2 = getInspectorByKey('sPropB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0500] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("当前PropB值为10");

      console.info('[StorageProp25Jsunit_0500] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0600
     * @tc.number StorageProp25Jsunit_0600
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0600', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Child1_btn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('lsePropB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0600] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值PropB为0");

      let strJson2 = getInspectorByKey('sonPropB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0600] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("子组件当前PropB值为12");

      console.info('[StorageProp25Jsunit_0600] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0700
     * @tc.number StorageProp25Jsunit_0700
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0700', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0700 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Child1_btn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('lsePropB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0700] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0700] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值PropB为123");

      let strJson2 = getInspectorByKey('sonPropB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0700] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0700] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("子组件当前PropB值为123");

      console.info('[StorageProp25Jsunit_0700] END');
      done();
    });

    /**
     * @tc.name   StorageProp25Jsunit_0800
     * @tc.number StorageProp25Jsunit_0800
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp25Jsunit_0800', Level.LEVEL0, async (done: Function) => {

      console.info('StorageProp25Jsunit_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Child1_btn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('lsePropB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp25Jsunit_0800] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_0800] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("LocalStorage值PropB为123");

      let strJson2 = getInspectorByKey('sonPropB');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageProp25Jsunit_0800] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_0800] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("子组件当前PropB值为124");

      console.info('[StorageProp25Jsunit_0800] END');
      done();
    });
  })
}
