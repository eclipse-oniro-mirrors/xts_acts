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

export default function TextCommonTextComputing7() {
  describe('TextCommonTextComputing7', () => {
    beforeEach(async (done: Function) => {
      console.info('TextCommonTextComputing beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0370',
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
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370
     * @tc.desc  : Test MeasureTextSize when overflow passes to Text0verflow.Ellipsis, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let overflow_EllipsisBtn = await driver.findComponent(ON.id('overflow_Ellipsis'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await overflow_EllipsisBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380
     * @tc.desc  : Test MeasureTextSize when overflow passes to Text0verflow.Clip, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let overflow_ClipBtn = await driver.findComponent(ON.id('overflow_Clip'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await overflow_ClipBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390
     * @tc.desc  : Test MeasureTextSize when overflow passes to Text0verflow.None, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let overflow_NoneBtn = await driver.findComponent(ON.id('overflow_None'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await overflow_NoneBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400
     * @tc.desc  : Test MeasureTextSize when overflow passes to Text0verflow.Marquee, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let overflow_MARQUEEBtn = await driver.findComponent(ON.id('overflow_MARQUEE'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await overflow_MARQUEEBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410
     * @tc.desc  : Test MeasureTextSize when textCase passes to TextCase.Normal, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textCase_NormalBtn = await driver.findComponent(ON.id('textCase_Normal'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await textCase_NormalBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420
     * @tc.desc  : Test MeasureTextSize when textCase passes to TextCase.LowerCase, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textCase_LowerCaseBtn = await driver.findComponent(ON.id('textCase_LowerCase'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await textCase_LowerCaseBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0430
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0430
     * @tc.desc  : Test MeasureTextSize when textCase passes to TextCase.UpperCase, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0430',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0430 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let textCase_UpperCaseBtn = await driver.findComponent(ON.id('textCase_UpperCase'));
      let textComputing0370_1 = await driver.findComponent(ON.id('textComputing0370_1'));
      let textComputing0370_12 = await driver.findComponent(ON.id('textComputing0370_12'));
      let textComputing0370_2 = await driver.findComponent(ON.id('textComputing0370_2'));
      let textComputing0370_22 = await driver.findComponent(ON.id('textComputing0370_22'));
      await CommonFunc.sleep(500);
      await textCase_UpperCaseBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0370_1.getText();
      let width2 = await textComputing0370_2.getText();
      let width12 = await textComputing0370_12.getText();
      let width22 = await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0430] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}