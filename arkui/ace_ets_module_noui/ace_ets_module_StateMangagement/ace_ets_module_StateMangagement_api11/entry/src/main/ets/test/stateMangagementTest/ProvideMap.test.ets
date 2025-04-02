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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
import Utils from '../../MainAbility/common/Utils.ets'

export default function ProvideMap() {
  describe('ProvideMap', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideMap beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/ProvideMap',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideMap state pages: " + JSON.stringify(pages));
        if (!("ProvideMap" == pages.name)) {
          console.info("get ProvideMap state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ProvideMap success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideMap page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDEMAP_0010
    * @tc.name  : ProvideMap_0100
    * @tc.desc  : Test if the state decorator supports MAP types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideMap_0100', 0, async (done: Function) => {
      console.info('ProvideMap_0100 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeMap_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeMap_set'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('provideMap_value_d');
      console.info("[ProvideMap_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideMap_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('4 d');
      console.info('[ProvideMap_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDEMAP_0020
    * @tc.name  : ProvideMap_0200
    * @tc.desc  : Test if the state decorator supports MAP types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideMap_0200', 0, async (done: Function) => {
      console.info('ProvideMap_0200 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeMap_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeMap_clear'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('provideMap_value_K');
      console.info("[ProvideMap_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideMap_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0 K');
      console.info('[ProvideMap_0200] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDEMAP_0030
    * @tc.name  : ProvideMap_0300
    * @tc.desc  : Test if the state decorator supports MAP types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideMap_0300', 0, async (done: Function) => {
      console.info('ProvideMap_0300 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeMap_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeMap_replace'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('provideMap_value_aa');
      console.info("[ProvideMap_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideMap_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0 aa');
      console.info('[ProvideMap_0300] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDEMAP_0040
    * @tc.name  : ProvideMap_0400
    * @tc.desc  : Test if the state decorator supports MAP types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideMap_0400', 0, async (done: Function) => {
      console.info('ProvideMap_0400 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeMap_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeMap_delete'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('provideMap_value_b');
      console.info("[ProvideMap_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideMap_0400] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('1 b');
      console.info('[ProvideMap_0400] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDEMAP_0050
    * @tc.name  : ProvideMap_0500
    * @tc.desc  : Test if the state decorator supports MAP types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideMap_0500', 0, async (done: Function) => {
      console.info('ProvideMap_0500 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeMap_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('provideMap_add'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('provideMap_value_d');
      console.info("[ProvideMap_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideMap_0500] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('4 d');
      console.info('[ProvideMap_0500] END');
      done();
    });

  })
}