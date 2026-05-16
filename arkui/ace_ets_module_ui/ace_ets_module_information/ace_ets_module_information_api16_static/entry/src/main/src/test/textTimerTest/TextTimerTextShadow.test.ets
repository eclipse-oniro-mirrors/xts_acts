'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../../../ets/MainAbility/common/Utils';
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

export default function TextTimerTextShadowTest() {
  describe('TextTimerTextShadowTest', () => {
    beforeAll(() => {
      console.info("TextTimerTextShadowTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('TextTimerTextShadowTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textTimer/TextTimerTextShadow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextTimerTextShadowTest state pages:' + JSON.stringify(pages));
        if (!('TextTimerTextShadow' == pages.name)) {
          console.info('get TextTimerTextShadowTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TextTimerTextShadowTest page error:' + err);
      }
      console.info('TextTimerTextShadowTest beforeEach end');
    });
    
    /**
     * @tc.number   TextTimerTextShadowTest_static_001
     * @tc.name     TextTimerTextShadowTest_static_001
     * @tc.desc     TextTimerTextShadowTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('TextTimerTextShadowTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textTimer1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('0.000000');
      console.info('[TextTimerTextShadowTest_001] END');
      done();
    });
    
    /**
     * @tc.number   TextTimerTextShadowTest_static_002
     * @tc.name     TextTimerTextShadowTest_static_002
     * @tc.desc     TextTimerTextShadowTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('TextTimerTextShadowTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textTimer2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('0.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('-10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('0.000000');
      console.info('[TextTimerTextShadowTest_002] END');
      done();
    });
    
    /**
     * @tc.number   TextTimerTextShadowTest_static_003
     * @tc.name     TextTimerTextShadowTest_static_003
     * @tc.desc     TextTimerTextShadowTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('TextTimerTextShadowTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_003 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textTimer3');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('50.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FFFF00FF');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('0.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('10.000000');
      console.info('[TextTimerTextShadowTest_003] END');
      done();
    });
  })
}
