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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import deviceInfo from "@ohos.deviceInfo"

export default function bindSheetRadius() {
  describe('bindSheetRadius', () => {
  let currentDeviceIsPC = false
      beforeAll(() => {
          console.info("popupKeyboardAvoidMode beforeAll start")
          let deviceTypeInfo = deviceInfo.deviceType
          currentDeviceIsPC = deviceTypeInfo === "2in1" ? true : false
          console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
          console.info("the value of the deviceType is " + deviceInfo.deviceType)
      })
    beforeEach(async (done: Function) => {
      console.info("bindSheetRadius beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/bindSheetRadius",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindSheetRadius state pages: " + JSON.stringify(pages));
        if (!("bindSheetRadius" == pages.name)) {
          console.info("get bindSheetRadius state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push bindSheetRadius success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSheetRadius page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    bindSheetRadius_0100
     * @tc.name      bindSheetRadius_0100
     * @tc.desc      set bindSheetRadius: 20px
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0100', 1, async (done: Function) => {
      console.info('bindSheetRadius_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0100] bindSheet click');
      await CommonFunc.sleep(1000);

      
      let btn1: Component = await driver.findComponent(ON.id('radiusPX'));
      await btn1.click();
      console.info('[bindSheetRadius_0100] radiusPX click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0100] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0100] obj2.$children[1].$children[0] radiusPX is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0100] obj2.$children[1].$children[0] radiusPX is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.borderRadius));
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight
      expect(topLeft).assertEqual('20.00px');
      expect(topRight).assertEqual('20.00px');
      
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0100] END');
      done();
    });

    /**
     * @tc.number    bindSheetRadius_0200
     * @tc.name      bindSheetRadius_0200
     * @tc.desc      set bindSheetRadius: 20vp
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0200', 1, async (done: Function) => {
      console.info('bindSheetRadius_0200 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0200] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('radiusVP'));
      await btn1.click();
      console.info('[bindSheetRadius_0200] radiusVP click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0200] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0200] obj2.$children[1].$children[0] radiusVP is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0200] obj2.$children[1].$children[0] radiusVP is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs.$attrs?.borderRadius));
      
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight
      expect(topLeft).assertEqual('20.00vp');
      expect(topRight).assertEqual('20.00vp');
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0200] END');
      done();
    });

    /**
     * @tc.number    bindSheetRadius_0300
     * @tc.name      bindSheetRadius_0300
     * @tc.desc      set bindSheetRadius: 20fp
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0300', 1, async (done: Function) => {
      console.info('bindSheetRadius_0300 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0300] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('radiusFP'));
      await btn1.click();
      console.info('[bindSheetRadius_0300] radiusFP click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0300] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0300] obj2.$children[1].$children[0] radiusFP is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0300] obj2.$children[1].$children[0] radiusFP is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs.$attrs?.borderRadius));
      
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight
      expect(topLeft).assertEqual('20.00fp');
      expect(topRight).assertEqual('20.00fp');
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0300] END');
      done();
    });

    /**
     * @tc.number    bindSheetRadius_0400
     * @tc.name      bindSheetRadius_0400
     * @tc.desc      set bindSheetRadius: topLeft: '10px', topRight: '20vp',
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0400', 1, async (done: Function) => {
      console.info('bindSheetRadius_0400 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0400] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('borderRadiuses'));
      await btn1.click();
      console.info('[bindSheetRadius_0400] borderRadiuses click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0400] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0400] obj2.$children[1].$children[0] borderRadiuses is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0400] obj2.$children[1].$children[0] borderRadiuses is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs.$attrs?.borderRadius));
      
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight
      expect(topLeft).assertEqual('10.00px');
      expect(topRight).assertEqual('20.00vp');
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0400] END');
      done();
    });

    /**
     * @tc.number    bindSheetRadius_0500
     * @tc.name      bindSheetRadius_0500
     * @tc.desc      set bindSheetRadius: topLeft: '100px', topRight: '0.00vp',
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0500', 1, async (done: Function) => {
      console.info('bindSheetRadius_0500 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0500] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('localizedBorderRadiuses'));
      await btn1.click();
      console.info('[bindSheetRadius_0500] localizedBorderRadiuses click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0500] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0500] obj2.$children[1].$children[0] localizedBorderRadiuses is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0500] obj2.$children[1].$children[0] localizedBorderRadiuses is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs.$attrs?.borderRadius));
      
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight
      expect(topLeft).assertEqual('100.00px');
      expect(topRight).assertEqual('0.00vp');
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0400] END');
      done();
    });

    /**
     * @tc.number    bindSheetRadius_0600
     * @tc.name      bindSheetRadius_0600
     * @tc.desc      set bindSheetRadius: undefined
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0600', 1, async (done: Function) => {
      console.info('bindSheetRadius_0600 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0600] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('undefined'));
      await btn1.click();
      console.info('[bindSheetRadius_0600] undefined click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0600] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0600] obj2.$children[1].$children[0] undefined is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0600] obj2.$children[1].$children[0] undefined is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs.$attrs?.borderRadius));
      
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight
      if(currentDeviceIsPC){
        expect(topLeft).assertEqual('16.00vp');
        expect(topRight).assertEqual('16.00vp');
      }else{
        expect(topLeft).assertEqual('32.00vp');
        expect(topRight).assertEqual('32.00vp');
      }
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0400] END');
      done();
    });
    /**
     * @tc.number    bindSheetRadius_0700
     * @tc.name      bindSheetRadius_0700
     * @tc.desc      set bindSheetRadius: null
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('bindSheetRadius_0700', 1, async (done: Function) => {
      console.info('bindSheetRadius_0700 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[bindSheetRadius_0700] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('null'));
      await btn1.click();
      console.info('[bindSheetRadius_0700] null click');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_0700] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_0700] obj2.$children[1].$children[0] null is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[bindSheetRadius_0700] obj2.$children[1].$children[0] null is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs.$attrs?.borderRadius));
      
      let topLeft: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topLeft
      let topRight: string = obj2.$children[1].$children[0].$attrs?.borderRadius.topRight

      if(currentDeviceIsPC){
        expect(topLeft).assertEqual('16.00vp');
        expect(topRight).assertEqual('16.00vp');
      }else{
        expect(topLeft).assertEqual('32.00vp');
        expect(topRight).assertEqual('32.00vp');
      }
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[bindSheetRadius_0400] END');
      done();
    });

  })
}