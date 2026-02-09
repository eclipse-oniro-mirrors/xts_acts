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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function clearPrefetchedResourceTest() {

  describe('clearPrefetchedResourceTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/clearPrefetchedResourceTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get clearPrefetchedResourceTest state success ' + JSON.stringify(pages));
        if (!('clearPrefetchedResourceTest' == pages.name)) {
          console.info('get clearPrefetchedResourceTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push clearPrefetchedResourceTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push clearPrefetchedResourceTest page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('clearPrefetchedResourceTest beforeEach start');
      done();
    })

    /**
     * @tc.name   testClearPrefetchedResource001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0100
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearPrefetchedResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource001", 148301);
      Utils.registerBaseEvent("testClearPrefetchedResource001", true, 148300, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('clearPrefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testClearPrefetchedResource002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0200
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearPrefetchedResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource002", 148301);
      Utils.registerBaseEvent("testClearPrefetchedResource002", '401', 148310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('clearPrefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testClearPrefetchedResource003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0300
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearPrefetchedResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource003", 148301);
      Utils.registerBaseEvent("testClearPrefetchedResource003", '401', 148320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('clearPrefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testClearPrefetchedResource004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0400
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearPrefetchedResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource004", 148301);
      Utils.registerBaseEvent("testClearPrefetchedResource004", '401', 148330, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('clearPrefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testClearPrefetchedResource005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0500
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearPrefetchedResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource005", 148301);
      Utils.registerBaseEvent("testClearPrefetchedResource005", '401', 148340, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('clearPrefetchedResourceTestButton',driver);
    })
    /**
     * @tc.name   testCustomizeSchemes001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_0600
     * @tc.desc   test customizeSchemes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomizeSchemes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemes001", 148301);
      Utils.registerBaseEvent("testCustomizeSchemes001", '17100020', 148350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('clearPrefetchedResourceTestButton',driver);
    })
  })
}
