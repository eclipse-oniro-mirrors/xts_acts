'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextCommonTextComputing5() {
  describe('TextCommonTextComputing5', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing5 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing5 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0200",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing5 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0200" == pages.name)) {
          console.info("get TextCommonTextComputing5 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing5 page error:" + err);
      }
      console.info("TextCommonTextComputing5 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0200
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0200
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_BoldBtn = await (driver.findComponent(ON.id('fontWeight_Bold')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await fontWeight_BoldBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0200_1.getText();
      let width2 =  await textComputing0200_2.getText();
      let width12 =  await textComputing0200_12.getText();
      let width22 =  await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0210
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0210
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0210
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_MediumBtn = await (driver.findComponent(ON.id('fontWeight_Medium')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await fontWeight_MediumBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0200_1.getText();
      let width2 =  await textComputing0200_2.getText();
      let width12 =  await textComputing0200_12.getText();
      let width22 =  await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0220
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0220
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0220
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_LighterBtn = await (driver.findComponent(ON.id('fontWeight_Lighter')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await fontWeight_LighterBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0200_1.getText();
      let width2 =  await textComputing0200_2.getText();
      let width12 =  await textComputing0200_12.getText();
      let width22 =  await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0230
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0230
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0230
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_NormalBtn = await (driver.findComponent(ON.id('fontWeight_Normal')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0240
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0240
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0240
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_200Btn = await (driver.findComponent(ON.id('fontWeight_200')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0250
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0250
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0250
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0250', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_500Btn = await (driver.findComponent(ON.id('fontWeight_500')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await fontWeight_500Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0200_1.getText();
      let width2 =  await textComputing0200_2.getText();
      let width12 =  await textComputing0200_12.getText();
      let width22 =  await textComputing0200_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0260
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0260
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0260
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0260', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_700Btn = await (driver.findComponent(ON.id('fontWeight_-700')) as Promise<Component>);
      let textComputing0200_1 = await (driver.findComponent(ON.id('textComputing0200_1')) as Promise<Component>);
      let textComputing0200_12 = await (driver.findComponent(ON.id('textComputing0200_12')) as Promise<Component>);
      let textComputing0200_2 = await (driver.findComponent(ON.id('textComputing0200_2')) as Promise<Component>);
      let textComputing0200_22 = await (driver.findComponent(ON.id('textComputing0200_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await fontWeight_700Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0200_1.getText();
      let width2 =  await textComputing0200_2.getText();
      let width12 =  await textComputing0200_12.getText();
      let width22 =  await textComputing0200_22.getText();
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