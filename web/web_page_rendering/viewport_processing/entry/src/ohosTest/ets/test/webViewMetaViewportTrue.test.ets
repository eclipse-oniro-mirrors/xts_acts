/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { Driver, ON } from '@kit.TestKit';
import { waitForComponent,waitAndClickComponent } from './WaitTest.test';
const driver = Driver.create();
// @ts-nocheck
let emitKey = "emitWebViewMetaViewportTrue"

export default function webViewMetaViewportTrue() {
  describe('ActsAceWebViewMetaViewportTrue', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewMetaViewportTrue',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewMetaViewportTrue state success " + JSON.stringify(pages));
        if (!("webViewMetaViewportTrue" == pages.name)) {
          console.info("get webViewMetaViewportTrue state success " + JSON.stringify(pages.name));

          let result = await router.pushUrl(options);
          console.info("push webViewMetaViewportTrue state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewMetaViewportTrue page error:" + err);
      }
      await waitForComponent("webViewMetaViewportTrue");
      done()
    });


    /**
     * @tc.name   testWebViewMetaViewportTrue
     * @tc.number SUB_ACE_WEB_METAAVIEWPORT_API_0100
     * @tc.desc   test interface of metaViewport with runjavascript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewMetaViewportTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewMetaViewportTrue",153040);
      Utils.registerEvent("emitWebViewMetaViewportTrue", "true", 153050, done);
      waitAndClickComponent("webViewMetaViewportTrue",driver);
    })
  })
}
