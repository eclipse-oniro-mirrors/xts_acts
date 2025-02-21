/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import Utils from './Utils';

export default function webViewControllerClearSslCacheTest() {

  describe('WebViewControllerClearSslCacheTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerClearSslCacheTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerClearSslCacheTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerClearSslCacheTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_CLEARSSLCACHE_0100
    * @tc.name        : testWebViewControllerClearSslCache001
    * @tc.desc        : stress testing ClearSslCache
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerClearSslCache001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerClearSslCache001", 80710, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_CLEAR_SSL_CACHE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
