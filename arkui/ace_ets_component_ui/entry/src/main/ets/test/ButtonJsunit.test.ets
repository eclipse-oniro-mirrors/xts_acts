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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function buttonJsunit() {
  describe('buttonJsunit', function () {
    beforeEach(async function (done) {
      console.info("buttonJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/buttonExample',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonJsunit state pages:" + JSON.stringify(pages));
        if (!("buttonExample" == pages.name)) {
          console.info("get buttonJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push buttonJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push buttonJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('buttonJsunit_0100', 0, async function (done) {
      console.info('buttonJsunitUITest_0100 START');
      await CommonFunc.sleep(1000);
      // 获取button组件的信息
      let strJson = getInspectorByKey('btok');
      let obj = JSON.parse(strJson);
      console.info("[buttonJsunit_0100'] component obj is: " + obj);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal');
      expect(obj.$attrs.stateEffect).assertEqual('true');
      expect(obj.$attrs.fontSize).assertEqual('12.00fp');
      expect(obj.$attrs.fontColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.fontFamily).assertEqual('123');
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      done();
    });

    it('buttonJsunit_0200', 0, async function (done) {
      console.info('buttonJsunitUITest_0200 START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'stateEffect', value:false});
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey('btok');
      let obj2 = JSON.parse(strJson2);
      console.info("[buttonJsunit_0200'] component2 obj is: " + obj2.$attrs.stateEffect);
      expect(obj2.$attrs.stateEffect).assertEqual('false');
      done();
    });

    it('buttonJsunit_0300', 0, async function (done) {
       console.info('buttonJsunitUITest_0300 START');
       await CommonFunc.sleep(1000);
       // 动态修改Button组件的属性,设置为非法值
       globalThis.value.message.notify({name:'bttype', value:'5'});
       await CommonFunc.sleep(500);
       let strJson = getInspectorByKey('btok');
       let obj = JSON.parse(strJson);
       console.info("[buttonJsunit_0300'] component obj is: " + obj.$attrs.type);
       expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
       done();
    });

    it('buttonJsunit_0400', 0, async function (done) {
       console.info('buttonJsunitUITest_0400 START');
       // check the button is click
       let driver = Driver.create();
       await driver.delayMs(waitUiReadyMs);
       let btn = await driver.findComponent(ON.id('btdisable'));
       await driver.delayMs(waitUiReadyMs);
       let isClick = await btn.isClickable();
       expect(isClick).assertFalse();
       done();
    });

     it('buttonJsunit_0500', 0, async function (done) {
       console.info('buttonJsunitUITest_0500 START');
       // 判断按钮的点击事件,通过按钮的文本可以判断
       let driver = Driver.create();
       await driver.delayMs(waitUiReadyMs);
       let btn = await driver.findComponent(ON.id('btdisable1'));
       await driver.delayMs(waitUiReadyMs);
       await btn.click();
       await driver.delayMs(2000);
       let tt = await btn.getText();
       console.info("[buttonJsunit_0500'] component obj is: " + tt);
       expect(tt == 'click').assertTrue();
       done();
    });

    it('buttonJsunit_0600', 0, async function (done) {
      // buton 通用字体属性判断
       console.info('buttonJsunitUITest_0600 START');
       await CommonFunc.sleep(1000);
       globalThis.value.message.notify({name:'fontSize',value:'13'});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontColor',value:Color.Green});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontFamily',value:'HarmonyOS Sans'});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontStyle',value:'FontStyle.Normal'});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontWeight',value:FontWeight.Bold});
       await CommonFunc.sleep(200);
       let strJson = getInspectorByKey('btok');
       let obj = JSON.parse(strJson);
       console.info("[buttonJsunit_0600'] component obj is: " + obj);
       expect(obj.$attrs.fontSize).assertEqual('13.00fp');
       expect(obj.$attrs.fontColor).assertEqual('#FF008000');
       expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
       expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
       expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
       done();
    });

    it('buttonJsunit_0700', 0, async function (done) {
      // buton 通用字体非法属性判断
       console.info('buttonJsunitUITest_0700 START');
       await CommonFunc.sleep(1000);
       globalThis.value.message.notify({name:'fontSize',value:'-200'});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontColor',value:"#ff"});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontFamily',value:'233'});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontStyle',value:'4444'});
       await CommonFunc.sleep(200);
       globalThis.value.message.notify({name:'fontWeight',value:'-20'});
       await CommonFunc.sleep(200);
       let strJson = getInspectorByKey('btok');
       let obj = JSON.parse(strJson);
       console.info("[buttonJsunit_0700'] component obj is: " + obj.$attrs.fontSize + obj.$attrs.fontColor + obj.$attrs.fontFamily + obj.$attrs.fontStyle + obj.$attrs.fontWeight);
       expect(obj.$attrs.fontSize).assertEqual('16.00fp');
       expect(obj.$attrs.fontColor).assertEqual('#FFFFFFFF');
       expect(obj.$attrs.fontFamily).assertEqual('233');
       expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
       expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
       done();
    });

    it('buttonJsunit_0800', 0, async function (done) {
      console.info('buttonJsunitUITest_0800 START');
      await CommonFunc.sleep(1000);
      // 动态修改Button组件的属性
      globalThis.value.message.notify({name:'bttype',value:ButtonType.Capsule});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('btok');
      let obj = JSON.parse(strJson);
      console.info("[buttonJsunit_0800'] component obj is: " + obj.$attrs.type);
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      done();
    });  

  })
}