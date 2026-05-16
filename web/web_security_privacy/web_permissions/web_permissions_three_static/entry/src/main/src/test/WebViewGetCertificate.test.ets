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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;


let emitKey = "emitGetCertificateCallback";
export default function webViewGetCertificate() {
  describe('ActsAceWebDevWebViewGetCertificateTest',  () =>{
    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.webpermissionsthreetest.static')
        await Utils.msSleep(5000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");

    })

    /**
     * @tc.name   testGetCertificateCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0100
     * @tc.desc   test interface of getCertificate with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCertificateCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      emitKey="emitGetCertificateCallback";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testGetCertificateCallback",true,403,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testGetCertificatePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0200
     * @tc.desc   test interface of getCertificate with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCertificatePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitGetCertificatePromise";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testGetCertificatePromise",true,404,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testGetCertificateNullStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0300
     * @tc.desc   test interface of getCertificate with Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCertificateNullStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitGetCertificateNull";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testGetCertificateNull","17100001",4043191,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testGetCertificateEmptyStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0400
     * @tc.desc   test interface of getCertificate with Empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCertificateEmptyStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitGetCertificateEmpty";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testGetCertificateEmpty","17100002",4043192,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testGetAttachStateStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0500
     * @tc.desc   test GetAttachState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttachStateStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitWebViewGetAttachState";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testGetAttachStateStatic",true,16013191,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testWaitForAttachedStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0600
     * @tc.desc   test waitForAttached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWaitForAttachedStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitWebViewWaitForAttached";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWaitForAttachedStatic",false,160131913,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testGetProgressStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0700
     * @tc.desc   test GetProgress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProgressStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitWebViewGetProgress";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testGetProgressStatic",true,16013194,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnRefreshAccessedHistoryEventStatic01
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0800
     * @tc.desc   test OnRefreshAccessedHistoryEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEventStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitOnRefreshAccessedHistoryEvent01";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testOnRefreshAccessedHistoryEventStatic01","success",160131941,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnRefreshAccessedHistoryEventStatic02
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_0900
     * @tc.desc   test OnRefreshAccessedHistoryEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEventStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitOnRefreshAccessedHistoryEvent02";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testOnRefreshAccessedHistoryEventStatic02","success",160131942,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnRefreshAccessedHistoryEventStatic03
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCERTIFICATE_API_1000
     * @tc.desc   test OnRefreshAccessedHistoryEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRefreshAccessedHistoryEventStatic03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitOnRefreshAccessedHistoryEvent03";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testOnRefreshAccessedHistoryEventStatic03",false,160131943,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewGetCertificate',10,'');
      await Utils.msSleep(5000);
      done();
    })
  })
}