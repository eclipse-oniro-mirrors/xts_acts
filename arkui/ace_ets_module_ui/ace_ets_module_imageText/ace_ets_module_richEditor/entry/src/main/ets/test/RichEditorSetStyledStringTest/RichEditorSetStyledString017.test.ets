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
import Utils from '../../MainAbility/common/Utils';

export default function RichEditorSetStyledString017() {
  describe('RichEditorSetStyledString017', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString017 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString017',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString017 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString017" == pages.name)) {
          console.info("get RichEditorSetStyledString017 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString017 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString017 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0052
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0052
     * @tc.desc   Validate the fontColor attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0052',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0052 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString017'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      let get_fontColor = await driver.findComponent(ON.id('get_fontColor'));
      await get_fontColor.click();
      await CommonFunc.sleep(500);
      let colorStr = await driver.findComponent(ON.id('colorStr'));
      let colorStrText = await colorStr.getText();
      await CommonFunc.sleep(500);
      expect(colorStrText).assertContain('colorStr:#FFFFA500,#FF0000FF,#FFFF00FF,#FFFF0000,');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0053
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0053
     * @tc.desc   Validate the fontSize attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0053',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0053 START');
      let driver = Driver.create();
      let sizeStr = await driver.findComponent(ON.id('sizeStr'));
      let sizeStrText = await sizeStr.getText();
      await CommonFunc.sleep(500);
      expect(sizeStrText).assertContain('sizeStr:10,20,30,40,');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0054
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0054
     * @tc.desc   Validate the fontStyle attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0054',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0054 START');
      let driver = Driver.create();
      let styleStr = await driver.findComponent(ON.id('styleStr'));
      let styleStrText = await styleStr.getText();
      await CommonFunc.sleep(500);
      expect(styleStrText).assertContain('styleStr:1,0,undefined,undefined,');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0055
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0055
     * @tc.desc   Validate the fontWeight attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0055',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0055 START');
      let driver = Driver.create();
      let weightStr = await driver.findComponent(ON.id('weightStr'));
      let weightStrText = await weightStr.getText();
      await CommonFunc.sleep(500);
      expect(weightStrText).assertContain('weightStr:11,9,13,10,');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0056
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0056
     * @tc.desc   Validate the fontFamily attribute of the attribute string to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0056',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0056 START');
      let driver = Driver.create();
      let familyStr = await driver.findComponent(ON.id('familyStr'));
      let familyStrText = await familyStr.getText();
      await CommonFunc.sleep(500);
      let str = 'familyStr:' + Utils.FONT_FAMILY + ',Arial,Arial,Arial,';
      expect(familyStrText).assertContain(str);
      done();
    });
  })
}


