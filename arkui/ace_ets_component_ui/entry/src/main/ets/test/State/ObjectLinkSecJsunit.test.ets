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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function ObjectLinkSecJsunit() {
  describe('ObjectLinkSecJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkSecJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkSec',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkSecJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkSec" == pages.name)) {
          console.info("get ObjectLinkSecJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkSecJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkSecJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({
        url: "MainAbility/pages/index/index"
      });
    });

    it('ObjectLinkSecJsunit_0100', 0, async (done: Function) => {

      console.info('ObjectLinkSecJsunit_0100 START');
      let strJson = getInspectorByKey('sec_state');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSecJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSecJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5");
      console.info('[ObjectLinkSecJsunit_0100] END');
      done();
    });

    it('ObjectLinkSecJsunit_0200', 0, async (done: Function) => {

      console.info('ObjectLinkSecJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sec_state');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSecJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSecJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5");
      console.info('[ObjectLinkSecJsunit_0200] END');
      done();
    });

    it('ObjectLinkSecJsunit_0300', 0, async (done: Function) => {

      console.info('ObjectLinkSecJsunit_0300 START');
      let strJson = getInspectorByKey('sec_provide');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSecJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSecJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5");
      console.info('[ObjectLinkSecJsunit_0300] END');
      done();
    });

    it('ObjectLinkSecJsunit_0400', 0, async (done: Function) => {

      console.info('ObjectLinkSecJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_provide2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sec_provide');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkSecJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSecJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5");
      console.info('[ObjectLinkSecJsunit_0400] END');
      done();
    });
  })
}

