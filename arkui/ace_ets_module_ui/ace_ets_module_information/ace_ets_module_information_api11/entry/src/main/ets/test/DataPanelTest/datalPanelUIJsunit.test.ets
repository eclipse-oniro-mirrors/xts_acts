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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';
const waitUiReadyMs = 1000;

export default function  datalPanelUIJsunit() {
  describe('datalPanelUIJsunit', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("datalPanelUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DatalPanelUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get datalPanelUIJsunit state pages:" + JSON.stringify(pages));
        if (!("DatalPanelUI" == pages.name)) {
          console.info("get datalPanelUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push datalPanelUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push datalPanelUIJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('datalPanelUIJsunit_0100', 0, async (done: Function) => {
       console.info('datalPanelUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the datelPanel component and test attribute
       let strJson = getInspectorByKey('dp1');
       let obj: ESObject = JSON.parse(strJson);
       console.info("datalPanelUIJsunit_0100'] component obj is: " + JSON.stringify(obj.$attrs.values));
       let valus: string = obj.$attrs.values;
       let expectV: string = [25,1].toString();
       expect(valus == expectV).assertTrue();
       expect(obj.$attrs.max).assertEqual('26.000000');
       expect(obj.$attrs.type).assertEqual('DataPanelType.Line');
       done();
    });

   it('datalPanelUIJsunit_0200', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of DataPanel dynamically
      globalThis.value.message.notify({name:'dataPanelType',value:DataPanelType.Line})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('DataPanelType.Line');
      done();
    });

    it('datalPanelUIJsunit_0300', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the attribute illegal value of DataPanel dynamically
      globalThis.value.message.notify({name:'dataPanelType',value:3})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0300'] component obj is: " + JSON.stringify(obj));
      // check the default value
      expect(obj.$attrs.type).assertEqual('DataPanelType.Circle');
      done();
    });

    it('datalPanelUIJsunit_0400', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute normal value of DataPanel dynamically
      globalThis.value.message.notify({name:'values',value:[10,10,10,10,10,10,10,10,10]})
      await CommonFunc.sleep(200);
      // check the value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0400'] component obj is: " + JSON.stringify(obj.$attrs.values));
      let valus: string = obj.$attrs.values;
      let expectV: string = [10,10,10,10,10,10,10,10,10].toString();
      expect(valus == expectV).assertTrue();
      done();
    });

    it('datalPanelUIJsunit_0500', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // modify the values ten attribute value of DataPanel dynamically
      globalThis.value.message.notify({name:'values',value:[-50,33,1,22,33,33,333,21,31,10]})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0500'] component obj is: " + JSON.stringify(obj.$attrs.values));
      let valus: string = obj.$attrs.values;
      let expectV: string = [0,33,1,22,33,33,333,21,31].toString();
      expect(valus == expectV).assertTrue();
      expect(obj.$attrs.max).assertEqual('507.000000');
      done();
    });

    it('datalPanelUIJsunit_0600', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // modify the max attribute value of DataPanel dynamically
      globalThis.value.message.notify({name:'maxValue',value:27})
      await CommonFunc.sleep(2000);
      // check the max value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0600'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.max).assertEqual('27.000000');
      done();
    });

    it('datalPanelUIJsunit_0700', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // fix value num
      globalThis.value.message.notify({name:'values',value:[-3,10,10,10,10,10,10,10,10,90]})
      await CommonFunc.sleep(2000);
      // modify the max attribute value of DataPanel dynamically
      globalThis.value.message.notify({name:'maxValue',value:-30})
      await CommonFunc.sleep(2000);
      // check the max value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0700'] component obj is: " + JSON.stringify(obj.$attrs.options));
      expect(obj.$attrs.max).assertEqual('80.000000');
      done();
    });

     it('datalPanelUIJsunit_0800', 0, async (done: Function) => {
      console.info('datalPanelUIJsunit_0800 START');
      await CommonFunc.sleep(1000);
      // fix value num
      globalThis.value.message.notify({name:'values',value:[10,10,10,10,10,10,10,10,10]})
      await CommonFunc.sleep(2000);
      // modify the max attribute value of DataPanel dynamically
      globalThis.value.message.notify({name:'maxValue',value:0})
      await CommonFunc.sleep(2000);
      // check the max value of changed attribute
      let strJson = getInspectorByKey('dp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[datalPanelUIJsunit_0800'] component obj is: " + JSON.stringify(obj.$attrs.max));
      expect(obj.$attrs.max).assertEqual('90.000000');
      done();
    }); 
  })
}