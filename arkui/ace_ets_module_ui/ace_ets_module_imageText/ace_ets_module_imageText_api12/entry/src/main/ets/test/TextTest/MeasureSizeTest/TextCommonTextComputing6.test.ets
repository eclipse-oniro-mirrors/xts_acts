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

export default function TextCommonTextComputing6() {
  describe('TextCommonTextComputing6', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0290',
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
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290
     * @tc.desc  : Test MeasureTextSize when letterSpacing passes to 10vp, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_10vpBtn = await driver.findComponent(ON.id('letterSpacing_10vp'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await letterSpacing_10vpBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0290_1.getText();
      let width2 = await textComputing0290_2.getText();
      let width12 = await textComputing0290_12.getText();
      let width22 = await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310
     * @tc.desc  : Test MeasureTextSize when letterSpacing passes to -5, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_5Btn = await driver.findComponent(ON.id('letterSpacing_-5'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await letterSpacing_5Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0290_1.getText();
      let width2 = await textComputing0290_2.getText();
      let width12 = await textComputing0290_12.getText();
      let width22 = await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320
     * @tc.desc  : Test MeasureTextSize when letterSpacing passes to 20, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_20Btn = await driver.findComponent(ON.id('letterSpacing_20'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await letterSpacing_20Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0290_1.getText();
      let width2 = await textComputing0290_2.getText();
      let width12 = await textComputing0290_12.getText();
      let width22 = await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330
     * @tc.desc  : Test MeasureTextSize when textAlign passes to TextAlign.End, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_endBtn = await driver.findComponent(ON.id('textAlign_end'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await textAlign_endBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0290_1.getText();
      let width2 = await textComputing0290_2.getText();
      let width12 = await textComputing0290_12.getText();
      let width22 = await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340
     * @tc.desc  : Test MeasureTextSize when textAlign passes to TextAlign.JUSTIFY, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_JUSTIFYBtn = await driver.findComponent(ON.id('textAlign_JUSTIFY'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await textAlign_JUSTIFYBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0290_1.getText();
      let width2 = await textComputing0290_2.getText();
      let width12 = await textComputing0290_12.getText();
      let width22 = await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360
     * @tc.desc  : Test MeasureTextSize when textAlign passes to TextAlign.Start, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_StartBtn = await driver.findComponent(ON.id('textAlign_Start'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await textAlign_StartBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0290_1.getText();
      let width2 = await textComputing0290_2.getText();
      let width12 = await textComputing0290_12.getText();
      let width22 = await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}