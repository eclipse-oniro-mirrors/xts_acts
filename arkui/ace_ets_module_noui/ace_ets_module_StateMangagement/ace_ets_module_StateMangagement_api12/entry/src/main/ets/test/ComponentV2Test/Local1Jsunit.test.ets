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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Local1Jsunit() {
  describe('Local1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Local1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/Local1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Local1Jsunit state pages:" + JSON.stringify(pages));
        if (!("Local1" == pages.name)) {
          console.info("get Local1Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Local1Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Local1Jsunit page error:" + err);
      }
      console.info("Local1Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Local1Jsunit after each called");
    });

    /**
     * @tc.number    Local1Jsunit_001
     * @tc.name      Local1Jsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('Local1Jsunit_001', 0, async (done: Function) => {
      console.info('[Local1Jsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("change_text"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('mess_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Local1Jsunit_001] component obj is: " + JSON.stringify(obj));
      console.info("[Local1Jsunit_001] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Hello ARKUI ARKUI ARKUI ARKUI');
      console.info('[Local1Jsunit_001] END');
      done();
    });
  })
}
