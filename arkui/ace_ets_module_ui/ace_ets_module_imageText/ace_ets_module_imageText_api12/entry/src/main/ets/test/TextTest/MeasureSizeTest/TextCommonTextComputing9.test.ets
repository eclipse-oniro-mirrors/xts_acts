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

export default function TextCommonTextComputing9() {
  describe('TextCommonTextComputing9', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0570',
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
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570
     * @tc.desc   Test MeasureTextSize when wordBreak passes to WordBreak.BREAK_ALL, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_allBtn = await driver.findComponent(ON.id('wordBreak_all'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await wordBreak_allBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580
     * @tc.desc   Test MeasureTextSize when wordBreak passes to WordBreak.NORMAL, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_NORMALBtn = await driver.findComponent(ON.id('wordBreak_NORMAL'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await wordBreak_NORMALBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590
     * @tc.desc   Test MeasureTextSize when wordBreak passes to WordBreak.BREAK_WORD, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_wordBtn = await driver.findComponent(ON.id('wordBreak_word'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await wordBreak_wordBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600
     * @tc.desc   Test MeasureTextSize when wordBreak does not pass on value, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610
     * @tc.desc   Test MeasureTextSize when textIndent passes to 5%, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_5Btn = await driver.findComponent(ON.id('textIndent-5%'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await textIndent_5Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620
     * @tc.desc   Test MeasureTextSize when textIndent passes to -10, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_10Btn = await driver.findComponent(ON.id('textIndent-10'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await textIndent_10Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630
     * @tc.desc   Test MeasureTextSize when textIndent passes to 100, view the return width/size result result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_100Btn = await driver.findComponent(ON.id('textIndent_100'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await textIndent_100Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0570_1.getText();
      let width2 = await textComputing0570_2.getText();
      let width12 = await textComputing0570_12.getText();
      let width22 = await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}