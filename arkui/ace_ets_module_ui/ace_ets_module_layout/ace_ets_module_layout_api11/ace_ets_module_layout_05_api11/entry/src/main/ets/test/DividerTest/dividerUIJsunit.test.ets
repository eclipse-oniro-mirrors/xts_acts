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
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function dividerUIJsunit() {
  describe('dividerUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("dividerUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/dividerUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dividerUIJsunit state pages:" + JSON.stringify(pages));
        if (!("dividerUI" == pages.name)) {
          console.info("get dividerUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push dividerUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push dividerUIJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('dividerUIJsunit_0100', 0, async (done: Function) => {
       console.info('dividerUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the dividerUIJsunit_0100 component and test attribute
       let strJson = getInspectorByKey('divider');
       let obj: ESObject = JSON.parse(strJson);
       console.info("dividerUIJsunit_0100'] component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.vertical).assertEqual('false');
       expect(obj.$attrs.strokeWidth).assertEqual('20.00vp');
       // to confirm
       //expect(obj.$attrs.lineCap).assertEqual('LineCapStyle.Butt');
       expect(obj.$attrs.lineCap).assertEqual('BUTT');
       expect(obj.$attrs.color).assertEqual('#FFACBDEF');
       done();
    });

   it('dividerUIJsunit_0200', 0, async (done: Function) => {
      console.info('dividerUIJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of divider dynamically
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'strokeWidth',value:'30'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<LineCapStyle>('value').message.notify({name:'lineCapStyle',value:LineCapStyle.Round})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'color',value:'#FFFFFF'})
      await CommonFunc.sleep(200);
      // check the value of changed attribute
      let strJson = getInspectorByKey('divider');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dividerUIJsunit_0200'] component obj is: " + JSON.stringify(obj.$attrs.lineCap));
      expect(obj.$attrs.strokeWidth).assertEqual('30.00vp');
      expect(obj.$attrs.lineCap).assertEqual('ROUND');
      expect(obj.$attrs.color).assertEqual('#FFFFFFFF');
      done();
    });

    it('dividerUIJsunit_0300', 0, async (done: Function) => {
      console.info('dividerUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the lineCapStyle attribute normal value of divider dynamically
      GlobalContext.getContext().getObject<LineCapStyle>('value').message.notify({name:'lineCapStyle',value:LineCapStyle.Square})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('divider');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dividerUIJsunit_0300'] component obj is: " + obj.$attrs.lineCap);
      expect(obj.$attrs.lineCap).assertEqual('SQUARE');
      done();
    });

    it('dividerUIJsunit_0400', 0, async (done: Function) => {
      console.info('datelPanelJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of divider dynamically
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'strokeWidth',value:'-30'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'lineCapStyle',value:'4'})
      await CommonFunc.sleep(200);
      //globalThis.value.message.notify({name:'color',value:'#FF'})
      //await CommonFunc.sleep(200);
      // check the value of changed attribute
      let strJson = getInspectorByKey('divider');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.strokeWidth).assertEqual('-30.00vp');
      expect(obj.$attrs.lineCap).assertEqual('BUTT');
      // to confirm
     // expect(obj.$attrs.color).assertEqual('#33182431');
      done();
    });

    it('dividerUIJsunit_0500', 0, async (done: Function) => {
      console.info('dividerUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the common attribute
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'widthK',value:'1.0'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('divider');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dividerUIJsunit_0500'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual('1.00vp')
      done();
    });

    
    it('dividerUIJsunit_0600', 0, async (done: Function) => {
      console.info('dividerUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of divider dynamically
      GlobalContext.getContext().getObject<boolean>('value').message.notify({name:'vertical',value:true})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('divider');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dividerUIJsunit_0600'] component obj is: " + JSON.stringify(obj.$attrs.vertical));
      expect(obj.$attrs.vertical).assertEqual('true');
      done();
    });  
    
  })
}