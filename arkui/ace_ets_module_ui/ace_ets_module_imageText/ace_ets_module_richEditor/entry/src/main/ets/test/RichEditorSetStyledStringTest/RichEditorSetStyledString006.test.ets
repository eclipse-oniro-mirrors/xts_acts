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

export default function RichEditorSetStyledString006() {
  describe('RichEditorSetStyledString006', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString006',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString006 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString006" == pages.name)) {
          console.info("get RichEditorSetStyledString006 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString006 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString006 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0015
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0015
     * @tc.desc   Call setStyle to set property string style to test RichEditor setStyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0015',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0015 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString006'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      let add_text = await driver.findComponent(ON.id('add_text'));
      await add_text.click();
      await CommonFunc.sleep(500);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      let get_content = await driver.findComponent(ON.id('get_content'));
      await get_content.click();
      await CommonFunc.sleep(500);
      let content = await driver.findComponent(ON.id('content'));
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      let imageStyle = 'verticalAlign:1;objectFit:1{"topLeft":10,"topRight":10,"bottomLeft":10,"bottomRight":10}';
      expect(contentText).assertContain(imageStyle);
      let update_style = await driver.findComponent(ON.id('update_style'));
      await update_style.click();
      await CommonFunc.sleep(500);
      await get_content.click();
      await CommonFunc.sleep(500);
      contentText = await content.getText();
      await CommonFunc.sleep(500);
      imageStyle = 'verticalAlign:2;objectFit:1{"topLeft":20,"topRight":20,"bottomLeft":20,"bottomRight":20}';
      expect(contentText).assertContain(imageStyle);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0016
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0016
     * @tc.desc   Call removeStyle to test the RichEditor setStyledString property string style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0016',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0016 START');
      let driver = Driver.create();
      let get_length = await driver.findComponent(ON.id('get_length'));
      await get_length.click();
      await CommonFunc.sleep(500);
      let lengthStr = await driver.findComponent(ON.id('lengthStr'));
      let lengthStrText = await lengthStr.getText();
      await CommonFunc.sleep(500);
      expect(lengthStrText).assertContain('lengthStr:12');
      let remove = await driver.findComponent(ON.id('remove'));
      await remove.click();
      await CommonFunc.sleep(500);
      await get_length.click();
      await CommonFunc.sleep(500);
      lengthStrText = await lengthStr.getText();
      await CommonFunc.sleep(500);
      expect(lengthStrText).assertContain('lengthStr:11');
      done();
    });
  })
}


