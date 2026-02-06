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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ''

export default function ActsAceWebViewOnPdfLoadResult() {
  describe('ActsAceWebViewOnPdfLoadResult', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewOnPdfLoadResult',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnPdfLoadResult state success " + JSON.stringify(pages));
        if (!("WebViewOnPdfLoadResult" == pages.name)) {
          console.info("get WebViewOnPdfLoadResult state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnPdfLoadResult state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOnPdfLoadResult page error:" + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebViewOnPdfScrollAtBottomKey"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    /*
      * @tc.number      : SUB_ACE_WEB_WEBVIEWONPDFLOADRESULT_API_0001
      * @tc.name        : emitWebViewOnPdfLoadResult001
      * @tc.desc        : emitWebViewOnPdfLoadResult001
      * @tc.size        : MediumTest
      * @tc.type        : Function
      * @tc.level       : Level 0
      */
    it('emitWebViewOnPdfLoadResult001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnPdfLoadResult001", 300650)
      Utils.registerEvent("emitWebViewOnPdfLoadResult001", PdfLoadResult.LOAD_SUCCESS, 300660, done);
      sendEventByKey('WebViewOnPdfScrollAtBottomKey', 10, '');
    })

    /*
       * @tc.number      : SUB_ACE_WEB_WEBVIEWONPDFLOADRESULT_API_0002
       * @tc.name        : emitWebViewOnPdfLoadResult002
       * @tc.desc        : emitWebViewOnPdfLoadResult002
       * @tc.size        : MediumTest
       * @tc.type        : Function
       * @tc.level       : Level 0
       */
    it('emitWebViewOnPdfLoadResult002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnPdfLoadResult002", 300650)
      Utils.registerEvent("emitWebViewOnPdfLoadResult002", PdfLoadResult.PARSE_ERROR_FILE, 300670, done);
      sendEventByKey('WebViewOnPdfScrollAtBottomKey', 10, '');
    })

      /*
       * @tc.number      : SUB_ACE_WEB_WEBVIEWONPDFLOADRESULT_API_0003
       * @tc.name        : emitWebViewOnPdfLoadResult003
       * @tc.desc        : emitWebViewOnPdfLoadResult003
       * @tc.size        : MediumTest
       * @tc.type        : Function
       * @tc.level       : Level 0
       */
    it('emitWebViewOnPdfLoadResult003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnPdfLoadResult003", 300650)
      Utils.registerEvent("emitWebViewOnPdfLoadResult003", PdfLoadResult.PARSE_ERROR_FORMAT, 300680, done);
      sendEventByKey('WebViewOnPdfScrollAtBottomKey', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBVIEWONPDFLOADRESULT_API_0004
     * @tc.name        : emitWebViewOnPdfLoadResult004
     * @tc.desc        : emitWebViewOnPdfLoadResult004
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('emitWebViewOnPdfLoadResult004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnPdfLoadResult004", 300650)
      Utils.registerEvent("emitWebViewOnPdfLoadResult004", PdfLoadResult.PARSE_ERROR_PASSWORD, 300690, done);
      sendEventByKey('WebViewOnPdfScrollAtBottomKey', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBVIEWONPDFLOADRESULT_API_0005
     * @tc.name        : emitWebViewOnPdfLoadResult005
     * @tc.desc        : emitWebViewOnPdfLoadResult005
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('emitWebViewOnPdfLoadResult005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnPdfLoadResult005", 300650)
      Utils.registerEvent("emitWebViewOnPdfLoadResult005", PdfLoadResult.PARSE_ERROR_HANDLER, 300700, done);
      sendEventByKey('WebViewOnPdfScrollAtBottomKey', 10, '');
    })




  })
}
