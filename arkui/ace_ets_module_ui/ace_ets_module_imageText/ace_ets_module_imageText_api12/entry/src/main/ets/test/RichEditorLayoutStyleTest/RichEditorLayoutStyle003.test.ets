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

export default function RichEditorLayoutStyle003() {
  describe('RichEditorLayoutStyle003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLayoutStyle003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLayoutStyle/RichEditorLayoutStyle003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLayoutStyle003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLayoutStyle003" == pages.name)) {
          console.info("get RichEditorLayoutStyle003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLayoutStyle003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLayoutStyle003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0090
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0090
     * @tc.desc  : The margin value is undefined to test RichEditor LayoutStyle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0090',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_0090 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLayoutStyle003'));
      let pointCenter = await rich.getBoundsCenter();
      
      let imageStyle = await driver.findComponent(ON.id('imageStyle'));
      let imageStyleText = await imageStyle.getText();
      await CommonFunc.sleep(500);
      expect(imageStyleText.indexOf('"margin":"[0.00px,0.00px,0.00px,0.00px]"') > 0).assertEqual(true);
      done();
    });

  })
}


