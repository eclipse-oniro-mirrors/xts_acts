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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function  dataPickerJsunit() {
  describe('dataPickerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("dataPickerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPicker',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dataPickerJsunit state pages:" + JSON.stringify(pages));
        if (!("dataPicker" == pages.name)) {
          console.info("get dataPickerJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push dataPickerJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push dataPickerJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('dataPickerJsunit_0100', 0, async (done: Function) => {
       console.info('dataPickerJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the dataPicker component and test attribute to confirm
       let strJson = getInspectorByKey('dataPicker');
       let obj: ESObject = JSON.parse(strJson);
        console.info("obj is: " + JSON.stringify(obj));
       console.info("dataPickerJsunit_0100'] component obj is: " + obj.$attrs.options + "---" + obj.$attrs.startDate);
       console.info("dataPickerJsunit_0100'] component obj is: " + obj.$attrs.start + "--" + obj.$attrs.end + "--" + obj.$attrs.selected);
       expect(obj.$attrs.lunar).assertEqual('false');
       done();
    });

   it('dataPickerJsunit_0200', 0, async (done: Function) => {
      console.info('dataPickerJsunit_0200 START');
      // modify the type attribute normal value of dataPicker dynamically
      globalThis.value.message.notify({name:'isLunar',value:true})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('dataPicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dataPicker'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.lunar).assertEqual('true');
      globalThis.value.message.notify({name:'isLunar',value:false})
      await CommonFunc.sleep(2000);
       let strJson2 = getInspectorByKey('dataPicker');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[dataPicker'] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.lunar).assertEqual('false'); 
      done();
    });

  })
}