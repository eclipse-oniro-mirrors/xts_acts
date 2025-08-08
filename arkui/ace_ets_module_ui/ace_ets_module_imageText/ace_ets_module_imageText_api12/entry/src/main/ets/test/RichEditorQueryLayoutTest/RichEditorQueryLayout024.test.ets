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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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

export default function RichEditorQueryLayout024() {
  describe('RichEditorQueryLayout024', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorQueryLayout024 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorQueryLayout/RichEditorQueryLayout024',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorQueryLayout024 state pages: " + JSON.stringify(pages));
        if (!("RichEditorQueryLayout024" == pages.name)) {
          console.info("get RichEditorQueryLayout024 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorQueryLayout024 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorQueryLayout024 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0019
     * @tc.name  : Test the RichEditor query for paragraphStyle and layoutStyle
     * @tc.desc  : Test RichEditor query for paragraphStyle and layoutStyle by obtaining paragraphStyle and layoutStyle through onSelect
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0019', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0019 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click();
      await CommonFunc.sleep(1000);

      let selectValue = await driver.findComponent(ON.id('selectValue'));
      let selectValueText = await selectValue.getText();
      await CommonFunc.sleep(500);
      expect(selectValueText.indexOf('"paragraphStyle":{"textAlign":0,"leadingMargin":["16.00vp","0.00vp"]') > 0).assertEqual(true);
      expect(selectValueText.indexOf('"layoutStyle":{"borderRadius":"20.00px","margin":"[30.00px,30.00px,30.00px,30.00px]"') > 0).assertEqual(true);
      done();
    });

  })
}


