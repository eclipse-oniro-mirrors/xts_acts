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
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{ BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;
export default function webviewController() {

  describe('webviewController', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("webviewController beforeAll start");
    })
    /**
     * @tc.name   testGetWebIdStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0100
     * @tc.desc   test getWebId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWebIdStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('getWebId', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('getWebId', 3, 202603161, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0200
     * @tc.desc   test createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePorts', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('createWebMessagePorts', 2, 202603162, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0300
     * @tc.desc   test createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePorts2', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('createWebMessagePorts2', 2, 202603163, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0400
     * @tc.desc   test createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsStatic003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePorts3', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('createWebMessagePorts3', 2, 202603164, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testClearMatchesStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0500
     * @tc.desc   test clearMatchesStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearMatchesStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('clearMatches', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('clearMatches', true, 202603165, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })


    /**
     * @tc.name   testPostMessageStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0600
     * @tc.desc   test postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('postMessage', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('postMessage', true, 202603166, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })


    /**
     * @tc.name   testSearchNextStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0700
     * @tc.desc   test searchNext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchNextStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('searchNext', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('searchNext', true, 202603167, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
