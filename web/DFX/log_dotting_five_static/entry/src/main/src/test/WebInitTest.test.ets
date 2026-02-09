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

import { beforeAll, beforeEach, TestType,afterEach, describe, it, TestType,  Size, Level } from '../../../hypium/index';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import Utils from '../../src/test/Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext: common.UIAbilityContext;

export default function WebInitTest() {

  describe('WebInitTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });

    beforeEach(async (done: () => void): Promise<void> => {	 
      await Utils.msSleep(2000); 
      console.info('webOnFirstContFour beforeEach start'); 
      if(!wifiMg.isWifiActive()){
        let state:boolean = wifiMg.isWifiActive();
        console.info("======> wifi_test/enable wifi: enabled " + state);
        await Utils.msSleep(2000);
      }
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }
        done();
      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
        done();
      }
    })

    /*
        * @tc.number     SUB_WEB_WEBCUSTOMIZESCHEMES_0100
        * @tc.name       customizeSchemesStatic0100
        * @tc.desc       test WebcustomizeSchemes
        * @tc.size       MediumTest
        * @tc.type       Function
        * @tc.level      Level 3
        */
    it('customizeSchemesStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("customizeSchemes0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("customizeSchemes0100", 401, 300, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('customizeSchemes', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /*
    * @tc.number     SUB_WEB_WEBCUSTOMIZESCHEMES_0200
    * @tc.name       customizeSchemesStatic0200
    * @tc.desc       test WebcustomizeSchemes
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 3
    */
    it('customizeSchemesStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("customizeSchemes0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("customizeSchemes0200", 17100020, 302, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('customizeSchemes', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /*
    * @tc.number     SUB_WEB_EMITONSWITCHNEXTPAGE_0100
    * @tc.name       emitonSwitchNextPage
    * @tc.desc       test emitonSwitchNextPage
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 3
    */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('customizeSchemes', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
