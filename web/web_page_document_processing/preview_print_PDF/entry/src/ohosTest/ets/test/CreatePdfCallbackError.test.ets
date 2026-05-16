/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCreatePdfCallbackError() {
  describe('createPdfCallbackErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/CreatePdfCallbackError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createPdfCallbackError state success " + JSON.stringify(pages));
        if (!("CreatePdfCallbackError" == pages.name)) {
          console.info("get createPdfCallbackError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push createPdfCallbackError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createPdfCallbackError page error: " + err);
      }
      await waitForComponent('webCreatePdfCallbackError');
      done();
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

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      done();
    })

    /**
     * @tc.name   testCreatePdfShouldPrintBackgroundFalse
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEPDF_CALLBACK_ERROR_001
     * @tc.desc   WebviewController createPdf shouldPrintBackground false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreatePdfShouldPrintBackgroundFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfShouldPrintBackgroundFalse", 300530);
      Utils.registerEvent("emitCreatePdfShouldPrintBackgroundFalse", true, 300531, done);
      sendEventByKey('webCreatePdfCallbackError', 10, '');
    })

    /**
     * @tc.name   testCreatePdfConfigurationNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEPDF_CALLBACK_ERROR_002
     * @tc.desc   WebviewController createPdf configuration null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreatePdfConfigurationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfConfigurationNull", 300530);
      Utils.registerEvent("emitCreatePdfConfigurationNull", '401', 300532, done);
      sendEventByKey('webCreatePdfCallbackError', 10, '');
    })

    /**
     * @tc.name   testCreatePdfConfigurationUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEPDF_CALLBACK_ERROR_003
     * @tc.desc   WebviewController createPdf configuration undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreatePdfConfigurationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfConfigurationUndefined", 300530);
      Utils.registerEvent("emitCreatePdfConfigurationUndefined", '401', 300533, done);
      sendEventByKey('webCreatePdfCallbackError', 10, '');
    })
  })
}
