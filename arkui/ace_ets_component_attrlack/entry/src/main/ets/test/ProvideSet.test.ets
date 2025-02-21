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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from './Utils.ets'

export default function ProvideSet() {
  describe('ProvideSet', function () {
    beforeEach(async function (done) {
      console.info("ProvideSet beforeEach start");
      let options = {
        uri: 'MainAbility/pages/ProvideSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideSet state pages: " + JSON.stringify(pages));
        if (!("ProvideSet" == pages.name)) {
          console.info("get ProvideSet state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push ProvideSet success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideSet page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDESET_0010
    * @tc.name  : ProvideSet_0100
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideSet_0100', 0, async function (done) {
      console.info('ProvideSet_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeSet_set'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('provideSet_value_5');
      let obj = JSON.parse(strJson);
      console.info("[ProvideSet_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideSet_0100] value: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('5');
      console.info('[ProvideSet_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDESET_0020
    * @tc.name  : ProvideSet_0200
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideSet_0200', 0, async function (done) {
      console.info('ProvideSet_0200 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeSet_clear'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('provideSet_value_0');
      let obj = JSON.parse(strJson);
      console.info("[ProvideSet_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideSet_0200] value: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      console.info('[ProvideSet_0200] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDESET_0030
    * @tc.name  : ProvideSet_0300
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideSet_0300', 0, async function (done) {
      console.info('ProvideSet_0300 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeSet_delete'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('provideSet_value_2');
      let obj = JSON.parse(strJson);
      console.info("[ProvideSet_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideSet_0300] value: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('2');
      console.info('[ProvideSet_0300] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_PROVIDESET_0040
    * @tc.name  : ProvideSet_0400
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type : 
    * @tc.size : 
    */
    it('ProvideSet_0400', 0, async function (done) {
      console.info('ProvideSet_0400 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeSet_init'));
      await btn_init.click();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('provideSet_add'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('provideSet_value_4');
      let obj = JSON.parse(strJson);
      console.info("[ProvideSet_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideSet_0400] value: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('4');
      console.info('[ProvideSet_0400] END');
      done();
    });

  })
}