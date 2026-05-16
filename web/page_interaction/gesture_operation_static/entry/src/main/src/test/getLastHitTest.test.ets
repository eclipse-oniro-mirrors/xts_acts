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

export default function HitTest() {

  describe('getLastHitTest', () => {
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
      }, (err: BusinessError | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageInteractionThree.test.static")
      await Utils.msSleep(2000)
      console.log("[Boruto-0]:beforeAll end,%s", "Succeed!")
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

    afterEach(async () => {
      await Utils.msSleep(2000);
      console.info("web afterEach finish");
    })


    /**
     * @tc.name   getLastHitTestStatic001
     * @tc.number getLastHitTest001
     * @tc.desc   test getLastHitTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLastHitTestStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("getLastHitTest001", 10)
        await Utils.msSleep(2000);

        let driver = Driver.create();
        let component = await driver.findComponent(ON.text('www.example.com'));
        if (component) {
          await component.click();
        }
        Utils.registerEvent("getLastHitTest001", true, 20250313, done);
        inspector.sendEventByKey('webGetLastHitTest', 10, '');
        await Utils.msSleep(2000)
        done()
      })

    /**
     * @tc.name   onLoadInterceptEventDataStatic001
     * @tc.number onLoadInterceptEventDataTest001
     * @tc.desc   test onLoadInterceptEventDataTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onLoadInterceptEventDataStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("onLoadInterceptEventDataTest001", 10)
        await Utils.msSleep(2000);

        let driver = Driver.create();
        let component = await driver.findComponent(ON.text('www.example.com'));
        if (component) {
          await component.click();
        }
        Utils.registerEvent("onLoadInterceptEventDataStatic001", "https://www.example.com/", 202503131, done);
        inspector.sendEventByKey('webGetLastHitTest', 10, '');
        await Utils.msSleep(2000)
        done()
      })
	  
	    /**
     * @tc.name   getLastHitTestStatic002
     * @tc.number SUB_WEB_GETLASTHITTEST_STATIC_0200
     * @tc.desc   getLastHitTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLastHitTestStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("getLastHitTest002", 10)
        await Utils.msSleep(2000);

        let driver = Driver.create();
        let component = await driver.findComponent(ON.text('www.example.com'));
        if (component) {
          await component.click();
        }
        Utils.registerEvent("getLastHitTest002", true, 20250314, done);
        inspector.sendEventByKey('webGetLastHitTest', 10, '');
        await Utils.msSleep(5000)
        done()
      })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webGetLastHitTest', 10, '');
        await Utils.msSleep(5000)
        done();
      })

  })
}
