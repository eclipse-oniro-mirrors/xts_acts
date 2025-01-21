/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  PointerMatrix,
  MouseButton
} from '@ohos.UiTest';

export default function richEditorApi3() {
  describe('richEditorApi3', () => {
    beforeEach(async (done: Function) => {
      console.info("richEditorApi3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/richEditor/richEditorApi/richEditorApi3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi3 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi3" == pages.name)) {
          console.info("get richEditorApi3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
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
     * @tc.number SUB_ACE_RICHEDITOR_richEditorApi3_0100
     * @tc.name testRichEditor
     * @tc.desc set api
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('richEditorApi3_0100', 0, async (done: Function) => {
      console.info('[richEditorApi3_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.mouseClick({
        x: 300, y: 300
      }, MouseButton.MOUSE_BUTTON_LEFT)
      await CommonFunc.sleep(2000);

      console.info("text1111");
      let text1 = getInspectorByKey('richEditorApi3_text1');
      console.info("text2222");

      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('222');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
