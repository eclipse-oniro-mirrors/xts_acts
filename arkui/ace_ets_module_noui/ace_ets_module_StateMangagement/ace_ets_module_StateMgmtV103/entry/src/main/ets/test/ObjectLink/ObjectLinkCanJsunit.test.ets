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
 


export default function ObjectLinkCanJsunit() {
  describe('ObjectLinkCanJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkCanJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ObjectLink/ObjectLinkCan',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkCanJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkCan" == pages.name)) {
          console.info("get ObjectLinkCanJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkCanJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkCanJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ObjectLinkFar2_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   ObjectLinkCanJsunit_0100
     * @tc.number ObjectLinkCanJsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkCanJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('ObjectLinkCanJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('farClassBN'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('farClassBN');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkCanJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkCanJsunit_0100] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ClassBN + 1: 5");

      let strJson2 = getInspectorByKey('sonClassBN');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkCanJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkCanJsunit_0100] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ClassBN的numB值: 6");

      console.info('[ObjectLinkCanJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkCanJsunit_0200
     * @tc.number ObjectLinkCanJsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkCanJsunit_0200', Level.LEVEL1, async (done: Function) => {

      console.info('ObjectLinkCanJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('farClassBN3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('farClassBN3');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkCanJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkCanJsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ClassBN 赋值3: 5");

      let strJson2 = getInspectorByKey('sonClassBN');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkCanJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkCanJsunit_0200] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ClassBN的numB值: 3");

      console.info('[ObjectLinkCanJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkCanJsunit_0300
     * @tc.number ObjectLinkCanJsunit_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkCanJsunit_0300', Level.LEVEL1, async (done: Function) => {

      console.info('ObjectLinkCanJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sonClassBN'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sonClassBN');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkCanJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkCanJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("ClassBN的numB值: 6");

      let strJson1 = getInspectorByKey('farClassBN');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ObjectLinkCanJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkCanJsunit_0300] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("ClassBN + 1: 5");

      let strJson2 = getInspectorByKey('farClassBN3');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ObjectLinkCanJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkCanJsunit_0300] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("ClassBN 赋值3: 5");

      console.info('[ObjectLinkCanJsunit_0300] END');
      done();
    });
  })
}

