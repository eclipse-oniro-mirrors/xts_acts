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

export default function ProvideArrayObject() {
  describe('ProvideArrayObject', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideArrayObject beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/ProvideArrayObject',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideArrayObject state pages: " + JSON.stringify(pages));
        if (!("ProvideArrayObject" == pages.name)) {
          console.info("get ProvideArrayObject state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideArrayObject success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideArrayObject page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: ProvideArrayObject_0100
    * @tc.name  : ProvideArrayObject_0100
    * @tc.desc  : Test if the state decorator supports ProvideArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ProvideArrayObject_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArrayObject_0100 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeArrayObject_add'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('provideArrayObject_value_3');
      console.info("[ProvideArrayObject_0100] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideArrayObject_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item 4: MyProvideObject4 index: 3');
      console.info('[ProvideArrayObject_0100] END');
      done();
    });
    /* *
    * @tc.number: ProvideArrayObject_0200
    * @tc.name  : ProvideArrayObject_0200
    * @tc.desc  : Test if the state decorator supports ProvideArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ProvideArrayObject_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArrayObject_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeArrayObject_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('provideArrayObject_value_0');
      console.info("[ProvideArrayObject_0200] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideArrayObject_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item 0: MyProvideObject0 index: 0');
      console.info('[ProvideArrayObject_0200] END');
      done();
    });
    /* *
    * @tc.number: ProvideArrayObject_0300
    * @tc.name  : ProvideArrayObject_0300
    * @tc.desc  : Test if the state decorator supports ProvideArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ProvideArrayObject_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArrayObject_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeArrayObject_replace'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('provideArrayObject_value_0');
      console.info("[ProvideArrayObject_0300] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideArrayObject_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item 99: MyProvideObject99 index: 0');
      console.info('[ProvideArrayObject_0300] END');
      done();
    });
    /* *
    * @tc.number: ProvideArrayObject_0400
    * @tc.name  : ProvideArrayObject_0400
    * @tc.desc  : Test if the state decorator supports ProvideArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ProvideArrayObject_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArrayObject_0400 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('consumeArrayObject_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('provideArrayObject_value_0');
      console.info("[ProvideArrayObject_0400] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideArrayObject_0400] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item 1: MyProvideObject1 index: 0');
      console.info('[ProvideArrayObject_0400] END');
      done();
    });
    /* *
    * @tc.number: ProvideArrayObject_0500
    * @tc.name  : ProvideArrayObject_0500
    * @tc.desc  : Test if the state decorator supports ProvideArrayObject types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ProvideArrayObject_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArrayObject_0500 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('consumeArrayObject_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('provideArrayObject_init'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('provideArrayObject_value_0');
      console.info("[ProvideArrayObject_0500] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parse(strJson)));
      console.info("[ProvideArrayObject_0500] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item 4: MyProvideObject4 index: 0');
      console.info('[ProvideArrayObject_0500] END');
      done();
    });

  })
}