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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach, expect } from '../../../hypium/index';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext: common.UIAbilityContext;


export default function webResourceResponseSet() {

  describe('WebResourceResponseSetTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsaceloadmetricenhancedtestthree.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ', err);
        throw (err as Error);
      }
    })

    /**
     * @tc.name   testSetResponseDataStatic001
     * @tc.number SUB_WEB_SETRESPONSEDATA_0100
     * @tc.desc   test setResponseData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResponseDataStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseData001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseData001", '""', 36010, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })

    /**
     * @tc.name   testSetResponseEncodingStatic001
     * @tc.number SUB_WEB_SETRESPONSEENCODING_0100
     * @tc.desc   test setResponseEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResponseEncodingStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseEncoding001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseEncoding001", 'utf-8', 36011, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })

    /**
     * @tc.name   testSetResponseMimeTypeStatic001
     * @tc.number SUB_WEB_SETRESPONSEMIMETYPE_0100
     * @tc.desc   test setResponseMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResponseMimeTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseMimeType001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseMimeType001", "text/html", 36012, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })

    /**
     * @tc.name   testSetReasonMessageStatic001
     * @tc.number SUB_WEB_SETREASONMESSAGE_0100
     * @tc.desc   test setReasonMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetReasonMessageStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetReasonMessage001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetReasonMessage001", "Forbidden", 36013, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })

    /**
     * @tc.name   testSetResponseHeaderStatic001
     * @tc.number SUB_WEB_SETRESPONSEHEADER_0100
     * @tc.desc   test setResponseHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResponseHeaderStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseHeader001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseHeader001", true, 36014, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })

    /**
     * @tc.name   testSetResponseCodeStatic001
     * @tc.number SUB_WEB_SETRESPONSECODE_0100
     * @tc.desc   test setResponseCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResponseCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseCode001", 403, 36015, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })

    /**
     * @tc.name   testSetResponseIsReadyStatic001
     * @tc.number SUB_WEB_SETRESPONSEISREADY_0100
     * @tc.desc   test setResponseIsReady
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResponseIsReadyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseIsReady001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseIsReady001", "test", 36016, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(7000);
        done();
      })
  })
}
