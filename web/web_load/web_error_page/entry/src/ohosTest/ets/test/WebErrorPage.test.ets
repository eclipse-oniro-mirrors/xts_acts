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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webErrorPageTest() {

  describe('webErrorPageTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebErrorPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebErrorPage state success ' + JSON.stringify(pages));
        if (!('WebErrorPage' == pages.name)) {
          console.info('get WebErrorPage state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebErrorPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebErrorPage page error: ' + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebErrorPageButton'),10000);
      console.log('waitForComponent WebErrorPageButton==>');
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
      console.info('WebErrorPage beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebErrorPage afterEach start');
      done();
    })

    /**
     * @tc.name   testSetErrorPageEnabledAndGetErrorPageEnabled01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0001
     * @tc.desc   test setErrorPageEnabled true getErrorPageEnabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledAndGetErrorPageEnabled01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled01', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledAndGetErrorPageEnabled01', true, 2025081401, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledAndGetErrorPageEnabled02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0002
     * @tc.desc   test setErrorPageEnabled false getErrorPageEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledAndGetErrorPageEnabled02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled02', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledAndGetErrorPageEnabled02', false, 2025081402, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledErrorCode01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0003
     * @tc.desc   test setErrorPageEnabled null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode01', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledErrorCode01', 401, 2025081403, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledErrorCode02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0004
     * @tc.desc   test setErrorPageEnabled undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode02', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledErrorCode02', 401, 2025081404, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledErrorCode03
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0005
     * @tc.desc   test setErrorPageEnabled init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCode03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode03', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledErrorCode03', 17100001, 2025081405, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testGetErrorPageEnabledErrorCode01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0006
     * @tc.desc   test setErrorPageEnabled init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetErrorPageEnabledErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetErrorPageEnabledErrorCode01', 19);
      Utils.registerBaseEvent('testGetErrorPageEnabledErrorCode01', 17100001, 2025081406, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testOnOverrideErrorPage01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0007
     * @tc.desc   test onOverrideErrorPage invalid url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnOverrideErrorPage01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnOverrideErrorPage01', 19);
      Utils.registerBaseEvent('testOnOverrideErrorPage01', -106, 2025081407, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testOnOverrideErrorPage02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0008
     * @tc.desc   test onOverrideErrorPage http response empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnOverrideErrorPage02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnOverrideErrorPage02', 19);
      Utils.registerBaseEvent('testOnOverrideErrorPage02', 400, 2025081408, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })

  })
}
