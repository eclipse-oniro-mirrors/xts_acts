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

export default function loadingProgressJsunit() {
  describe('loadingProgressJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("loadingProgressJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/loadingprogress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get loadingProgressJsunit state pages:" + JSON.stringify(pages));
        if (!("loadingprogress" == pages.name)) {
          console.info("get loadingProgressJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push loadingProgressJsunit success" + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push loadingProgressJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('loadingProgressJsunit_0100', 0, async (done: Function) => {
       console.info('loadingProgressJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the gauge component and test attribute
       let strJson = getInspectorByKey('loadingProgress');
       let obj: ESObject = JSON.parse(strJson);
       console.info('loadingProgressJsunit_0100 component obj is:' + JSON.stringify(obj));
       expect(obj.$attrs.color).assertEqual('#FF0000FF');
       done();
    });

   it('loadingProgressJsunit_0200', 0, async (done: Function) => {
      console.info('loadingProgressJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the color attribute normal value of loadingProgress dynamically
      globalThis.value.message.notify({name:'color',value:Color.Green})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('loadingProgress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('loadingProgressJsunit_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#FF008000');
      done();
    });

  it('loadingProgressJsunit_0300', 0, async (done: Function) => {
      console.info('loadingProgressJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of loadingProgress dynamically
      globalThis.value.message.notify({name:'color',value:'-20'})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('loadingProgress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('loadingProgressJsunit_0300  component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#99666666');
      done();
   });
    
  })
}