/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 202490;
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webViewOnSslErrorEventTwo() {

  describe('webViewOnSslErrorEventTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnSslErrorEventTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewOnSslErrorEventTwo state success ' + JSON.stringify(pages));
        if (!('webViewOnSslErrorEventTwo' == pages.name)) {
          console.info('get webViewOnSslErrorEventTwo state success ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info('push webViewOnSslErrorEventTwo page success');
        }
      } catch (err) {
        console.error('push webViewOnSslErrorEventTwo page error: ' + err);
      }
      await driver.waitForComponent(ON.id('onSslErrorEventCertChainDataButton'),10000);
      console.log('waitForComponent onSslErrorEventCertChainDataButton==>');
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
      console.info('webViewOnSslErrorEventTwo beforeEach start');
      done();
    })

    /**
     * @tc.name   testOnSslErrorEventCertChainData0100
     * @tc.number SUB_WEB_ONSSLERROREVENT_CERTCHAINDATA_0100
     * @tc.desc   test http onSslErrorEvent certChainData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSslErrorEventCertChainData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnSslErrorEventCertChainData0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("testOnSslErrorEventCertChainData0100", 1, 202500, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "onSslErrorEventCertChainDataButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnSslErrorEventCertChainData0100' + '_returnCheck', 1, 3000)) {
        done();
      }
    })
    /**
     * @tc.name   testOnSslErrorEventCertChainData0200
     * @tc.number SUB_WEB_ONSSLERROREVENT_CERTCHAINDATA_0200
     * @tc.desc   test iframe onSslErrorEvent certChainData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSslErrorEventCertChainData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnSslErrorEventCertChainData0200", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("testOnSslErrorEventCertChainData0200", 1, 202510, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "onSslErrorEventCertChainDataButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnSslErrorEventCertChainData0200' + '_returnCheck', 1, 3000)) {
        done();
      }
    })
  })
}