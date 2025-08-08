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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function RichEditorQueryLayout020() {
  describe('RichEditorQueryLayout020', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorQueryLayout020 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorQueryLayout/RichEditorQueryLayout020',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorQueryLayout020 state pages: " + JSON.stringify(pages));
        if (!("RichEditorQueryLayout020" == pages.name)) {
          console.info("get RichEditorQueryLayout020 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorQueryLayout020 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorQueryLayout020 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0022
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0022
     * @tc.desc  : Test RichEditor query for paragraphStyle and layoutStyle by obtaining paragraphStyle and layoutStyle through aboutToDelete
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0022',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0022 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      let delLayoutStyle = await driver.findComponent(ON.id('delLayoutStyle'));
      let delLayoutStyleText = await delLayoutStyle.getText();
      await CommonFunc.sleep(500);
      expect(delLayoutStyleText.indexOf('"layoutStyle":{"borderRadius":"10.00px","margin":"[21.00px,21.00px,21.00px,21.00px]"') > 0).assertEqual(true);

      let paragraphStyle = await driver.findComponent(ON.id('paragraphStyle'));
      let paragraphStyleText = await paragraphStyle.getText();
      await CommonFunc.sleep(500);
      expect(paragraphStyleText).assertContain('"textAlign":0');
      expect(paragraphStyleText).assertContain('"leadingMargin":["20.00vp","0.00vp"]');
      expect(paragraphStyleText).assertContain('"wordBreak":2');
      expect(paragraphStyleText).assertContain('"lineBreakStrategy":0');
      done();
    });

  })
}


