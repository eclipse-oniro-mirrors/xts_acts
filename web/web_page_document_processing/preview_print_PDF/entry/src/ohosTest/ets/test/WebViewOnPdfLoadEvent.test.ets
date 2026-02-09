/**
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
import { beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck

export default function ActsAceWebViewOnPdfLoadEvent() {
  describe('ActsAcewebViewWebViewOnPdfLoadEvent', () => {

    beforeAll(async (done: Function) => {
      console.info("ActsAceWebViewOnPdfLoadEvent beforeall start***********")
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewOnPdfLoadEvent',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnPdfLoadEvent state success " + JSON.stringify(pages));
        if (!("WebViewOnPdfLoadEvent" == pages.name)) {
          console.info("get WebViewOnPdfLoadEvent state************")
          console.info("get WebViewOnPdfLoadEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnPdfLoadEvent state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOnPdfLoadEvent page error:" + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebViewOnPdfLoadEventKey"),10000);
      console.log("ActsAceWebViewOnPdfLoadEvent beforeall end***********")
      done()
    });

    beforeEach(async (done: Function) => {
      console.log("ActsAceWebViewOnPdfLoadEvent beforeEach start***********");
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
      console.log("ActsAceWebViewOnPdfLoadEvent beforeEach end***********");
    })

    /**
     * @tc.name   emitwebViewWebViewOnPdfLoadEvent001
     * @tc.number SUB_ACE_WEB_WEBVIEWWEBVIEWONPDFLOADEVENT_API_0001
     * @tc.desc   emitwebViewWebViewOnPdfLoadEvent001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewWebViewOnPdfLoadEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitwebViewWebViewOnPdfLoadEvent001", 300620)
      Utils.registerEvent("emitwebViewWebViewOnPdfLoadEvent001", 'resource://rawfile/printTemplate.pdf', 300630, done);
      sendEventByKey('WebViewOnPdfLoadEventKey', 10, '');
    })

    /**
     * @tc.name   emitwebViewWebViewOnPdfLoadEvent002
     * @tc.number SUB_ACE_WEB_WEBVIEWWEBVIEWONPDFLOADEVENT_API_0002
     * @tc.desc   emitwebViewWebViewOnPdfLoadEvent002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewWebViewOnPdfLoadEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitwebViewWebViewOnPdfLoadEvent002", 300620)
      Utils.registerEvent("emitwebViewWebViewOnPdfLoadEvent002", 0, 300640, done);
      sendEventByKey('WebViewOnPdfLoadEventKey', 10, '');
    })
  })
}
