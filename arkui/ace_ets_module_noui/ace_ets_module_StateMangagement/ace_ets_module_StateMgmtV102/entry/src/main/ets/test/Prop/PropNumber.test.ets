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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
 

export default function PropNumber() {
  describe('PropNumber', () => {
    beforeEach(async (done: Function) => {
      console.info("PropNumber beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Prop/PropNumber',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropNumber state pages: " + JSON.stringify(pages));
        if (!("PropNumber" == pages.name)) {
          console.info("get PropNumber state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropNumber success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropNumber page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   PropNumber_0100
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0470
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumber_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PropNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Number]" number is 10');
      console.info('[PropNumber_0100] END');
      done();
    });
    /**
     * @tc.name   PropNumber_0200
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0480
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumber_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PropNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Object]" number is {"pages":20}');
      console.info('[PropNumber_0100] END');
      done();
    });
    /**
     * @tc.name   PropNumber_0300
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0490
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumber_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PropNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumber_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumber_0300] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Object]" number is {"number":"30"}');
      console.info('[PropNumber_0300] END');
      done();
    });
    /**
     * @tc.name   PropNumber_0400
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0500
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumber_0400', Level.LEVEL0, async (done: Function) => {
      console.info('PropNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Date]" number is "2021-08-08T00:00:00.000Z"');
      console.info('[PropNumber_0100] END');
      done();
    });
    /**
     * @tc.name   PropNumber_0500
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0510
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumber_0500', Level.LEVEL0, async (done: Function) => {
      console.info('PropNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[PropNumber_0100] END');
      done();
    });

  })
}

