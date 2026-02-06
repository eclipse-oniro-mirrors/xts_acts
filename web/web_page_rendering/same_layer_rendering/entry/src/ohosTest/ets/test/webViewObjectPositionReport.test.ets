/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { waitAndClickComponent,waitForComponent } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
const driver = Driver.create();
// @ts-nocheck
let emitKey = '';

export default function ActsAceWebViewObjectPositionReport() {
  describe('ActsAceWebViewObjectPositionReport', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewObjectPositionReport',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewObjectPositionReport state success " + JSON.stringify(pages));
        if (!("webViewObjectEmbed" == pages.name)) {
          console.info("get webViewObjectPositionReport state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewObjectPositionReport state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewObjectPositionReport page error:" + err);
      }
      await waitForComponent("webViewObjectPositionReportButton");
      done()
    });

    /**
     * @tc.name   testWebViewObjectPositionReport
     * @tc.number SUB_ACE_WEB_OBJECTPOSITIONREPORT_API_0001
     * @tc.desc   test objectPositionReport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectPositionReport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectPositionReport"
      Utils.emitEvent(emitKey, 153820);
      Utils.registerEvent("testWebViewObjectPositionReport", 'success', 153830, done);
      await waitAndClickComponent("webViewObjectPositionReportButton",driver);
    })

  })
}
