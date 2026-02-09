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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function onSslErrorEventTwoTest() {

  describe('onSslErrorEventTwoTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/OnSslErrorEventTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get OnSslErrorEventTwo state success ' + JSON.stringify(pages));
        if (!('OnSslErrorEventTwo' == pages.name)) {
          console.info('get OnSslErrorEventTwo state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push OnSslErrorEventTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push OnSslErrorEventTwo page error: ' + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('OnSslErrorEventTwoButton'),10000);
      console.log('waitForComponent OnSslErrorEventTwoButton==>');
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
        if (data.chload >= 800 || data.rssi <= -80) {
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
      console.info('OnSslErrorEventTwo beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('OnSslErrorEventTwo afterEach start');
      done();
    })

    /**
     * @tc.name   testOnSslErrorEventAbortLoadingFalse
     * @tc.number SUB_ACE_WEB_ONSSLERROREVENT_ABORTLOADING_API_0001
     * @tc.desc   test onSslErrorEvent handleCancel abortLoading false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSslErrorEventAbortLoadingFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnSslErrorEventAbortLoadingFalse', 22);
      Utils.registerBaseEvent('testOnSslErrorEventAbortLoadingFalse', true, 2025081413, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnSslErrorEventTwoButton', 10, '');
    })
    /**
     * @tc.name   testOnSslErrorEventAbortLoadingTrue
     * @tc.number SUB_ACE_WEB_ONSSLERROREVENT_ABORTLOADING_API_0002
     * @tc.desc   test onSslErrorEvent handleCancel abortLoading true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSslErrorEventAbortLoadingTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnSslErrorEventAbortLoadingTrue', 22);
      Utils.registerBaseEvent('testOnSslErrorEventAbortLoadingTrue', -1, 2025082601, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnSslErrorEventTwoButton', 10, '');
    })


  })
}
