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
import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebViewSdkSchemeHandler() {

  describe('componentLifeCycleTestTWO', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getSize
     * @tc.number SUB_ACE_WEB_getSize_API_0001
     * @tc.desc   test getSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_getSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_getSize', 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getSize", true, 1508, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebHttpBodyStream', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_getPosition
     * @tc.number SUB_ACE_WEB_getPosition_API_0001
     * @tc.desc   test getPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_getPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSdkSchemeHandler_getPosition', 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getPosition", true, 1509, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebHttpBodyStream', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_isChunked
     * @tc.number SUB_ACE_WEB_isChunked_API_0001
     * @tc.desc   test isChunked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_isChunked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSdkSchemeHandler_isChunked', 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isChunked", true, 1510, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebHttpBodyStream', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_isOF
     * @tc.number SUB_ACE_WEB_isOF_API_0001
     * @tc.desc   test isOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_isOF', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSdkSchemeHandler_isOF', 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isOF", true, 1510, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebHttpBodyStream', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_isInMemory
     * @tc.number SUB_ACE_WEB_isInMemory_API_0001
     * @tc.desc   test isInMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_isInMemory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewSdkSchemeHandler_isInMemory', 10);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isInMemory", true, 1512, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebHttpBodyStream', 10, '');
      await Utils.msSleep(4000);
      done();
    })
  })
}
