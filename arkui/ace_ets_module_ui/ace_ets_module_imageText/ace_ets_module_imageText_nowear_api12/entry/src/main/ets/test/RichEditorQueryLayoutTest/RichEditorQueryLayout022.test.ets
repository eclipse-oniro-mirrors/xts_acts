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

export default function RichEditorQueryLayout022() {
  describe('RichEditorQueryLayout022', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorQueryLayout022 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorQueryLayout/RichEditorQueryLayout022',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorQueryLayout022 state pages: " + JSON.stringify(pages));
        if (!("RichEditorQueryLayout022" == pages.name)) {
          console.info("get RichEditorQueryLayout022 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorQueryLayout022 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorQueryLayout022 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0021
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0021
     * @tc.desc  : Test RichEditor query for paragraphStyle and layoutStyle by obtaining paragraphStyle and layoutStyle through GetSpans
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0021',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0021 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let getSpans = await driver.findComponent(ON.id('get_content'));
      await getSpans.click();
      await CommonFunc.sleep(1000);

      let layoutStyle = await driver.findComponent(ON.id('layoutStyle'));
      let layoutStyleText = await layoutStyle.getText();
      await CommonFunc.sleep(500);
      expect(layoutStyleText).assertEqual('layoutStyle:{"borderRadius":"25.00px","margin":"[20.00px,20.00px,20.00px,20.00px]"}');

      let paragraphStyle = await driver.findComponent(ON.id('paragraphStyle'));
      let paragraphStyleText = await paragraphStyle.getText();
      await CommonFunc.sleep(500);
      expect(paragraphStyleText).assertContain('"textAlign":1');
      expect(paragraphStyleText).assertContain('"leadingMargin":["16.00vp","0.00vp"]');
      expect(paragraphStyleText).assertContain('"wordBreak":2');
      expect(paragraphStyleText).assertContain('"lineBreakStrategy":0');
      done();
    });

  })
}


