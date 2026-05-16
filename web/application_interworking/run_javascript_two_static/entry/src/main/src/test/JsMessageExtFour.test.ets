/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';

import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError,RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';

import Utils from './Util.test';

export default function jsMessageExtFour() {

  describe('JsMessageExtFourTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.runjavascripttwotest.static')
      await Utils.msSleep(8000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testPromiseJavascriptProxyGetErrorDescriptionStatic001
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_PROMISE_STATIC_0100
     * @tc.desc   test Promise javascriptProxy getErrorDescription object length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJavascriptProxyGetErrorDescriptionStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      Utils.emitEvent('emitPromiseJavascriptProxyGetErrorDescription001', 144)
      await Utils.msSleep(7000);
      Utils.registerBaseEvent('testPromiseJavascriptProxyGetErrorDescription001', true, 25112127, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(5000);
      inspector.sendEventByKey('JsMessageExtFourButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
    /**
     * @tc.name   testCallbackJavascriptProxyGetErrorDescriptionStatic001
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_CALLBACK_STATIC_0100
     * @tc.desc   test Callback javascriptProxy getErrorDescription object length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJavascriptProxyGetErrorDescriptionStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      Utils.emitEvent('emitCallbackJavascriptProxyGetErrorDescription001', 144)

      Utils.registerBaseEvent('testCallbackJavascriptProxyGetErrorDescription001', true, 25112130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(5000);
      inspector.sendEventByKey('JsMessageExtFourButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

  })
}
