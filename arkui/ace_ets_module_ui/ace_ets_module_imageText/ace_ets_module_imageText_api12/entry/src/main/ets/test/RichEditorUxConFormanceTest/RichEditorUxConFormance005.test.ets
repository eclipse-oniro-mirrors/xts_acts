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

export default function RichEditorUxConFormance005() {
  describe('RichEditorUxConFormance005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorUxConFormance005 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorUxConFormance/RichEditorUxConFormance005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorUxConFormance005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorUxConFormance005" == pages.name)) {
          console.info("get RichEditorUxConFormance005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorUxConFormance005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorUxConFormance005 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_font_size').id)
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0002
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0002
     * @tc.desc  : Set font size to 0 to test RichEditor UXConformance
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0002 START');
      let driver = Driver.create();

      let get_spans = await driver.findComponent(ON.id('get_spans'));
      await get_spans.click();
      await CommonFunc.sleep(1000);

      let spanInfo = await driver.findComponent(ON.id('spanInfo'));
      let spanInfoText = await spanInfo.getText();
      await CommonFunc.sleep(500);
      expect(spanInfoText.indexOf('"fontSize":'+px2vp(resourceSize)) > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0003
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0003
     * @tc.desc  : Set negative font size to test RichEditor UXCorrormance
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0003 START');
      let driver = Driver.create();

      let updateSpanStyle = await driver.findComponent(ON.id('updateSpanStyle'));
      await updateSpanStyle.click();
      await CommonFunc.sleep(1000);

      let get_spans = await driver.findComponent(ON.id('get_spans'));
      await get_spans.click();
      await CommonFunc.sleep(1000);

      let spanInfo = await driver.findComponent(ON.id('spanInfo'));
      let spanInfoText = await spanInfo.getText();
      await CommonFunc.sleep(500);
      expect(spanInfoText.indexOf('"fontSize":'+px2vp(resourceSize)) > 0).assertEqual(true);
      done();
    });

  })
}


