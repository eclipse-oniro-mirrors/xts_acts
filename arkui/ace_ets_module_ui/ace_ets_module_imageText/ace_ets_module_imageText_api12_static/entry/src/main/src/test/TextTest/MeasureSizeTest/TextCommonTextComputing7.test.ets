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

export default function TextCommonTextComputing7() {
  describe('TextCommonTextComputing7', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing7 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing7 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0370",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing7 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0370" == pages.name)) {
          console.info("get TextCommonTextComputing7 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing7 page error:" + err);
      }
      console.info("TextCommonTextComputing7 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0370
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0370
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0370
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0370', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let overflow_EllipsisBtn = await (driver.findComponent(ON.id('overflow_Ellipsis')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await overflow_EllipsisBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0370] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0380
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0380
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0380
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0380', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let overflow_ClipBtn = await (driver.findComponent(ON.id('overflow_Clip')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await overflow_ClipBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0380] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0390
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0390
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0390
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0390', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let overflow_NoneBtn = await (driver.findComponent(ON.id('overflow_None')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await overflow_NoneBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0390] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0400
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0400
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0400
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let overflow_MARQUEEBtn = await (driver.findComponent(ON.id('overflow_MARQUEE')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await overflow_MARQUEEBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0400] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0410
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0410
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0410
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0410', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textCase_NormalBtn = await (driver.findComponent(ON.id('textCase_Normal')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textCase_NormalBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0410] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0420
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0420
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0420
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0420', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textCase_LowerCaseBtn = await (driver.findComponent(ON.id('textCase_LowerCase')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textCase_LowerCaseBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0420] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0430
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0430
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0430
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0430', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0430 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textCase_UpperCaseBtn = await (driver.findComponent(ON.id('textCase_UpperCase')) as Promise<Component>);
      let textComputing0370_1 = await (driver.findComponent(ON.id('textComputing0370_1')) as Promise<Component>);
      let textComputing0370_12 = await (driver.findComponent(ON.id('textComputing0370_12')) as Promise<Component>);
      let textComputing0370_2 = await (driver.findComponent(ON.id('textComputing0370_2')) as Promise<Component>);
      let textComputing0370_22 = await (driver.findComponent(ON.id('textComputing0370_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textCase_UpperCaseBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0370_1.getText();
      let width2 =  await textComputing0370_2.getText();
      let width12 =  await textComputing0370_12.getText();
      let width22 =  await textComputing0370_22.getText();
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