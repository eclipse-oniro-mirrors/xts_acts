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

import { expect, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;

export default function componentLifeCycleTestOne() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {

      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('componentLifeCycleTestOne beforeEach start');
    })

    /**
     * @tc.name   onInactiveStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_STATIC_007
     * @tc.desc   make web component inactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onInactiveStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitonInactive", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("onInactive", "baidu", 7, done);
      inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   onActiveStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_STATIC_008
     * @tc.desc   return whether the third party cookie is allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('onActiveStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitonActive", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("onActive", "index", 8, done); //Depend on execution order, executed after onInactive, result is "index"
      inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnActiveInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2000
     * @tc.desc   test interface of onActive with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnActiveInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnActiveInitErr", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testOnActiveInitErr', '17100001', 638, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      Utils.registerBaseEvent('testOnActiveInitErr', 'Init error. The WebviewController must be associated with a Web component', 639, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnInactiveInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2100
     * @tc.desc   test interface of onInactive with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnInactiveInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnInactiveInitErr", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testOnInactiveInitErr', '17100001', 640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      Utils.registerBaseEvent('testOnInactiveInitErr', 'Init error. The WebviewController must be associated with a Web component', 641, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testGetWebIdInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2200
     * @tc.desc   test interface of getWebId with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWebIdInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitGetWebIdInitErr", 10)
      await Utils.msSleep(3000);
      Utils.registerBaseEvent('testGetWebIdInitErr', '17100001', 642, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      Utils.registerBaseEvent('testGetWebIdInitErr', 'Init error. The WebviewController must be associated with a Web component', 643, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
        await Utils.msSleep(5000)
        done();
      })
  })
}
