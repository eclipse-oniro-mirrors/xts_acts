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
import { Driver, ON } from '@ohos.UiTest';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
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
          console.info("push WebViewJavaScriptProxyAndOnPageVisible page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewJavaScriptProxyAndOnPageVisible page error: " + err);
      }
      await driver.waitForComponent(ON.id("buttonJavaScriptProxyAndPageVisible"), 10000);
      console.log("waitForComponent buttonJavaScriptProxyAndPageVisible");
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
     * @tc.name   testZoomCount001
     * @tc.number SUB_WEB_ZOOMCOUNT_0100
     * @tc.desc   test ZoomCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testZoomCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitZoomCount", 150400)
      Utils.registerEvent("testZoomCount001", true, 150410, done);
      let StartModel = await driver.findComponent(ON.id("buttonJavaScriptProxyAndPageVisible"));
      await StartModel.click();
    })
  })
}
