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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
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

    /**
    * @tc.number      Acts_CloseAllMediaPresentations_0100
    * @tc.name        CloseAllMediaPresentations0100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('CloseAllMediaPresentations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("CloseAllMediaPresentations0100", true, 350310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_CloseAllMediaPresentations_0200
    * @tc.name        CloseAllMediaPresentations0200
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('CloseAllMediaPresentations0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("CloseAllMediaPresentations0200", true, 350320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_CloseAllMediaPresentations_0300
    * @tc.name        CloseAllMediaPresentations0300
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('CloseAllMediaPresentations0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("CloseAllMediaPresentations0300", true, 350330, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_CloseAllMediaPresentations_0400
    * @tc.name        CloseAllMediaPresentations0400
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('CloseAllMediaPresentations0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("CloseAllMediaPresentations0400", true, 350340, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_CloseAllMediaPresentations_0500
    * @tc.name        CloseAllMediaPresentations0500
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('CloseAllMediaPresentations0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("CloseAllMediaPresentations0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("CloseAllMediaPresentations0500", true, 350350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0100
    * @tc.name        GetMediaPlaybackState0100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0100", 0, 350360, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0200
    * @tc.name        GetMediaPlaybackState0200
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0200", 1, 350370, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0300
    * @tc.name        GetMediaPlaybackState0300
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0300", 2, 350380, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0400
    * @tc.name        GetMediaPlaybackState0400
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0400", 2, 350390, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0500
    * @tc.name        GetMediaPlaybackState0500
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0500", 3, 350400, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0600
    * @tc.name        GetMediaPlaybackState0600
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0600", true, 350410, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0700
    * @tc.name        GetMediaPlaybackState0700
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0700", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0700", 0, 350420, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0800
    * @tc.name        GetMediaPlaybackState0800
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0800", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0800", 1, 350430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_0900
    * @tc.name        GetMediaPlaybackState0900
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0900", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState0900", 1, 350440, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_1000
    * @tc.name        GetMediaPlaybackState1000
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1000", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState1000", 1, 350450, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_1100
    * @tc.name        GetMediaPlaybackState1100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState1100", 2, 350460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_1200
    * @tc.name        GetMediaPlaybackState1200
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState1200", 2, 350470, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_GetMediaPlaybackState_1300
    * @tc.name        GetMediaPlaybackState1300
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("GetMediaPlaybackState1300", 1, 350480, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })
  })
}
