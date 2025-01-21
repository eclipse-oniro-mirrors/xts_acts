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

export default function PropSet() {
  describe('PropSet', () => {
    beforeEach(async (done: Function) => {
      console.info("PropSet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/PropSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropSet state pages: " + JSON.stringify(pages));
        if (!("PropSet" == pages.name)) {
          console.info("get PropSet state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push PropSet success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropSet page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROPSET_0010
    * @tc.name  : PropSet_0100
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('PropSet_0100', 0, async (done: Function) => {
      console.info('PropSet_0100 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('propSet_set'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('propSet_value_5');
      console.info("[PropSet_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[PropSet_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('5');
      console.info('[PropSet_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROPSET_0020
    * @tc.name  : PropSet_0200
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('PropSet_0200', 0, async (done: Function) => {
      console.info('PropSet_0200 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('propSet_clear'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('propSet_value_0');
      console.info("[PropSet_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[PropSet_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0');
      console.info('[PropSet_0200] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROPSET_0030
    * @tc.name  : PropSet_0300
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('PropSet_0300', 0, async (done: Function) => {
      console.info('PropSet_0300 START');
      let driver: Driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('propSet_delete'));
      await button.click();
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('propSet_value_2');
      console.info("[PropSet_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('2');
      console.info('[PropSet_0300] END');
      done();
    });
  })
}