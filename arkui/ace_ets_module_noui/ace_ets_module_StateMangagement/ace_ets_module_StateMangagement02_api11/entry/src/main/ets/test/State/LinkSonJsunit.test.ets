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


export default function LinkSonJsunit() {
  describe('LinkSonJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkSonJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LinkSon',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkSonJsunit state pages: " + JSON.stringify(pages));
        if (!("LinkSon" == pages.name)) {
          console.info("get LinkSonJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkSonJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkSonJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ParentLink_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   LinkSonJsunit_0100
     * @tc.number LinkSonJsunit_0100
     * @tc.desc   LinkSonJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSonJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('LinkSonJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('str_parLink'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('str_parText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkSonJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_0100] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Parent str: Link Parent");

      let strJson2 = getInspectorByKey('str1_tSon1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkSonJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_0100] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("@Link str1: Link Parent");

      let strJson3 = getInspectorByKey('str2_tSon2');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LinkSonJsunit_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_0100] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("@Link str2: Link Parent");

      let strJson4 = getInspectorByKey('num_parText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[LinkSonJsunit_0300] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual("Parent num: 0");

      let strJson5 = getInspectorByKey('num1_tSon1');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[LinkSonJsunit_0300] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual("@Link num1: 0");

      let strJson6 = getInspectorByKey('num2_tSon2');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[LinkSonJsunit_0300] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual("@Link num2: 0");

      console.info('[LinkSonJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   LinkSonJsunit_0200
     * @tc.number LinkSonJsunit_0200
     * @tc.desc   LinkSonJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSonJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('LinkSonJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('str_son1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('str1_tSon1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkSonJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@Link str1: Link Son1");

      let strJson2 = getInspectorByKey('str_parText');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkSonJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_0200] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("Parent str: Link Son1");

      let strJson3 = getInspectorByKey('str2_tSon2');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LinkSonJsunit_0200] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_0200] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("@Link str2: Link Son1");

      let strJson4 = getInspectorByKey('num_parText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[LinkSonJsunit_0200] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_0200] text: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual("Parent num: 0");

      let strJson5 = getInspectorByKey('num1_tSon1');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[LinkSonJsunit_0200] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_0200] text: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual("@Link num1: 0");

      let strJson6 = getInspectorByKey('num2_tSon2');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[LinkSonJsunit_0200] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_0200] text: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual("@Link num2: 0");

      console.info('[LinkSonJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   LinkSonJsunit_0300
     * @tc.number LinkSonJsunit_0300
     * @tc.desc   LinkSonJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSonJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('LinkSonJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('str_son2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('str2_tSon2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkSonJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@Link str2: Link Son2");

      let strJson2 = getInspectorByKey('str1_tSon1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkSonJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("@Link str1: Link Son2");

      let strJson3 = getInspectorByKey('str_parText');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LinkSonJsunit_0300] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("Parent str: Link Son2");

      let strJson4 = getInspectorByKey('num_parText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[LinkSonJsunit_0300] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual("Parent num: 0");

      let strJson5 = getInspectorByKey('num1_tSon1');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[LinkSonJsunit_0300] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual("@Link num1: 0");

      let strJson6 = getInspectorByKey('num2_tSon2');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[LinkSonJsunit_0300] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_0300] text: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual("@Link num2: 0");

      console.info('[LinkSonJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   LinkSonJsunit_0400
     * @tc.number LinkSonJsunit_0400
     * @tc.desc   LinkSonJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSonJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('LinkSonJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('num_parLink'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('num_parText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkSonJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_0400] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Parent num: 3");

      let strJson2 = getInspectorByKey('num1_tSon1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkSonJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_0400] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("@Link num1: 3");

      let strJson3 = getInspectorByKey('num2_tSon2');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LinkSonJsunit_0400] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_0400] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("@Link num2: 3");

      let strJson4 = getInspectorByKey('str_parText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[LinkSonJsunit_0400] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_0400] text: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual("Parent str: before");

      let strJson5 = getInspectorByKey('str1_tSon1');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[LinkSonJsunit_0400] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_0400] text: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual("@Link str1: before");

      let strJson6 = getInspectorByKey('str2_tSon2');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[LinkSonJsunit_0400] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_0400] text: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual("@Link str2: before");
      console.info('[LinkSonJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   LinkSonJsunit_0500
     * @tc.number LinkSonJsunit_0500
     * @tc.desc   LinkSonJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSonJsunit_0500', Level.LEVEL0, async (done: Function) => {

      console.info('LinkSonJsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('num_son1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('num1_tSon1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkSonJsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_0500] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@Link num1: 2");

      let strJson2 = getInspectorByKey('num_parText');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkSonJsunit_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_0500] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("Parent num: 2");

      let strJson3 = getInspectorByKey('num2_tSon2');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LinkSonJsunit_0500] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_0500] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("@Link num2: 2");

      let strJson4 = getInspectorByKey('str_parText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[LinkSonJsunit_0500] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_0500] text: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual("Parent str: before");

      let strJson5 = getInspectorByKey('str1_tSon1');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[LinkSonJsunit_0500] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_0500] text: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual("@Link str1: before");

      let strJson6 = getInspectorByKey('str2_tSon2');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[LinkSonJsunit_0500] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_0500] text: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual("@Link str2: before");

      console.info('[LinkSonJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   LinkSonJsunit_0600
     * @tc.number LinkSonJsunit_0600
     * @tc.desc   LinkSonJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSonJsunit_0600', Level.LEVEL0, async (done: Function) => {

      console.info('LinkSonJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('num_son2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('num2_tSon2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkSonJsunit_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_0600] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("@Link num2: 1");

      let strJson2 = getInspectorByKey('num1_tSon1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkSonJsunit_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_0600] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("@Link num1: 1");

      let strJson3 = getInspectorByKey('num_parText');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LinkSonJsunit_0600] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_0600] text: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual("Parent num: 1");

      let strJson4 = getInspectorByKey('str_parText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[LinkSonJsunit_0600] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_0600] text: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual("Parent str: before");

      let strJson5 = getInspectorByKey('str1_tSon1');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[LinkSonJsunit_0600] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_0600] text: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual("@Link str1: before");

      let strJson6 = getInspectorByKey('str2_tSon2');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[LinkSonJsunit_0600] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_0600] text: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual("@Link str2: before");

      console.info('[LinkSonJsunit_0600] END');
      done();
    });
  })
}

