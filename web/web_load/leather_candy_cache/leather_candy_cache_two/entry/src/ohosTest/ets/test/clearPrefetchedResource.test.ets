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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function clearPrefetchedResourceTest() {

  describe('clearPrefetchedResourceTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/clearPrefetchedResourceTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clearPrefetchedResourceTest state success " + JSON.stringify(pages));
        if (!("clearPrefetchedResourceTest" == pages.name)) {
          console.info("get clearPrefetchedResourceTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(900);
          console.info("push clearPrefetchedResourceTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push clearPrefetchedResourceTest page error: " + err);
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
      console.info("clearPrefetchedResourceTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0100
    * @tc.name       : testClearPrefetchedResource001
    * @tc.desc       : test clearPrefetchedResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearPrefetchedResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource001", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testClearPrefetchedResource001", true, 10112, done);
      sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0200
    * @tc.name       : testClearPrefetchedResource002
    * @tc.desc       : test clearPrefetchedResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearPrefetchedResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource002", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testClearPrefetchedResource002", '401', 10113, done);
      sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0300
    * @tc.name       : testClearPrefetchedResource003
    * @tc.desc       : test clearPrefetchedResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearPrefetchedResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource003", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testClearPrefetchedResource003", '401', 10114, done);
      sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0400
    * @tc.name       : testClearPrefetchedResource004
    * @tc.desc       : test clearPrefetchedResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearPrefetchedResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource004", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testClearPrefetchedResource004", '401', 10115, done);
      sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_0500
    * @tc.name       : testClearPrefetchedResource005
    * @tc.desc       : test clearPrefetchedResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearPrefetchedResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearPrefetchedResource005", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testClearPrefetchedResource005", '401', 10116, done);
      sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_0600
    * @tc.name       : testCustomizeSchemes001
    * @tc.desc       : test customizeSchemes
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomizeSchemes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemes001", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testCustomizeSchemes001", '17100020', 10117, done);
      sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
    })
  })
}
