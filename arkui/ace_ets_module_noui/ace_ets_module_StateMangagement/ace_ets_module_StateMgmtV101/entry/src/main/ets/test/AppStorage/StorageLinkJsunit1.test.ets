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


export default function StorageLinkJsunit1() {
  describe('StorageLinkJsunit1', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageLinkJsunit1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AppStorage/StorageLink1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageLinkJsunit1 state pages: " + JSON.stringify(pages));
        if (!("StorageLink1" == pages.name)) {
          console.info("get StorageLinkJsunit1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageLinkJsunit1 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageLinkJsunit1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0100
     * @tc.number StorageLinkJsunit1_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0100', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son1
      console.info('[StorageLinkJsunit1_0100] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('button_son1'));
      await button_son1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('button_son1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageLinkJsunit1_0100] son1 obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.label).assertEqual('num: 11111');
      console.info('[StorageLinkJsunit1_0100] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0200
     * @tc.number StorageLinkJsunit1_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0200', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son2
      console.info('[StorageLinkJsunit1_0200] START');
      let driver = await UiDriver.create()
      let button_son2 = await driver.findComponent(BY.key('button_son2'));
      await button_son2.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('button_son2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageLinkJsunit1_0200] son2 obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.label).assertEqual('string: sss');
      console.info('[StorageLinkJsunit1_0200] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0300
     * @tc.number StorageLinkJsunit1_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0300', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son3
      console.info('[StorageLinkJsunit1_0300] START');
      let driver = await UiDriver.create()
      let button_son3 = await driver.findComponent(BY.key('button_son3'));
      await button_son3.click();
      await CommonFunc.sleep(2000);

      let strJson3 = getInspectorByKey('button_son3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[StorageLinkJsunit1_0300] son3 obj3 is: " + JSON.stringify(obj3));
      await CommonFunc.sleep(1000);
      expect(obj3.$attrs.label).assertEqual('boolean: true');
      console.info('[StorageLinkJsunit1_0300] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0400
     * @tc.number StorageLinkJsunit1_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0400', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son4
      console.info('[StorageLinkJsunit1_0400] START');
      let driver = await UiDriver.create()
      let button_son4 = await driver.findComponent(BY.key('button_son4'));
      await button_son4.click();
      await CommonFunc.sleep(2000);

      let strJson4 = getInspectorByKey('button_son4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[StorageLinkJsunit1_0400] son4 obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.$attrs.label).assertEqual('enu: 3');
      console.info('[StorageLinkJsunit1_0400] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0500
     * @tc.number StorageLinkJsunit1_0500
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0500', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son5
      console.info('[StorageLinkJsunit1_0500] START');
      let driver = await UiDriver.create()
      let button_son5 = await driver.findComponent(BY.key('button_son5'));
      await button_son5.click();
      await CommonFunc.sleep(2000);

      let strJson5 = getInspectorByKey('button_son5');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[StorageLinkJsunit1_0500] son5 obj5 is: " + JSON.stringify(obj5));
      await CommonFunc.sleep(1000);
      expect(obj5.$attrs.label).assertEqual('class: Title:Hello C');
      console.info('[StorageLinkJsunit1_0500] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0600
     * @tc.number StorageLinkJsunit1_0600
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0600', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son6
      console.info('[StorageLinkJsunit1_0600] START');
      let driver = await UiDriver.create()
      let button_son6 = await driver.findComponent(BY.key('button_son6'));
      await button_son6.click();
      await CommonFunc.sleep(2000);

      let strJson6 = getInspectorByKey('button_son6');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[StorageLinkJsunit1_0600] son6 obj6 is: " + JSON.stringify(obj6));
      await CommonFunc.sleep(1000);
      expect(obj6.$attrs.label).assertEqual('obj: {"name":"ls","age":13}');
      console.info('[StorageLinkJsunit1_0600] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0700
     * @tc.number StorageLinkJsunit1_0700
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0700', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son7
      console.info('[StorageLinkJsunit1_0700] START');
      let driver = await UiDriver.create()
      let button_son7 = await driver.findComponent(BY.key('button_son7'));
      await button_son7.click();
      await CommonFunc.sleep(2000);

      let strJson7 = getInspectorByKey('button_son7');
      let obj7: ESObject = JSON.parse(strJson7);
      console.info("[StorageLinkJsunit1_0700] son7 obj7 is: " + JSON.stringify(obj7));
      await CommonFunc.sleep(1000);
      expect(obj7.$attrs.label).assertEqual('strArray: ls,zs');
      console.info('[StorageLinkJsunit1_0700] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0800
     * @tc.number StorageLinkJsunit1_0800
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0800', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son8
      console.info('[StorageLinkJsunit1_0800] START');
      let driver = await UiDriver.create()
      let button_son8 = await driver.findComponent(BY.key('button_son8'));
      await button_son8.click();
      await CommonFunc.sleep(2000);

      let strJson8 = getInspectorByKey('button_son8');
      let obj8: ESObject = JSON.parse(strJson8);
      console.info("[StorageLinkJsunit1_0800] son8 obj8 is: " + JSON.stringify(obj8));
      await CommonFunc.sleep(1000);
      expect(obj8.$attrs.label).assertEqual('numArray: 2,3');
      console.info('[StorageLinkJsunit1_0800] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_0900
     * @tc.number StorageLinkJsunit1_0900
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_0900', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son9
      console.info('[StorageLinkJsunit1_0900] START');
      let driver = await UiDriver.create()
      let button_son9 = await driver.findComponent(BY.key('button_son9'));
      await button_son9.click();
      await CommonFunc.sleep(2000);

      let strJson9 = getInspectorByKey('button_son9');
      let obj9: ESObject = JSON.parse(strJson9);
      console.info("[StorageLinkJsunit1_0900] son9 obj9 is: " + JSON.stringify(obj9));
      await CommonFunc.sleep(1000);
      expect(obj9.$attrs.label).assertEqual('boolArray: false,true');
      console.info('[StorageLinkJsunit1_0900] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_1000
     * @tc.number StorageLinkJsunit1_1000
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_1000', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son9
      console.info('[StorageLinkJsunit1_1000] START');
      let driver = await UiDriver.create()
      let button_son10 = await driver.findComponent(BY.key('button_son10'));
      await button_son10.click();
      await CommonFunc.sleep(2000);

      let strJson10 = getInspectorByKey('button_son10');
      let obj10: ESObject = JSON.parse(strJson10);
      console.info("[StorageLinkJsunit1_1000] son10 obj10 is: " + JSON.stringify(obj10));
      await CommonFunc.sleep(1000);
      expect(obj10.$attrs.label).assertEqual('classArray: [{"value":"hello world"},{"value":"hello C"}]');
      console.info('[StorageLinkJsunit1_1000] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_1100
     * @tc.number StorageLinkJsunit1_1100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_1100', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son11
      console.info('[StorageLinkJsunit1_1100] START');
      let driver = await UiDriver.create()
      let button_son11 = await driver.findComponent(BY.key('button_son11'));
      await button_son11.click();
      await CommonFunc.sleep(2000);

      let strJson11 = getInspectorByKey('button_son11');
      let obj11: ESObject = JSON.parse(strJson11);
      console.info("[StorageLinkJsunit1_1100] son11 obj11 is: " + JSON.stringify(obj11));
      await CommonFunc.sleep(1000);
      expect(obj11.$attrs.label).assertEqual('objArray: [{"name":"ls"},{"name":"zs"}]');
      console.info('[StorageLinkJsunit1_1100] END');
      done();
    });
    
    /**
     * @tc.name   StorageLinkJsunit1_1200
     * @tc.number StorageLinkJsunit1_1200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit1_1200', Level.LEVEL0, async (done: Function) => {
      // Get the init value of button_son11
      console.info('[StorageLinkJsunit1_1200] START');
      let driver = await UiDriver.create()
      let button_son12 = await driver.findComponent(BY.key('button_son12'));
      await button_son12.click();
      await CommonFunc.sleep(2000);

      let strJson12 = getInspectorByKey('button_son12');
      let obj12: ESObject = JSON.parse(strJson12);
      console.info("[StorageLinkJsunit1_1200] son12 obj12 is: " + JSON.stringify(obj12));
      await CommonFunc.sleep(1000);
      expect(obj12.$attrs.label).assertEqual('menuArray: 2,3');
      console.info('[StorageLinkJsunit1_1200] END');
      done();
    });
  })
}
