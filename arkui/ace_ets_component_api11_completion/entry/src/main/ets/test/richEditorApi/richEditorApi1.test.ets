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
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function richEditorApi1() {
  describe('richEditorApi1', function () {
    beforeEach(async function (done) {
      console.info("richEditorApi1 beforeEach start");
      let options = {
        url: 'MainAbility/pages/richEditorApi/richEditorApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi1 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi1" == pages.name)) {
          console.info("get richEditorApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi1 page error:" + err);
      }
      console.info("richEditorApi1 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi1 after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_RICHEDITORAPI1_0100
     * @tc.name      testRichEditor
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('richEditorApi1_0100', 0, async function (done) {
      console.info('[richEditorApi1_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let RichEditor1 = CommonFunc.getComponentRect('RichEditor1')
      await driver.longClick(parseInt((RichEditor1.right-RichEditor1.left)*0.5+RichEditor1.left),
        parseInt((RichEditor1.bottom-RichEditor1.top)*0.5+RichEditor1.top))
      await CommonFunc.sleep(2000);

      let button1: Component = await driver.findComponent(ON.text('复制'));
      button1.click()
      await CommonFunc.sleep(1000);

      await driver.longClick(parseInt((RichEditor1.right-RichEditor1.left)*0.5+RichEditor1.left),
        parseInt((RichEditor1.bottom-RichEditor1.top)*0.5+RichEditor1.top))
      await CommonFunc.sleep(2000);

      let button2: Component = await driver.findComponent(ON.text('粘贴'));
      button2.click()
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('richEditorApi1_text1');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('222');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
