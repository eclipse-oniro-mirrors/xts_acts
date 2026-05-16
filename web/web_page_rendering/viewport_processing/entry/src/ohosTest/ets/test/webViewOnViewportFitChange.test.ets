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
import { accessibility, config } from '@kit.AccessibilityKit';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
import { Driver } from '@ohos.UiTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
let emitKey = ""


export default function webViewOnViewportFitChange() {
  describe('ActsAceWebViewOnViewportFitChange', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnViewportFitChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnViewportFitChange state success " + JSON.stringify(pages));
        if (!("webViewOnViewportFitChange" == pages.name)) {
          console.info("get webViewOnViewportFitChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewOnViewportFitChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnViewportFitChange page error: " + err);
      }
      await waitForComponent("webViewOnViewportFitChange");
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
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 153910,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      done();
    })

    /**
     * @tc.name   testWebViewOnViewportFitChange
     * @tc.number SUB_ACE_WEB_OnViewportFitChange_API_0001
     * @tc.desc   test OnViewportFitChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnViewportFitChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnViewportFitChange", 154030);
      Utils.registerEvent("testWebViewOnViewportFitChange", true, 154040, done);
      waitAndClickComponent("webViewOnViewportFitChange",driver);

    })

    /**
     * @tc.name   testWebView_ViewportFit_COVER
     * @tc.number SUB_ACE_WEB_ViewportFit_COVER_API_0002
     * @tc.desc   ViewportFit_COVER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_ViewportFit_COVER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebView_ViewportFit_COVER", 154030);
      Utils.registerEvent("testWebView_ViewportFit_COVER", true, 154050, done);
      waitAndClickComponent("webViewOnViewportFitChange",driver);
    })
  })
}
