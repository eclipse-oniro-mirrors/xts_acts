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

export default function RichEditorLayoutStyle002() {
  describe('RichEditorLayoutStyle002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLayoutStyle002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLayoutStyle/RichEditorLayoutStyle002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLayoutStyle002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLayoutStyle002" == pages.name)) {
          console.info("get RichEditorLayoutStyle002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLayoutStyle002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLayoutStyle002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0130
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0130
     * @tc.desc   Set the margin to -1 for left, top, right, and bottom to test RichEditor LayoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0130',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0130 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLayoutStyle002'));
      let pointCenter = await rich.getBoundsCenter();

      let imageStyle = await driver.findComponent(ON.id('imageStyle'));
      let imageStyleText = await imageStyle.getText();
      await CommonFunc.sleep(500);
      expect(imageStyleText.indexOf('"margin":"[0.00px,0.00px,0.00px,0.00px]"') > 0).assertEqual(true);
      done();
    });

  })
}


