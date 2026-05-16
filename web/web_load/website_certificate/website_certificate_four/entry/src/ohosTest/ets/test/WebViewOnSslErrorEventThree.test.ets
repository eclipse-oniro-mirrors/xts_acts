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

export default function webViewOnSslErrorEventThree() {

  describe('webViewOnSslErrorEventThree', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnSslErrorEventThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewOnSslErrorEventThree state success ' + JSON.stringify(pages));
        if (!('webViewOnSslErrorEventThree' == pages.name)) {
          console.info('get webViewOnSslErrorEventThree state success ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info('push webViewOnSslErrorEventThree page success');
        }
      } catch (err) {
        console.error('push webViewOnSslErrorEventThree page error: ' + err);
      }
      await driver.waitForComponent(ON.id('OnSslErrorEventThreeButton'),10000);
      console.log('waitForComponent OnSslErrorEventThreeButton==>');
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
     * @tc.name   testOnSslErrorEventHandleConfirm
     * @tc.number SUB_WEB_ONSSLERROREVENT_HANDLER_0100
     * @tc.desc   test onSslErrorEvent handleConfirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSslErrorEventHandleConfirm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnSslErrorEventHandleConfirm", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testOnSslErrorEventHandleConfirm", 'https://expired.badssl.com/', 26031021, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnSslErrorEventHandleConfirm", 'https://expired.badssl.com/', 26031022, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnSslErrorEventHandleConfirm", '', 26031023, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnSslErrorEventHandleConfirm", false, 26031024, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnSslErrorEventHandleConfirm", true, 26031025, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnSslErrorEventHandleConfirm", true, 26031026, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnSslErrorEventThreeButton', 10, '');
    })
    /**
     * @tc.name   testOnSslErrorEventHandleCancel
     * @tc.number SUB_WEB_ONSSLERROREVENT_HANDLER_0200
     * @tc.desc   test onSslErrorEvent handleCancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSslErrorEventHandleCancel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnSslErrorEventHandleCancel", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testOnSslErrorEventHandleCancel", true, 26031027, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnSslErrorEventThreeButton', 10, '');
    })
  })
}