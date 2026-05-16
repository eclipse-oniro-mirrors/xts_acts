/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function LazyForEachTest0120() {
  describe('LazyForEachTest0120', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachTest0120 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEach0120',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachTest0120 state pages: " + JSON.stringify(pages));
        if (!("LazyForEach0120" == pages.name)) {
          console.info("get LazyForEachTest0120 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push LazyForEachTest0120 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachTest0120 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   LazyForEachTest0120_0100
     * @tc.number LazyForEachTest0120_0100
     * @tc.desc   aceEtsTest_ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LazyForEachTest0120_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('LazyForEachTest0120001 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("LazyForEach0120_1"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloA'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      btn = await driver.findComponent(ON.id("LazyForEach0120_2"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[1]
        .$children[0];
      console.info("[LazyForEachTest0120001] list index 1 is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("Hello1");
      await CommonFunc.sleep(1000);
      obj = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[2]
        .$children[0];
      console.info("[LazyForEachTest0120001] list index 2 is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("Hello0");
      console.info('LazyForEachTest0120_0100 END');
    });
  })
}