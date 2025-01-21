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

export default function spanUIJsunit() {
  describe('spanUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("spanUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/spanUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get spanUIJsunit state pages:" + JSON.stringify(pages));
        if (!("spanUI" == pages.name)) {
          console.info("get spanUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push spanUIJsunit success" + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push spanUIJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('spanUIJsunit_0100', 0, async (done: Function) => {
      console.info('spanUIJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the sapn component and test attribute
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0100 component obj is:' + obj.$attrs.content + "--" + obj.$attrs.textCase + "---" + obj.$attrs.letterSpacing + "--" + obj.$attrs.fontSize + "--" + obj.$attrs.decoration);
      expect(obj.$attrs.content).assertEqual('I am Underline-span');
      expect(obj.$attrs.textCase).assertEqual('TextCase.Normal');
      expect(obj.$attrs.letterSpacing).assertEqual('10.00fp');
      expect(obj.$attrs.fontSize).assertEqual('12.00fp');
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFFCCEE",' +
      '"style":"TextDecorationStyle.SOLID"}');
      console.info('spanUIJsunit_0100 END');
      done();
    });

    it('spanUIJsunit_0200', 0, async (done: Function) => {
      console.info('spanUIJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the content and textCase attribute normal value  dynamically
      globalThis.value.message.notify({name:'content',value:'I am test'})
      await CommonFunc.sleep(300);
      globalThis.value.message.notify({name:'textCase',value:TextCase.LowerCase})
      await CommonFunc.sleep(300);
      // check the value of changed attribute
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('I am test');
      expect(obj.$attrs.textCase).assertEqual('TextCase.LowerCase');
      done();
    });

    it('spanUIJsunit_0300', 0, async (done: Function) => {
      console.info('spanUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute enum textCase value of span dynamically
      globalThis.value.message.notify({name:'textCase',value:TextCase.UpperCase})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0300 component obj is: ' + obj.$attrs.textCase);
      expect(obj.$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    });
    
    it('spanUIJsunit_0400', 0, async (done: Function) => {
      console.info('spanUIJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // modify the values illegal attribute enum textCase value of span dynamically
      globalThis.value.message.notify({name:'textCase',value:5})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0400 component obj is: ' + obj.$attrs.textCase);
      expect(obj.$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    }); 

    it('spanUIJsunit_0500', 0, async (done: Function) => {
      console.info('spanUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // modify the normal values letter space and fontSize of span dynamically
      globalThis.value.message.notify({name:'fontSize',value:20})
      await CommonFunc.sleep(300);
      globalThis.value.message.notify({name:'letterSpacing',value:25})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0500 component obj is: ' + obj.$attrs.letterSpacing + "----" + obj.$attrs.fontSize);
      expect(obj.$attrs.letterSpacing).assertEqual('25.00fp');
      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      done();
    }); 

    it('spanUIJsunit_0600', 0, async (done: Function) => {
      console.info('spanUIJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      globalThis.value.message.notify({name:'type',value:TextDecorationType.None})
      await CommonFunc.sleep(300);
      globalThis.value.message.notify({name:'color',value:'#FFAACC'})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0600 component obj is: ' + obj.$attrs.decoration);
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FFFFAACC",' +
      '"style":"TextDecorationStyle.SOLID"}');
      done();
    }); 

    it('spanUIJsunit_0700', 0, async (done: Function) => {
      console.info('spanUIJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      globalThis.value.message.notify({name:'type',value:TextDecorationType.Overline})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0700 component obj is: ' + obj.$attrs.decoration);
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Overline","color":"#FFFFAACC",' +
      '"style":"TextDecorationStyle.SOLID"}');
      globalThis.value.message.notify({name:'type',value:TextDecorationType.LineThrough})
      await CommonFunc.sleep(300);
      let strJson2 = getInspectorByKey('testSpan');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('spanUIJsunit_0700 component obj2 is: ' + obj2.$attrs.decoration);
      expect(obj2.$attrs.decoration).assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFFFAACC",' +
      '"style":"TextDecorationStyle.SOLID"}');
      done();
    }); 
    
    it('spanUIJsunit_0800', 0, async (done: Function) => {
      console.info('spanUIJsunit_0800 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      globalThis.value.message.notify({name:'color',value: Color.Green})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0800 component obj is: ' + obj.$attrs.decoration);
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FF008000",' +
      '"style":"TextDecorationStyle.SOLID"}');
      globalThis.value.message.notify({name:'color',value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(300);
      let strJson2 = getInspectorByKey('testSpan');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('spanUIJsunit_0800 component obj2 is: ' + obj2.$attrs.decoration);
      expect(obj2.$attrs.decoration).assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFEE82EE",' +
      '"style":"TextDecorationStyle.SOLID"}');
      done();
    }); 
     
    it('spanUIJsunit_0900', 0, async (done: Function) => {
      console.info('spanUIJsunit_0900 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span illegal dynamically
      globalThis.value.message.notify({name:'type',value:8})
      await CommonFunc.sleep(300);
      globalThis.value.message.notify({name:'color',value:'#FCC'})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('testSpan');
      let obj: ESObject = JSON.parse(strJson);
      console.info('spanUIJsunit_0900 component obj is: ' + obj.$attrs.decoration);
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FFFFCCCC",' +
      '"style":"TextDecorationStyle.SOLID"}');
      done();
    }); 
  })
}