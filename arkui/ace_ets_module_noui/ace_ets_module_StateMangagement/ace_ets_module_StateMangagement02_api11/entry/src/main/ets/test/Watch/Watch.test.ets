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
export default function WatchTest() {
  describe('WatchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WatchTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Watch/Watch',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WatchTest state pages: " + JSON.stringify(pages));
        if (!("Watch" == pages.name)) {
          console.info("get WatchTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push WatchTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WatchTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   WatchTest_0100
     * @tc.number Computed
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WatchTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('WatchTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('watchButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('totalText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WatchTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Total: 17.00 €');

      strJson = getInspectorByKey('priceText');
      obj = JSON.parse(strJson);
      console.info("[WatchTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Price: 17.00 €');

      console.info('[WatchTest_0100] END');
      done();
    });
  })
}

