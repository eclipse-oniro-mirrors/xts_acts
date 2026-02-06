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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
const waitUiReadyMs = 1000;

export default function checkBoxJsunit() {
  describe('CheckBoxJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("checkBoxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkBox/checkBoxExample',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBoxJsunit state pages:" + JSON.stringify(pages));
        if (!("checkBoxExample" == pages.name)) {
          console.info("get checkBoxJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push checkBoxJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push checkBoxJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   checkBoxJsunit_0100
     * @tc.number checkBoxJsunit_0100
     * @tc.desc   checkBoxJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkBoxJsunit_0100', Level.LEVEL1, async (done: Function) => {
       console.info('checkBoxJsunit_0100 START');
       await CommonFunc.sleep(3000);
       // get the checkbox component and test attribute
       let strJson = getInspectorByKey('chek1');
       let obj: ESObject = JSON.parse(strJson);
       console.info("[checkBoxJsunit_0100'] component obj is: " + JSON.stringify(obj.$attrs.select));
       expect(obj.$attrs.selectedColor).assertEqual('#FFED6F21');
       let driver = Driver.create();
       await driver.delayMs(waitUiReadyMs);
       let checkBox = await driver.findComponent(ON.id('chek1'));
       let isChecked = await checkBox.isChecked();
       // to confirm
       console.info("[checkBoxJsunit_0100'] component obj isChecked: " + isChecked);
       expect(isChecked).assertTrue();
       done(); 
    });

   /**
    * @tc.name   checkBoxJsunit_0200
    * @tc.number checkBoxJsunit_0200
    * @tc.desc   checkBoxJsunit_0200
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('checkBoxJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('checkBoxJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the attribute normal value of checkbox dynamically
      globalThis.value.message.notify({name:'select',value:false})
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkBox = await driver.findComponent(ON.id('chek1'));
      let isChecked = await checkBox.isChecked();
      expect(isChecked).assertFalse();
      globalThis.value.message.notify({name:'selectedColor',value:'#ecaaff'})
      await CommonFunc.sleep(4000);
      // check the value of changed attribute
      let strJson2 = getInspectorByKey('chek1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[blankJsunit_0200'] component obj2 is: " + JSON.stringify(obj2.$attrs.selectedColor));
      expect(obj2.$attrs.selectedColor).assertEqual('#FFECAAFF');
      done();
    });

    /**
     * @tc.name   checkBoxJsunit_0300
     * @tc.number checkBoxJsunit_0300
     * @tc.desc   checkBoxJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkBoxJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('checkBoxJsunit_0300 START');
      await CommonFunc.sleep(2000);
      // modify the attribute illegal value of checkbox dynamically
      globalThis.value.message.notify({name:'selectedColor',value:'#ecaf'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('chek1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0300'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#EECCAAFF');
      done();
    });

    /**
     * @tc.name   checkBoxJsunit_0400
     * @tc.number checkBoxJsunit_0400
     * @tc.desc   checkBoxJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkBoxJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('checkBoxJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the clicking event of checkbox
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkbox1 = await driver.findComponent(ON.id('chek1'));
      expect(checkbox1 != null).assertTrue();
      await checkbox1.click();
      await driver.delayMs(waitUiReadyMs);
      // check the click event by selectedColor
      let strJson = getInspectorByKey('chek1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0400'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#FFFFFF21');
      done();
    });
    
    /**
     * @tc.name   checkBoxJsunit_0500
     * @tc.number checkBoxJsunit_0500
     * @tc.desc   checkBoxJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkBoxJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('checkBoxJsunit_0300 START');
      await CommonFunc.sleep(2000);
      // verify the enum color
      globalThis.value.message.notify({name:'selectedColor',value:Color.Green})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('chek1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0500'] component obj is: " + JSON.stringify(obj.$attrs.selectedColor));
      expect(obj.$attrs.selectedColor).assertEqual('#FF008000');
      done();
    });

    /**
     * @tc.name   checkBoxJsunit_0600
     * @tc.number checkBoxJsunit_0600
     * @tc.desc   checkBoxJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkBoxJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('checkBoxJsunit_0600 START');
      await CommonFunc.sleep(2000);
      // verify the enum color of rgb
      globalThis.value.message.notify({name:'selectedColor',value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('chek1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0600'] component obj is: " + JSON.stringify(obj.$attrs.selectedColor));
      expect(obj.$attrs.selectedColor).assertEqual('#FFEE82EE');
      done();
    });

    /**
     * @tc.name   checkBoxJsunit_0700
     * @tc.number checkBoxJsunit_0700
     * @tc.desc   checkBoxJsunit_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkBoxJsunit_0700', Level.LEVEL1, async (done: Function) => {
      console.info('checkBoxJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // more click
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkbox1 = await driver.findComponent(ON.id('chek1'));
      expect(checkbox1 != null).assertTrue();
      await checkbox1.click();
      await driver.delayMs(waitUiReadyMs);
      await checkbox1.click();
      await driver.delayMs(waitUiReadyMs);
      await checkbox1.click();
      await driver.delayMs(waitUiReadyMs);
      // check the click event by selectedColor
      let strJson = getInspectorByKey('chek1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0700'] component obj is: " + JSON.stringify(obj.$attrs.selectedColor));
      expect(obj.$attrs.selectedColor).assertEqual('#FFFFFF21');
      done();
    });

    
  })
}