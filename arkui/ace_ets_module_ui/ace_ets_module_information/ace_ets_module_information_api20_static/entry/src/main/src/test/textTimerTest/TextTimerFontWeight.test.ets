/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import Utils from '../../../ets/MainAbility/common/Utils';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextTimerFontWeightTest() {
  describe('TextTimerFontWeightTest', () => {
    beforeAll(() => {
      console.info("TextTimerFontWeightTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.information.api20.static", "EntryAbility");
    });
     beforeEach(async (): Promise<void> => {
      console.info('TextTimerFontWeightTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textTimer/TextTimerFontWeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextTimerFontWeightTest state pages:' + JSON.stringify(pages));
        if (!('TextTimerFontWeight' === pages.name)) {
          console.info('get TextTimerFontWeightTest pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push TextTimerFontWeightTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextTimerFontWeightTest page error:' + err);
      }
      console.info('TextTimerFontWeightTest beforeEach end');
    });

    
    /**
     * @tc.number   TextTimerFontWeightTest_static_001
     * @tc.name     TextTimerFontWeightTest_static_001
     * @tc.desc     TextTimerFontWeightTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('TextTimerFontWeightTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextTimerFontWeightTest_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextTimerFontWeightTest_001 component obj is: ' + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
    
      console.info('[TextTimerFontWeightTest_001] END');
      done();
    });
   
    
    /**
     * @tc.number   TextTimerFontWeightTest_static_002
     * @tc.name     TextTimerFontWeightTest_static_002
     * @tc.desc     TextTimerFontWeightTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('TextTimerFontWeightTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextTimerFontWeightTest_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextTimer1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextTimerFontWeightTest_002 component obj is: ' + obj.getElement('$attrs').getString('fontWeight'));
      let strJson_base = inspector.getInspectorByKey('TextTimer_base');
      let obj_base = JSON.parseJsonElement(strJson_base);
      console.info('TextTimerFontWeightTest_003 component obj_base is: ' + obj_base.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual(obj_base.getElement('$attrs').getString('fontWeight'));
    
      console.info('[TextTimerFontWeightTest_002] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextTimerFontWeightTest_static_004
     * @tc.name     TextTimerFontWeightTest_static_004
     * @tc.desc     TextTimerFontWeightTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('TextTimerFontWeightTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextTimerFontWeightTest_004 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextTimer3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextTimerFontWeightTest_004 component obj is: ' + obj.getElement('$attrs').getString('fontWeight'));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
    
      console.info('[TextTimerFontWeightTest_004] END');
      done();
    });
  })
}
