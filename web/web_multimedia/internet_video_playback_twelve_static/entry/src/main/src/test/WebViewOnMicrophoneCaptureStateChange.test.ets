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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { MicrophoneCaptureStateChangeInfo, MicrophoneCaptureState } from '@ohos.arkui.component';

let testAbilityContext:common.UIAbilityContext;
const driver = Driver.create();

export default function ActsAceWebViewOnMicrophoneCaptureStateChangeTest() {

    describe('ActsAceWebViewOnMicrophoneCaptureStateChange', (): void => {
      beforeAll(async ():Promise<void> => {
        console.log('App start')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('beforeEach start');
      })

    /**
     * @tc.name   testOnMicrophoneCaptureStateChangeState001
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_0001
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL3
     */
    it('testOnMicrophoneCaptureStateChangeState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let buttonOne = await driver.findComponent(ON.text('开启麦克风'));
      if(buttonOne)
      {
        await buttonOne.click();
        console.log("✅ 成功点击「开启麦克风」按钮");
      }
      await Utils.msSleep(1000)
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnMicrophoneCaptureStateChange001", true, 20260101, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testOnMicrophoneCaptureStateChangeStatic002
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_0002
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL3
     */
    it('testOnMicrophoneCaptureStateChangeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnMicrophoneCaptureStateChange002", MicrophoneCaptureState.PAUSED, 20251229, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testOnMicrophoneCaptureStateChangeStatic003
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0003
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL3
     */
    it('testOnMicrophoneCaptureStateChangeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange003", 10)
      Utils.registerEvent("testOnMicrophoneCaptureStateChange003", MicrophoneCaptureState.ACTIVE, 20251230, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testOnMicrophoneCaptureStateChangeStatic004
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0004
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL3
     */
    it('testOnMicrophoneCaptureStateChangeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange004", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnMicrophoneCaptureStateChange004", MicrophoneCaptureState.NONE, 20251231, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
  })
}