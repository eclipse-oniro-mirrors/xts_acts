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
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function InjectOfflineResourcesTest() {

  describe('injectOfflineResourcesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(500);
      console.info("injectOfflineResourcesTest beforeEach start");
    })

    /**
     * @tc.name   testInjectOfflineResourcesStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_STATIC_0100
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInjectOfflineResourcesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testInjectOfflineResources001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testInjectOfflineResources001", true, 20001, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
      })
    /**
     * @tc.name   testInjectOfflineResourcesStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_STATIC_0200
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInjectOfflineResourcesStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testInjectOfflineResources002", 10)
        await Utils.msSleep(500);
        Utils.registerEvent("testInjectOfflineResources002", 401, 20002, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testOfflineResourceTypeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_OFFLINERESOURCETYPE_STATIC_0100
     * @tc.desc   test OfflineResourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOfflineResourceTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testOfflineResourceType001", 10)
        await Utils.msSleep(500);
        let num: byte = 3
        Utils.registerEvent("testMODULE_JS", Type.of(num) + ' ' + num, 20003, done);
        num = 2
        Utils.registerEvent("testCLASSIC_JS", Type.of(num) + ' ' + num, 20004, done);
        num = 1
        Utils.registerEvent("testCSS", Type.of(num) + ' ' + num, 20005, done);
        num = 0
        Utils.registerEvent("testIMAGE", Type.of(num) + ' ' + num, 20006, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
      })
  })
}