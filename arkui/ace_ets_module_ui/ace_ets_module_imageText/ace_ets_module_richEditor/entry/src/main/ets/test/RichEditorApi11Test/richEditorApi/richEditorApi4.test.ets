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
import CommonFunc from '../../../MainAbility/common/Common';
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

export default function richEditorApi4() {
  describe('richEditorApi4', () => {
    beforeEach(async (done: Function) => {
      console.info("richEditorApi4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi11/richEditorApi/richEditorApi4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi4 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi4" == pages.name)) {
          console.info("get richEditorApi4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorApi4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi4 page error:" + err);
      }
      console.info("richEditorApi4 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi4 after each called");
    });
    /**
     * @tc.name   richEditorApi4_0100
     * @tc.number SUB_ACE_RICHEDITOR_RICHEDITORAPI1_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorApi4_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorApi4_0100] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('richEditorApi4_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('richEditorApi4_btn2'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('richEditorApi4_text1');
      let Obj1: ESObject = JSON.parse(text1);
      let content : ESObject = JSON.parse(Obj1.$attrs.content);
      console.info('[richEditorApi4_0100] content:' + content.fontSize);
      console.info('[richEditorApi4_0100] content:' + content.fontColor);
      console.info('[richEditorApi4_0100] content:' + content.fontFeature);
      console.info('[richEditorApi4_0100] content:' + content.decoration.type);
      console.info('[richEditorApi4_0100] content:' + content.decoration.color);
      expect('' + content.fontSize).assertEqual('50');
      expect('' + content.fontColor).assertEqual('#FF182431');
      expect('' + content.fontFeature).assertEqual('');
      expect('' + content.decoration.type).assertEqual('0');
      expect('' + content.decoration.color).assertEqual('#FF182431');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
