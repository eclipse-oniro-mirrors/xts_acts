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

export default function RichEditorCustomSpan012() {
  describe('RichEditorCustomSpan012', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan012 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan012',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan012 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan012" == pages.name)) {
          console.info("get RichEditorCustomSpan012 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan012 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan012 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0018
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0018
     * @tc.desc   Clear the specified type style of the specified range content through removeStyle (). The clear positions include pictures, attribute string and CustomSpan to test RichEditor CustomSpan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0018',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0018 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan012'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let add_text = await driver.findComponent(ON.id('add_text'));
      await add_text.click();
      await CommonFunc.sleep(500);
      let image_top = await driver.findComponent(ON.id('image_top'));
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
      expect(stylesInfoText).assertContain('stylesInfo:[{"start":6,"length":5,"styledKey":0,"styledValue":{}}]');
      await CommonFunc.sleep(500);
      let removeStyle = await driver.findComponent(ON.id('removeStyle'));
      await removeStyle.click();
      await CommonFunc.sleep(500);
      await getStyles.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      expect(stylesInfoText).assertContain('stylesInfo:[]');
      done();
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0019
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0019
     * @tc.desc   Test RichEditor CustomSpan through reminding all styles of specified content through removeStyles ()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0019',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0019 START');
      let driver = Driver.create();
      let getStylesAll = await driver.findComponent(ON.id('getStylesAll'));
      await getStylesAll.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      expect(stylesInfoText).assertContain('stylesInfo:[{"start":0,"length":6,"styledKey":0,"styledValue":{}}]');
      await CommonFunc.sleep(500);
      let removeStyleAll = await driver.findComponent(ON.id('removeStyleAll'));
      await removeStyleAll.click();
      await CommonFunc.sleep(500);
      await getStylesAll.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      expect(stylesInfoText).assertContain('stylesInfo:[]');
      done();
    });

  })
}


