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

export default function TextCommonTextComputing6() {
  describe('TextCommonTextComputing6', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing6 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0290",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing6 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0290" == pages.name)) {
          console.info("get TextCommonTextComputing6 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing6 page error:" + err);
      }
      console.info("TextCommonTextComputing6 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0290
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0290
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0290
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0290', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_10vpBtn = await (driver.findComponent(ON.id('letterSpacing_10vp')) as Promise<Component>);
      let textComputing0290_1 = await (driver.findComponent(ON.id('textComputing0290_1')) as Promise<Component>);
      let textComputing0290_12 = await (driver.findComponent(ON.id('textComputing0290_12')) as Promise<Component>);
      let textComputing0290_2 = await (driver.findComponent(ON.id('textComputing0290_2')) as Promise<Component>);
      let textComputing0290_22 = await (driver.findComponent(ON.id('textComputing0290_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await letterSpacing_10vpBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0290_1.getText();
      let width2 =  await textComputing0290_2.getText();
      let width12 =  await textComputing0290_12.getText();
      let width22 =  await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0310
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0310
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0310
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0310', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_5Btn = await (driver.findComponent(ON.id('letterSpacing_-5')) as Promise<Component>);
      let textComputing0290_1 = await (driver.findComponent(ON.id('textComputing0290_1')) as Promise<Component>);
      let textComputing0290_12 = await (driver.findComponent(ON.id('textComputing0290_12')) as Promise<Component>);
      let textComputing0290_2 = await (driver.findComponent(ON.id('textComputing0290_2')) as Promise<Component>);
      let textComputing0290_22 = await (driver.findComponent(ON.id('textComputing0290_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await letterSpacing_5Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0290_1.getText();
      let width2 =  await textComputing0290_2.getText();
      let width12 =  await textComputing0290_12.getText();
      let width22 =  await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0320
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0320
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0320
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0320', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_20Btn = await (driver.findComponent(ON.id('letterSpacing_20')) as Promise<Component>);
      let textComputing0290_1 = await (driver.findComponent(ON.id('textComputing0290_1')) as Promise<Component>);
      let textComputing0290_12 = await (driver.findComponent(ON.id('textComputing0290_12')) as Promise<Component>);
      let textComputing0290_2 = await (driver.findComponent(ON.id('textComputing0290_2')) as Promise<Component>);
      let textComputing0290_22 = await (driver.findComponent(ON.id('textComputing0290_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await letterSpacing_20Btn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0290_1.getText();
      let width2 =  await textComputing0290_2.getText();
      let width12 =  await textComputing0290_12.getText();
      let width22 =  await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0330
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0330
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0330
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0330', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_endBtn = await (driver.findComponent(ON.id('textAlign_end')) as Promise<Component>);
      let textComputing0290_1 = await (driver.findComponent(ON.id('textComputing0290_1')) as Promise<Component>);
      let textComputing0290_12 = await (driver.findComponent(ON.id('textComputing0290_12')) as Promise<Component>);
      let textComputing0290_2 = await (driver.findComponent(ON.id('textComputing0290_2')) as Promise<Component>);
      let textComputing0290_22 = await (driver.findComponent(ON.id('textComputing0290_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textAlign_endBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0290_1.getText();
      let width2 =  await textComputing0290_2.getText();
      let width12 =  await textComputing0290_12.getText();
      let width22 =  await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0340
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0340
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0340
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0340', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_JUSTIFYBtn = await (driver.findComponent(ON.id('textAlign_JUSTIFY')) as Promise<Component>);
      let textComputing0290_1 = await (driver.findComponent(ON.id('textComputing0290_1')) as Promise<Component>);
      let textComputing0290_12 = await (driver.findComponent(ON.id('textComputing0290_12')) as Promise<Component>);
      let textComputing0290_2 = await (driver.findComponent(ON.id('textComputing0290_2')) as Promise<Component>);
      let textComputing0290_22 = await (driver.findComponent(ON.id('textComputing0290_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textAlign_JUSTIFYBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0290_1.getText();
      let width2 =  await textComputing0290_2.getText();
      let width12 =  await textComputing0290_12.getText();
      let width22 =  await textComputing0290_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0360
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0360
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0360
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0360', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_StartBtn = await (driver.findComponent(ON.id('textAlign_Start')) as Promise<Component>);
      let textComputing0290_1 = await (driver.findComponent(ON.id('textComputing0290_1')) as Promise<Component>);
      let textComputing0290_12 = await (driver.findComponent(ON.id('textComputing0290_12')) as Promise<Component>);
      let textComputing0290_2 = await (driver.findComponent(ON.id('textComputing0290_2')) as Promise<Component>);
      let textComputing0290_22 = await (driver.findComponent(ON.id('textComputing0290_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await textAlign_StartBtn.click();
      await CommonFunc.sleep(500);
      let width1 =  await textComputing0290_1.getText();
      let width2 =  await textComputing0290_2.getText();
      let width12 =  await textComputing0290_12.getText();
      let width22 =  await textComputing0290_22.getText();
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