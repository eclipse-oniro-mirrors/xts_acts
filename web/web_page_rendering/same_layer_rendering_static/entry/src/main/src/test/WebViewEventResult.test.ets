/*
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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it ,afterEach} from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
let testAbilityContext:common.UIAbilityContext;

const driver = Driver.create();
export default function webViewEventResult() {
  describe('webViewEventResult', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   testWebViewEventResult_static_01
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_API_0001
     * @tc.desc   test setGestureEventResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewEventResult_static_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewEventResult01', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewEventResult01', true, 80140, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
      inspector.sendEventByKey('EventResult', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testWebViewEventResult_static_02
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_API_0002
     * @tc.desc   test setGestureEventResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewEventResult_static_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewEventResult02', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewEventResult02', true, 80150, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
      inspector.sendEventByKey('EventResult', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testWebViewEventResult_static_03
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_API_0003
     * @tc.desc   test setGestureEventResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewEventResult_static_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewEventResult03', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewEventResult03', true, 80160, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
      inspector.sendEventByKey('EventResult', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testWebViewEventResult_static_04
     * @tc.number SUB_ACE_WEB_EVENT_RESULT_API_0004
     * @tc.desc   test setGestureEventResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewEventResult_static_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewEventResult04', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewEventResult04', true, 80170, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
      inspector.sendEventByKey('EventResult', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testWebViewMouseEventResult_static_01
     * @tc.number SUB_ACE_WEB_MOUSE_EVENT_RESULT_API_0001
     * @tc.desc   test setMouseEventResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewMouseEventResult_static_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewMouseEventResult01', 10)
      await Utils.msSleep(2000);
      let buttonOne = await driver.findComponent(ON.id('EventResult'));
      Utils.registerEvent('emitWebViewMouseEventResult01', true, 90140, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
      if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT)
        console.info("buttonOne.mouseClick")
      }
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testWebViewMouseEventResult_static_02
     * @tc.number SUB_ACE_WEB_MOUSE_EVENT_RESULT_API_0002
     * @tc.desc   test setGestureEventResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewMouseEventResult_static_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewMouseEventResult02', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewMouseEventResult02', true, 90150, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
      let buttonOne = await driver.findComponent(ON.id('EventResult'));
      if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT)
        console.info("buttonOne.mouseClick")
      }
      await Utils.msSleep(4000);
      done();
    })

    /**
    * @tc.name         SwitchNextPageStatic
    * @tc.number       SUB_WEB_SWITCH_NEXT_PAGE90150
    * @tc.desc         test SwitchNextPageStatic
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic8', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebViewEventResultButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}
