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
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';


export default function StateNumberJsunit() {
  describe('StateNumberJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StateNumberJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateNumber',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateNumberJsunit state pages: " + JSON.stringify(pages));
        if (!("StateNumber" == pages.name)) {
          console.info("get StateNumberJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateNumberJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateNumberJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({
        uri: "MainAbility/pages/index/index"
      });
    });

    it('StateNumberJsunit_0100', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0100 START');
      let strJson = getInspectorByKey('state_string');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0100] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("string: hello");
      console.info('[StateNumberJsunit_0100] END');
      done();
    });

    it('StateNumberJsunit_0200', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('state_string'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state_string');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0200] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("string: world");
      console.info('[StateNumberJsunit_0200] END');
      done();
    });

    it('StateNumberJsunit_0300', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0300 START');
      let strJson = getInspectorByKey('state_number');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0300] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("number: 0");
      console.info('[StateNumberJsunit_0300] END');
      done();
    });

    it('StateNumberJsunit_0400', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('state_number'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state_number');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0400] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("number: 8");
      console.info('[StateNumberJsunit_0400] END');
      done();
    });

    it('StateNumberJsunit_0500', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0500 START');
      let strJson = getInspectorByKey('state_Boolean');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0500] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("Boolean: true");
      console.info('[StateNumberJsunit_0500] END');
      done();
    });

    it('StateNumberJsunit_0600', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('state_Boolean'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state_Boolean');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0600] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("Boolean: false");
      console.info('[StateNumberJsunit_0600] END');
      done();
    });

    it('StateNumberJsunit_0700', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0700 START');
      let strJson = getInspectorByKey('state_enum');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0700] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0700] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("enum: #ff0000ff");
      console.info('[StateNumberJsunit_0700] END');
      done();
    });

    it('StateNumberJsunit_0800', 0, async (done: Function) => {

      console.info('StateNumberJsunit_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('state_enum'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state_enum');
      let obj = JSON.parse(strJson);
      console.info("[StateNumberJsunit_0800] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_0800] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("enum: #ffff0000");
      console.info('[StateNumberJsunit_0800] END');
      done();
    });
  })
}

