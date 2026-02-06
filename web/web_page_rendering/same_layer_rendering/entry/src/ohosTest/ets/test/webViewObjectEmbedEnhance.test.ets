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
import { waitAndClickComponent,waitForComponent } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
const driver = Driver.create();
// @ts-nocheck
let emitKey = '';

export default function ActsAceWebViewObjectEmbedEnhance() {
  describe('ActsAceWebViewObjectEmbedEnhance', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewObjectEmbedEnhance',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewObjectEmbedEnhance state success " + JSON.stringify(pages));
        if (!("webViewObjectEmbedEnhance" == pages.name)) {
          console.info("get webViewObjectEmbedEnhance state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewObjectEmbedEnhance state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewObjectEmbedEnhance page error:" + err);
      }
      await waitForComponent("webViewObjectEmbedEnhanceButton");
      done()
    });


    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0014
     *@tc.name testWebViewObjectEmbedAbc
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedAbc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedAbc"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedAbc", 'success', 153690, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0005
     *@tc.name testWebViewObjectEmbedId
     *@tc.desc test objectEmbedId
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedId"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedId", 'success', 153700, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0002
     *@tc.name testWebViewObjectEmbedType
     *@tc.desc test objectEmbedType
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedType"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedType", 'success', 153710, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_API_0003
     *@tc.name testWebViewObjectEmbedSrc
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedSrc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedSrc"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedSrc", 'success', 153720, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_ENHANCE_API_0004
     *@tc.name testWebViewObjectEmbedWidth
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedWidth"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedWidth", 'success', 153730, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0005
     *@tc.name testWebViewObjectEmbedHeight
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedHeight"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedHeight", 'success', 153740, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0006
     *@tc.name testWebViewObjectEmbedTagEmbed
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedTagEmbed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedTagEmbed"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedTagEmbed", 'success', 153750, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0007
     *@tc.name testWebViewObjectEmbedTagObject
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedTagObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedTagObject"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedTagObject", 'success', 153760, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0008
     *@tc.name testWebViewObjectEmbedPosition
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedPosition"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedPosition", 'success', 153770, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0009
     *@tc.name testWebViewObjectEmbedUrl
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedUrl"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedUrl", 'success', 153780, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0010
     *@tc.name testWebViewObjectEmbedParams
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedParams"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedParams", 'success', 153790, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0011
     *@tc.name testWebViewObjectEmbedHasParams
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedHasParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedHasParams"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedHasParams", 'success', 153800, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })

    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED_Gesture_API_0012
     *@tc.name testWebViewObjectEmbedTest
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewObjectEmbedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbedTest"
      Utils.emitEvent(emitKey, 153680);
      Utils.registerEvent("testWebViewObjectEmbedTest", 'success', 153810, done);
      waitAndClickComponent("webViewObjectEmbedEnhanceButton",driver);
    })
  })
}
