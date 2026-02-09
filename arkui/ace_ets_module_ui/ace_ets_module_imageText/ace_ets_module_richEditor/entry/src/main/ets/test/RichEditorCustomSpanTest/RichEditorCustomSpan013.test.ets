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

export default function RichEditorCustomSpan013() {
  describe('RichEditorCustomSpan013', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan013 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan013',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan013 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan013" == pages.name)) {
          console.info("get RichEditorCustomSpan013 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan013 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan013 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0020
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0020
     * @tc.desc   Test RichEditor Custom Span by clearing all styles of attribute string objects using clearStyles()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0020 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan013'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let add_text = await driver.findComponent(ON.id('addText'));
      await add_text.click();
      await CommonFunc.sleep(500);
      let image_top = await driver.findComponent(ON.id('addImage'));
      await image_top.click();
      await CommonFunc.sleep(500);
      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      expect(stylesInfoText).assertContain('stylesInfo:[{"start":12,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"custom"}},{"start":11,"length":1,"styledKey":300,"styledValue":{}},{"start":0,"length":6,"styledKey":0,"styledValue":{}},{"start":6,"length":5,"styledKey":0,"styledValue":{}}]');
      await CommonFunc.sleep(500);
      let clearStyles = await driver.findComponent(ON.id('clearStyles'));
      await clearStyles.click();
      await CommonFunc.sleep(500);
      await getStyles.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      expect(stylesInfoText).assertContain('stylesInfo:[]');
      done();
    });

  })
}


