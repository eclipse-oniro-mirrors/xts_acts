/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import wifiMg from '@ohos.wifiManager';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

//let emitKey = "emitClearMatches";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {
      await waitForComponent("webcomponent");
      done()
    });

    beforeEach(async (done: Function) => {
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
        if (data.chload >= 800 || data.rssi <= -80) {
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
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   ClearMatches
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_017
     * @tc.desc   ClearMatches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ClearMatches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearMatches", 119790)
      Utils.registerEvent("ClearMatches", "17100001", 119800, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   SearchNext
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_018
     * @tc.desc   SearchNext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchNext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSearchNext", 119790)
      Utils.registerEvent("SearchNext", "17100001", 119810, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   ClearSslCache
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_019
     * @tc.desc   ClearSslCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ClearSslCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearSslCache", 119790)
      Utils.registerEvent("ClearSslCache", "17100001", 119820, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   ClearClientAuthenticationCache
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_020
     * @tc.desc   ClearClientAuthenticationCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ClearClientAuthenticationCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearClientAuthenticationCache", 119790)
      Utils.registerEvent("ClearClientAuthenticationCache", "17100001", 119830, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   Stop
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_021
     * @tc.desc   Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStop", 119790)
      Utils.registerEvent("Stop", "17100001", 119840, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   RequestFocus
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_022
     * @tc.desc   RequestFocus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RequestFocus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRequestFocus", 119790)
      Utils.registerEvent("RequestFocus", "17100001",119850, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   ZoomIn
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_023
     * @tc.desc   ZoomIn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ZoomIn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitZoomIn", 119790)
      Utils.registerEvent("ZoomIn", "17100001", 119860, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   ZoomOut
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_024
     * @tc.desc   ZoomOut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ZoomOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitZoomOut", 119790)
      Utils.registerEvent("ZoomOut", "17100001", 119870, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   GetWebId
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_025
     * @tc.desc   GetWebId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWebId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetWebId", 119790)
      Utils.registerEvent("GetWebId", "17100001", 119880, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   GetUserAgent
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_026
     * @tc.desc   GetUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetUserAgent", 119790)
      Utils.registerEvent("GetUserAgent", "17100001", 119890, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   GetPageHeigth
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_027
     * @tc.desc   GetPageHeigth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetPageHeigth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetPageHeigth", 119790)
      Utils.registerEvent("GetPageHeigth", "17100001", 119900, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   BackOrForward
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_028
     * @tc.desc   BackOrForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackOrForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitBackOrForward", 119790)
      Utils.registerEvent("BackOrForward", "17100001", 119910, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   GetUrl
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_030
     * @tc.desc   GetUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetUrl", 119790)
      Utils.registerContainEvent("GetUrl", "17100001", 119920, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
