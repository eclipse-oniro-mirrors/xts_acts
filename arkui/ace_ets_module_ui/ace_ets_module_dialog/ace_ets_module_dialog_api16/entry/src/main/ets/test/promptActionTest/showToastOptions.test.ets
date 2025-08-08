/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from '@ohos/hypium'
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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
import deviceInfo from "@ohos.deviceInfo"

export default function showToastOptions() {
  describe('showToastOptions', () => {
    let currentDeviceIsPC = false
    beforeAll(() => {
      console.info("popupKeyboardAvoidMode beforeAll start")
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsPC = deviceTypeInfo === "2in1" ? true : false
      console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
      console.info("the value of the deviceType is " + deviceInfo.deviceType)
    })
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showToastOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get showToastOptions state success ' + JSON.stringify(pages));
        if (!('showToastOptions' == pages.name)) {
          console.info('get showToastOptions state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push showToastOptions page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push showToastOptions page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_0100
     * @tc.name showToastOptions_0100
     * @tc.desc To test showToastOptions  shadow：ShadowStyle.OUTER_DEFAULT_MD
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      
      console.info('showToastOptions_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('md'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      
      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Toast Massage'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1]?.$attrs
        console.info('[showToastOptions_0100] column'+ JSON.stringify(column))
        let shadow:string = column.shadow
        console.info('[showToastOptions_0100] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_0200
     * @tc.name showToastOptions_0200
     * @tc.desc To test  showToastOptions
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('shadowOption'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

       if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs

        let radius:string = column.shadow?.radius
        let type:string = column.shadow?.type
        let color:string = column.shadow?.color
        let offsetX:string = column.shadow?.offsetX
        let offsetY:string = column.shadow?.offsetY
        let fill:string = column.shadow?.fill

        expect(radius).assertEqual('10.000000')
        expect(type).assertEqual('1')
        expect(color).assertEqual('#FF94A0F0')
        expect(offsetX).assertEqual('2.000000')
        expect(offsetY).assertEqual('3.000000')
        expect(fill).assertEqual('1')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0200 END');
      done();
    });
    
    /**
     * @tc.number SUB_ACE_showToastOptions_0300
     * @tc.name showToastOptions_0300
     * @tc.desc To test  showToastOptions undefined
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('xs'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_0400
     * @tc.name showToastOptions_0400
     * @tc.desc To test  showToastOptions shadow: ShadowStyle.OUTER_DEFAULT_SM
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('sm'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);


      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
        console.info('[showToastOptions_0400] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0400 END');
      done();
    });

    
    /**
     * @tc.number SUB_ACE_showToastOptions_0500
     * @tc.name showToastOptions_0500
     * @tc.desc To test  showToastOptions shadow: ShadowStyle.OUTER_FLOATING_LG
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('lg'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
      
        console.info('[showToastOptions_0500] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG')
     
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_0600
     * @tc.name showToastOptions_0600
     * @tc.desc To test  showToastOptions shadow: ShadowStyle.OUTER_FLOATING_SM
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('fsm'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);


      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
        console.info('[showToastOptions_0600] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM')
      }

      
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0600 END');
      done();
    });


     /**
     * @tc.number SUB_ACE_showToastOptions_0700
     * @tc.name showToastOptions_0700
     * @tc.desc To test  showToastOptions backgroundBlurStyle
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('fmd'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
      
        console.info('[showToastOptions_0700] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD')
      }

     

      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_0800
     * @tc.name showToastOptions_0800
     * @tc.desc To test  showToastOptions shadow: null
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nul'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

       if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
        console.info('[showToastOptions_0800] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD')
      }
      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_showToastOptions_0900
     * @tc.name showToastOptions_0900
     * @tc.desc To test  showToastOptions shadow: null
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('showToastOptions_0900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showToastOptions_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('unf'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      if(currentDeviceIsPC){
        let button1 = await driver.findComponent(ON.text('Message Info'));
        expect(button1 != null).assertTrue()
      }else{
        let column: ESObject = obj.$children[1].$attrs
        let shadow:string = column.shadow
        console.info('[showToastOptions_0900] shadow'+ shadow)
        expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD')
      }

      await CommonFunc.sleep(1000);
      console.info('showToastOptions_0900 END');
      done();
    });
  })
}