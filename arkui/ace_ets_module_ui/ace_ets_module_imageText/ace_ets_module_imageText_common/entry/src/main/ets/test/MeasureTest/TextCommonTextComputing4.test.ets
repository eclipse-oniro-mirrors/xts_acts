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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function TextCommonTextComputing4() {
  describe('TextCommonTextComputing4', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Measure/TextCommonTextComputing0160',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextCommonTextComputing state pages: ' + JSON.stringify(pages));
        if (!('TextCommonTextComputing0160' == pages.name)) {
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
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160
     * @tc.desc   Test MeasureTextSize when fontStyle passes to Normal, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_normalBtn = await driver.findComponent(ON.id('fontStyle_normal'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await fontStyle_normalBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0160_1.getText();
      let width2 = await textComputing0160_2.getText();
      let width12 = await textComputing0160_12.getText();
      let width22 = await textComputing0160_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170
     * @tc.desc   Test MeasureTextSize when fontStyle passes to Italic, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_ItalicBtn = await driver.findComponent(ON.id('fontStyle_Italic'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await fontStyle_ItalicBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0160_1.getText();
      let width2 = await textComputing0160_2.getText();
      let width12 = await textComputing0160_12.getText();
      let width22 = await textComputing0160_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190
     * @tc.desc   Test MeasureTextSize when fontStyle passes to -100, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_100Btn = await driver.findComponent(ON.id('fontStyle-100'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await fontStyle_100Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0160_1.getText();
      let width2 = await textComputing0160_2.getText();
      let width12 = await textComputing0160_12.getText();
      let width22 = await textComputing0160_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270
     * @tc.desc   Test MeasureTextSize when fontFamily passes to $(app.string.fontFanily), view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontFamily_resBtn = await driver.findComponent(ON.id('fontFamily_res'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await fontFamily_resBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0160_1.getText();
      let width2 = await textComputing0160_2.getText();
      let width12 = await textComputing0160_12.getText();
      let width22 = await textComputing0160_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280
     * @tc.desc   Test MeasureTextSize when fontFamily set value, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontFamily_ohBtn = await driver.findComponent(ON.id('fontFamily_oh'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await fontFamily_ohBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0160_1.getText();
      let width2 = await textComputing0160_2.getText();
      let width12 = await textComputing0160_12.getText();
      let width22 = await textComputing0160_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}