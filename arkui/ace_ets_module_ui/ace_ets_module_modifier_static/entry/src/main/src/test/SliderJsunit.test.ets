'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
export default function sliderTest() {
  describe('sliderTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("sliderJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get slider state pages: " + JSON.stringify(pages));
        if (!("slider" == pages.name)) {
          console.info("get slider state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push slider page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_010
     * @tc.name     ArkUX_Stage_Slider_static_010
     * @tc.desc     ArkUX_Stage_Slider_static_010
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_010 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_010 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('stepSize')).assertEqual("1.00px");
      console.info('ArkUX_Stage_Slider_static_010 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_011
     * @tc.name     ArkUX_Stage_Slider_static_011
     * @tc.desc     ArkUX_Stage_Slider_static_011
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_011 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_011 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('stepColor')).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_static_011 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_012
     * @tc.name     ArkUX_Stage_Slider_static_012
     * @tc.desc     ArkUX_Stage_Slider_static_012
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_012 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_012 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('blockBorderWidth')).assertEqual("50.00vp");
      console.info('ArkUX_Stage_Slider_static_012 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_013
     * @tc.name     ArkUX_Stage_Slider_static_013
     * @tc.desc     ArkUX_Stage_Slider_static_013
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_013 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_013 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('trackBorderRadius')).assertEqual("30.00vp");
      console.info('ArkUX_Stage_Slider_static_013 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_014
     * @tc.name     ArkUX_Stage_Slider_static_014
     * @tc.desc     ArkUX_Stage_Slider_static_014
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_014 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_014 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('showTips')).assertEqual("true");
      console.info('ArkUX_Stage_Slider_static_014 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_015
     * @tc.name     ArkUX_Stage_Slider_static_015
     * @tc.desc     ArkUX_Stage_Slider_static_015
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_015 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_015 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_static_015 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_017
     * @tc.name     ArkUX_Stage_Slider_static_017
     * @tc.desc     ArkUX_Stage_Slider_static_017
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_017 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_017 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('blockSize')?.getString('width')).assertEqual('10.00px');
      expect(objNew.getElement('$attrs').getElement('blockSize')?.getString('height')).assertEqual('10.00px');
      console.info('ArkUX_Stage_Slider_static_017 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_018
     * @tc.name     ArkUX_Stage_Slider_static_018
     * @tc.desc     ArkUX_Stage_Slider_static_018
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_018 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_018 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('blockColor')).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_static_018 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_019
     * @tc.name     ArkUX_Stage_Slider_static_019
     * @tc.desc     ArkUX_Stage_Slider_static_019
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_019 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_019 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('trackColor')).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_static_019 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_020
     * @tc.name     ArkUX_Stage_Slider_static_020
     * @tc.desc     ArkUX_Stage_Slider_static_020
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_020 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_020 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('selectedColor')).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_static_020 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_021
     * @tc.name     ArkUX_Stage_Slider_static_021
     * @tc.desc     ArkUX_Stage_Slider_static_021
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_021 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_021 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('showSteps')).assertEqual("false");
      console.info('ArkUX_Stage_Slider_static_021 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_022
     * @tc.name     ArkUX_Stage_Slider_static_022
     * @tc.desc     ArkUX_Stage_Slider_static_022
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_022 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_022 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('trackThickness')).assertEqual('2.00px');
      console.info('ArkUX_Stage_Slider_static_022 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_023
     * @tc.name     ArkUX_Stage_Slider_static_023
     * @tc.desc     ArkUX_Stage_Slider_static_023
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_023 START');
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_023 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.SHAPE");
      console.info('ArkUX_Stage_Slider_static_023 END');
      done();
    });

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_static_0110
     * @tc.name     ArkUX_Stage_Slider_static_0110
     * @tc.desc     ArkUX_Stage_Slider_static_0110
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Slider_static_0110 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
      await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('slider');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_Slider_static_0110 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('stepSize')).assertEqual("2.00px");
      console.info('ArkUX_Stage_Slider_static_0110 END');
      done();
    });

  })
}
