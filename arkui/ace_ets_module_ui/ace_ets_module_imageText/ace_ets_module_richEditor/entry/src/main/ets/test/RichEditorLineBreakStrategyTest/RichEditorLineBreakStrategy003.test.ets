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

export default function RichEditorLineBreakStrategy003() {
  describe('RichEditorLineBreakStrategy003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineBreakStrategy003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineBreakStrategy/RichEditorLineBreakStrategy003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineBreakStrategy003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineBreakStrategy003" == pages.name)) {
          console.info("get RichEditorLineBreakStrategy003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineBreakStrategy003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineBreakStrategy003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0003
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0003
     * @tc.desc   Add textSpan to set the LineBreakStrategy property value to -1 and obtain the LineBreakStrategy property value to test RichEditor LayoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0003 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineBreakStrategy003'));
      let pointCenter = await rich.getBoundsCenter();

      let getAttr = await driver.findComponent(ON.id('getAttr'));
      await getAttr.click();
      await CommonFunc.sleep(500);

      let attributeValue = await driver.findComponent(ON.id('attributeValue'));
      let attributeValueText = await attributeValue.getText();
      await CommonFunc.sleep(500);
      expect(attributeValueText).assertEqual('linebreak attributeValue:GREEDY');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0004
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0004
     * @tc.desc   Updating paragraph styles without setting the lineBroakStratagy property to obtain the value of the lineBrolStrategy property for testing RichEditor LayoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0004 START');
      let driver = Driver.create();

      let updateParagraphStyle = await driver.findComponent(ON.id('updateParagraphStyle'));
      await updateParagraphStyle.click();
      await CommonFunc.sleep(500);

      let getAttr = await driver.findComponent(ON.id('getAttr'));
      await getAttr.click();
      await CommonFunc.sleep(500);

      let attributeValue = await driver.findComponent(ON.id('attributeValue'));
      let attributeValueText = await attributeValue.getText();
      await CommonFunc.sleep(500);
      expect(attributeValueText).assertEqual('linebreak attributeValue:GREEDY');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0005
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0005
     * @tc.desc   Update paragraph style to set lineBreakStrategy to HIGH_QUALITY and obtain the value of the lineBrealStrategy property to test RichEditor LayoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0005 START');
      let driver = Driver.create();

      let updateQuality = await driver.findComponent(ON.id('updateQuality'));
      await updateQuality.click();
      await CommonFunc.sleep(500);

      let getAttr = await driver.findComponent(ON.id('getAttr'));
      await getAttr.click();
      await CommonFunc.sleep(500);

      let attributeValue = await driver.findComponent(ON.id('attributeValue'));
      let attributeValueText = await attributeValue.getText();
      await CommonFunc.sleep(500);
      expect(attributeValueText).assertEqual('linebreak attributeValue:HIGH_QUALITY');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0006
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0006
     * @tc.desc   Update the paragraph style setting to set the lineBrealStrategy property value to -1 and obtain the linebreakStrategy property value to test RichEditor LayoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0006 START');
      let driver = Driver.create();

      let updateGreedy = await driver.findComponent(ON.id('updateGreedy'));
      await updateGreedy.click();
      await CommonFunc.sleep(500);

      let getAttr = await driver.findComponent(ON.id('getAttr'));
      await getAttr.click();
      await CommonFunc.sleep(500);

      let attributeValue = await driver.findComponent(ON.id('attributeValue'));
      let attributeValueText = await attributeValue.getText();
      await CommonFunc.sleep(500);
      expect(attributeValueText).assertEqual('linebreak attributeValue:GREEDY');
      done();
    });

  })
}


