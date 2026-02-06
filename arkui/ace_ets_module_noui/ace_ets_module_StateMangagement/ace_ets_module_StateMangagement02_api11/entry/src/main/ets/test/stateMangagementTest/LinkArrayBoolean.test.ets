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

export default function LinkArrayBoolean() {
  describe('LinkArrayBoolean', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkArrayBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/LinkArrayBoolean',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkArrayBoolean state pages: " + JSON.stringify(pages));
        if (!("LinkArrayBoolean" == pages.name)) {
          console.info("get LinkArrayBoolean state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkArrayBoolean success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkArrayBoolean page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: LinkArrayBoolean_0010
    * @tc.name  : LinkArrayBoolean_0100
    * @tc.desc  : Test if the state decorator supports LinkArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('LinkArrayBoolean_0100', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArrayBoolean_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayBoolean_add'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkArrayBoolean_value_3');

      console.info("[LinkArrayBoolean_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkArrayBoolean_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true index:3');
      console.info('[LinkArrayBoolean_0100] END');
      done();
    });
    /* *
    * @tc.number: LinkArrayBoolean_0200
    * @tc.name  : LinkArrayBoolean_0200
    * @tc.desc  : Test if the state decorator supports LinkArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('LinkArrayBoolean_0200', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArrayBoolean_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayBoolean_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkArrayBoolean_value_0');
      console.info("[LinkArrayBoolean_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkArrayBoolean_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true index:0');
      console.info('[LinkArrayBoolean_0200] END');
      done();
    });
    /* *
    * @tc.number: LinkArrayBoolean_0300
    * @tc.name  : LinkArrayBoolean_0300
    * @tc.desc  : Test if the state decorator supports LinkArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('LinkArrayBoolean_0300', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArrayBoolean_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayBoolean_replace'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkArrayBoolean_value_0');
      console.info("[LinkArrayBoolean_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkArrayBoolean_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true index:0');
      console.info('[LinkArrayBoolean_0300] END');
      done();
    });
    /* *
    * @tc.number: LinkArrayBoolean_0400
    * @tc.name  : LinkArrayBoolean_0400
    * @tc.desc  : Test if the state decorator supports LinkArrayBoolean types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('LinkArrayBoolean_0400', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArrayBoolean_0400 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayBoolean_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayBoolean_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkArrayBoolean_value_1');
      console.info("[LinkArrayBoolean_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkArrayBoolean_0400] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false index:1');
      console.info('[LinkArrayBoolean_0400] END');
      done();
    });
  })
}