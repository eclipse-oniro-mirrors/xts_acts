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
export default function Provider15Test() {
  describe('Provider15Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider15Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider15Test state pages: " + JSON.stringify(pages));
        if (!("Provider15" == pages.name)) {
          console.info("get Provider15Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider15Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider15Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Provider15
     * @tc.name      Provider15Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider15Test_0100', 0, async (done: Function) => {
      console.info('Provider15Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Provider15'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strBut = getInspectorByKey('Provider15');
      let strBut1 = getInspectorByKey('Provider15-01');
      let objBut: ESObject = JSON.parse(strBut);
      let objBut1: ESObject = JSON.parse(strBut1);
      console.info("[Provider15Test_0100] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider15Test_0100] component objBut1 is: " + JSON.stringify(objBut1));
      expect(objBut.$attrs.label).assertEqual('0');
      expect(objBut1.$attrs.label).assertEqual('0');
      console.info('[Provider15Test_0100] END');
      done();
    });
    /**
     * @tc.number    Provider15
     * @tc.name      Provider15Test_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider15Test_0200', 0, async (done: Function) => {
      console.info('Provider15Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Provider15-01'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strBut = getInspectorByKey('Provider15');
      let strBut1 = getInspectorByKey('Provider15-01');
      let objBut: ESObject = JSON.parse(strBut);
      let objBut1: ESObject = JSON.parse(strBut1);
      console.info("[Provider15Test_0100] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider15Test_0100] component objBut1 is: " + JSON.stringify(objBut1));
      expect(objBut.$attrs.label).assertEqual('1');
      expect(objBut1.$attrs.label).assertEqual('1');
      console.info('[Provider15Test_0200] END');
      done();
    });
  })
}

