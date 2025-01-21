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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewObjectEmbedEnhance() {
  describe('ActsAceWebViewObjectEmbedEnhance', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewObjectEmbedEnhance',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewObjectEmbedEnhance state success " + JSON.stringify(pages));
        if (!("webViewObjectEmbedEnhance" == pages.name)) {
          console.info("get webViewObjectEmbedEnhance state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewObjectEmbedEnhance state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewObjectEmbedEnhance page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })


    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0014
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedAbc', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedAbc"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedAbc", 'success', 1014, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0001
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbedId
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedId', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedId"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedId", 'success', 1001, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0002
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbedType
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedType', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedType"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedType", 'success', 1002, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0003
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedSrc', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedSrc"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedSrc", 'success', 1003, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0004
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedWidth', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedWidth"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedWidth", 'success', 1004, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0005
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedHeight', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedHeight"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedHeight", 'success', 1005, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0006
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedTagEmbed', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedTagEmbed"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedTagEmbed", 'success', 1006, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0007
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedTagObject', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedTagObject"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedTagObject", 'success', 1007, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0008
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedPosition', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedPosition"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedPosition", 'success', 1008, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0009
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedUrl', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedUrl"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedUrl", 'success', 1009, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0010
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedParams', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedParams"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedParams", 'success', 1010, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0011
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedHasParams', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedHasParams"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedHasParams", 'success', 1011, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0012
     *@tc.name testWebViewObjectEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbedTest', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedTest"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbedTest", 'success', 1012, done);
      sendEventByKey('webViewObjectEmbedEnhanceButton', 10, '');
    })



  })
}
