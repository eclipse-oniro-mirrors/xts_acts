/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { beforeAll, afterEach, beforeEach, describe, it ,expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {

      await driver.waitForComponent(ON.id("webcomponent"), 10000);
      console.log("waitForComponent webcomponent");
      done()
    });
    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })


    /**
     * @tc.name   geolocationAccessFalse
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_021
     * @tc.desc   geolocationAccessFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('geolocationAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGeolocationAccessFalse", 160950)
      Utils.registerContainEvent("geolocationAccessFalse", "位置服务被拒绝", 160960, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   onGeolocationShow
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_024
     * @tc.desc   onGeolocationShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onGeolocationShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnGeolocationShow", 160950)
      Utils.registerContainEvent("onGeolocationShow", "onGeolocationShow", 160970, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   domStorageAccessFalse
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_025
     * @tc.desc   domStorageAccessFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('domStorageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDomStorageAccessFalse", 160950)
      Utils.registerContainEvent("domStorageAccessFalse", "sorry", 160980, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   domStorageAccessTrue
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_026
     * @tc.desc   domStorageAccessTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('domStorageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDomStorageAccessTrue", 160950)
      Utils.registerContainEvent("domStorageAccessTrue", "domapi", 160990, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   databaseAccessTrue
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_031
     * @tc.desc   databaseAccessTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('databaseAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDatabaseAccessTrue", 160950)
      Utils.registerContainEvent("databaseAccessTrue", "openDatabase", 161000, done);
      sendEventByKey('webcomponent', 10, '');
    })

  })
}
