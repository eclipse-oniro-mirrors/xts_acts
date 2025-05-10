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

export default function textOneJsunit() {
  describe('textOneJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/textOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textOneJsunit state pages:" + JSON.stringify(pages));
        if (!("textOne" == pages.name)) {
          console.info("get textOneJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push textOneJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push textOneJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('textOneJsunit_0100', 0, async (done: Function) => {
       console.info('textOneJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the text part component and test attribute
       let strJson = getInspectorByKey('text1');
       let obj: ESObject = JSON.parse(strJson);
       console.info('textOneJsunit_0100 component obj is: ' + obj.$attrs.textAlign + "---" + obj.$attrs.content + "--" + obj.$attrs.fontSize);
       expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center');
       expect(obj.$attrs.content).assertEqual('TextAlign set to Center.');
       expect(obj.$attrs.fontSize).assertEqual('12.00fp');
       done();
    });

   it('textOneJsunit_0200', 0, async (done: Function) => {
      console.info('textOneJsunit_0200 START');
      // test the enum value of textAlign 
      globalThis.value.message.notify({name:'textAlign',value:TextAlign.Start})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textOneJsunit_0200 component obj is: ' + obj.$attrs.textAlign);
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
      globalThis.value.message.notify({name:'textAlign',value:TextAlign.End})
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey('text1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textOneJsunit_0200 component obj2 is: ' + obj.$attrs.textAlign);
      expect(obj2.$attrs.textAlign).assertEqual('TextAlign.End');
      done();
    });

    it('textOneJsunit_0300', 0, async (done: Function) => {
      console.info('textOneJsunit_0300 START');
      // test the illegal enum value of textAlign 
      globalThis.value.message.notify({name:'textAlign',value:4})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textOneJsunit_0300 component obj is: ' + obj.$attrs.textAlign);
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Left');
      done();
    });

    it('textOneJsunit_0400', 0, async (done: Function) => {
      console.info('textOneJsunit_0400 START');
      // test the  enum value of textOverflow
      globalThis.value.message.notify({name:'textOverflow',value:TextOverflow.Clip})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'maxLines',value:1})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text4');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textOneJsunit_0400 component obj is: ' + obj.$attrs.textOverflow);
      expect(obj.$attrs.textOverflow).assertEqual('TextOverflow.Clip');

      globalThis.value.message.notify({name:'textOverflow',value:TextOverflow.Ellipsis})
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('text4');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textOneJsunit_0400 component obj2 is: ' + obj2.$attrs.textOverflow);
      expect(obj2.$attrs.textOverflow).assertEqual('TextOverflow.Ellipsis');
      done();
    });

    it('textOneJsunit_0500', 0, async (done: Function) => {
      console.info('textOneJsunit_0500 START');
      // test the illegal enum value of textOverflow
      globalThis.value.message.notify({name:'textOverflow',value:4})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'maxLines',value:1})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text4');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textOneJsunit_0400 component obj is: ' + obj.$attrs.textOverflow);
      expect(obj.$attrs.textOverflow).assertEqual('TextOverflow.Ellipsis');
      done();
    });

    it('textOneJsunit_0600', 0, async (done: Function) => {
      console.info('textOneJsunit_0600 START');
      // test the value of lineHeight 
      globalThis.value.message.notify({name:'lineHeight',value:20})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('text5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textOneJsunit_0600 component obj is: ' + obj.$attrs.lineHeight);
      expect(obj.$attrs.lineHeight).assertEqual('20.00fp');
      globalThis.value.message.notify({name:'lineHeight',value:"30fp"})
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey('text5');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textOneJsunit_0600 component obj is: ' + obj2.$attrs.lineHeight);
      expect(obj2.$attrs.lineHeight).assertEqual('30.00fp');
      done();
    });
  })
}