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


export default function RichEditor006() {
  describe('RichEditor006', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEmoji/RichEditor006',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor006 state pages: " + JSON.stringify(pages));
        if (!("RichEditor006" == pages.name)) {
          console.info("get RichEditor006 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(4000);
          console.info("push RichEditor006 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor006 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_0009
     * @tc.name  : Test the RichEditor doubleClick event
     * @tc.desc  : Test RichEditor Emojis by using symbols before and after the emoji, and the delete button cannot delete the emoji behind the cursor
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_0009',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_0009 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let back = await driver.findComponent(ON.id('back'));
      back.click();
      await CommonFunc.sleep(500);
      let point = await driver.findComponent(ON.id('get_position'));
      point.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('position_text'));
      let beginPosition = await text.getText();

      //KEYCODE_DEL
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);

      point.click();
      await CommonFunc.sleep(1000);
      let endPosition = await text.getText();

      expect(parseInt(beginPosition)).assertLarger(parseInt(endPosition));
      done();
    });
  })
}


