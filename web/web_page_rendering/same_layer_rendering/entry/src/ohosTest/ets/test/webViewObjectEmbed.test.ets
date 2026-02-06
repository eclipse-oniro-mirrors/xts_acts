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
import { Driver, ON } from '@kit.TestKit';
import emitter from '@ohos.events.emitter';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
// @ts-nocheck
let emitKey = ""
const driver = Driver.create();

export default function ActsAceWebViewObjectEmbed() {
  describe('ActsAceWebViewObjectEmbed', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewObjectEmbed',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewObjectEmbed state success " + JSON.stringify(pages));
        if (!("webViewObjectEmbed" == pages.name)) {
          console.info("get webViewObjectEmbed state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewObjectEmbed state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewObjectEmbed page error:" + err);
      }
      await waitForComponent("webViewObjectEmbedButton");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })


    /**
     * @tc.name   testWebViewObjectEmbed01
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_API_0001
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectEmbed01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbed01"
      Utils.emitEvent(emitKey, 153970);
      Utils.registerEvent("testWebViewObjectEmbed01", 'success', 153980, done);
      sendEventByKey('webViewObjectEmbedButton', 10, '');
    })


    /**
     * @tc.name   testWebViewObjectEmbed04
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_API_0004
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectEmbed04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbed04"
      Utils.emitEvent(emitKey, 153970);
      Utils.registerEvent("testWebViewObjectEmbed04", 'success', 153990, done);
      sendEventByKey('webViewObjectEmbedButton', 10, '');
    })

    /**
     * @tc.name   testWebViewObjectEmbedGesture01
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0001
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectEmbedGesture01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedGesture01"
      Utils.emitEvent(emitKey, 153970);
      Utils.registerEvent("testWebViewObjectEmbedGesture01", 'success', 154000, done);
      sendEventByKey('webViewObjectEmbedButton', 10, '');
    })
    /**
     * @tc.name   testWebViewObjectEmbedGesture02
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0002
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectEmbedGesture02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedGesture02"
      Utils.emitEvent(emitKey, 153970);
      Utils.registerEvent("testWebViewObjectEmbedGesture02", 'success', 154010, done);
      sendEventByKey('webViewObjectEmbedButton', 10, '');
    })
    /**
     * @tc.name   testWebViewObjectEmbedGesture03
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0003
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectEmbedGesture03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedGesture03"
      Utils.emitEvent(emitKey, 153970);
      Utils.registerEvent("testWebViewObjectEmbedGesture03", 'success', 154020, done);
      sendEventByKey('webViewObjectEmbedButton', 10, '');
    })

  })
}
