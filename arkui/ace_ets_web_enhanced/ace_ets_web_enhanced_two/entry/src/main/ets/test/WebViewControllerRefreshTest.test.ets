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

export default function webViewControllerRefreshTest() {

  describe('WebViewControllerRefreshTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerRefreshTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerRefreshTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerRefreshTest" == pages.name)) {
          console.info("get WebViewControllerRefreshTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerRefreshTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerRefreshTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebViewControllerRefreshTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0200
    * @tc.name       : testRefresh002
    * @tc.desc       : test WebViewController.refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh002', 0, async (done: Function) => {
      Utils.emitEvent("testRefresh002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRefresh002", 'second', 76700, done);
      sendEventByKey('WebViewControllerRefreshTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0300
    * @tc.name       : testRefresh003
    * @tc.desc       : test WebViewController.refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh003', 0, async (done: Function) => {
      Utils.emitEvent("testRefresh003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRefresh003", 'OpenHarmony - Gitee.com', 76702, done);
      sendEventByKey('WebViewControllerRefreshTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0400
    * @tc.name       : testRefresh004
    * @tc.desc       : test WebViewController.refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh004', 0, async (done: Function) => {
      Utils.emitEvent("testRefresh004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRefresh004", 'second', 76704, done);
      sendEventByKey('WebViewControllerRefreshTestButton', 10, '');
    })
  })
}
