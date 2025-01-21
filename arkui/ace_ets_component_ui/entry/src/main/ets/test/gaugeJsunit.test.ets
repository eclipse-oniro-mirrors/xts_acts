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

export default function gaugeJsunit() {
  describe('gaugeJsunit', function () {
    beforeEach(async function (done) {
      console.info("gaugeJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/guage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gaugeJsunit state pages:" + JSON.stringify(pages));
        if (!("guage" == pages.name)) {
          console.info("get gaugeJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push gaugeJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push gaugeJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('gaugeJsunit_0100', 0, async function (done) {
       console.info('gaugeJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the gauge component and test attribute
       let strJson = getInspectorByKey('guage');
       let obj = JSON.parse(strJson);
       console.info('gaugeJsunit_0100 component obj is:' + JSON.stringify(obj));
       console.info('gaugeJsunit_0100 component obj startAngle is:' + obj.$attrs.startAngle);
       console.info('gaugeJsunit_0100 component obj startAngle is:' + obj.$attrs.endAngle);
       console.info('gaugeJsunit_0100 component obj startAngle is:' + obj.$attrs.strokeWidth);
       console.info('gaugeJsunit_0100 component obj startAngle is:' + obj.$attrs.colors);
       expect(obj.$attrs.startAngle).assertEqual('0.00');
       expect(obj.$attrs.endAngle).assertEqual('0.00');
       expect(obj.$attrs.strokeWidth).assertEqual('0.00vp');
       expect(obj.$attrs.value).assertEqual('30.00');
       expect(obj.$attrs.min).assertEqual('0.00');
       expect(obj.$attrs.max).assertEqual('100.00');
       let colors = obj.$attrs.colors;
       console.info('gaugeJsunit_0100 component obj is: ' + colors);
       expect(colors).assertEqual('[["#FF317AF7",0.10000000149011612],["#FF5BA854",0.20000000298023224],["#FFE08C3A",0.300000011920929],["#FF9C554B",0.40000000596046448]]');
       done();
    });

   it('gaugeJsunit_0200', 0, async function (done) {
      console.info('gaugeJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of guage dynamically
      globalThis.value.message.notify({name:'startAngle',value:20})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'strokeWidth',value:30})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'endAngle',value:270})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'colors',value:[[0x317AF6, 0.3], [0x5BA854, 0.3], [0xE08C3A, 0.4], [0x9A554B, 0.4]]})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('guage');
      let obj = JSON.parse(strJson);
      console.info('gaugeJsunit_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.startAngle).assertEqual('20.00');
      expect(obj.$attrs.endAngle).assertEqual('270.00');
      expect(obj.$attrs.strokeWidth).assertEqual('30.00vp');
      let colors = obj.$attrs.colors;
      console.info('gaugeJsunit_0200 component obj is: ' + colors);
      expect(colors).assertEqual('[["#FF317AF6",0.300000011920929],["#FF5BA854",0.300000011920929],["#FFE08C3A",0.40000000596046448],["#FF9A554B",0.40000000596046448]]');
      done();
    });

  it('gaugeJsunit_0300', 0, async function (done) {
      console.info('gaugeJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the parameter value of guage dynamically
      globalThis.value.message.notify({name:'value',value:'40'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'min',value:'20'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'max',value:'90'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('guage');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.value).assertEqual('0.00');
      expect(obj.$attrs.min).assertEqual('0.00');
      expect(obj.$attrs.max).assertEqual('100.00');
      done();   
    });

  
    it('gaugeJsunit_0400', 0, async function (done) {
      console.info('gaugeJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of divider dynamically
      globalThis.value.message.notify({name:'startAngle',value:-30})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'strokeWidth',value:'-30'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'endAngle',value:450})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'colors',value:'[[0x317AF6, 2], [0x5BA, 0.3], [0xE08C3A, 0.4], [0x9A554B, 0.4]]'})
      await CommonFunc.sleep(2000);
       // check the value of changed attribute
      let strJson = getInspectorByKey('guage');
      let obj = JSON.parse(strJson);
      console.info('gaugeJsunit_0400 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.startAngle).assertEqual('-30.00');
      expect(obj.$attrs.endAngle).assertEqual('450.00');
      expect(obj.$attrs.strokeWidth).assertEqual('-30.00vp');
      let colors = obj.$attrs.colors;
      console.info('gaugeJsunit_0400 component obj is: ' + colors);
      expect(colors).assertEqual('[["#FF317AF6",0.300000011920929],["#FF5BA854",0.300000011920929],["#FFE08C3A",0.40000000596046448],["#FF9A554B",0.40000000596046448]]');
      done();
   });
     
   it('gaugeJsunit_0500', 0, async function (done) {
      console.info('gaugeJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the illegal parameter 
      globalThis.value.message.notify({name:'value',value:'-40'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'min',value:'-6'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'max',value:'-7'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('guage');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.value).assertEqual('0.00');
      expect(obj.$attrs.min).assertEqual('0.00');
      expect(obj.$attrs.max).assertEqual('100.00');
      done();   
    });

    it('gaugeJsunit_0600', 0, async function (done) {
      console.info('gaugeJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // test the support common attribute
      globalThis.value.message.notify({name:'wth',value:'20'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('guage');
      let obj = JSON.parse(strJson);
      console.info('gaugeJsunit_0600 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual('20.00vp')
      done();  
    });

    it('gaugeJsunit_0700', 0, async function (done) {
      console.info('gaugeJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // test the support common attribute
      globalThis.value.message.notify({name:'wth',value:'-60'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('guage');
      let obj = JSON.parse(strJson);
      console.info('gaugeJsunit_0700 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual('0.00vp')
      done();  
    }); 
    
  })
}