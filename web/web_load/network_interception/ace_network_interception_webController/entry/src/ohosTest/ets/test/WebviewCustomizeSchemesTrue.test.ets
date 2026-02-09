/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();


export default function webviewCustomizeSchemesTrueTest() {

  describe('webviewCustomizeSchemesTrueTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewCustomizeSchemesTrue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewCustomizeSchemesTrue state success ' + JSON.stringify(pages));
        if (!("webviewCustomizeSchemesTrue" == pages.name)) {
          console.info('get webviewCustomizeSchemesTrue state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewCustomizeSchemesTrue page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewCustomizeSchemesTrue page error: ' + err);
      }
      await driver.waitForComponent(ON.id('CustomizeSchemesTrueButton'),10000);
      console.log('CustomizeSchemesTrueButton click==>');
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
      console.info('webviewCustomizeSchemesTrue beforeEach start');
      done();
    })


    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue01
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0100
     * @tc.desc   test lazyInitWebEngine true fetch request in customizeSchemes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue01', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue01', true, 2025102801,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue02
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0200
     * @tc.desc   test lazyInitWebEngine true fetch request not in customizeSchemes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue02', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue02', true, 2025102802,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue03
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0300
     * @tc.desc   test lazyInitWebEngine true isSupportCORS true isSupportFetch false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue03', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue03', true, 2025102803,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue04
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0400
     * @tc.desc   test lazyInitWebEngine true isSupportCORS false isSupportFetch false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue04', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue04', true, 2025102804,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineError01
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_ERROR_0100
     * @tc.desc   test lazyInitWebEngine true schemeName length exceeds 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineError01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineError01', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineError01', 401, 2025102805,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineError02
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_ERROR_0200
     * @tc.desc   test lazyInitWebEngine true customizeSchemes length exceeds 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineError02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineError02', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineError02', 401, 2025102806,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineError03
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_ERROR_0300
     * @tc.desc   test lazyInitWebEngine true customizeSchemes 17100020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineError03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineError03', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineError03', 17100020, 2025102807,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })


  })
}
