/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function prefetchedResourceTest() {
  describe('prefetchedResourceTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/prefetchedResourceTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get prefetchedResourceTest state success ' + JSON.stringify(pages));
        if (!('prefetchedResourceTest' == pages.name)) {
          console.info('get prefetchedResourceTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push prefetchedResourceTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push prefetchedResourceTest page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('prefetchedResourceTest beforeEach start');
      done();
    })

    /**
     * @tc.name   testPrefetchedResource001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0100
     * @tc.desc   test PrefetchedResource first parameter1 is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrefetchedResource001", 148800);
      Utils.registerBaseEvent("testPrefetchedResource001", '17100002', 148810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testPrefetchedResource002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0200
     * @tc.desc   test PrefetchedResource first parameter1 is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrefetchedResource002", 148800);
      Utils.registerBaseEvent("testPrefetchedResource002", '17100002', 148820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testPrefetchedResource003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0300
     * @tc.desc   test PrefetchedResource first parameter2 is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource003", 148800);
        Utils.registerBaseEvent("testPrefetchedResource003", '401', 148830, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0400
     * @tc.desc   test PrefetchedResource first parameter2 is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource004", 148800);
        Utils.registerBaseEvent("testPrefetchedResource004", '401', 148840, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0500
     * @tc.desc   test PrefetchedResource first parameter3 is NA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource005", 148800);
        Utils.registerBaseEvent("testPrefetchedResource005", true, 148850, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0600
     * @tc.desc   test PrefetchedResource first parameter3 is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource006", 148800);
        Utils.registerBaseEvent("testPrefetchedResource006", "401", 148860, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0700
     * @tc.desc   test PrefetchedResource first parameter3 is unefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource007", 148800);
        Utils.registerBaseEvent("testPrefetchedResource007", "401", 148870, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0800
     * @tc.desc   test PrefetchedResource first parameter4 is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource008", 148800);
        Utils.registerBaseEvent("testPrefetchedResource008", "401", 148880, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_0900
     * @tc.desc   test PrefetchedResource first parameter4 is unefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource009", 148800);
        Utils.registerBaseEvent("testPrefetchedResource009", "401", 148890, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
    /**
     * @tc.name   testPrefetchedResource010
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHEDRESOURCE_1000
     * @tc.desc   test PrefetchedResource first parameter2 is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrefetchedResource010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testPrefetchedResource010", 148800);
        Utils.registerBaseEvent("testPrefetchedResource010", true, 148891, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('prefetchedResourceTestButton',driver);
      })
  })
}
