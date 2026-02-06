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

export default function richEditorApi31() {
  describe('richEditorApi31', () => {
    beforeEach(async (done: Function) => {
      console.info("richEditorApi31 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi11/richEditorApi/richEditorApi3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi31 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi3" == pages.name)) {
          console.info("get richEditorApi31 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorApi31 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi31 page error:" + err);
      }
      console.info("richEditorApi31 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi31 after each called");
    });
    /**
     * @tc.name   richEditorApi31_0100
     * @tc.number SUB_ACE_RICHEDITOR_richEditorApi31_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorApi31_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorApi31_0100] START');
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
