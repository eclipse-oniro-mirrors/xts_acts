/**
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function webTwoJsunit() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
        console.log(' App start')
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
    * @tc.name        testOnSslErrorEventReceiveStatic001
    * @tc.number      SUB_WEB_ONSSLERROREVENTRECEIVE_0100
    * @tc.desc        test onSslErrorEventReceive handleConfirm
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnSslErrorEventReceiveStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testOnSslErrorEventReceive001", 10)
      Utils.registerEvent("testOnSslErrorEventReceive001", true, 30272, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('SslErrorHandlerButton', 10, '');
      await Utils.msSleep(12000);
      done()
    })

    /**
    * @tc.name        testSslErrorHandlerHandleCancelStatic001
    * @tc.number      SUB_WEB_SSLERRORHANDLERHANDLECANCEL_0100
    * @tc.desc        test sslErrorHandler handleCancel
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testSslErrorHandlerHandleCancelStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testSslErrorHandlerHandleCancel001", 10)
      Utils.registerEvent("testSslErrorHandlerHandleCancel001", 0, 30271, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('SslErrorHandlerButton', 10, '');
      await Utils.msSleep(12000);
      done()
    })

    /***
    * @tc.name        testSslErrorHandlerHandleCancelStatic002
    * @tc.number      SUB_WEB_SSLERRORHANDLERHANDLECANCEL_0200
    * @tc.desc        test sslErrorHandler handleCancel(true)
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('testSslErrorHandlerHandleCancelStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testSslErrorHandlerHandleCancel002", 10)
      Utils.registerEvent("testSslErrorHandlerHandleCancel002", 0, 302711, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('SslErrorHandlerButton', 10, '');
      await Utils.msSleep(12000);
      done()
    })

    /***
    * @tc.name        testSslErrorHandlerHandleCancelStatic003
    * @tc.number      SUB_WEB_SSLERRORHANDLERHANDLECANCEL_0300
    * @tc.desc        test sslErrorHandler handleCancel(false)
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('testSslErrorHandlerHandleCancelStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testSslErrorHandlerHandleCancel003", 10)
      Utils.registerEvent("testSslErrorHandlerHandleCancel003", 0, 302712, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('SslErrorHandlerButton', 10, '');
      await Utils.msSleep(12000);
      done()
    })

    /**
    * @tc.name        testSslErrorHandlerHandleConfirmStatic001
    * @tc.number      SUB_WEB_SSLERRORHANDLERHANDLECONFIRM_0100
    * @tc.desc        test sslErrorHandler handleConfirm
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testSslErrorHandlerHandleConfirmStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testSslErrorHandlerHandleConfirm001", 10)
      Utils.registerEvent("testSslErrorHandlerHandleConfirm001", true, 30270, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('SslErrorHandlerButton', 10, '');
      await Utils.msSleep(12000);
      done()
    })

    /**
    * @tc.name        testClearSslCacheStatic001
    * @tc.number      SUB_WEB_WEBVIEWCONTROLLER_CLEARSSLCACHE_0100
    * @tc.desc        test clearSslCache
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testClearSslCacheStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testClearSslCache001", 10)
      Utils.registerEvent("testClearSslCache001", true, 100073, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('SslErrorHandlerButton', 10, '');
      await Utils.msSleep(12000);
      done()
    })
  })
}
