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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ChipGroupApi1() {
  describe('ChipGroupApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipGroupApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/ChipGroupApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipGroupApi1 state pages:" + JSON.stringify(pages));
        if (!("ChipGroupApi1" == pages.name)) {
          console.info("get ChipGroupApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipGroupApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupApi1 page error:" + err);
      }
      console.info("ChipGroupApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number ChipGroupApi1_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('ChipGroupApi1_0100', 0, async (done: Function) => {
      console.info('ChipGroupApi1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("ChipGroupApi1_btn1"));
      await btn1.click()
      await CommonFunc.sleep(1000);

      // sendEventByKey('ChipGroupApi1_btn1',10,"")


      let text1 = getInspectorByKey('ChipGroupApi1_text1');
      expect(JSON.stringify(JSON.parse(text1).$attrs.content)).assertEqual('"SymbolGlyph"');
      await CommonFunc.sleep(1000);

      console.info('ChipGroupApi1_0100 END');
      done();
    });

  })
}