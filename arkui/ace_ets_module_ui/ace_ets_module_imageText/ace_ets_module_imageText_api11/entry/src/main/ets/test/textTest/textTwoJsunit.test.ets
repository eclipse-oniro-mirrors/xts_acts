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

export default function textTwoJsunit() {
  describe('textTwoJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/textTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textTwoJsunit state pages:" + JSON.stringify(pages));
        if (!("textTwo" == pages.name)) {
          console.info("get textTwoJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push textTwoJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push textTwoJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('textTwoJsunit_0100', 0, async (done: Function) => {
      console.info('textTwoJsunit_0200 START');
      // test the illegal value of decoration
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'type',value:undefined})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'color',value:undefined})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0100 component obj is: ' + obj.$attrs.decoration);
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FF000000",' +
      '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    it('textTwoJsunit_0200', 0, async (done: Function) => {
      console.info('imageOneJsunit_0200 START');
      await CommonFunc.sleep(500);
      // get the image component and test attribute
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0200 component obj is: ' + obj.$attrs.decoration);
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FF000000",' +
      '"style":"TextDecorationStyle.SOLID"}');
      await CommonFunc.sleep(1000);
      // to modify the atrribute
      globalThis.value.message.notify({name:'type',value:TextDecorationType.Overline})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'color',value:Color.Green})
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey('text1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textTwoJsunit_0200 component obj2 is: ' + obj2.$attrs.decoration);
      expect(obj2.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Overline","color":"#FF008000",' +
      '"style":"TextDecorationStyle.SOLID"}');
      await CommonFunc.sleep(1000);

      globalThis.value.message.notify({name:'type',value:TextDecorationType.Underline})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'color',value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(200);
      let strJson3 = getInspectorByKey('text1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('textTwoJsunit_0200 component obj3 is: ' + obj3.$attrs.decoration);
      expect(obj3.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFEE82EE",' +
      '"style":"TextDecorationStyle.SOLID"}');
      await CommonFunc.sleep(1000);

      globalThis.value.message.notify({name:'type',value:TextDecorationType.None})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'color',value:'#FFACEEEE'})
      await CommonFunc.sleep(200);
      let strJson4 = getInspectorByKey('text1');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('textTwoJsunit_0200 component obj4 is: ' + obj4.$attrs.decoration);
      expect(obj4.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FFACEEEE",' +
      '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

   

    it('textTwoJsunit_0300', 0, async (done: Function) => {
      console.info('textTwoJsunit_0300 START');
      // test the baselineOffset
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'baselineOffset',value:30})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0300 component obj is: ' + obj.$attrs.baselineOffset);
      expect(obj.$attrs.baselineOffset).assertEqual('30');
      done();
    });

    it('textTwoJsunit_0400', 0, async (done: Function) => {
      console.info('textTwoJsunit_0400 START');
      // test the baselineOffset of negative value
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'baselineOffset',value:-20})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0400 component obj is: ' + obj.$attrs.baselineOffset);
      expect(obj.$attrs.baselineOffset).assertEqual('-20');
      done();
    });

    it('textTwoJsunit_0500', 0, async (done: Function) => {
      console.info('textTwoJsunit_0500 START');
      // test the letterSpacing
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'letterSpacing',value:4})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0500 component obj is: ' + obj.$attrs.letterSpacing);
      expect(obj.$attrs.letterSpacing).assertEqual('4.00fp');
      done();
    });

    it('textTwoJsunit_0600', 0, async (done: Function) => {
      console.info('textTwoJsunit_0600 START');
      // test the baselineOffset of negative value
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'letterSpacing',value:-2})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0600 component obj is: ' + obj.$attrs.letterSpacing);
      expect(obj.$attrs.baselineOffset).assertEqual('0');
      done();
    });

    it('textTwoJsunit_0700', 0, async (done: Function) => {
      console.info('textTwoJsunit_0700 START');
      // test the testcase
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'textCase',value:TextCase.Normal})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0700 component obj is: ' + obj.$attrs.textCase);
      expect(obj.$attrs.textCase).assertEqual('TextCase.Normal');

      globalThis.value.message.notify({name:'textCase',value:TextCase.LowerCase})
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('text5');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textTwoJsunit_0700 component obj2 is: ' + obj2.$attrs.textCase);
      expect(obj2.$attrs.textCase).assertEqual('TextCase.LowerCase');

      globalThis.value.message.notify({name:'textCase',value:TextCase.UpperCase})
      await CommonFunc.sleep(2000);
      let strJson3 = getInspectorByKey('text5');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('textTwoJsunit_0700 component obj3 is: ' + obj3.$attrs.textCase);
      expect(obj3.$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    });

    it('textTwoJsunit_0800', 0, async (done: Function) => {
      console.info('textTwoJsunit_0800 START');
      // test the testcase of illegal value
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'textCase',value:8})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textTwoJsunit_0800 component obj is: ' + obj.$attrs.testCase);
      expect(obj.$attrs.textCase).assertEqual('TextCase.UpperCase');
      done();
    });
  })
}