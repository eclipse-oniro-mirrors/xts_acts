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

export default function LocalStoageLinkThreeJsunit() {
  describe('LocalStoageLinkThreeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStoageLinkThreeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/localStorage/LocalStoageLinkThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStoageLinkThreeTest state pages: " + JSON.stringify(pages));
        if (!("LocalStoageLinkThree" == pages.name)) {
          console.info("get LocalStoageLinkThreeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStoageLinkThreeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStoageLinkThreeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   LocalStoageLinkThreeTest_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STORAGE_INTERFACE_0040
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStoageLinkThreeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('LocalStoageLinkThreeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('navButton'));
      await button.click();
      await CommonFunc.sleep(3000);

      let strJson = getInspectorByKey('navText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalStoageLinkThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('PropA');

      strJson = getInspectorByKey('navText4');
      obj = JSON.parse(strJson);
      console.info("[LocalStoageLinkThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('PropA');

      button = await driver.findComponent(ON.id('navButton1'));
      await button.click();
      await CommonFunc.sleep(3000);

      strJson = getInspectorByKey('navText2');
      obj = JSON.parse(strJson);
      console.info("[LocalStoageLinkThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Hello World');

      button = await driver.findComponent(ON.id('navButton2'));
      await button.click();
      await CommonFunc.sleep(3000);

      strJson = getInspectorByKey('navText3');
      obj = JSON.parse(strJson);
      console.info("[LocalStoageLinkThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('pageThreeStack');

      button = await driver.findComponent(ON.id('navButton3'));
      await button.click();
      await CommonFunc.sleep(3000);

      strJson = getInspectorByKey('navText');
      obj = JSON.parse(strJson);
      console.info("[LocalStoageLinkThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('PropA');

      console.info('[LocalStoageLinkThreeTest_0100] END');
      done();
    });
  })
}

