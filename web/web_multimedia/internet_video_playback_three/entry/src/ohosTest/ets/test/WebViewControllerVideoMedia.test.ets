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
export default function webViewControllerVideoMediaTest() {

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
    * @tc.number      Acts_StopAllMedia_0100
    * @tc.name        StopAllMedia0100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('StopAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0100", 3, 350010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
     * @tc.number      Acts_StopAllMedia_0200
     * @tc.name        StopAllMedia0200
     * @tc.desc        test WebViewControllerVideoMedia
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('StopAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0200", 0, 350020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
     * @tc.number      Acts_StopAllMedia_0300
     * @tc.name        StopAllMedia0300
     * @tc.desc        test WebViewControllerVideoMedia
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('StopAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0300", 3, 350030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_StopAllMedia_0400
    * @tc.name        StopAllMedia0400
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('StopAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0400", 2, 350040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_StopAllMedia_0500
    * @tc.name        StopAllMedia0500
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('StopAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0500", 2, 350050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_StopAllMedia_0600
    * @tc.name        StopAllMedia0600
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('StopAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0600", 3, 350060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_StopAllMedia_0700
    * @tc.name        StopAllMedia0700
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('StopAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0700", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0700", 3, 350070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_StopAllMedia_0800
    * @tc.name        StopAllMedia0800
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('StopAllMedia0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0800", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("StopAllMedia0800", 3, 350080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_ResumeAllMedia_0100
    * @tc.name        ResumeAllMedia0100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0100", 1, 350100, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })
    /**
    * @tc.number      Acts_ResumeAllMedia_0200
    * @tc.name        ResumeAllMedia0200
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0200", 0, 350120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_ResumeAllMedia_0300
    * @tc.name        ResumeAllMedia0300
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0300", 1, 350130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_ResumeAllMedia_0400
    * @tc.name        ResumeAllMedia0400
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0400", 2, 350140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_ResumeAllMedia_0500
    * @tc.name        ResumeAllMedia0500
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0500", 3, 350150, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_ResumeAllMedia_0600
    * @tc.name        ResumeAllMedia0600
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0600", 1, 350160, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_ResumeAllMedia_0700
    * @tc.name        ResumeAllMedia0700
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('ResumeAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0700", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("ResumeAllMedia0700", 1, 350170, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0100
    * @tc.name        PauseAllMedia0100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0100", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0100", 2, 350210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0200
    * @tc.name        PauseAllMedia0200
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0200", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0200", 2, 350220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0300
    * @tc.name        PauseAllMedia0300
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0300", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0300", 2, 350230, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0400
    * @tc.name        PauseAllMedia0400
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0400", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0400", 2, 350240, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0500
    * @tc.name        PauseAllMedia0500
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0500", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0500", 2, 350250, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0600
    * @tc.name        PauseAllMedia0600
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0600", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0600", 2, 350260, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0700
    * @tc.name        PauseAllMedia0700
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0700", EVENT_ID_SET_EMIT_KEY);;
      Utils.registerBaseEvent("PauseAllMedia0700", 2, 350270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })

    /**
    * @tc.number      Acts_PauseAllMedia_0800
    * @tc.name        PauseAllMedia0800
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('PauseAllMedia0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0800", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("PauseAllMedia0800", 2, 350280, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let driver = Driver.create();
      let StartModel = await driver.findComponent(ON.id("WebViewControllerVideoMedia"));
      await StartModel.click();
    })
  })
}
