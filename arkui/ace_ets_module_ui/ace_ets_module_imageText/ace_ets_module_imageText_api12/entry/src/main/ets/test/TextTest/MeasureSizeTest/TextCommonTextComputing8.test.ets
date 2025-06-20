/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function TextCommonTextComputing8() {
  describe('TextCommonTextComputing8', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0440',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextCommonTextComputing state pages: ' + JSON.stringify(pages));
        if (!('measureSize' == pages.name)) {
          console.info('get TextCommonTextComputing state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info('push TextCommonTextComputing page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextCommonTextComputing page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0440
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when maxLines passes to 1, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0440', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0440 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let maxLines_1Btn = await driver.findComponent(ON.id('maxLines_1'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await maxLines_1Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0440] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0460
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when maxLines passes to 10, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0460', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0460 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let maxLines_10Btn = await driver.findComponent(ON.id('maxLines_10'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await maxLines_10Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0460] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0470
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when maxLines passes to -5, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0470', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0470 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let maxLines_5Btn = await driver.findComponent(ON.id('maxLines_-5'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await maxLines_5Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0470] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0480
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when lineHeight passes to -10, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0480', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0480 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let maxLines_fu10Btn = await driver.findComponent(ON.id('lineHeight_-10'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await maxLines_fu10Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0480] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0500
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when lineHeight passes to 330vp, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0500', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0500 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let lineHeight_330Btn = await driver.findComponent(ON.id('lineHeight_330'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await lineHeight_330Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0500] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0510
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when lineHeight passes to 320, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0510', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0510 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let lineHeight_320Btn = await driver.findComponent(ON.id('lineHeight_320'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await lineHeight_320Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0510] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0520
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when lineHeight passes to 15, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0520', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0520 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let lineHeight_15Btn = await driver.findComponent(ON.id('lineHeight_15'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await lineHeight_15Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0520] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0530
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when lineHeight passes to 10vp, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0530', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0530 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let baselineOffset_10vpBtn = await driver.findComponent(ON.id('baselineOffset_10vp'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await baselineOffset_10vpBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0530] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0550
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when baselineOffset passes to 0, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0550', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0550 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let baselineOffset_0Btn = await driver.findComponent(ON.id('baselineOffset_0'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await baselineOffset_0Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0550] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0560
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when baselineOffset passes to -10, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0560', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0560 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let baselineOffset_10Btn = await driver.findComponent(ON.id('baselineOffset_-10'));
      let textComputing0440_1 = await driver.findComponent(ON.id('textComputing0440_1'));
      let textComputing0440_12 = await driver.findComponent(ON.id('textComputing0440_12'));
      let textComputing0440_2 = await driver.findComponent(ON.id('textComputing0440_2'));
      let textComputing0440_22 = await driver.findComponent(ON.id('textComputing0440_22'));
      await CommonFunc.sleep(500);
      await baselineOffset_10Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0440_1.getText();
      let width2 = await textComputing0440_2.getText();
      let width12 = await textComputing0440_12.getText();
      let width22 = await textComputing0440_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0560] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}