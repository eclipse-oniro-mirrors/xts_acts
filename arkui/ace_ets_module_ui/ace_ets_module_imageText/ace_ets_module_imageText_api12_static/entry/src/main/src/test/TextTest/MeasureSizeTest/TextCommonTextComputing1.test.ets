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

export default function TextCommonTextComputing1() {
  describe('TextCommonTextComputing1', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing1 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0010" == pages.name)) {
          console.info("get TextCommonTextComputing1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing1 page error:" + err);
      }
      console.info("TextCommonTextComputing1 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0010', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0010 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await (driver.findComponent(ON.id('resetInChinese')) as Promise<Component>);
      let textComputing0010_1 = await (driver.findComponent(ON.id('textComputing0010_1')) as Promise<Component>);
      let textComputing0010_12 = await (driver.findComponent(ON.id('textComputing0010_12')) as Promise<Component>);
      let textComputing0010_2 = await (driver.findComponent(ON.id('textComputing0010_2')) as Promise<Component>);
      let textComputing0010_22 = await (driver.findComponent(ON.id('textComputing0010_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0020
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0020
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0020', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0020 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await (driver.findComponent(ON.id('resetInChEn')) as Promise<Component>);
      let textComputing0010_1 = await (driver.findComponent(ON.id('textComputing0010_1')) as Promise<Component>);
      let textComputing0010_12 = await (driver.findComponent(ON.id('textComputing0010_12')) as Promise<Component>);
      let textComputing0010_2 = await (driver.findComponent(ON.id('textComputing0010_2')) as Promise<Component>);
      let textComputing0010_22 = await (driver.findComponent(ON.id('textComputing0010_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0030
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0030
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0030
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0030', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0030 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await (driver.findComponent(ON.id('resetInChEnJaHa')) as Promise<Component>);
      let textComputing0010_1 = await (driver.findComponent(ON.id('textComputing0010_1')) as Promise<Component>);
      let textComputing0010_12 = await (driver.findComponent(ON.id('textComputing0010_12')) as Promise<Component>);
      let textComputing0010_2 = await (driver.findComponent(ON.id('textComputing0010_2')) as Promise<Component>);
      let textComputing0010_22 = await (driver.findComponent(ON.id('textComputing0010_22')) as Promise<Component>);
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
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0040
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0040', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0040 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let resetInChineseBtn = await (driver.findComponent(ON.id('resetInChSym')) as Promise<Component>);
      let textComputing0010_1 = await (driver.findComponent(ON.id('textComputing0010_1')) as Promise<Component>);
      let textComputing0010_12 = await (driver.findComponent(ON.id('textComputing0010_12')) as Promise<Component>);
      let textComputing0010_2 = await (driver.findComponent(ON.id('textComputing0010_2')) as Promise<Component>);
      let textComputing0010_22 = await (driver.findComponent(ON.id('textComputing0010_22')) as Promise<Component>);
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