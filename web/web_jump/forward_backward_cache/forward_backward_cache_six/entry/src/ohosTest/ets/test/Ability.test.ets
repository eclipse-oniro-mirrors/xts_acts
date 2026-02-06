/*
* Copyright (C) 2024-2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function abilityTest() {
  describe('ActsAbilityTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('Index' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      await waitForComponent('webviewEnableBackForwardCacheButton');
      done()
    })

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewBFCacheSuspendPlayer beforeEach start');
      done();
    });

    afterEach(async (done: Function) => {
      console.info('webviewBFCacheSuspendPlayer afterEach start');
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0005
     * @tc.name testWebView_enableBackForwardCache0005
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137660, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_0005', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0006
     * @tc.name testWebView_enableBackForwardCache0006
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137670, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_0006', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0007
     * @tc.name testWebView_enableBackForwardCache0007
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137680, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_0007', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0008
     * @tc.name testWebView_enableBackForwardCache0008
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137690, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_0008', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0009
     * @tc.name testWebView_enableBackForwardCache0009
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137700, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_0009', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00010
     * @tc.name testWebView_enableBackForwardCache00010
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137710, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_00010', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00011
     * @tc.name testWebView_enableBackForwardCache00011
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137720, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_00011', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00012
     * @tc.name testWebView_enableBackForwardCache00012
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137730, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_00012', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00013
     * @tc.name testWebView_enableBackForwardCache00013
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache00013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137740, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_00013', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00014
     * @tc.name testWebView_enableBackForwardCache00014
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache00014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions', 'true', 137750, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_00014', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00015
     * @tc.name testWebView_enableBackForwardCache00016
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_enableBackForwardCache00016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.registerBaseEvent('setBackForwardCacheOptions',
          '17100001Init error. The WebviewController must be associated with a Web component', 137760, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('SUB_ACE_WEB_BFCACHE_SDK_00015', 137650)
        sendEventByKey('setBackForwardCacheOptions', 10, '');
      })
  })
}