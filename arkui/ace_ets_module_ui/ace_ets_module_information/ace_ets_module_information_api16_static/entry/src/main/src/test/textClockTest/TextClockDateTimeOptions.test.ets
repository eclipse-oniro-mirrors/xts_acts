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

export default function TextClockDateTimeOptionsTest() {
  describe('TextClockDateTimeOptionsTest', () => {
    beforeAll(() => {
      console.info("TextClockDateTimeOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textClock/TextClockDateTimeOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextClockDateTimeOptionsTest state pages:' + JSON.stringify(pages));
        if (!('TextClockDateTimeOptions' == pages.name)) {
          console.info('get TextClockDateTimeOptionsTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TextClockDateTimeOptionsTest page error:' + err);
      }
      console.info('TextClockDateTimeOptionsTest beforeEach end');
    });
    
    /**
     * @tc.number   TextClockDateTimeOptionsTest_static_001
     * @tc.name     TextClockDateTimeOptionsTest_static_001
     * @tc.desc     TextClockDateTimeOptionsTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('TextClockDateTimeOptionsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('numeric');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextClockDateTimeOptionsTest_001 component obj is: ' + obj.getElement('$attrs').getString('dateTimeOptions'));
      expect(obj.getElement('$attrs').getString('dateTimeOptions')).assertEqual('{"hour":"numeric"}');
      console.info('[TextClockDateTimeOptionsTest_001] END');
      done();
    });
    
    /**
     * @tc.number   TextClockDateTimeOptionsTest_static_002
     * @tc.name     TextClockDateTimeOptionsTest_static_002
     * @tc.desc     TextClockDateTimeOptionsTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('TextClockDateTimeOptionsTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('digit');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextClockDateTimeOptionsTest_002 component obj is: ' + obj.getElement('$attrs').getString('dateTimeOptions'));
      expect(obj.getElement('$attrs').getString('dateTimeOptions')).assertEqual('{"hour":"2-digit"}');
      console.info('[TextClockDateTimeOptionsTest_002] END');
      done();
    });
  })
}
