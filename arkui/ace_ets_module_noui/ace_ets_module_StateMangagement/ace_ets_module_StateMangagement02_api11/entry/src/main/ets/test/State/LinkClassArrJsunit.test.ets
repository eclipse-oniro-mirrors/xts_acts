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


export default function LinkClassArrJsunit() {
  describe('LinkClassArrJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkClassArrJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LinkClassArr',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkClassArrJsunit state pages: " + JSON.stringify(pages));
        if (!("LinkClassArr" == pages.name)) {
          console.info("get LinkClassArrJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkClassArrJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkClassArrJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ParentLinkAC_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   LinkClassArrJsunit_0100
     * @tc.number LinkClassArrJsunit_0100
     * @tc.desc   LinkClassArrJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkClassArrJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('LinkClassArrJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('arrBtn_ParentAC'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('arr_ParentAC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkClassArrJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkClassArrJsunit_0100] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("arrPar: 3,2,1");

      let strJson2 = getInspectorByKey('arr_SonAC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkClassArrJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkClassArrJsunit_0100] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("arrSon: 3,2,1");

      console.info('[LinkClassArrJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   LinkClassArrJsunit_0200
     * @tc.number LinkClassArrJsunit_0200
     * @tc.desc   LinkClassArrJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkClassArrJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('LinkClassArrJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('arrBtn_SonAC'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('arr_SonAC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkClassArrJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkClassArrJsunit_0200] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("arrSon: 3,2,1");

      let strJson2 = getInspectorByKey('arr_ParentAC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkClassArrJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkClassArrJsunit_0200] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("arrPar: 3,2,1");

      console.info('[LinkClassArrJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   LinkClassArrJsunit_0300
     * @tc.number LinkClassArrJsunit_0300
     * @tc.desc   LinkClassArrJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkClassArrJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('LinkClassArrJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('casBtn_ParentAC'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('class_ParentAC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkClassArrJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkClassArrJsunit_0300] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("classPar: 3");

      let strJson2 = getInspectorByKey('class_SonAC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkClassArrJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkClassArrJsunit_0300] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("classSon: 3");

      console.info('[LinkClassArrJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   LinkClassArrJsunit_0400
     * @tc.number LinkClassArrJsunit_0400
     * @tc.desc   LinkClassArrJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkClassArrJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('LinkClassArrJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('casBtn_SonAC'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('class_SonAC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkClassArrJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkClassArrJsunit_0400] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("classSon: 2");

      let strJson2 = getInspectorByKey('class_ParentAC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkClassArrJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkClassArrJsunit_0400] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("classPar: 2");

      console.info('[LinkClassArrJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   LinkClassArrJsunit_0500
     * @tc.number LinkClassArrJsunit_0500
     * @tc.desc   LinkClassArrJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkClassArrJsunit_0500', Level.LEVEL0, async (done: Function) => {

      console.info('LinkClassArrJsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('caBtn_ParentAC'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('classArr_ParentAC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkClassArrJsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkClassArrJsunit_0500] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("classArrPar: 1");

      let strJson2 = getInspectorByKey('classArr_SonAC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkClassArrJsunit_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkClassArrJsunit_0500] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("classArrSon: 1");

      console.info('[LinkClassArrJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   LinkClassArrJsunit_0600
     * @tc.number LinkClassArrJsunit_0600
     * @tc.desc   LinkClassArrJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkClassArrJsunit_0600', Level.LEVEL0, async (done: Function) => {

      console.info('LinkClassArrJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('caBtn_SonAC'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('classArr_SonAC');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LinkClassArrJsunit_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkClassArrJsunit_0600] text: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("classArrSon: 1");

      let strJson2 = getInspectorByKey('classArr_ParentAC');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LinkClassArrJsunit_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkClassArrJsunit_0600] text: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("classArrPar: 1");

      console.info('[LinkClassArrJsunit_0600] END');
      done();
    });
  })
}

