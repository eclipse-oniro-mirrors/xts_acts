/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  Driver,
  Component,
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


export default function ProvideNumber() {
  describe('ProvideNumber', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideNumber beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ProvideNumber',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideNumber state pages: " + JSON.stringify(pages));
        if (!("ProvideNumber" == pages.name)) {
          console.info("get ProvideNumber state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideNumber success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideNumber page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0240
    * @tc.name  : ProvideNumber_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideNumber_0100', 0, async (done: Function) => {
      console.info('ProvideNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Number]" number is 10');
      console.info('[ProvideNumber_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0250
    * @tc.name  : ProvideNumber_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideNumber_0200', 0, async (done: Function) => {
      console.info('ProvideNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Object]" number is {"pages":20}');
      console.info('[ProvideNumber_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0260
    * @tc.name  : ProvideNumber_0300
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideNumber_0300', 0, async (done: Function) => {
      console.info('ProvideNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Object]" number is {"number":"30"}');
      console.info('[ProvideNumber_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0270
    * @tc.name  : ProvideNumber_0400
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideNumber_0400', 0, async (done: Function) => {
      console.info('ProvideNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Date]" number is "2021-08-08T00:00:00.000Z"');
      console.info('[ProvideNumber_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0280
    * @tc.name  : ProvideNumber_0500
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideNumber_0500', 0, async (done: Function) => {
      console.info('ProvideNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[ProvideNumber_0100] END');
      done();
    });

  })
}

