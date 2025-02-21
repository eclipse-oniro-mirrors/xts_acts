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


export default function ProgressJsunit() {
  describe('ProgressJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ProgressJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ProgressPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProgressJsunit state pages: " + JSON.stringify(pages));
        if (!("ProgressPage" == pages.name)) {
          console.info("get ProgressJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ProgressJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProgressJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ProgressJsunit_0100', 0, async (done: Function) => {
      // Get the information of the Progress component
      console.info('[ProgressJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.value).assertEqual('20.000000');
      expect(obj.$attrs.total).assertEqual('100.000000');
      expect(obj.$attrs.type).assertEqual('ProgressStyle.Linear');
      expect(obj.$attrs.color).assertEqual('#FF808080');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('pro3');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ProgressJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.strokeWidth).assertEqual('15.00vp');
      expect(obj1.$attrs.scaleCount).assertEqual('15');
      expect(obj1.$attrs.scaleWidth).assertEqual('5.00vp');
      await CommonFunc.sleep(1000);
      console.info('[ProgressJsunit_0100] END');
      done();
    });

    it('ProgressJsunit_0200', 0, async (done: Function) => {
      // Modify the total value of the Progress component
      console.info('[ProgressJsunit_0200] START');
      globalThis.value.message.notify({name:'progressTotal',value:200})
      await CommonFunc.sleep(2000);
      // Get the total value of the Progress component
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.total).assertEqual('200.000000');
      console.info('[ProgressJsunit_0200] END');
      done();
    });

    it('ProgressJsunit_0300', 0, async (done: Function) => {
      // Modify the type of the Progress component
      console.info('[ProgressJsunit_0300] START');
      globalThis.value.message.notify({name:'ProgressType',value:ProgressStyle.Capsule})
      await CommonFunc.sleep(2000);
      // Get the type of the Progress component
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('ProgressStyle.Capsule');
      console.info('[ProgressJsunit_0300] END');
      done();
    });

    it('ProgressJsunit_0400', 0, async (done: Function) => {
      // Modify the color of the Progress component
      console.info('[ProgressJsunit_0400] START');
      globalThis.value.message.notify({name:'ProgressColor',value:Color.Blue})
      await CommonFunc.sleep(2000);
      // Get the color of the Progress component
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#FF808080');
      await CommonFunc.sleep(1000);
      console.info('[ProgressJsunit_0400] END');
      done();
    });

    it('ProgressJsunit_0500', 0, async (done: Function) => {
      // Modify the backgroundColor of the Progress component
      console.info('[ProgressJsunit_0500] START');
      globalThis.value.message.notify({name:'backgroundColor',value:Color.Black})
      await CommonFunc.sleep(2000);
      // Get the backgroundColor of the Progress component
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF000000');
      console.info('[ProgressJsunit_0500] END');
      done();
    });

    it('ProgressJsunit_0600', 0, async (done: Function) => {
      // Modify the style of the Progress component
      console.info('[ProgressJsunit_0600] START');
      globalThis.value.message.notify({name:'ProgressType',value:ProgressStyle.ScaleRing})
      await CommonFunc.sleep(2000);

      // Get the value of the modified style attribute
      let strJson = getInspectorByKey('pro3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunProgressJsunit_0600it_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('ProgressStyle.ScaleRing');
      console.info('[ProgressJsunit_0600] END');
      done();
    });
    
    it('ProgressJsunit_0700', 0, async (done: Function) => {
      // Modify the value of the Progress component
      console.info('[ProgressJsunit_0700] START');
      globalThis.value.message.notify({name:'progressValue',value:20})
      await CommonFunc.sleep(2000);
      // Get the value of the Progress component
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.value).assertEqual('20.000000');
      console.info('[ProgressJsunit_0700] END');
      done();
    });

    it('ProgressJsunit_0800', 0, async (done: Function) => {
      // Illegal modification of the value of the Progress component
      console.info('[ProgressJsunit_0800] START');
      globalThis.value.message.notify({name:'progressValue',value:-20})
      await CommonFunc.sleep(1500);
      // Get the value of Progress component after illegal modification
      let strJson = getInspectorByKey('pro1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.value).assertEqual('0.000000');

      globalThis.value.message.notify({name:'progressValue',value:400})
      await CommonFunc.sleep(1500);
      // Get the value of the Progress component after illegal modification again
      let strJson1 = getInspectorByKey('pro1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ProgressJsunit_0800] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.value).assertEqual('200.000000');
      console.info('[ProgressJsunit_0800] END');
      done();
    });

    it('ProgressJsunit_0900', 0, async (done: Function) => {
      // Get the default value of the Progress component
      console.info('[ProgressJsunit_0900] START');
      let strJson = getInspectorByKey('pro2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProgressJsunit_0900] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.value).assertEqual('10.000000');
      expect(obj.$attrs.total).assertEqual('100.000000');
      expect(obj.$attrs.type).assertEqual('ProgressStyle.Linear');
      console.info('[ProgressJsunit_0900] END');
      done();
    });
  })
}
