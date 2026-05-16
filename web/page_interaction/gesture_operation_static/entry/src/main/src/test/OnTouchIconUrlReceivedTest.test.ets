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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext: common.UIAbilityContext;

export default function onTouchIconUrlReceived() {

  describe('onTouchIconUrlReceived', () => {
    beforeAll(async  (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
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

    /**
     * @tc.name   onFaviconReceivedEventFaviconStatic001
     * @tc.number onFaviconReceivedEventFaviconTest001
     * @tc.desc   test onFaviconReceivedEventFaviconTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onFaviconReceivedEventFaviconStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("onFaviconReceivedEventFaviconTest001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("onFaviconReceivedEventFaviconStatic001", true, 202503132, done);
        inspector.sendEventByKey('onTouch', 10, '');
        await Utils.msSleep(2000)
        done()
      })

    /**
     * @tc.name   onTouchIconUrlReceivedEventPrecomposedStatic001
     * @tc.number onTouchIconUrlReceivedEventPrecomposedTest001
     * @tc.desc   test onTouchIconUrlReceivedEventPrecomposedTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onTouchIconUrlReceivedEventPrecomposedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("onTouchIconUrlReceivedEventPrecomposedTest001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("onTouchIconUrlReceivedEventPrecomposedStatic001", true, 202503133, done);
        inspector.sendEventByKey('onTouch', 10, '');
        await Utils.msSleep(2000)
        done()
      })

    /**
     * @tc.name   onTouchIconUrlReceivedEventUrlStatic001
     * @tc.number onTouchIconUrlReceivedEventUrlTest001
     * @tc.desc   test onTouchIconUrlReceivedEventUrlTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onTouchIconUrlReceivedEventUrlStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("onTouchIconUrlReceivedEventUrlTest001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("onTouchIconUrlReceivedEventUrlStatic001","resource://rawfile/icon.png" , 202503134, done);
        inspector.sendEventByKey('onTouch', 10, '');
        await Utils.msSleep(8000)
        done()
      })
  })
}
