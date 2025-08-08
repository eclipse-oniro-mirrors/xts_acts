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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function injectOfflineResourcesTest() {

  describe('injectOfflineResourcesTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/injectOfflineResourcesTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get injectOfflineResourcesTest state success " + JSON.stringify(pages));
        if (!("injectOfflineResourcesTest" == pages.name)) {
          console.info("get injectOfflineResourcesTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(900);
          console.info("push injectOfflineResourcesTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push injectOfflineResourcesTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(500);
      console.info("injectOfflineResourcesTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0100
    * @tc.name       : testInjectOfflineResources001
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResources001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources001", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testInjectOfflineResources001", true, 20001, done);
      sendEventByKey('injectOfflineResourcesTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0200
    * @tc.name       : testInjectOfflineResources002
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResources002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources002", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testInjectOfflineResources002", '401', 20002, done);
      sendEventByKey('injectOfflineResourcesTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0300
    * @tc.name       : testInjectOfflineResources003
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResources003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources003", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testInjectOfflineResources003", '401', 20003, done);
      sendEventByKey('injectOfflineResourcesTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0400
    * @tc.name       : testInjectOfflineResources004
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResources004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources004", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testInjectOfflineResources004", '17100002', 20004, done);
      sendEventByKey('injectOfflineResourcesTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_0500
    * @tc.name       : testInjectOfflineResources005
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResources005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testInjectOfflineResources005", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testInjectOfflineResources005", '17100001', 20005, done);
      sendEventByKey('injectOfflineResourcesTestButton', 10, '');
    })
  })
}
