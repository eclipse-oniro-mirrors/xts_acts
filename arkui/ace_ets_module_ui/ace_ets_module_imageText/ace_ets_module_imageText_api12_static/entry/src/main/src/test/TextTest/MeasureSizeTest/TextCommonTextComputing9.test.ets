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
import { UtilsTest } from '../../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextCommonTextComputing9() {
  describe('TextCommonTextComputing9', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing9 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing9 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0570",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing9 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0570" == pages.name)) {
          console.info("get TextCommonTextComputing9 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing9 page error:" + err);
      }
      console.info("TextCommonTextComputing9 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0570
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0570
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0570
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0570', Level.LEVEL0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_allBtn =  await (driver.findComponent(ON.id('wordBreak_all')) as Promise<Component>);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0580
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0580
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0580
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0580', Level.LEVEL0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_NORMALBtn = await (driver.findComponent(ON.id('wordBreak_NORMAL')) as Promise<Component>);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await wordBreak_NORMALBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0570_1.getText();
      let width2 =  await textComputing0570_2.getText();
      let width12 =  await textComputing0570_12.getText();
      let width22 =  await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0590
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0590
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0590
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0590', Level.LEVEL0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_wordBtn = await (driver.findComponent(ON.id('wordBreak_word')) as Promise<Component>);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await wordBreak_wordBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0570_1.getText();
      let width2 =  await textComputing0570_2.getText();
      let width12 =  await textComputing0570_12.getText();
      let width22 =  await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0600
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0600
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0600
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0600', Level.LEVEL0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0570_1.getText();
      let width2 =  await textComputing0570_2.getText();
      let width12 =  await textComputing0570_12.getText();
      let width22 =  await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0610
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0610
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0610
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0610', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_5Btn = await (driver.findComponent(ON.id('textIndent-5%')) as Promise<Component>);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textIndent_5Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0570_1.getText();
      let width2 =  await textComputing0570_2.getText();
      let width12 =  await textComputing0570_12.getText();
      let width22 =  await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0620
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0620
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0620
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0620', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_10Btn = await (driver.findComponent(ON.id('textIndent-10')) as Promise<Component>);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textIndent_10Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0570_1.getText();
      let width2 =  await textComputing0570_2.getText();
      let width12 =  await textComputing0570_12.getText();
      let width22 =  await textComputing0570_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0630
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0630
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0630
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0630', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_100Btn = await (driver.findComponent(ON.id('textIndent_100')) as Promise<Component>);
      let textComputing0570_1 = await (driver.findComponent(ON.id('textComputing0570_1')) as Promise<Component>);
      let textComputing0570_12 = await (driver.findComponent(ON.id('textComputing0570_12')) as Promise<Component>);
      let textComputing0570_2 = await (driver.findComponent(ON.id('textComputing0570_2')) as Promise<Component>);
      let textComputing0570_22 = await (driver.findComponent(ON.id('textComputing0570_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textIndent_100Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0570_1.getText();
      let width2 =  await textComputing0570_2.getText();
      let width12 =  await textComputing0570_12.getText();
      let width22 =  await textComputing0570_22.getText();
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