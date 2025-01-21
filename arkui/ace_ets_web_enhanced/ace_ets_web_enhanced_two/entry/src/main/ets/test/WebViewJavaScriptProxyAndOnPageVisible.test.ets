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

export default function WebViewJavaScriptProxyAndOnPageVisible() {

  describe('WebViewJavaScriptProxyAndOnPageVisibleTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewJavaScriptProxyAndOnPageVisible',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewJavaScriptProxyAndOnPageVisible state success " + JSON.stringify(pages));
        if (!("WebViewJavaScriptProxyAndOnPageVisible" == pages.name)) {
          console.info("get WebViewJavaScriptProxyAndOnPageVisible state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewJavaScriptProxyAndOnPageVisible page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewJavaScriptProxyAndOnPageVisible page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ZOOMCOUNT_0100
    * @tc.name       : testZoomCount001
    * @tc.desc       : test ZoomCount
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testZoomCount001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomCount", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomCount001", true, 1403, done);
      sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORMODE_0300
    * @tc.name       : testFileSelectorMode003
    * @tc.desc       : test FileSelectorMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorMode003', 0, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenFolderMode", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorMode003", 2, 863, done);
      sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JAVASCRIPTPROXY_0100
    * @tc.name       : testJavaScriptProxy001
    * @tc.desc       : test javaScriptProxy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJavaScriptProxy001', 0, async (done: Function) => {
      Utils.emitEvent("javaScriptProxy", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJavaScriptProxy001", true, 1271, done);
      sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONPAGEVISIBLE_0100
    * @tc.name       : testOnPageVisible001
    * @tc.desc       : test onPageVisible
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnPageVisible001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPageVisible", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageVisible001", 'resource://rawfile/icon.html', 1372, done);
      sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SSLERRORHOSTMISMATCH_0100
    * @tc.name       : testSslErrorHostMismatch001
    * @tc.desc       : test SslError HostMismatch
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSslErrorHostMismatch001', 0, async (done: Function) => {
      Utils.emitEvent("emitSslErrorHostMismatch", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSslErrorHostMismatch001", SslError.HostMismatch, 891, done);
      sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
    })
  })
}
