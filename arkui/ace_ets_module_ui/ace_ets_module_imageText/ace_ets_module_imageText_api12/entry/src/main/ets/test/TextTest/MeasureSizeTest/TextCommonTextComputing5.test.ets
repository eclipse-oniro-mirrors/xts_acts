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
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function TextCommonTextComputing5() {
  describe('TextCommonTextComputing5', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0200',
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
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Bold, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_BoldBtn = await driver.findComponent(ON.id('fontWeight_Bold'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_BoldBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Medium, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_MediumBtn = await driver.findComponent(ON.id('fontWeight_Medium'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_MediumBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Lighter, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_LighterBtn = await driver.findComponent(ON.id('fontWeight_Lighter'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_LighterBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Normal, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_NormalBtn = await driver.findComponent(ON.id('fontWeight_Normal'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_NormalBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to 200, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_200Btn = await driver.findComponent(ON.id('fontWeight_200'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_200Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to 500, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_500Btn = await driver.findComponent(ON.id('fontWeight_500'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_500Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to -700, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_700Btn = await driver.findComponent(ON.id('fontWeight_-700'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await fontWeight_700Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0200_1.getText();
      let width2 = await textComputing0200_2.getText();
      let width12 = await textComputing0200_12.getText();
      let width22 = await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}