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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function APIUnderlineColorTest() {
  describe('APIUnderlineColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIUnderlineColorTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIUnderlineColorTest state pages:" + JSON.stringify(pages));
        if (!("APIUnderlineColor" == pages.name)) {
          console.info("get  APIUnderlineColorTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/TextInput/APIUnderlineColor"})
          await CommonFunc.sleep(2000);
          console.info("push APIUnderlineColorTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIUnderlineColorTest page error:" + err);
      }
      console.info("APIUnderlineColorTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIUnderlineColorTest after each called");
    });

    /**
     * @tc.number    APIUnderlineColorTest_001
     * @tc.desc      api
     * @tc.level     Level 3
     * @tc.type
     */

    it('APIUnderlineColorTest_001', 0, async (done: Function) => {
      console.info('[APIUnderlineColorTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('APIUnderlineColorButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APIUnderlineColorText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APIUnderlineColorTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('#FF66DD00');
      console.info('[APIUnderlineColorTest_001] END');
      done();
    });
  })
}
