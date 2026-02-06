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

export default function TextCommonTextComputing2() {
  describe('TextCommonTextComputing2', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing2 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0050",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing2 state pages:" + JSON.stringify(pages));
        if (!("TextCommonTextComputing0050" == pages.name)) {
          console.info("get TextCommonTextComputing2 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextCommonTextComputing2 page error:" + err);
      }
      console.info("TextCommonTextComputing2 beforeEach end");
    }); 

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0050
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0050', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0050 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textComputing0050_1 = await (driver.findComponent(ON.id('textComputing0050_1')) as Promise<Component>);
      let textComputing0050_12 = await (driver.findComponent(ON.id('textComputing0050_12')) as Promise<Component>);
      let textComputing0050_2 = await (driver.findComponent(ON.id('textComputing0050_2')) as Promise<Component>);
      let textComputing0050_22 = await (driver.findComponent(ON.id('textComputing0050_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      let width1 = await textComputing0050_1.getText();
      let width2 = await textComputing0050_2.getText();
      let width12 = await textComputing0050_12.getText();
      let width22 = await textComputing0050_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0050] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0060
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0060
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0060
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0060', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0060 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let conWidth_200vpBtn = await (driver.findComponent(ON.id('conWidth_200vp')) as Promise<Component>);
      let textComputing0050_1 = await (driver.findComponent(ON.id('textComputing0050_1')) as Promise<Component>);
      let textComputing0050_12 = await (driver.findComponent(ON.id('textComputing0050_12')) as Promise<Component>);
      let textComputing0050_2 = await (driver.findComponent(ON.id('textComputing0050_2')) as Promise<Component>);
      let textComputing0050_22 = await (driver.findComponent(ON.id('textComputing0050_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await conWidth_200vpBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0050_1.getText();
      let width2 = await textComputing0050_2.getText();
      let width12 = await textComputing0050_12.getText();
      let width22 = await textComputing0050_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0060] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0080
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0080
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0080
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0080', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0080 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let conWidth_calcBtn = await (driver.findComponent(ON.id('conWidth_calc')) as Promise<Component>);
      let textComputing0050_1 = await (driver.findComponent(ON.id('textComputing0050_1')) as Promise<Component>);
      let textComputing0050_12 = await (driver.findComponent(ON.id('textComputing0050_12')) as Promise<Component>);
      let textComputing0050_2 = await (driver.findComponent(ON.id('textComputing0050_2')) as Promise<Component>);
      let textComputing0050_22 = await (driver.findComponent(ON.id('textComputing0050_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await conWidth_calcBtn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0050_1.getText();
      let width2 = await textComputing0050_2.getText();
      let width12 = await textComputing0050_12.getText();
      let width22 = await textComputing0050_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0080] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0090
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0090
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0090
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0090', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0090 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let conWidth_90Btn = await (driver.findComponent(ON.id('conWidth_90abc')) as Promise<Component>);
      let textComputing0050_1 = await (driver.findComponent(ON.id('textComputing0050_1')) as Promise<Component>);
      let textComputing0050_12 = await (driver.findComponent(ON.id('textComputing0050_12')) as Promise<Component>);
      let textComputing0050_2 = await (driver.findComponent(ON.id('textComputing0050_2')) as Promise<Component>);
      let textComputing0050_22 = await (driver.findComponent(ON.id('textComputing0050_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await conWidth_90Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0050_1.getText();
      let width2 = await textComputing0050_2.getText();
      let width12 = await textComputing0050_12.getText();
      let width22 = await textComputing0050_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0090] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0100
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0100
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0100', Level.LEVEL0, async (done:  () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0100 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let conWidth_50Btn = await (driver.findComponent(ON.id('conWidth_50')) as Promise<Component>);
      let textComputing0050_1 = await (driver.findComponent(ON.id('textComputing0050_1')) as Promise<Component>);
      let textComputing0050_12 = await (driver.findComponent(ON.id('textComputing0050_12')) as Promise<Component>);
      let textComputing0050_2 = await (driver.findComponent(ON.id('textComputing0050_2')) as Promise<Component>);
      let textComputing0050_22 = await (driver.findComponent(ON.id('textComputing0050_22')) as Promise<Component>);
      await CommonFunc.sleep(500);
      await conWidth_50Btn.click();
      await CommonFunc.sleep(500);
      let width1 = await textComputing0050_1.getText();
      let width2 = await textComputing0050_2.getText();
      let width12 = await textComputing0050_12.getText();
      let width22 = await textComputing0050_22.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0100] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}