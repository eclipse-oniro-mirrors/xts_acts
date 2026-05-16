/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
// import { inspector.sendEventByKey } from '@internal.full.global';
import inspector from '@ohos.arkui.inspector';
// import { inspector.sendEventByKey } from "@kit.ArkUI"
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function ActsWebGetResponseDataExTest() {
  describe('ActsWebGetResponseDataExTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testGetResponseDataExStringStatic001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_STRING_0100
     * @tc.desc   test getResponseDataEx with HTML string return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExStringStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExString001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExString001", true, 134010, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetResponseDataExStringStatic002
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_STRING_0200
     * @tc.desc   test getResponseDataEx with plain string return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExStringStatic002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExString002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExString002", true, 134020, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetResponseDataExIntStatic001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_INT_0100
     * @tc.desc   test getResponseDataEx with file handle return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExIntStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExInt001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExInt001", true, 134030, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetResponseDataExIntStatic002
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_INT_0200
     * @tc.desc   test getResponseDataEx with zero file handle return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExIntStatic002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExInt001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExInt001", true, 134040, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetResponseDataExArrayBufferStatic001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_ARRAYBUFFER_0100
     * @tc.desc   test getResponseDataEx with ArrayBuffer return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExArrayBufferStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExArrayBuffer001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExArrayBuffer001", true, 134050, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetResponseDataExResourceStatic001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_RESOURCE_0100
     * @tc.desc   test getResponseDataEx with Resource return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExResourceStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExResource001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExResource001", true, 134060, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetResponseDataExUndefinedStatic001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_UNDEFINED_0100
     * @tc.desc   test getResponseDataEx with undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExUndefinedStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseDataExUndefined001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExUndefined001", true, 134070, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

  })
}
