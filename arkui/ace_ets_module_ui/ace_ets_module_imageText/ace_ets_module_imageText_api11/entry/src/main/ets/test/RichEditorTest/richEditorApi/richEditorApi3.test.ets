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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function richEditorApi3() {
  describe('richEditorApi3', () => {
    beforeEach(async (done: Function) => {
      console.info("richEditorApi3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/richEditorApi/richEditorApi3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi3 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi3" == pages.name)) {
          console.info("get richEditorApi3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorApi3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi3 page error:" + err);
      }
      console.info("richEditorApi3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi3 after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_richEditorApi3_0100
     * @tc.name      testSpan
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('richEditorApi3_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorApi3_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('richEditorApi3_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('richEditorApi3_btn2'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      console.log('spanParagraphs'+AppStorage.get('getParagraphs_textAlign'))
      console.log('spanParagraphs'+JSON.stringify(AppStorage.get('getParagraphs_size')))
      expect(AppStorage.get('getParagraphs_textAlign')).assertEqual(0)
      expect(JSON.stringify(AppStorage.get('getParagraphs_size'))).assertEqual('{"size":["16.00vp","0.00vp"]}')
      AppStorage.delete('getParagraphs_textAlign')
      AppStorage.delete('getParagraphs_size')
      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
