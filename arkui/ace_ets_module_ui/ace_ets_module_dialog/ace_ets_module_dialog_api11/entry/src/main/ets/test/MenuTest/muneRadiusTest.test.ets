/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import deviceInfo from "@ohos.deviceInfo"

export default function muneRadiusTest() {
  describe('muneRadiusTest', () => {
  let currentDeviceIsPC = false
      beforeAll(() => {
          console.info("muneRadiusTest beforeAll start")
          let deviceTypeInfo = deviceInfo.deviceType
          currentDeviceIsPC = deviceTypeInfo === "2in1" ? true : false
          console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
          console.info("the value of the deviceType is " + deviceInfo.deviceType)
      })
    beforeEach(async (done: Function) => {
      console.info("muneRadiusTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menuradius",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get muneRadiusTest state pages: " + JSON.stringify(pages));
        if (!("muneRadiusTest" == pages.name)) {
          console.info("get muneRadiusTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push muneRadiusTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push muneRadiusTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0100
     * @tc.name      muneRadiusTest_0100
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('num4'));
      await btn.click();
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('aaa');
      console.info(`[muneRadiusTest_0100] component obj1 is:${JSON.stringify(strJson)}`);
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0100 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0100] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0100] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0100] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      expect(obj.$attrs.borderRadius.topLeft).assertEqual('30.00px');
      await CommonFunc.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0100] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0200
     * @tc.name      muneRadiusTest_0200
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('num5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('bbb');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0200 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0200] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0200] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0200] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      expect(obj.$attrs.borderRadius.topLeft).assertEqual('30.00fp');
      await CommonFunc.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu1'));
      await menu.click();
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0200] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0300
     * @tc.name      muneRadiusTest_0300
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('num1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ccc');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0300 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0300] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0300] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0300] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      expect(obj.$attrs.borderRadius.topLeft).assertEqual('30.00vp');
      await CommonFunc.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu2'));
      await menu.click();
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0300] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0400
     * @tc.name      muneRadiusTest_0400
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0400 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('num2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ddd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0400 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0400] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0400] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0400] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      expect(obj.$attrs.borderRadius.topLeft).assertEqual('20.00%');
      await CommonFunc.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu3'));
      await menu.click();
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0400] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0500
     * @tc.name      muneRadiusTest_0500
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0500 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('num3'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('menuAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0500 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0500] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0500] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0500] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      
      if(currentDeviceIsPC){
      
      let topLeft:string = obj.$attrs.borderRadius.topLeft
      console.info("[muneRadiusTest_0500] topLeft1: " + topLeft);
        expect(topLeft).assertEqual('8.00vp');
      }else{
        expect(obj.$attrs.borderRadius.topLeft).assertEqual('20.00vp');
      }

      await CommonFunc.sleep(1000);

      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0500] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0600
     * @tc.name      muneRadiusTest_0600
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0600 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('BorderRadiuses'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('fff');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0600 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0600] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0600] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0600] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      expect(obj.$attrs.borderRadius.topLeft).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu5'));
      await menu.click();
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0600] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0700
     * @tc.name      muneRadiusTest_0700
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0700 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('BorderRadiuses1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ggg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0700 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0700] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0700] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0700] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));
      expect(obj.$attrs.borderRadius.topLeft).assertEqual('-20.00vp');
      await CommonFunc.sleep(1000);

      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0700] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0800
     * @tc.name      muneRadiusTest_0800
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0800 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('undefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('aundefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0800 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0800] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0800] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0800] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));

      if(currentDeviceIsPC){
      
      let topLeft:string = obj.$attrs.borderRadius.topLeft
      console.info("[muneRadiusTest_0500] topLeft1: " + topLeft);
        expect(topLeft).assertEqual('8.00vp');
      }else{
        expect(obj.$attrs.borderRadius.topLeft).assertEqual('20.00vp');
      }
      await CommonFunc.sleep(1000);

      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0800] END');
      done();
    });

    /**
     * @tc.number    muneRadiusTest_0900
     * @tc.name      muneRadiusTest_0900
     * @tc.desc      set muneRadiusTest: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('muneRadiusTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('muneRadiusTest_0900 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('null'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('anull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("muneRadiusTest_0900 obj is: " + JSON.stringify(obj));
      console.info("[muneRadiusTest_0900] obj: " + JSON.stringify(obj.$attrs));
      console.info("[muneRadiusTest_0900] divider: " + JSON.stringify(obj.$attrs.borderRadius));
      console.info("[muneRadiusTest_0900] topLeft: " + JSON.stringify(obj.$attrs.borderRadius.topLeft));

      if(currentDeviceIsPC){
      
      let topLeft:string = obj.$attrs.borderRadius.topLeft
      console.info("[muneRadiusTest_0500] topLeft1: " + topLeft);
        expect(topLeft).assertEqual('8.00vp');
      }else{
        expect(obj.$attrs.borderRadius.topLeft).assertEqual('20.00vp');
      }
      
      await CommonFunc.sleep(1000);

      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await CommonFunc.sleep(1000);
      
      console.info('[muneRadiusTest_0900] END');
      done();
    });


  })
}