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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
const waitUiReadyMs = 1000;

export default function checkBoxGroupUIJsunit() {
  describe('checkBoxGroupUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("checkBoxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkBox/checkBoxGroupUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBoxGroupUIJsunit pages:" + JSON.stringify(pages));
        if (!("checkBoxGroupUI" == pages.name)) {
          console.info("get checkBoxGroupUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push checkBoxGroupUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push checkBoxGroupUI page error:" + err);
	        expect().assertFail();
      }
      done();
    });
  

    it('checkBoxGroupUIJsunit_0100', 0, async (done: Function) => {
       console.info('checkBoxGroupUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the checkboxGroup component and test attribute
       let strJson = getInspectorByKey('allck');
       console.info("checkBoxGroupUIJsunit_0100 strJson:" + strJson);
       let obj: ESObject = JSON.parse(strJson);
       console.info("checkBoxGroupUIJsunit_0100 component obj is: " + JSON.stringify(obj.$attrs.selectedColor));
       expect(obj.$attrs.selectedColor).assertEqual('#FF007DFF');
       // add assert single checkbox selectedColor
       let strJson2 = getInspectorByKey('cb1');
       console.info("checkBoxGroupUIJsunit_cb1_0100 strJson:" + strJson2);
       let obj2: ESObject = JSON.parse(strJson2);
       console.info("checkBoxGroupUIJsunit_cb1_0100 component obj2 is: " + JSON.stringify(obj2.$attrs.selectedColor));
       expect(obj2.$attrs.selectedColor).assertEqual('#FF007DEF');
       done();
    });

   it('checkBoxGroupUIJsunit_0200', 0, async (done: Function) => {
      console.info('checkBoxGroupUIJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the attribute normal value of checkbox dynamically
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectedColor',value:'#EEAAFF'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('allck');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkBoxGroupUIJsunit_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#FFEEAAFF');
      // add assert single checkbox selectedColor
      let strJson2 = getInspectorByKey('cb1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("checkBoxGroupUIJsunit_cb1_0200 component obj2 is: " + JSON.stringify(obj2.$attrs.selectedColor));
      expect(obj2.$attrs.selectedColor).assertEqual('#FF007DEF');
      done();
    });

    it('checkBoxGroupUIJsunit_0300', 0, async (done: Function) => {
      console.info('checkBoxGroupUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the attribute illegal value of checkbox dynamically
      globalThis.value.message.notify({name:'selectedColor',value:'#eaf'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('allck');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkBoxGroupUIJsunit_0300 '] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#FFEEAAFF');
      done();
    });

    it('checkBoxGroupUIJsunit_0400', 0, async (done: Function) => {
      console.info('checkBoxGroupUIJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // modify the selectedColor 
      globalThis.value.message.notify({name:'selectedColor',value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('allck');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkBoxGroupUIJsunit_0400 '] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#FFEE82EE');
      done();
    });

     it('checkBoxGroupUIJsunit_0500', 0, async (done: Function) => {
      console.info('checkBoxGroupUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // modify the selectedColor 
      globalThis.value.message.notify({name:'selectedColor',value:Color.Green})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('allck');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkBoxGroupUIJsunit_0500 '] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#FF008000');
      done();
    });

    it('checkBoxGroupUIJsunit_0600', 0, async (done: Function) => {
      console.info('checkBoxGroupUIJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // test the clicking event of checkboxGroup
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkGoup = await driver.findComponent(ON.id('allck'));
      await checkGoup.click();
      await driver.delayMs(waitUiReadyMs);
      await checkGoup.click();
      await driver.delayMs(waitUiReadyMs);
      // check the isSelect and name
      let ttx = await driver.findComponent(ON.id('text1'));
      let txt = await ttx.getText();
      console.info("[checkBoxGroupUIJsunit_0600'] component obj is: " + txt);
      expect(txt).assertEqual('["checkbox1","checkbox2","checkbox3"]');
      let ttxx = await driver.findComponent(ON.id('text2'));
      let txtt = await ttxx.getText();
      console.info("[checkBoxGroupUIJsunit_0600'] component obj2 is: " + txtt);
      expect(txtt).assertEqual('0');
      await checkGoup.click();
      await driver.delayMs(waitUiReadyMs);
      done();   
    });

    it('checkBoxGroupUIJsunit_0700', 0, async (done: Function) => {
      console.info('checkBoxGroupUIJsunit_0700 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkGoup = await driver.findComponent(ON.id('cb2'));
      await checkGoup.click();
      await driver.delayMs(waitUiReadyMs);
       // check the isSelect and name
      let ttx = await driver.findComponent(ON.id('text1'));
      let txt = await ttx.getText();
      console.info("[checkBoxGroupUIJsunit_0700'] component obj is: " + txt);
      expect(txt).assertEqual('["checkbox2"]');
      let ttxx = await driver.findComponent(ON.id('text2'));
      let txtt = await ttxx.getText();
      console.info("[checkBoxGroupUIJsunit_0700'] component obj2 is: " + txtt);
      expect(txtt).assertEqual('1');
      done();   
    });
    
  })
}