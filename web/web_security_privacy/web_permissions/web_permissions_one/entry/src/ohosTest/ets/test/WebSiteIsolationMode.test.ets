/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import web_webview from '@ohos.web.webview';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function ActsWebSiteIsolationMode() {

  describe('WebSiteIsolationModeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSiteIsolationMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebSiteIsolationMode state success " + JSON.stringify(pages));
        if (!("WebSiteIsolationMode" == pages.name)) {
          console.info("get WebSiteIsolationMode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebSiteIsolationMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebSiteIsolationMode page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebSiteIsolationModeButton"), 10000);
      console.log("waitForComponent WebOnPermissionRequestTestButton");
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
     * @tc.name   emitWebSiteIsolationMode001
     * @tc.number SUB_ACE_WEB_WEBSITEISOLATIONMODE_API_0001
     * @tc.desc   emitWebSiteIsolationMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebSiteIsolationMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebSiteIsolationMode001", 162001)
      Utils.registerEvent("emitWebSiteIsolationMode001", web_webview.SiteIsolationMode.PARTIAL, 20250920, done);
      sendEventByKey('WebSiteIsolationModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebSiteIsolationMode002
     * @tc.number SUB_ACE_WEB_WEBSITEISOLATIONMODE_API_0002
     * @tc.desc   emitWebSiteIsolationMode002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebSiteIsolationMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebSiteIsolationMode002", 162001)
      Utils.registerEvent("emitWebSiteIsolationMode002", web_webview.SiteIsolationMode.STRICT, 20250921, done);
      sendEventByKey('WebSiteIsolationModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebSiteIsolationMode003
     * @tc.number SUB_ACE_WEB_WEBSITEISOLATIONMODE_API_0003
     * @tc.desc   emitWebSiteIsolationMode003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebSiteIsolationMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebSiteIsolationMode003", 162001)
      Utils.registerEvent("emitWebSiteIsolationMode003",  web_webview.RenderProcessMode.SINGLE, 20250922, done);
      sendEventByKey('WebSiteIsolationModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebSiteIsolationMode004
     * @tc.number SUB_ACE_WEB_WEBSITEISOLATIONMODE_API_0004
     * @tc.desc   emitWebSiteIsolationMode004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebSiteIsolationMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebSiteIsolationMode004", 162001)
      Utils.registerEvent("emitWebSiteIsolationMode004", web_webview.RenderProcessMode.MULTIPLE, 20250923, done);
      sendEventByKey('WebSiteIsolationModeButton', 10, '');
    })


  })
}
