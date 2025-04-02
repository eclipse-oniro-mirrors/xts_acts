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
export default function Provider2Test() {
  describe('Provider2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider2Test state pages: " + JSON.stringify(pages));
        if (!("Provider2" == pages.name)) {
          console.info("get Provider2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider2Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Provider2
     * @tc.name      Provider2Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider2Test_0100', 0, async (done: Function) => {
      console.info('Provider2Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider2Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('0');

      strJson = getInspectorByKey('button2');
      obj = JSON.parse(strJson);
      console.info("[Provider2Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('0');
      console.info('[Provider2Test_0100] END');
      done();
    });
    /**
     * @tc.number    Provider2
     * @tc.name      Provider2Test_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider2Test_0200', 0, async (done: Function) => {
      console.info('Provider2Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider2Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('1');

      strJson = getInspectorByKey('button1');
      obj = JSON.parse(strJson);
      console.info("[Provider2Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('1');
      console.info('[Provider2Test_0200] END');
      done();
    });
  })
}

