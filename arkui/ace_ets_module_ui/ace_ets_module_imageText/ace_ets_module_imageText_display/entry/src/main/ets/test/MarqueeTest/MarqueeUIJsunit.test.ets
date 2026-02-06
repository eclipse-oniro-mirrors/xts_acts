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

export default function MarqueeUIJsunit() {
  describe('MarqueeUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("MarqueeUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Marquee/MarqueeUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarqueeUIJsunit state pages:" + JSON.stringify(pages));
        if (!("MarqueeUI" == pages.name)) {
          console.info("get MarqueeUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push MarqueeUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push MarqueeUIJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   marqueeUIJsunit_0100
     * @tc.number marqueeUIJsunit_0100
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('marqueeUIJsunit_0100', Level.LEVEL1, async (done: Function) => {
       console.info('marqueeUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the marquee component and test attribute
       let strJson = getInspectorByKey('marqueeUI');
       console.info('marqueeUIJsunit_0100 hhe');
       let obj: ESObject = JSON.parse(strJson);
       // to confirm allowScale
       console.info('marqueeUIJsunit_0100 component obj is: ' + obj.$attrs.allowScale);
       expect(obj.$attrs.start).assertEqual('false');
       
       expect(Math.abs(obj.$attrs.step - vp2px(50)) <= 1).assertTrue();
       expect(obj.$attrs.loop).assertEqual('2');
       expect(obj.$attrs.fromStart).assertEqual('true');
       expect(obj.$attrs.src).assertEqual('Running Marquee starts rolling');
       done();
    });


   /**
    * @tc.name   marqueeUIJsunit_0200
    * @tc.number marqueeUIJsunit_0200
    * @tc.desc   marqueeUIJsunit_0200
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('marqueeUIJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0200 START');
      // modify the type attribute normal value of marquee dynamically
      globalThis.value.message.notify({name:'fromStart',value:true})
      await CommonFunc.sleep(200);
      // check the value of changed parameter
      let strJson = getInspectorByKey('marqueeUI');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fromStart).assertEqual('true');
      done();
    });

    /**
     * @tc.name   marqueeUIJsunit_0300
     * @tc.number marqueeUIJsunit_0300
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('marqueeUIJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0400 START');
      await CommonFunc.sleep(1000);
      //  test event 
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('start'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      await driver.delayMs(5000);
      // check the test event
      let ttx = await driver.findComponent(ON.id('text1'));
      let txt = await ttx.getText();
      console.info("[marqueeUIJsunit_0300'] component obj is: " + txt);
      expect(txt == 'onStart').assertTrue();
      let ttxx = await driver.findComponent(ON.id('text2'));
      let txtt = await ttxx.getText();
      console.info("[marqueeUIJsunit_0300'] component obj2 is: " + txtt);
      expect(txtt == 'onBounce').assertTrue();
      await driver.delayMs(1000);
      let ttxxx = await driver.findComponent(ON.id('text3'));
      let txttt = await ttxxx.getText();
      console.info("[marqueeUIJsunit_0300'] component obj3 is: " + txttt);
      expect(txttt == 'onFinish').assertTrue();
      done();   
    });

    /**
     * @tc.name   marqueeUIJsunit_0400
     * @tc.number marqueeUIJsunit_0400
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('marqueeUIJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0300 START');
      await CommonFunc.sleep(100);
      // modify the values partly attribute illegal value of marguee dynamically
      globalThis.value.message.notify({name:'loop',value:-30})
      await CommonFunc.sleep(1000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('marqueeUI');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.loop).assertEqual('-1');
      done();
   });


    /**
     * @tc.name   marqueeUIJsunit_0500
     * @tc.number marqueeUIJsunit_0500
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('marqueeUIJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0400 START');
      // modify the type attribute normal value of marquee dynamically
      globalThis.value.message.notify({name:'step',value:50})
      await CommonFunc.sleep(200);
      // check the value of changed parameter
      let strJson = getInspectorByKey('marqueeUI');
      let obj: ESObject = JSON.parse(strJson);
      
      expect(Math.abs(obj.$attrs.step - vp2px(50)) <= 1).assertTrue();
    
      done();   
    });    


   /**
    * @tc.name   marqueeUIJsunit_0600
    * @tc.number marqueeUIJsunit_0600
    * @tc.desc   Return specified page by index value
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('marqueeUIJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0600 START');
      // modify the values partly attribute illegal value of marguee dynamically
      globalThis.value.message.notify({name:'step',value:-30})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('marqueeUI');
      let obj: ESObject = JSON.parse(strJson);
      expect(Math.abs(obj.$attrs.step - vp2px(6)) <= 1).assertTrue();
      done();
   });
   /**
    * @tc.name   marqueeUIJsunit_0700
    * @tc.number marqueeUIJsunit_0700
    * @tc.desc   Return specified page by index value
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('marqueeUIJsunit_0700', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0700 START');
      // modify the type attribute normal value of marquee dynamically
      globalThis.value.message.notify({name:'loop',value:2})
      await CommonFunc.sleep(100);
      let strJson = getInspectorByKey('marqueeUI');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.loop).assertEqual('2');
      done();   
    });
    /**
     * @tc.name   marqueeUIJsunit_0800
     * @tc.number marqueeUIJsunit_0800
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('marqueeUIJsunit_0800', Level.LEVEL1, async (done: Function) => {
      console.info('marqueeUIJsunit_0800 START');
      // modify the type attribute normal value of marquee dynamically
      globalThis.value.message.notify({name:'src',value:'Running Marquee starts rolling'})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('marqueeUI');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.src).assertEqual('Running Marquee starts rolling');
      done();   
    });
  })
}