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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function ConsumeColor() {
  describe('ConsumeColor', () => {
    beforeEach(async (done: Function) => {
      console.info("ConsumeColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ConsumeColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ConsumeColor state pages: " + JSON.stringify(pages));
        if (!("ConsumeColor" == pages.name)) {
          console.info("get ConsumeColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ConsumeColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConsumeColor page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ConsumeColor_0100
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0980
     * @tc.desc   To test that the Consume decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConsumeColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFA500');
      console.info('[ConsumeColor_0100] END');
      done();
    });
    /**
     * @tc.name   ConsumeColor_0200
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0990
     * @tc.desc   To test that the Consume decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConsumeColor_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      console.info('[ConsumeColor_0100] END');
      done();
    });
    /**
     * @tc.name   ConsumeColor_0300
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1000
     * @tc.desc   To test that the Consume decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConsumeColor_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeColor_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Undefined]" number is undefined');
      console.info('[ConsumeColor_0100] END');
      done();
    });
    /**
     * @tc.name   ConsumeColor_0400
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1010
     * @tc.desc   To test that the Consume decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConsumeColor_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFA52A2A');
      console.info('[ConsumeColor_0100] END');
      done();
    });
    /**
     * @tc.name   ConsumeColor_0500
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1020
     * @tc.desc   To test that the Consume decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConsumeColor_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeColor_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Null]" number is null');
      console.info('[ConsumeColor_0100] END');
      done();
    });
    /**
     * @tc.name   ConsumeColor_0600
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1030
     * @tc.desc   To test that the Consume decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConsumeColor_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF008000');
      console.info('[ConsumeColor_0100] END');
      done();
    });
  })
}

