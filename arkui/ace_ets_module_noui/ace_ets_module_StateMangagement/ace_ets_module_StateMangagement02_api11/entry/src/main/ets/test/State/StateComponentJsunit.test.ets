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


export default function StateComponentJsunit() {
  describe('StateComponentJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateComponentJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateComponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateComponentJsunit state pages: " + JSON.stringify(pages));
        if (!("StateComponent" == pages.name)) {
          console.info("get StateComponentJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateComponentJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateComponentJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({
        url: "MainAbility/pages/index/index"
      });
    });

    /**
     * @tc.name   StateComponentJsunit_0100
     * @tc.number StateComponentJsunit_0100
     * @tc.desc   StateComponentJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateComponentJsunit_0100', Level.LEVEL0, async (done: Function) => {
      // get the value of title1
      console.info('StateComponentJsunit_0100 START');
      let strJson1 = getInspectorByKey('text_component1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StateComponentJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StateComponentJsunit_0100] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Hello World");

      let strJson2 = getInspectorByKey('text_component7');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StateComponentJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StateComponentJsunit_0100] title: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("Hello, World 2");

      console.info('[StateComponentJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   StateComponentJsunit_0200
     * @tc.number StateComponentJsunit_0200
     * @tc.desc   StateComponentJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateComponentJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('StateComponentJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('change_component1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_component1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateComponentJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Hello ArkUI");
      console.info('[StateComponentJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   StateComponentJsunit_0300
     * @tc.number StateComponentJsunit_0300
     * @tc.desc   StateComponentJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateComponentJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('StateComponentJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('increase_component1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('increase_component3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateComponentJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_0300] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("Click to increase count=3");
      console.info('[StateComponentJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   StateComponentJsunit_0400
     * @tc.number StateComponentJsunit_0400
     * @tc.desc   StateComponentJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateComponentJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('StateComponentJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('change_component7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_component7');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateComponentJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_0400] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Hello ArkUI");
      console.info('[StateComponentJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   StateComponentJsunit_0500
     * @tc.number StateComponentJsunit_0500
     * @tc.desc   StateComponentJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateComponentJsunit_0500', Level.LEVEL0, async (done: Function) => {

      console.info('StateComponentJsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('increase_component7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('increase_component8');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateComponentJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_0500] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("Click to increase count=8");
      console.info('[StateComponentJsunit_0500] END');
      done();
    });
  })
}

