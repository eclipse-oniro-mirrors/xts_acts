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

export default function TextCommonTextComputing1() {
  describe('TextCommonTextComputing1', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Measure/TextCommonTextComputing0010',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextCommonTextComputing state pages: ' + JSON.stringify(pages));
        if (!('TextCommonTextComputing0010' == pages.name)) {
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
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0010
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0010
     * @tc.desc   Test the MeasureTextSize function when the textContent is presented in Chinese, and view the return width/size result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0010 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await driver.findComponent(ON.id('resetInChinese'));
      let textComputing0010_1 = await driver.findComponent(ON.id('textComputing0010_1'));
      let textComputing0010_12 = await driver.findComponent(ON.id('textComputing0010_12'));
      let textComputing0010_2 = await driver.findComponent(ON.id('textComputing0010_2'));
      let textComputing0010_22 = await driver.findComponent(ON.id('textComputing0010_22'));
      await CommonFunc.sleep(1000);
      await resetInChineseBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0010_1.getText();
      let width2 = await textComputing0010_2.getText();
      let width12 = await textComputing0010_12.getText();
      let width22 = await textComputing0010_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0010] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0020
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0020
     * @tc.desc   Test the MeasureTextSize function when the textContent is presented in Chinese and English, and view the return width/size result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0020 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await driver.findComponent(ON.id('resetInChEn'));
      let textComputing0010_1 = await driver.findComponent(ON.id('textComputing0010_1'));
      let textComputing0010_12 = await driver.findComponent(ON.id('textComputing0010_12'));
      let textComputing0010_2 = await driver.findComponent(ON.id('textComputing0010_2'));
      let textComputing0010_22 = await driver.findComponent(ON.id('textComputing0010_22'));
      await CommonFunc.sleep(500);
      await resetInChineseBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0010_1.getText();
      let width2 = await textComputing0010_2.getText();
      let width12 = await textComputing0010_12.getText();
      let width22 = await textComputing0010_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0020] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0030
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0030
     * @tc.desc   Test the MeasureTextSize function When the textContent vote is Chinese, Japanese, and Korean mixed English, and view the return width/size result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0030',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0030 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await driver.findComponent(ON.id('resetInChEnJaHa'));
      let textComputing0010_1 = await driver.findComponent(ON.id('textComputing0010_1'));
      let textComputing0010_12 = await driver.findComponent(ON.id('textComputing0010_12'));
      let textComputing0010_2 = await driver.findComponent(ON.id('textComputing0010_2'));
      let textComputing0010_22 = await driver.findComponent(ON.id('textComputing0010_22'));
      await CommonFunc.sleep(500);
      await resetInChineseBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0010_1.getText();
      let width2 = await textComputing0010_2.getText();
      let width12 = await textComputing0010_12.getText();
      let width22 = await textComputing0010_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0030] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0040
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0040
     * @tc.desc   Test the MeasureTextSize function When the textContent is Chinese+special symbols, and view the return width/size result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0040 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await driver.findComponent(ON.id('resetInChSym'));
      let textComputing0010_1 = await driver.findComponent(ON.id('textComputing0010_1'));
      let textComputing0010_12 = await driver.findComponent(ON.id('textComputing0010_12'));
      let textComputing0010_2 = await driver.findComponent(ON.id('textComputing0010_2'));
      let textComputing0010_22 = await driver.findComponent(ON.id('textComputing0010_22'));
      await CommonFunc.sleep(500);
      await resetInChineseBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0010_1.getText();
      let width2 = await textComputing0010_2.getText();
      let width12 = await textComputing0010_12.getText();
      let width22 = await textComputing0010_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0040] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}