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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

let emitKey = 'emitTerminateRenderProcess0100';

export default function webviewTerminateRenderProcess() {
  describe('TerminateRenderProcess', (): void => {

    beforeAll(async (): Promise<void> => {
      console.log('APP start')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('webviewTerminateRenderProcess beforeEach start');
    })

    /**
     * @tc.name   emitTerminateRenderProcessstatic0100
     * @tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0100
     * @tc.desc   terminateRenderProcess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitTerminateRenderProcessstatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitTerminateRenderProcess0100', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitTerminateRenderProcess0100', true, 5300, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('TerminateRenderProcess', 10, '');
        await Utils.msSleep(10000);
        done();
      })
    /**
     * @tc.name   emitTerminateRenderProcessstatic0200
     * @tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0200
     * @tc.desc   terminateRenderProcess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitTerminateRenderProcessstatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitTerminateRenderProcess0200', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitTerminateRenderProcess0200', true, 5304, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('TerminateRenderProcess', 10, '');
        await Utils.msSleep(10000);
        done();
      })
    /**
     * @tc.name   emitTerminateRenderProcessstatic0300
     * @tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0300
     * @tc.desc   terminateRenderProcess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitTerminateRenderProcessstatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitTerminateRenderProcess0300', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitTerminateRenderProcess0300', true, 5306, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('TerminateRenderProcess', 10, '');
        await Utils.msSleep(10000);
        done();
      })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0400
     * @tc.desc   PAGE_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('TerminateRenderProcess'));
        await Utils.msSleep(2000);
        button?.click();
        done();
      })
  })
}
