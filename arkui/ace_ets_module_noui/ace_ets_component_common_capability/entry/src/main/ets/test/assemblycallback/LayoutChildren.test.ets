/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
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

export default function LayoutChildrenTest() {
  describe('LayoutChildrenTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LayoutChildrenTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LayoutChildren",
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get LayoutChildrenTest state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get LayoutChildrenTest state pages.name: " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push LayoutChildrenTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LayoutChildrenTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BindControllerErrorCodeTest after each called');
    });


    /**
     * @tc.name   LayoutChildrenTest_0100
     * @tc.number LayoutChildrenTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutChildrenTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('LayoutChildrenTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('Button1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('Button5'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('initid2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('LayoutChildrenTest_0100 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init11');
      let btn2 = await driver.findComponent(ON.id('Button3'));
      await btn2.click();
      let btn3 = await driver.findComponent(ON.id('Button5'));
      await btn3.click();
      console.info("click btn3 complete")
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('initid2');
      let obj2: ESObject = JSON.parse(strJson);
      console.info('LayoutChildrenTest_0100 component obj2 is: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('init11');
      let strJson1 = getInspectorByKey('initid1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('LayoutChildrenTest_0100 component obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('offLayoutChildrenByID');
      console.info('[LayoutChildrenTest_0100] END');
      done();
    });


    /**
     * @tc.name   LayoutChildrenTest_0200
     * @tc.number LayoutChildrenTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LayoutChildrenTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('LayoutChildrenTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('Button1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('Button2'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('Button5'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('initid2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('LayoutChildrenTest_0200 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init11');
      let strJson1 = getInspectorByKey('initid3');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('LayoutChildrenTest_0200 component obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('init21');
      let btn3 = await driver.findComponent(ON.id('Button4'));
      await btn3.click();
      console.info("click btn3 complete")
      await CommonFunc.sleep(500);
      let btn4 = await driver.findComponent(ON.id('Button5'));
      await btn4.click();
      console.info("click btn4 complete")
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('initid2');
      obj = JSON.parse(strJson);
      console.info('LayoutChildrenTest_0200 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init11');
      strJson1 = getInspectorByKey('initid3');
      obj1 = JSON.parse(strJson1);
      console.info('LayoutChildrenTest_0200 component obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('init21');
      let strJson2 = getInspectorByKey('initid1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('LayoutChildrenTest_0200 component obj2 is: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('offLayoutChildrencomplete');
      console.info('[LayoutChildrenTest_0200] END');
      done();
    });
  })
}