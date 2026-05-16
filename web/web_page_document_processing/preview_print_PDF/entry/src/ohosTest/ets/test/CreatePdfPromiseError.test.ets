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

export default function webCreatePdfPromiseError() {
  describe('createPdfPromiseErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/CreatePdfPromiseError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createPdfPromiseError state success " + JSON.stringify(pages));
        if (!("CreatePdfPromiseError" == pages.name)) {
          console.info("get createPdfPromiseError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push createPdfPromiseError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("pushed createPdfPromiseError page error: " + err);
      }
      await waitForComponent('webCreatePdfPromiseError');
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
     * @tc.name   testCreatePdfPromiseShouldPrintBackgroundFalse
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEPDF_PROMISE_ERROR_001
     * @tc.desc   WebviewController createPdf promise shouldPrintBackground false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreatePdfPromiseShouldPrintBackgroundFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfPromiseShouldPrintBackgroundFalse", 300540);
      Utils.registerEvent("emitCreatePdfPromiseShouldPrintBackgroundFalse", true, 300541, done);
      sendEventByKey('webCreatePdfPromiseError', 10, '');
    })

    /**
     * @tc.name   testCreatePdfPromiseConfigurationNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEPDF_PROMISE_ERROR_002
     * @tc.desc   WebviewController createPdf promise configuration null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreatePdfPromiseConfigurationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfPromiseConfigurationNull", 300540);
      Utils.registerEvent("emitCreatePdfPromiseConfigurationNull", '401', 300542, done);
      sendEventByKey('webCreatePdfPromiseError', 10, '');
    })

    /**
     * @tc.name   testCreatePdfPromiseConfigurationUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEPDF_PROMISE_ERROR_003
     * @tc.desc   WebviewController createPdf promise configuration undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreatePdfPromiseConfigurationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfPromiseConfigurationUndefined", 300540);
      Utils.registerEvent("emitCreatePdfPromiseConfigurationUndefined", '401', 300543, done);
      sendEventByKey('webCreatePdfPromiseError', 10, '');
    })
  })
}
