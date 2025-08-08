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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Monitor6Test() {
  describe('Monitor6Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Monitor6Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Monitor/Monitor6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Monitor6Test state pages: " + JSON.stringify(pages));
        if (!("Monitor6" == pages.name)) {
          console.info("get Monitor6Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor6Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor6Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Monitor6
     * @tc.name      Monitor6Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Monitor6Test_0100', 0, async (done: Function) => {
      console.info('Monitor6Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Monitor6_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Monitor6Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('测试1：fail');
      console.info('[Monitor6Test_0100] END');
      done();
    });
    /**
     * @tc.number    Monitor6
     * @tc.name      Monitor6Test_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Monitor6Test_0200', 0, async (done: Function) => {
      console.info('Monitor6Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Monitor6_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Monitor6Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('测试2：fail');
      console.info('[Monitor6Test_0200] END');
      done();
    });
    /**
     * @tc.number    Monitor6
     * @tc.name      Monitor6Test_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Monitor6Test_0300', 0, async (done: Function) => {
      console.info('Monitor6Test_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Monitor6_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Monitor6Test_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('测试3：fail');
      console.info('[Monitor6Test_0300] END');
      done();

    /**
     * @tc.number    Monitor6
     * @tc.name      Monitor6Test_0400
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Monitor6Test_0400', 0, async (done: Function) => {
      console.info('Monitor6Test_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Monitor6_4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Monitor6Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('测试4：fail');
      console.info('[Monitor6Test_0400] END');
      done();
    });
    });
  })
}

