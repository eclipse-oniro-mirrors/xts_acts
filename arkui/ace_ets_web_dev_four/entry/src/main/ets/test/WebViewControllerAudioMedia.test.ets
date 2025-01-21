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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import webView from '@ohos.web.webview';
import router from '@ohos.router';
export default function WebViewControllerAudioMedia() {

  describe('webViewControllerAudioMedia', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerAudioMedia',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerAudioMedia state success " + JSON.stringify(pages));
        if (!("WebViewControllerAudioMedia" == pages.name)) {
          console.info("get WebViewControllerAudioMedia state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerAudioMedia page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerAudioMedia page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : Acts_StopAllMedia_0100
    * @tc.name       : testStopAllMedia0100
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('StopAllMedia0100', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0100", 3, 33301, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
     * @tc.number     : Acts_StopAllMedia_0200
     * @tc.name       : testStopAllMedia0200
     * @tc.desc       : test WebViewControllerAudioMedia
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('StopAllMedia0200', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0200", 0, 33302, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
     * @tc.number     : Acts_StopAllMedia_0300
     * @tc.name       : testStopAllMedia0300
     * @tc.desc       : test WebViewControllerAudioMedia
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('StopAllMedia0300', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0300", 3, 33303, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_StopAllMedia_0400
    * @tc.name       : testStopAllMedia0400
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('StopAllMedia0400', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0400", 2, 33304, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_StopAllMedia_0500
    * @tc.name       : testStopAllMedia0500
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('StopAllMedia0500', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0500", 2, 33305, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_StopAllMedia_0600
    * @tc.name       : testStopAllMedia0600
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('StopAllMedia0600', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0600", 3, 33306, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_StopAllMedia_0700
    * @tc.name       : testStopAllMedia0700
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('StopAllMedia0700', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0700", 3, 33307, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_StopAllMedia_0800
    * @tc.name       : testStopAllMedia0800
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('StopAllMedia0800', 0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("StopAllMedia0800", 3, 33308, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0100
    * @tc.name       : testResumeAllMedia0100
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0100', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0100", 1, 33309, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0200
    * @tc.name       : testResumeAllMedia0200
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0200', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0200", 0, 33310, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0300
    * @tc.name       : testResumeAllMedia0300
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0300', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0300", 1, 33311, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0400
    * @tc.name       : testResumeAllMedia0400
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0400', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0400", 2, 33312, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0500
    * @tc.name       : testResumeAllMedia0500
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0500', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0500", 3, 33313, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_ResumeAllMedia_0600
    * @tc.name       : testResumeAllMedia0600
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0600', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0600", 1, 33314, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_ResumeAllMedia_0700
    * @tc.name       : testResumeAllMedia0700
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('ResumeAllMedia0700', 0, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ResumeAllMedia0700", 1, 33315, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0100
    * @tc.name       : testPauseAllMedia0100
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0100', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0100", 2, 33316, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0200
    * @tc.name       : testPauseAllMedia0200
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0200', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0200", 2, 33317, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0300
    * @tc.name       : testPauseAllMedia0300
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0300', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0300", 2, 33318, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0400
    * @tc.name       : testPauseAllMedia0400
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0400', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0400", 2, 33319, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0500
    * @tc.name       : testPauseAllMedia0500
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0500', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0500", 2, 33320, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0600
    * @tc.name       : testPauseAllMedia0600
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0600', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0600", 2, 33321, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0700
    * @tc.name       : testPauseAllMedia0700
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0700', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0700", 2, 33322, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_PauseAllMedia_0800
    * @tc.name       : testPauseAllMedia0800
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('PauseAllMedia0800', 0, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PauseAllMedia0800", 2, 33323, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0100
    * @tc.name       : testGetMediaPlaybackState0100
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0100', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0100", 0, 33324, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0200
    * @tc.name       : testGetMediaPlaybackState0200
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0200', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0200", 1, 33325, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0300
    * @tc.name       : testGetMediaPlaybackState0300
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0300', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0300", 2, 33326, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0400
    * @tc.name       : testGetMediaPlaybackState0400
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0400', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0400", 2, 33327, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0500
    * @tc.name       : testGetMediaPlaybackState0500
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0500', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0500", 3, 33328, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0600
    * @tc.name       : testGetMediaPlaybackState0600
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0600', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0600", 1, 33329, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0700
    * @tc.name       : testGetMediaPlaybackState0700
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0700', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0700", 0, 33330, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0800
    * @tc.name       : testGetMediaPlaybackState0800
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0800', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0800", 1, 33331, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_0900
    * @tc.name       : testGetMediaPlaybackState0900
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState0900', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState0900", 1, 33332, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1000
    * @tc.name       : testGetMediaPlaybackState1000
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState1000', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState1000", 1, 33333, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1100
    * @tc.name       : testGetMediaPlaybackState1100
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState1100', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState1100", 2, 33334, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
    /*
    * @tc.number     : Acts_GetMediaPlaybackState_1200
    * @tc.name       : testGetMediaPlaybackState1200
    * @tc.desc       : test WebViewControllerAudioMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GetMediaPlaybackState1200', 0, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("GetMediaPlaybackState1200", 2, 33335, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerAudioMedia"));
      await StartModel.click();
      let size = await driver.getDisplaySize();
      console.log("size x:" + size.x)
      console.log("size y:" + size.y)
      await driver.delayMs(1000);
      await driver.click(size.x / 2, size.y / 2);
      await driver.delayMs(1000);
    })
  })
}