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
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webPrefetchPageEnhancedTest() {

  describe('webPrefetchPageEnhancedTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebPrefetchPageEnhanced',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebPrefetchPageEnhanced state success ' + JSON.stringify(pages));
        if (!('WebPrefetchPageEnhanced' == pages.name)) {
          console.info('get WebPrefetchPageEnhanced state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebPrefetchPageEnhanced page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebPrefetchPageEnhanced page error: ' + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebPrefetchPageEnhancedButton'),10000);
      console.log('waitForComponent WebPrefetchPageEnhancedButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebPrefetchPageEnhanced beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebPrefetchPageEnhanced afterEach start');
      done();
    })

    /**
     * @tc.name   testPrefetchPageWithHeader01
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_HEADER_API_0001
     * @tc.desc   test prefetchPage url with additionalHeaders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchPageWithHeader01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithHeader01', 119);
      Utils.registerBaseEvent('testPrefetchPageWithHeader01', 'no error', 2025091601, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithHeader02
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_HEADER_API_0002
     * @tc.desc   test prefetchPage url with additionalHeaders null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithHeader02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithHeader02', 119);
      Utils.registerBaseEvent('testPrefetchPageWithHeader02', 'no error', 2025091602, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithHeader03
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_HEADER_API_0003
     * @tc.desc   test prefetchPage url with additionalHeaders undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithHeader03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithHeader03', 119);
      Utils.registerBaseEvent('testPrefetchPageWithHeader03', 'no error', 2025091603, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithHeaderError01
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_HEADER_ERROR_API_0001
     * @tc.desc   test prefetchPage url with additionalHeaders errorCode 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPrefetchPageWithHeaderError01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithHeaderError01', 119);
      Utils.registerBaseEvent('testPrefetchPageWithHeaderError01', '17100002URL error. The webpage corresponding to the URL is invalid, or the URL length exceeds 2*1024*1024.', 26020501, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })

    /**
     * @tc.name   testPrefetchPageWithOptions01
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0001
     * @tc.desc   test prefetchPage url with prefetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions01', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions01', 'no error', 2025091604, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions02
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0002
     * @tc.desc   test prefetchPage url with header prefetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions02', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions02', 'no error', 2025091605, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions03
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0003
     * @tc.desc   test prefetchPage url with minTimeBetweenPrefetchesMs -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions03', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions03', 'no error', 2025091606, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions04
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0004
     * @tc.desc   test prefetchPage url with minTimeBetweenPrefetchesMs 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions04', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions04', 'no error', 2025091607, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions05
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0005
     * @tc.desc   test prefetchPage url with minTimeBetweenPrefetchesMs 3.145
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions05', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions05', 'no error', 2025091608, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions06
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0006
     * @tc.desc   test prefetchPage url with minTimeBetweenPrefetchesMs 501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions06', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions06', 'no error', 2025091609, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions07
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0007
     * @tc.desc   test prefetchPage url with minTimeBetweenPrefetchesMs 1e10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions07', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions07', 'no error', 2025091610, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions08
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0008
     * @tc.desc   test prefetchPage url with minTimeBetweenPrefetchesMs 999999999999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions08', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions08', 'no error', 2025091611, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions09
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0009
     * @tc.desc   test prefetchPage url with PrefetchOptions with only minTimeBetweenPrefetchesMs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions09', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions09', 'no error', 2025091612, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions10
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0010
     * @tc.desc   test prefetchPage url with PrefetchOptions with only ignoreCacheControlNoStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions10', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions10', 'no error', 2025091613, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptions11
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_API_0011
     * @tc.desc   test prefetchPage url with PrefetchOptions without minTimeBetweenPrefetchesMs ignoreCacheControlNoStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchPageWithOptions11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptions11', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptions11', 'no error', 2025091614, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptionsError01
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_ERROR_API_0001
     * @tc.desc   test prefetchPage url with PrefetchOptions 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPrefetchPageWithOptionsError01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptionsError01', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptionsError01', 17100001, 2025091615, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })
    /**
     * @tc.name   testPrefetchPageWithOptionsError02
     * @tc.number SUB_ACE_WEB_PREFETCHPAGE_PREFETCHOPTIONS_ERROR_API_0002
     * @tc.desc   test prefetchPage url with PrefetchOptions 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPrefetchPageWithOptionsError02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitPrefetchPageWithOptionsError02', 119);
      Utils.registerBaseEvent('testPrefetchPageWithOptionsError02', '17100002URL error. The webpage corresponding to the URL is invalid, or the URL length exceeds 2*1024*1024.', 2025091616, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebPrefetchPageEnhancedButton', 10, '');
    })

  })
}
