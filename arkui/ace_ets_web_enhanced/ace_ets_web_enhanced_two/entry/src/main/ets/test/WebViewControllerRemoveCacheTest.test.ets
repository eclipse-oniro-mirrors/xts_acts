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

export default function webViewControllerRemoveCacheTest() {

  describe('WebViewControllerRemoveCacheTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerRemoveCacheTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerRemoveCacheTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerRemoveCacheTest" == pages.name)) {
          console.info("get WebViewControllerRemoveCacheTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerRemoveCacheTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerRemoveCacheTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebViewControllerRemoveCacheTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_0100
    * @tc.name       : testRemoveCache001
    * @tc.desc       : test removeCache true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRemoveCache001', 0, async (done: Function) => {
      Utils.emitEvent("testRemoveCache001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRemoveCache001", true, 77200, done);
      sendEventByKey('WebViewControllerRemoveCacheTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_0200
    * @tc.name       : testRemoveCache002
    * @tc.desc       : test removeCache false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRemoveCache002', 0, async (done: Function) => {
      Utils.emitEvent("testRemoveCache002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRemoveCache002", true, 77202, done);
      sendEventByKey('WebViewControllerRemoveCacheTestButton', 10, '');
    })
  })
}
