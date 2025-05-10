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
import CommonFunc from "../../../MainAbility/common/Common";
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function navigationApi1() {
  describe('navigationApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("navigationApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationApi/navigationApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigationApi1 state pages:" + JSON.stringify(pages));
        if (!("navigationApi1" == pages.name)) {
          console.info("get navigationApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigationApi1 page error:" + err);
      }
      console.info("navigationApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("navigationApi1 after each called");
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_navigationApi1_0100
     * @tc.name testSpan
     * @tc.desc set api
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('navigationApi1_0100', 0, async (done: Function) => {
      console.info('[navigationApi1_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('navigationApi1_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('navigationApi1_btn2'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('navigationApi1_text1');
      expect(JSON.parse(text1).$attrs.content).assertEqual('POP');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
