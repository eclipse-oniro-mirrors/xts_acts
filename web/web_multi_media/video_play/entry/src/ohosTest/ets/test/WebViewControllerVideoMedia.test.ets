/*
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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
const EVENT_ID_SET_EMIT_KEY = 350000;
export default function webViewControllerVideoMedia() {

  describe('webViewControllerVideoMedia', () => {
    beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerVideoMedia',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerVideoMedia state success " + JSON.stringify(pages));
        if (!("WebViewControllerVideoMedia" == pages.name)) {
          console.info("get WebViewControllerVideoMedia state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerVideoMedia page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerVideoMedia page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerVideoMedia"), 10000);
      console.log("webViewSetHttpDns");
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

    /*
    * @tc.number     : Acts_StopAllMedia_0100
    * @tc.name       : testStopAllMedia0100
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('StopAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0100", 3, 350010, done);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
     * @tc.number     : Acts_StopAllMedia_0200
     * @tc.name       : testStopAllMedia0200
     * @tc.desc       : test WebViewControllerVideoMedia
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('StopAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0200", 0, 350020, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
     * @tc.number     : Acts_StopAllMedia_0300
     * @tc.name       : testStopAllMedia0300
     * @tc.desc       : test WebViewControllerVideoMedia
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('StopAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0300", 3, 350030, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_StopAllMedia_0400
    * @tc.name       : testStopAllMedia0400
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('StopAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0400", 2, 350040, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_StopAllMedia_0500
    * @tc.name       : testStopAllMedia0500
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('StopAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0500", 2, 350050, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_StopAllMedia_0600
    * @tc.name       : testStopAllMedia0600
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('StopAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0600", 3, 350060, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_StopAllMedia_0700
    * @tc.name       : testStopAllMedia0700
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('StopAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0700", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0700", 3, 350070, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_StopAllMedia_0800
    * @tc.name       : testStopAllMedia0800
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('StopAllMedia0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0800", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("StopAllMedia0800", 3, 350080, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0100
    * @tc.name       : testResumeAllMedia0100
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0100", 1, 350100, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0200
    * @tc.name       : testResumeAllMedia0200
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0200", 0, 350120, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0300
    * @tc.name       : testResumeAllMedia0300
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0300", 1, 350130, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0400
    * @tc.name       : testResumeAllMedia0400
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0400", 2, 350140, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0500
    * @tc.name       : testResumeAllMedia0500
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0500", 3, 350150, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0600
    * @tc.name       : testResumeAllMedia0600
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0600", 1, 350160, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0700
    * @tc.name       : testResumeAllMedia0700
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('ResumeAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0700", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("ResumeAllMedia0700", 1, 350170, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0100
    * @tc.name       : testPauseAllMedia0100
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0100", 2, 350210, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0200
    * @tc.name       : testPauseAllMedia0200
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0200", 2, 350220, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0300
    * @tc.name       : testPauseAllMedia0300
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0300", 2, 350230, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0400
    * @tc.name       : testPauseAllMedia0400
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0400", 2, 350240, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0500
    * @tc.name       : testPauseAllMedia0500
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0500", 2, 350250, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0600
    * @tc.name       : testPauseAllMedia0600
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0600", 2, 350260, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0700
    * @tc.name       : testPauseAllMedia0700
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0700", EVENT_ID_SET_EMIT_KEY);;
      Utils.registerEvent("PauseAllMedia0700", 2, 350270, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_PauseAllMedia_0800
    * @tc.name       : testPauseAllMedia0800
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('PauseAllMedia0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0800", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("PauseAllMedia0800", 2, 350280, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_CloseAllMediaPresentations_0100
    * @tc.name       : testCloseAllMediaPresentations0100
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('CloseAllMediaPresentations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("CloseAllMediaPresentations0100", true, 350310, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_CloseAllMediaPresentations_0200
    * @tc.name       : testCloseAllMediaPresentations0200
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('CloseAllMediaPresentations0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("CloseAllMediaPresentations0200", true, 350320, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_CloseAllMediaPresentations_0300
    * @tc.name       : testCloseAllMediaPresentations0300
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('CloseAllMediaPresentations0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("CloseAllMediaPresentations0300", true, 350330, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_CloseAllMediaPresentations_0400
    * @tc.name       : testCloseAllMediaPresentations0400
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('CloseAllMediaPresentations0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("CloseAllMediaPresentations0400", true, 350340, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_CloseAllMediaPresentations_0500
    * @tc.name       : testCloseAllMediaPresentations0500
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('CloseAllMediaPresentations0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("CloseAllMediaPresentations0500", true, 350350, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0100
    * @tc.name       : testGetMediaPlaybackState0100
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0100", 0, 350360, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0200
    * @tc.name       : testGetMediaPlaybackState0200
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0200", 1, 350370, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0300
    * @tc.name       : testGetMediaPlaybackState0300
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0300", 2, 350380, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0400
    * @tc.name       : testGetMediaPlaybackState0400
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0400", 2, 350390, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0500
    * @tc.name       : testGetMediaPlaybackState0500
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0500", 3, 350400, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0600
    * @tc.name       : testGetMediaPlaybackState0600
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0600", true, 350410, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0700
    * @tc.name       : testGetMediaPlaybackState0700
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0700", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0700", 0, 350420, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0800
    * @tc.name       : testGetMediaPlaybackState0800
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0800", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0800", 1, 350430, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0900
    * @tc.name       : testGetMediaPlaybackState0900
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0900", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState0900", 1, 350440, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1000
    * @tc.name       : testGetMediaPlaybackState1000
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1000", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState1000", 1, 350450, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1100
    * @tc.name       : testGetMediaPlaybackState1100
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState1100", 2, 350460, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1200
    * @tc.name       : testGetMediaPlaybackState1200
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState1200", 2, 350470, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1300
    * @tc.name       : testGetMediaPlaybackState1300
    * @tc.desc       : test WebViewControllerVideoMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('GetMediaPlaybackState1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("GetMediaPlaybackState1300", 1, 350480, done);
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })
  })
}
