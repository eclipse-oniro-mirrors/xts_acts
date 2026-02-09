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
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();

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
      await waitForComponents('WebViewControllerVideoMedia');
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
    * @tc.number      Acts_GetMediaPlaybackState_0100
    * @tc.name        GetMediaPlaybackState0100
    * @tc.desc        test WebViewControllerVideoMedia
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 2
    */
    it('GetMediaPlaybackState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0100", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0100", 'MediaPlaybackState.NONE', 132500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0200", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0200", 'MediaPlaybackState.PLAYING', 132510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0300", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0300", 'MediaPlaybackState.PAUSED', 132520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0400", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0400", 'MediaPlaybackState.PAUSED', 132530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0500", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0500", 'MediaPlaybackState.STOPPED', 132540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0600", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0600", true, 132550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0700", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0700", 'MediaPlaybackState.NONE', 132560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0800", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0800", 'MediaPlaybackState.PLAYING', 132570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState0900", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0900", 'MediaPlaybackState.PLAYING', 132580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState1000", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState1000", 'MediaPlaybackState.PLAYING', 132590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState1100", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState1100", 'MediaPlaybackState.PAUSED', 132600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
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
      Utils.emitEvent("GetMediaPlaybackState1200", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState1200", 'MediaPlaybackState.PAUSED', 132610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })
  })
}
