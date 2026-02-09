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
import { beforeAll,afterEach, beforeEach, describe, it , expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

export default function getSurfaceId() {
  describe('getSurfaceId', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/getSurfaceId',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSurfaceId state success " + JSON.stringify(pages));
        if (!("getSurfaceId" == pages.name)) {
          console.info("get getSurfaceId state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push getSurfaceId page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getSurfaceId page error: " + err);
      }
      await waitForComponent("getSurfaceIdButton");
      done();
    });

    beforeEach(async (done: Function) =>{
      if(!wifiMg.isWifiActive()){
        console.info("======> wifi_test/enable wifi:" + wifiMg.enableWifi());
        await Utils.sleep(5000);
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
          expect().message("======> WLAN Network error").assertFail(); //方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();//方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }

      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      await Utils.sleep(2000);
      console.info("getSurfaceId beforeEach start");
      done();
    })
    /**
     * @tc.name   emitGetSurfaceId0100
     * @tc.number emitGetSurfaceId0100
     * @tc.desc   emitGetSurfaceId0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetSurfaceId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetSurfaceId0100', 150000);
      Utils.registerEvent("emitGetSurfaceId0100", true, 150010, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
    /**
     * @tc.name   emitGetSurfaceId0200
     * @tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0200
     * @tc.desc   getSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetSurfaceId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetSurfaceId0200', 150000);
      Utils.registerEvent("emitGetSurfaceId0200", "17100001", 150020, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
    /**
     * @tc.name   emitGetSurfaceId0300
     * @tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0300
     * @tc.desc   getSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetSurfaceId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetSurfaceId0300', 150000);
      Utils.registerEvent("emitGetSurfaceId0300", "Init error. The WebviewController must be associated with a Web component", 150030, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
  })
}

