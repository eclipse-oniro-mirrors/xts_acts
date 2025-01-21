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

export default function webViewControllerLoadUrlTest() {

  describe('WebViewControllerLoadUrlTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerLoadUrlTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerLoadUrlTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerLoadUrlTest" == pages.name)) {
          console.info("get WebViewControllerLoadUrlTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerLoadUrlTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerLoadUrlTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebViewControllerLoadUrlTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0500
    * @tc.name       : testLoadUrl005
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl005', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl005", 'second', 77004, done);
      sendEventByKey('WebViewControllerLoadUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0600
    * @tc.name       : testLoadUrl006
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl006', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl006", 'OpenAtom OpenHarmony', 77006, done);
      sendEventByKey('WebViewControllerLoadUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0700
    * @tc.name       : testLoadUrl007
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl007', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl007", 'second', 77008, done);
      sendEventByKey('WebViewControllerLoadUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0800
    * @tc.name       : testLoadUrl008
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl008', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl008", 'second', 77010, done);
      sendEventByKey('WebViewControllerLoadUrlTestButton', 10, '');
    })
  })
}
