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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Provider4Test() {
  describe('Provider4Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider4Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider4Test state pages: " + JSON.stringify(pages));
        if (!("Provider4" == pages.name)) {
          console.info("get Provider4Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider4Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider4Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Provider4Test_0100
     * @tc.name      Provider4Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider4Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Provider4Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('parents'));
      await text.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('parents');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider4Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('parents:11');

      strJson = getInspectorByKey('AComp');
      obj = JSON.parse(strJson);
      console.info("[Provider4Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('AComp:11');

      strJson = getInspectorByKey('valText');
      obj = JSON.parse(strJson);
      console.info("[Provider4Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('11');

      console.info('[Provider4Test_0100] END');
      done();
    });
    /**
     * @tc.number    Provider4Test_0200
     * @tc.name      Provider4Test_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider4Test_0200', Level.LEVEL0, async (done: Function) => {
      console.info('Provider4Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('AComp'));
      await text.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('AComp');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider4Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('AComp:12');

      strJson = getInspectorByKey('parents');
      obj = JSON.parse(strJson);
      console.info("[Provider4Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('parents:12');

      strJson = getInspectorByKey('valText');
      obj = JSON.parse(strJson);
      console.info("[Provider4Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('12');

      console.info('[Provider4Test_0200] END');
      done();
    });
  })
}

