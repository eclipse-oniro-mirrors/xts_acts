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
import CommonFunc from '../../MainAbility/common/Common'

export default function PropArrayBoolean() {
  describe('PropArrayBoolean', () => {
    beforeEach(async (done: Function) => {
      console.info("PropArrayBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/PropArrayBoolean',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropArrayBoolean state pages: " + JSON.stringify(pages));
        if (!("PropArrayBoolean" == pages.name)) {
          console.info("get PropArrayBoolean state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropArrayBoolean success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropArrayBoolean page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: PropArrayBoolean_0100
    * @tc.name  : PropArrayBoolean_0100
    * @tc.desc  : Test if the state decorator supports PropArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('PropArrayBoolean_0100', 0, async (done: Function) => {
      console.info('PropArrayBoolean_0100 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('propArrayBoolean_add'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('propArrayBoolean_value_3');
      console.info("[PropArrayBoolean_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[PropArrayBoolean_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false index: 3');
      console.info('[PropArrayBoolean_0100] END');
      done();
    });
    /* *
    * @tc.number: PropArrayBoolean_0200
    * @tc.name  : PropArrayBoolean_0200
    * @tc.desc  : Test if the state decorator supports PropArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('PropArrayBoolean_0200', 0, async (done: Function) => {
      console.info('PropArrayBoolean_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('propArrayBoolean_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('propArrayBoolean_value_0');
      console.info("[PropArrayBoolean_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[PropArrayBoolean_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true index: 0');
      console.info('[PropArrayBoolean_0200] END');
      done();
    });
    /* *
    * @tc.number: PropArrayBoolean_0300
    * @tc.name  : PropArrayBoolean_0300
    * @tc.desc  : Test if the state decorator supports PropArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('PropArrayBoolean_0300', 0, async (done: Function) => {
      console.info('PropArrayBoolean_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('propArrayBoolean_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('propArrayBoolean_value_0');
      console.info("[PropArrayBoolean_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false index: 0');
      console.info('[PropArrayBoolean_0300] END');
      done();
    });
  })
}