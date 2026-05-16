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

export default function TextCommonTextComputing4() {
  describe('TextCommonTextComputing4', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing4 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0160",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing4 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0160" == pages.name)) {
          console.info("get TextCommonTextComputing4 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing4 page error:" + err);
      }
      console.info("TextCommonTextComputing4 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0160
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0160
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0160
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_normalBtn = await (driver.findComponent(ON.id('fontStyle_normal')) as Promise<Component>);
      let textComputing0160_1 = await (driver.findComponent(ON.id('textComputing0160_1')) as Promise<Component>);
      let textComputing0160_12 = await (driver.findComponent(ON.id('textComputing0160_12')) as Promise<Component>);
      let textComputing0160_2 = await (driver.findComponent(ON.id('textComputing0160_2')) as Promise<Component>);
      let textComputing0160_22 = await (driver.findComponent(ON.id('textComputing0160_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0170
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0170
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0170
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_ItalicBtn = await (driver.findComponent(ON.id('fontStyle_Italic')) as Promise<Component>);
      let textComputing0160_1 = await (driver.findComponent(ON.id('textComputing0160_1')) as Promise<Component>);
      let textComputing0160_12 = await (driver.findComponent(ON.id('textComputing0160_12')) as Promise<Component>);
      let textComputing0160_2 = await (driver.findComponent(ON.id('textComputing0160_2')) as Promise<Component>);
      let textComputing0160_22 = await (driver.findComponent(ON.id('textComputing0160_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0190
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0190
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0190
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_100Btn = await (driver.findComponent(ON.id('fontStyle-100')) as Promise<Component>);
      let textComputing0160_1 = await (driver.findComponent(ON.id('textComputing0160_1')) as Promise<Component>);
      let textComputing0160_12 = await (driver.findComponent(ON.id('textComputing0160_12')) as Promise<Component>);
      let textComputing0160_2 = await (driver.findComponent(ON.id('textComputing0160_2')) as Promise<Component>);
      let textComputing0160_22 = await (driver.findComponent(ON.id('textComputing0160_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0270
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0270
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0270
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0270', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontFamily_resBtn = await (driver.findComponent(ON.id('fontFamily_res')) as Promise<Component>);
      let textComputing0160_1 = await (driver.findComponent(ON.id('textComputing0160_1')) as Promise<Component>);
      let textComputing0160_12 = await (driver.findComponent(ON.id('textComputing0160_12')) as Promise<Component>);
      let textComputing0160_2 = await (driver.findComponent(ON.id('textComputing0160_2')) as Promise<Component>);
      let textComputing0160_22 = await (driver.findComponent(ON.id('textComputing0160_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0280
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0280
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0280
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0280', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontFamily_ohBtn = await (driver.findComponent(ON.id('fontFamily_oh')) as Promise<Component>);
      let textComputing0160_1 = await (driver.findComponent(ON.id('textComputing0160_1')) as Promise<Component>);
      let textComputing0160_12 = await (driver.findComponent(ON.id('textComputing0160_12')) as Promise<Component>);
      let textComputing0160_2 = await (driver.findComponent(ON.id('textComputing0160_2')) as Promise<Component>);
      let textComputing0160_22 = await (driver.findComponent(ON.id('textComputing0160_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await fontFamily_ohBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0160_1.getText();
      let width2 =  await textComputing0160_2.getText();
      let width12 =  await textComputing0160_12.getText();
      let width22 =  await textComputing0160_22.getText();
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