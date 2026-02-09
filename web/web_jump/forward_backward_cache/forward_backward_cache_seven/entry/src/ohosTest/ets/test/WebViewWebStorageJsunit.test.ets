/**
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
import { Constants } from './Constants.test'
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function WebViewWebStorageJsunit() {
  describe('actsAceWebViewWebStorageJsunit', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webStorage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webStorage state success ' + JSON.stringify(pages));
        if (!('webStorage' == pages.name)) {
          console.info('get webStorage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webStorage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webStorage page error: ' + err);
      }
      await Utils.sleep(10000)
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
      console.info('webStorage beforeEach start');
      done();
    });

    afterEach(async (done: Function) => {
      console.info('webStorage afterEach start');
      done();
    })

    /**
     * @tc.name   testGetOriginsCallbackLoadWebkit01
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0100
     * @tc.desc   test api getOrigins callback mode by checking the value 0f Origins[0].origin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadWebkit01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadWebkit01', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadWebkit01', Constants.ORIGIN_URL, 137860, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadWebkit02
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0200
     * @tc.desc   test api getOrigins callback mode by checking the value 0f  Origins[0].usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadWebkit02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadWebkit02', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadWebkit02', true, 137870, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadWebkit03
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0300
     * @tc.desc   test api getOrigins callback mode by the value 0f checking Origins[0].quote
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadWebkit03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadWebkit03', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadWebkit03', true, 137880, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadWebkit01
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0400
     * @tc.desc   test api getOrigins promise mode by checking the value 0f Origins[0].origin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadWebkit01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadWebkit01', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadWebkit01', Constants.ORIGIN_URL, 137890, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadWebkit02
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0500
     * @tc.desc   test api getOrigins promise mode by checking the value 0f  Origins[0].usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadWebkit02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadWebkit02', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadWebkit02', true, 137900, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadWebkit03
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0600
     * @tc.desc   test api getOrigins promise mode by the value 0f checking Origins[0].quote
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadWebkit03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadWebkit03', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadWebkit03', true, 137910, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadOnlineWebsite01
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0700
     * @tc.desc   test api getOrigins callback mode by checking the length of origins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadOnlineWebsite01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadOnlineWebsite01', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadOnlineWebsite01', 1, 137920, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadOnlineWebsite02
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0800
     * @tc.desc   test api getOrigins callback mode by checking the value 0f Origins[0].usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadOnlineWebsite02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadOnlineWebsite02', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadOnlineWebsite02', true, 137930, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadOnlineWebsite03
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0900
     * @tc.desc   test api getOrigins callback mode by checking the value 0f Origins[0].quota
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadOnlineWebsite03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadOnlineWebsite03', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadOnlineWebsite03', true, 137940, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadOnlineWebsite01
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1000
     * @tc.desc   test api getOrigins Promise mode by checking the length of origins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadOnlineWebsite01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadOnlineWebsite01', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadOnlineWebsite01', 1, 137950, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadOnlineWebsite02
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1100
     * @tc.desc   test api getOrigins Promise mode by checking the value 0f Origins[0].usage when load website
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadOnlineWebsite02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadOnlineWebsite02', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadOnlineWebsite02', true, 137960, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadOnlineWebsite03
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1200
     * @tc.desc   test api getOrigins Promise mode by checking the value 0f Origins[0].quota
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadOnlineWebsite03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadOnlineWebsite03', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadOnlineWebsite03', true, 137970, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadLocalHtml01
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1300
     * @tc.desc   test api getOrigins callback mode by checking the length of origins when load local html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadLocalHtml01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadLocalHtml01', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadLocalHtml01', 2, 137980, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadLocalHtml02
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1400
     * @tc.desc   test api getOrigins callback mode by checking the value 0f Origins[0].usage when load local html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadLocalHtml02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadLocalHtml02', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadLocalHtml02', true, 137990, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsCallbackLoadLocalHtml03
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1500
     * @tc.desc   test api getOrigins callback mode by checking the value 0f Origins[0].quota when load local html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsCallbackLoadLocalHtml03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsCallbackLoadLocalHtml03', 137850);
        Utils.registerEvent('testGetOriginsCallbackLoadLocalHtml03', true, 138000, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadLocalHtml02
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1700
     * @tc.desc   test api getOrigins callback mode by checking the value 0f Origins[0].usage when load local html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadLocalHtml02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadLocalHtml02', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadLocalHtml02', true, 138010, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testGetOriginsPromiseLoadLocalHtml03
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1800
     * @tc.desc   test api getOrigins Promise mode by checking the value 0f Origins[0].quota when load local html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginsPromiseLoadLocalHtml03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadLocalHtml03', 137850);
        Utils.registerEvent('testGetOriginsPromiseLoadLocalHtml03', true, 138020, done);
        sendEventByKey('webStorage', 10, '');
      })

    /**
     * @tc.name   testDeleteOrigin
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1900
     * @tc.desc   test api deleteOrigin by checking the value 0f getOriginUsage when delete 'resource://rawfile/'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitDeleteOrigin', 137850);
      Utils.registerEvent('testDeleteOrigin', 0, 138030, done);
      sendEventByKey('webStorage', 10, '');
    })

    /**
     * @tc.name   testDeleteAllData
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2000
     * @tc.desc   test api deleteAllData by checking the value 0f getOriginUsage when delete 'resource://rawfile/'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAllData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitDeleteAllData', 137850);
      Utils.registerEvent('testDeleteAllData', 0, 138040, done);
      sendEventByKey('webStorage', 10, '');
    })

    /**
     * @tc.name   testGetOriginQuotaCallback
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2100
     * @tc.desc   test api getOriginQuota callbcak mode by load loacal html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginQuotaCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetOriginQuotaCallback', 137850);
      Utils.registerEvent('testGetOriginQuotaCallback', true, 138050, done);
      sendEventByKey('webStorage', 10, '');
    })

    /**
     * @tc.name   testGetOriginQuotaPromise
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2200
     * @tc.desc   test api getOriginQuota callbcak mode by load loacal html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginQuotaPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetOriginQuotaPromise', 137850);
      Utils.registerEvent('testGetOriginQuotaPromise', true, 138060, done);
      sendEventByKey('webStorage', 10, '');
    })

    /**
     * @tc.name   testGetOriginUsageCallback
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2300
     * @tc.desc   test api getOriginUsage callbcak mode by load loacal html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginUsageCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetOriginUsageCallback', 137850);
      Utils.registerEvent('testGetOriginUsageCallback', true, 138070, done);
      sendEventByKey('webStorage', 10, '');
    })

    /**
     * @tc.name   testGetOriginUsagePromise
     * @tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2400
     * @tc.desc   test api getOriginUsage callbcak mode by load loacal html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginUsagePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetOriginUsagePromise', 137850);
      Utils.registerEvent('testGetOriginUsagePromise', true, 138080, done);
      sendEventByKey('webStorage', 10, '');
    })
  })
}