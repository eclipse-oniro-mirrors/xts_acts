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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function SliderEnableHapticFeedbackTest() {
  describe('SliderAddEnableHapticFeedbackApi', () => {
    beforeAll(() => {
      console.info("SliderAddEnableHapticFeedbackApi beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('SliderAddEnableHapticFeedbackApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/SliderEnableHapticFeedbackTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SliderAddEnableHapticFeedbackApi state pages:' + JSON.stringify(pages));
        if (!('SliderEnableHapticFeedbackTest' == pages.name)) {
          console.info('get SliderAddEnableHapticFeedbackApi pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push SliderAddEnableHapticFeedbackApi page error:' + err);
      }
      console.info('SliderAddEnableHapticFeedbackApi beforeEach end');
    });

    
    
/**
     * @tc.number   SliderAddEnableHapticFeedbackApi_static_001
     * @tc.name     SliderAddEnableHapticFeedbackApi_static_001
     * @tc.desc     SliderAddEnableHapticFeedbackApi_static_001
     * @tc.level    Level.LEVEL1
     */
it('SliderAddEnableHapticFeedbackApi_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SliderAddEnableHapticFeedbackApi_static_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_true')) as Component;
      await (trueBtn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let slider = inspector.getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_static_001] attrs is: " +
      JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback'));
      await Utils.sleep(1000);
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_static_001] END');
      done();
    });

    
    
/**
     * @tc.number   SliderAddEnableHapticFeedbackApi_static_002
     * @tc.name     SliderAddEnableHapticFeedbackApi_static_002
     * @tc.desc     SliderAddEnableHapticFeedbackApi_static_002
     * @tc.level    Level.LEVEL1
     */
it('SliderAddEnableHapticFeedbackApi_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SliderAddEnableHapticFeedbackApi_static_002] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_false')) as Component;
      await (trueBtn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let slider = inspector.getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_static_002] attrs is: " +
      JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback'));
      await Utils.sleep(1000);
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[SliderAddEnableHapticFeedbackApi_static_002] END');
      done();
    });

    
    
/**
     * @tc.number   SliderAddEnableHapticFeedbackApi_static_003
     * @tc.name     SliderAddEnableHapticFeedbackApi_static_003
     * @tc.desc     SliderAddEnableHapticFeedbackApi_static_003
     * @tc.level    Level.LEVEL1
     */
it('SliderAddEnableHapticFeedbackApi_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SliderAddEnableHapticFeedbackApi_static_003] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_undefied')) as Component;
      await (trueBtn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let slider = inspector.getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_static_003] attrs is: " +
      JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback'));
      await Utils.sleep(1000);
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_static_003] END');
      done();
    });

    
    
/**
     * @tc.number   SliderAddEnableHapticFeedbackApi_static_004
     * @tc.name     SliderAddEnableHapticFeedbackApi_static_004
     * @tc.desc     SliderAddEnableHapticFeedbackApi_static_004
     * @tc.level    Level.LEVEL1
     */
it('SliderAddEnableHapticFeedbackApi_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SliderAddEnableHapticFeedbackApi_static_004] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_null')) as Component;
      await (trueBtn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let slider = inspector.getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_static_004] attrs is: " +
      JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback'));
      await Utils.sleep(1000);
      expect(JSON.parseJsonElement(slider).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_static_004] END');
      done();
    });
  })
}