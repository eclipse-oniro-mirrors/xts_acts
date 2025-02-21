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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';


export default function StateArrayNewJsunit() {
  describe('StateArrayNewJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateArrayNewJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateArrayNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateArrayNewJsunit state pages: " + JSON.stringify(pages));
        if (!("StateArrayNew" == pages.name)) {
          console.info("get StateArrayNewJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateArrayNewJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateArrayNewJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    it('StateArrayNewJsunit_0200', 0, async (done: Function) => {

      console.info('StateArrayNewJsunit_0200 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('every_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('every_Array');
      let obj = JSON.parse(strJson);
      console.info("[StateArrayNewJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Click to every value to the array false');
      console.info('[StateArrayNewJsunit_0200] END');
      done();
    });

    it('StateArrayNewJsunit_0400', 0, async (done: Function) => {

      console.info('StateArrayNewJsunit_0400 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('some_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('some_Array');
      let obj = JSON.parse(strJson);
      console.info("[StateArrayNewJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_0400] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Click to some value to the array false');
      console.info('[StateArrayNewJsunit_0400] END');
      done();
    });


    it('StateArrayNewJsunit_0600', 0, async (done: Function) => {

      console.info('StateArrayNewJsunit_0600 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('filter_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('filter_Array');
      let obj = JSON.parse(strJson);
      console.info("[StateArrayNewJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_0600] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Click to filter value to the array exuberant,destruction,present");
      console.info('[StateArrayNewJsunit_0600] END');
      done();
    });


    it('StateArrayNewJsunit_0800', 0, async (done: Function) => {

      console.info('StateArrayNewJsunit_0800 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('reduce_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('reduce_Array');
      let obj = JSON.parse(strJson);
      console.info("[StateArrayNewJsunit_0800] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_0800] ClassA: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Click to reduce value to the array 10');
      console.info('[StateArrayNewJsunit_0800] END');
      done();
    });

    it('StateArrayNewJsunit_1000', 0, async (done: Function) => {

      console.info('StateArrayNewJsunit_1000 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('reduceRight_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('reduceRight_Array');
      let obj = JSON.parse(strJson);
      console.info("[StateArrayNewJsunit_1000] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_1000] ClassA: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Click to reduceRight value to the array 4,5,2,3,0,1');
      console.info('[StateArrayNewJsunit_1000] END');
      done();
    });
  })
}

