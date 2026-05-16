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
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function geolocationPermissions() {

  describe('GeolocationPermissionsTestSuite', (): void => {

    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testPrepareForPageLoadStatic001
     * @tc.number SUB_ACE_WEB_PREPARE_FORPAGELOAD_0100
     * @tc.desc   test prepareForPageLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrepareForPageLoadStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitPrepareForPageLoadStatic001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPrepareForPageLoadStatic001', true, 202603241, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPrepareForPageLoadStatic002
     * @tc.number SUB_WEB_PREPARE_FORPAGELOAD_0200
     * @tc.desc   test prepareForPageLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrepareForPageLoadStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitPrepareForPageLoadStatic002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPrepareForPageLoadStatic002', "17100002", 202603242, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPrepareForPageLoadStatic003
     * @tc.number SUB_ACE_WEB_PREPARE_FORPAGELOAD_0300
     * @tc.desc   test prepareForPageLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrepareForPageLoadStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitPrepareForPageLoadStatic003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPrepareForPageLoadStatic003', true, 202603243, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPrepareForPageLoadStatic004
     * @tc.number SUB_ACE_WEB_PREPARE_FORPAGELOAD_0400
     * @tc.desc   test prepareForPageLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrepareForPageLoadStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitPrepareForPageLoadStatic004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPrepareForPageLoadStatic004', "17100002", 202603244, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPrepareForPageLoadStatic005
     * @tc.number SUB_ACE_WEB_PREPARE_FORPAGELOAD_0500
     * @tc.desc   test prepareForPageLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrepareForPageLoadStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitPrepareForPageLoadStatic005', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPrepareForPageLoadStatic005', "17100013", 202603245, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetUrlTrustListStatic001
     * @tc.number SUB_WEB_SET_URLTRUSTLIST_0100
     * @tc.desc   test setUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSetUrlTrustListStatic01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetUrlTrustListStatic001', true, 202603246, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetUrlTrustListStatic002
     * @tc.number SUB_ACE_WEB_SET_URLTRUSTLIST_0200
     * @tc.desc   test setUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSetUrlTrustListStatic02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetUrlTrustListStatic002', true, 202603247, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetUrlTrustListStatic003
     * @tc.number SUB_ACE_WEB_SET_URLTRUSTLIST_0300
     * @tc.desc   test setUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSetUrlTrustListStatic03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetUrlTrustListStatic003', "17100001", 202603248, done);
        inspector.sendEventByKey('GeolocationPermissionsButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

  })
}
