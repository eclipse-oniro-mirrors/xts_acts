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
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerZoomNull() {

  describe('WebViewControllerZoomNull', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerZoomNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerZoomNull state success " + JSON.stringify(pages));
        if (!("WebViewControllerZoomNull" == pages.name)) {
          console.info("get WebViewControllerZoomNull state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push WebViewControllerZoomNull page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerZoomNull page error: " + err);
      }
      await waitForComponent("WebViewControllerZoomNull");
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebZoomNull001
     * @tc.number SUB_WEB_WEBZOOMNULL_0100
     * @tc.desc   test WebviewController zoom with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebZoomNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebZoomNull001", 153230)
      Utils.registerEvent("testWebZoomNull001", false, 153240, done);
      sendEventByKey('WebViewControllerZoomNull', 10, '');
    })

    /**
     * @tc.name   testWebZoomUndefined001
     * @tc.number SUB_WEB_WEBZOOMUNDEFINED_0100
     * @tc.desc   test WebviewController zoom with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebZoomUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebZoomUndefined001", 153230)
      Utils.registerEvent("testWebZoomUndefined001", false, 153250, done);
      sendEventByKey('WebViewControllerZoomNull', 10, '');
    })
  })
}
