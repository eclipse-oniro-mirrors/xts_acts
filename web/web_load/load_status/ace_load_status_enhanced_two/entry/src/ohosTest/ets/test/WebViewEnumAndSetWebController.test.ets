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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebViewEnumAndSetWebController() {

  describe('WebViewEnumAndSetWebControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndSetWebController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewEnumAndSetWebController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndSetWebController page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerDownloadTest afterEach end");
      done();
    })


    /*
    * @tc.number     : SUB_WEB_CACHEMODE_0200
    * @tc.name       : testCacheMode002
    * @tc.desc       : test cacheMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCacheMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeOnly", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCacheMode002", "cacheError", 1401, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CACHEMODE_0100
    * @tc.name       : testCacheMode001
    * @tc.desc       : test CacheMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCacheMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCacheModeDefault", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCacheMode001", '"index"', 1402, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CACHEMODE_0300
    * @tc.name       : testCacheMode003
    * @tc.desc       : test CacheMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCacheMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCacheModeOnline", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCacheMode003", true, 1405, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CACHEMODE_0400
    * @tc.name       : testCacheMode004
    * @tc.desc       : test CacheMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCacheMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCacheModeNone", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCacheMode004", "华为 - 构建万物互联的智能世界", 1406, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

  })
}
