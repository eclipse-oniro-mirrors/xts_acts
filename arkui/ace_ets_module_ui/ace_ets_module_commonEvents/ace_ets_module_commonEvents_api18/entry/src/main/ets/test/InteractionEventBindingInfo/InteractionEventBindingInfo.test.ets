/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function InteractionEventBindingInfoTest() {

  describe('InteractionEventBindingInfoTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/InteractionEventBindingInfo/InteractionEventBindingInfo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get InteractionEventBindingInfoTest state pages: " + JSON.stringify(pages));
        if (!("InteractionEventBindingInfoTest" == pages.name)) {
          console.info("get InteractionEventBindingInfoTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push InteractionEventBindingInfoTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push InteractionEventBindingInfoTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("InteractionEventBindingInfoTest after each called");
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0100
     * @tc.number InteractionEventBindingInfoTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0100 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('baseTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0100] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[InteractionEventBindingInfoTest_0100] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0200
     * @tc.number InteractionEventBindingInfoTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0200 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('nodeTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0200] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[InteractionEventBindingInfoTest_0200] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0300
     * @tc.number InteractionEventBindingInfoTest_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0300 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('builtInTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0300] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[InteractionEventBindingInfoTest_0300] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0400
     * @tc.number InteractionEventBindingInfoTest_0400
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0400 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('baseFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0400] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0400] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[InteractionEventBindingInfoTest_0400] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0500
     * @tc.number InteractionEventBindingInfoTest_0500
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0500 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('nodeFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0500] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0500] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[InteractionEventBindingInfoTest_0500] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0600
     * @tc.number InteractionEventBindingInfoTest_0600
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0600 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('nativeFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0600] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0600] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[InteractionEventBindingInfoTest_0600] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0700
     * @tc.number InteractionEventBindingInfoTest_0700
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0700 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('builtInFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value7');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0700] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0700] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[InteractionEventBindingInfoTest_0700] END');
      done();
    });

    /**
     * @tc.name   InteractionEventBindingInfoTest_0800
     * @tc.number InteractionEventBindingInfoTest_0800
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InteractionEventBindingInfoTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('InteractionEventBindingInfoTest_0800 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value8');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[InteractionEventBindingInfoTest_0800] component obj is: " + JSON.stringify(obj));
      console.info("[InteractionEventBindingInfoTest_0800] title: " + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[InteractionEventBindingInfoTest_0800] END');
      done();
    });


  })
}