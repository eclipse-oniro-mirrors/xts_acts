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

export default function StateArrayObject() {
  describe('StateArrayObject', () => {
    beforeEach(async (done: Function) => {
      console.info("StateArrayObject beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/StateArrayObject',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StateArrayObject state pages: " + JSON.stringify(pages));
        if (!("StateArrayObject" == pages.name)) {
          console.info("get StateArrayObject state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateArrayObject success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateArrayObject page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StateArrayObject after each called");
    });
    /* *
    * @tc.number: StateArrayObject_0100
    * @tc.name  : StateArrayObject_0100
    * @tc.desc  : Test if the state decorator supports StateArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('StateArrayObject_0100', 0, async (done: Function) => {
      console.info('StateArrayObject_0100 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_add'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateArrayObject_value_3');
      console.info("[StateArrayObject_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateArrayObject_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item7: Object 7 index: 3');
      console.info('[StateArrayObject_0100] END');
      done();
    });
    /* *
    * @tc.number: StateArrayObject_0200
    * @tc.name  : StateArrayObject_0200
    * @tc.desc  : Test if the state decorator supports StateArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('StateArrayObject_0200', 0, async (done: Function) => {
      console.info('StateArrayObject_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateArrayObject_value_0');
      console.info("[StateArrayObject_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateArrayObject_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item0: Object 0 index: 0');
      console.info('[StateArrayObject_0200] END');
      done();
    });
    /* *
    * @tc.number: StateArrayObject_0300
    * @tc.name  : StateArrayObject_0300
    * @tc.desc  : Test if the state decorator supports StateArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('StateArrayObject_0300', 0, async (done: Function) => {
      console.info('StateArrayObject_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_replace'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateArrayObject_value_0');
      console.info("[StateArrayObject_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateArrayObject_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item6: Object 6 index: 0');
      console.info('[StateArrayObject_0300] END');
      done();
    });
    /* *
    * @tc.number: StateArrayObject_0400
    * @tc.name  : StateArrayObject_0400
    * @tc.desc  : Test if the state decorator supports StateArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('StateArrayObject_0400', 0, async (done: Function) => {
      console.info('StateArrayObject_0400 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('stateArrayObject_value_0');
      console.info("[StateArrayObject_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[StateArrayObject_0400] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item5: Object 5 index: 0');
      console.info('[StateArrayObject_0400] END');
      done();
    });
  })
}