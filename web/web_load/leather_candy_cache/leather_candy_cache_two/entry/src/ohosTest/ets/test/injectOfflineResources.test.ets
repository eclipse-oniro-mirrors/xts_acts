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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function injectOfflineResourcesTest() {

  describe('injectOfflineResourcesTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/injectOfflineResourcesTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get injectOfflineResourcesTest state success ' + JSON.stringify(pages));
        if (!('injectOfflineResourcesTest' == pages.name)) {
          console.info('get injectOfflineResourcesTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push injectOfflineResourcesTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push injectOfflineResourcesTest page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('injectOfflineResourcesTest beforeEach start');
      done();
    })

    /**
     * @tc.name   testInjectOfflineResources001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0100
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInjectOfflineResources001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources001", 148311)
      Utils.registerBaseEvent("testInjectOfflineResources001", true, 148360, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('injectOfflineResourcesTestButton',driver)
    })
    /**
     * @tc.name   testInjectOfflineResources002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0200
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInjectOfflineResources002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources002", 148311)
      Utils.registerBaseEvent("testInjectOfflineResources002", '401', 148370, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('injectOfflineResourcesTestButton',driver)
    })
    /**
     * @tc.name   testInjectOfflineResources003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0300
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInjectOfflineResources003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources003", 148311)
      Utils.registerBaseEvent("testInjectOfflineResources003", '401', 148380, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('injectOfflineResourcesTestButton',driver)
    })
    /**
     * @tc.name   testInjectOfflineResources004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0400
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInjectOfflineResources004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources004", 148311)
      Utils.registerBaseEvent("testInjectOfflineResources004", '17100002URL error. The webpage corresponding to the URL is invalid, or the URL length exceeds 2*1024*1024.', 148390, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('injectOfflineResourcesTestButton',driver)
    })
    /**
     * @tc.name   testInjectOfflineResources005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0500
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInjectOfflineResources005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources005", 148311)
      Utils.registerBaseEvent("testInjectOfflineResources005", '17100001', 148400, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('injectOfflineResourcesTestButton',driver)
    })
  })
}
