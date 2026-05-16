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

export default function buttonJsunit() {
  describe('buttonJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/buttonExample',
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

    /**
     * @tc.name   buttonJsunit_0100
     * @tc.number buttonJsunit_0100
     * @tc.desc   buttonJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('buttonJsunitUITest_0100 START');
      await CommonFunc.sleep(1000);
      // 获取button组件的信息
      let strJson = getInspectorByKey('btok');
      let obj: ESObject = JSON.parse(strJson);
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

    /**
     * @tc.name   buttonJsunit_0200
     * @tc.number buttonJsunit_0200
     * @tc.desc   buttonJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('buttonJsunitUITest_0200 START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'stateEffect', value:false});
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey('btok');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[buttonJsunit_0200'] component2 obj is: " + obj2.$attrs.stateEffect);
      expect(obj2.$attrs.stateEffect).assertEqual('false');
      done();
    });

    /**
     * @tc.name   buttonJsunit_0300
     * @tc.number buttonJsunit_0300
     * @tc.desc   buttonJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0300', Level.LEVEL1, async (done: Function) => {
       console.info('buttonJsunitUITest_0300 START');
       await CommonFunc.sleep(1000);
       // 动态修改Button组件的属性,设置为非法值
       globalThis.value.message.notify({name:'bttype', value:'5'});
       await CommonFunc.sleep(500);
       let strJson = getInspectorByKey('btok');
       let obj: ESObject = JSON.parse(strJson);
       console.info("[buttonJsunit_0300'] component obj is: " + obj.$attrs.type);
       expect(obj.$attrs.type).assertEqual('ButtonType.ROUNDED_RECTANGLE');
       done();
    });

    /**
     * @tc.name   buttonJsunit_0400
     * @tc.number buttonJsunit_0400
     * @tc.desc   buttonJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0400', Level.LEVEL1, async (done: Function) => {
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

     /**
      * @tc.name   buttonJsunit_0500
      * @tc.number buttonJsunit_0500
      * @tc.desc   buttonJsunit_0500
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('buttonJsunit_0500', Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   buttonJsunit_0600
     * @tc.number buttonJsunit_0600
     * @tc.desc   buttonJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0600', Level.LEVEL1, async (done: Function) => {
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
       let obj: ESObject = JSON.parse(strJson);
       console.info("[buttonJsunit_0600'] component obj is: " + obj);
       expect(obj.$attrs.fontSize).assertEqual('13.00fp');
       expect(obj.$attrs.fontColor).assertEqual('#FF008000');
       expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
       expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
       expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
       done();
    });

    /**
     * @tc.name   buttonJsunit_0700
     * @tc.number buttonJsunit_0700
     * @tc.desc   buttonJsunit_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0700', Level.LEVEL1, async (done: Function) => {
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
       let obj: ESObject = JSON.parse(strJson);
       console.info("[buttonJsunit_0700'] component obj is: " + obj.$attrs.fontSize + obj.$attrs.fontColor + obj.$attrs.fontFamily + obj.$attrs.fontStyle + obj.$attrs.fontWeight);
       let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_size_body1').id)
	     console.info("[TextInputPageJsunit_0200] size: " +px2fp(resourceSize));
       expect(obj.$attrs.fontSize).assertContain('fp')
       expect(obj.$attrs.fontColor).assertContain('#')
       expect(obj.$attrs.fontFamily).assertEqual('233');
       expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
       expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
       done();
    });

    /**
     * @tc.name   buttonJsunit_0800
     * @tc.number buttonJsunit_0800
     * @tc.desc   buttonJsunit_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonJsunit_0800', Level.LEVEL1, async (done: Function) => {
      console.info('buttonJsunitUITest_0800 START');
      await CommonFunc.sleep(1000);
      // 动态修改Button组件的属性
      globalThis.value.message.notify({name:'bttype',value:ButtonType.Capsule});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('btok');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonJsunit_0800'] component obj is: " + obj.$attrs.type);
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      done();
    });  

  })
}