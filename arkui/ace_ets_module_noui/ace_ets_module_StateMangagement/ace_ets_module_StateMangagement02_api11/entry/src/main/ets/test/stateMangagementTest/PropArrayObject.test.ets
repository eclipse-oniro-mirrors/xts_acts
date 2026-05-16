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

export default function PropArrayObject() {
  describe('PropArrayObject', () => {
    beforeEach(async (done: Function) => {
      console.info("PropArrayObject beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/PropArrayObject',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropArrayObject state pages: " + JSON.stringify(pages));
        if (!("PropArrayObject" == pages.name)) {
          console.info("get PropArrayObject state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropArrayObject success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropArrayObject page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   PropArrayObject_0100
     * @tc.number PropArrayObject_0100
     * @tc.desc   Test if the state decorator supports PropArrayObject types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayObject_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PropArrayObject_0100 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('propArrayObject_add'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('propArrayObject_value_3');
      console.info("[PropArrayObject_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[PropArrayObject_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item7 MyPropObject7 index: 3');
      console.info('[PropArrayObject_0100] END');
      done();
    });
    /**
     * @tc.name   PropArrayObject_0200
     * @tc.number PropArrayObject_0200
     * @tc.desc   Test if the state decorator supports PropArrayObject types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayObject_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PropArrayObject_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('propArrayObject_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('propArrayObject_value_0');
      console.info("[PropArrayObject_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[PropArrayObject_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item0 MyPropObject0 index: 0');
      console.info('[PropArrayObject_0200] END');
      done();
    });
    /**
     * @tc.name   PropArrayObject_0300
     * @tc.number PropArrayObject_0300
     * @tc.desc   Test if the state decorator supports PropArrayObject types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayObject_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PropArrayObject_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('propArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('propArrayObject_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('propArrayObject_value_0');
      console.info("[PropArrayObject_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item5 MyPropObject5 index: 0');
      console.info('[PropArrayObject_0300] END');
      done();
    });
  })
}