/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function inputMethodListTest() {
  describe('inputMethodListTest', () => {
    beforeEach(async (done: Function) => {
      console.info("inputMethodListTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/InputMethodList/inputMethodListTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get inputMethodListTest state pages:" + JSON.stringify(pages));
        if (!("inputMethodListTest" == pages.name)) {
          console.info("get inputMethodListTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push inputMethodListTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push inputMethodListTest page error:" + err);
      }
      console.info("inputMethodListTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("inputMethodListTest after each called");
    });


    /**
     * @tc.number inputMethodListTest_0100
     * @tc.name inputMethodListTest_0100
     * @tc.desc Test defaultSelected
     * @tc.level Level 2
     */
    it('inputMethodListTest_0100', 0, async (done: Function) => {
      console.info('inputMethodListTest_0100 START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let open = await driver.findComponent(ON.id('inputMethodListTest_col'));
      await open.click()
      console.info("[addParallelGestureTest1_0100] text");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('inputMethodListTest_text');
      await CommonFunc.sleep(1000);
      console.info("[inputMethodListTest_0100] obj1 is: " + JSON.stringify(strJson1));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('1');

      await driver.triggerKey(2070);
      await CommonFunc.sleep(2000);

      console.info('inputMethodListTest_0100 END');
      done();
    });
  })
}