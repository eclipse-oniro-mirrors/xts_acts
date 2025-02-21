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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewControllerPart3Test() {

  describe('WebViewPrefetchResourceTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewPrefetchResource',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewPrefetchResource state success " + JSON.stringify(pages));
        if (!("WebViewPrefetchResource" == pages.name)) {
          console.info("get WebViewPrefetchResource state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(900);
          console.info("push WebViewPrefetchResource page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewPrefetchResource page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      console.info("WebViewPrefetchResource beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0100
    * @tc.name       : testPrefetchResource001
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource001', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource001", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource001", true, 10080, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0200
    * @tc.name       : testPrefetchResource002
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource002', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource002", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource001", true, 10081, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0300
    * @tc.name       : testPrefetchResource003
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource003', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource003", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource003", "17100002", 10082, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0400
    * @tc.name       : testPrefetchResource004
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource004', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource004", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource004", "401", 10083, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0500
    * @tc.name       : testPrefetchResource005
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource005', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource005", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource005", "17100002", 10084, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0600
    * @tc.name       : testPrefetchResource006
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource006', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource006", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource006", "17100002", 10085, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0700
    * @tc.name       : testPrefetchResource007
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource007', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource007", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource007", "401", 10086, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0800
    * @tc.name       : testPrefetchResource008
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource008', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource008", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource008", "401", 10087, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_0900
    * @tc.name       : testPrefetchResource009
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource009', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource009", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource009", "401", 10088, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_1000
    * @tc.name       : testPrefetchResource010
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource010', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource010", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource010", "401", 10089, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_1100
    * @tc.name       : testPrefetchResource011
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource011', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource011", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource011", true, 10090, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHRESOURCE_1200
    * @tc.name       : testPrefetchResource012
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchResource012', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchResource012", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrefetchResource012", '401', 10091, done);
      sendEventByKey('WebViewPrefetchResourceTestButton', 10, '');
    })
  })
}
