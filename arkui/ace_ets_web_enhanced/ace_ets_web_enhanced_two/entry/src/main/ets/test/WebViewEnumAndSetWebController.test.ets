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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function WebViewEnumAndSetWebController() {

  describe('WebViewEnumAndSetWebControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewEnumAndSetWebController',
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
    * @tc.number     : SUB_WEB_OVERVIEWMODEACCESS_0100
    * @tc.name       : testOverviewModeAccess001
    * @tc.desc       : test OverviewModeAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOverviewModeAccess001', 0, async (done: Function) => {
      Utils.emitEvent("emitOverviewModeAccessTrue", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOverviewModeAccess001", '0.25', 1291, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONTOUCHICONURLRECEIVED_0100
    * @tc.name       : testOnTouchIconUrlReceived001
    * @tc.desc       : test onTouchIconUrlReceived
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnTouchIconUrlReceived001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnTouchIconUrlReceived", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnTouchIconUrlReceived001", 'resource://rawfile/icon.png', 1371, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CACHEMODE_0200
    * @tc.name       : testCacheMode002
    * @tc.desc       : test cacheMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCacheMode002', 0, async (done: Function) => {
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
    it('testCacheMode001', 0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeDefault", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCacheMode001", '"index"', 1402, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETITEMATINDEX_0100
    * @tc.name       : testGetItemAtIndex001
    * @tc.desc       : test GetItemAtIndex
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetItemAtIndex001', 0, async (done: Function) => {
      Utils.emitEvent("emitGetItemAtIndex", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetItemAtIndex001", "FullScreenTest", 1501, done);
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
    it('testCacheMode003', 0, async (done: Function) => {
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
    it('testCacheMode004', 0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeNone", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCacheMode004", "华为 - 构建万物互联的智能世界", 1406, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_FILESELECTORMODE_0200
     * @tc.name       : testFileSelectorMode002
     * @tc.desc       : test FileSelectorMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFileSelectorMode002', 0, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenMultipleMode", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorMode002", 1, 862, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SETWEBCONTROLLER_0100
    * @tc.name       : testSetWebController001
    * @tc.desc       : test setWebController
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetWebController001', 0, async (done: Function) => {
      Utils.emitEvent("emitSetWebController", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetWebController001", true, 1311, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })
  })
}
