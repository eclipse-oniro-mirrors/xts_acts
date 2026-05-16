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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''


export default function CertChainDataTest() {
  describe('CertChainDataTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
    * @tc.name        testCertChainDataStatic01
    * @tc.number      SUB_ACE_CERTCHAINDATA_API_202412099
    * @tc.desc        test certChainData01 interface when choose callback mode.
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testCertChainDataStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>{
        await Utils.msSleep(2000);
        Utils.emitEvent("certChainData01", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("certChainData01",true,202412099,done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('certChainDataWeb',10,'');
        await Utils.msSleep(5000);
        done();
      })

    /**
    * @tc.name        testOnHttpErrorReceiveStatic
    * @tc.number      SUB_ACE_CERTCHAINDATA_API_001
    * @tc.desc        test certChainData01 interface when choose callback mode.
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnHttpErrorReceiveStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>{
        await Utils.msSleep(2000);
        Utils.emitEvent("onHttpErrorReceive", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("onHttpErrorReceive",true,2024120991,done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('certChainDataWeb',10,'');
        await Utils.msSleep(5000);
        done();
      })

    /**
    * @tc.name        testOnErrorReceiveStatic
    * @tc.number      SUB_ACE_CERTCHAINDATA_API_001
    * @tc.desc        test certChainData01 interface when choose callback mode.
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnErrorReceiveStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>{
        await Utils.msSleep(2000);
        Utils.emitEvent("onErrorReceive", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("onErrorReceive",true,2024120992,done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('certChainDataWeb',10,'');
        await Utils.msSleep(5000);
        done();
      })


    /**
    * @tc.name        testOnSslErrorEventStatic
    * @tc.number      SUB_ACE_CERTCHAINDATA_API_001
    * @tc.desc        test certChainData01 interface when choose callback mode.
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnSslErrorEventStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>{
        await Utils.msSleep(2000);
        Utils.emitEvent("onSslErrorEvent", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("onSslErrorEvent",true,2024120993,done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('certChainDataWeb',10,'');
        await Utils.msSleep(5000);
        done();
      })


    /**
    * @tc.name        testOnRequestSelectedStatic
    * @tc.number      SUB_ACE_CERTCHAINDATA_API_001
    * @tc.desc        test certChainData01 interface when choose callback mode.
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnRequestSelectedStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>{
        await Utils.msSleep(2000);
        Utils.emitEvent("onRequestSelected", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("onRequestSelected",true,2024120994,done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('certChainDataWeb',10,'');
        await Utils.msSleep(5000);
        done();
      })

    /**
    * @tc.name        emitonSwitchNextPageStatic
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_2024120994
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitonSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('certChainDataWeb', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
