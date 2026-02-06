/**
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
import CommonFunc from '../../MainAbility/common/Common'

export default function StateMap() {
  describe('StateMap', () => {
    beforeEach(async (done: Function) => {
      console.info("StateMap beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateMap',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateMap state pages: " + JSON.stringify(pages));
        if (!("StateMap" == pages.name)) {
          console.info("get StateMap state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateMap success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateMap page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StateMap after each called");
    });
    /**
     * @tc.name   StateMap_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STATEMAP_0010
     * @tc.desc   Test if the state decorator supports MAP types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateMap_0100', Level.LEVEL1, async (done: Function) => {
      console.info('StateMap_0100 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateMap_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateMap_set'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateMap_value_d');
      console.info("[StateMap_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateMap_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('4 d');
      console.info('[StateMap_0100] END');
      done();
    });
    /**
     * @tc.name   StateMap_0200
     * @tc.number SUB_ACE_STATUSMANAGER_STATEMAP_0020
     * @tc.desc   Test if the state decorator supports MAP types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateMap_0200', Level.LEVEL1, async (done: Function) => {
      console.info('StateMap_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateMap_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateMap_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateMap_value_K');
      console.info("[StateMap_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateMap_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0 K');
      console.info('[StateMap_0200] END');
      done();
    });
    /**
     * @tc.name   StateMap_0300
     * @tc.number SUB_ACE_STATUSMANAGER_STATEMAP_0030
     * @tc.desc   Test if the state decorator supports MAP types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateMap_0300', Level.LEVEL1, async (done: Function) => {
      console.info('StateMap_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateMap_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateMap_replace'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateMap_value_aa');
      console.info("[StateMap_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateMap_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0 aa');
      console.info('[StateMap_0300] END');
      done();
    });
    /**
     * @tc.name   StateMap_0400
     * @tc.number SUB_ACE_STATUSMANAGER_STATEMAP_0040
     * @tc.desc   Test if the state decorator supports MAP types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateMap_0400', Level.LEVEL1, async (done: Function) => {
      console.info('StateMap_0400 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateMap_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateMap_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateMap_value_b');
      console.info("[StateMap_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateMap_0400] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('1 b');
      console.info('[StateMap_0400] END');
      done();
    });
  })
}