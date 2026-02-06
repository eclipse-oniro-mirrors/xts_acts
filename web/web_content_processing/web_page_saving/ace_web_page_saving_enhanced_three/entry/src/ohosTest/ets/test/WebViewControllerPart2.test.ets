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
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitAndClickComponent } from './WaitTest.test';
import events_emitter from '@ohos.events.emitter';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewControllerPart2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerPart2 state success " + JSON.stringify(pages));
        if (!("webViewControllerPart2" == pages.name)) {
          console.info("get webViewControllerPart2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewControllerPart2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerPart2 page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewControllerPart2 beforeEach start");
      done();
    })


    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_0100
    * @tc.name       : testSearchAllAsync001
    * @tc.desc       : test searchAllAsync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSearchAllAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSearchAllAsync001", 132040)
      Utils.registerBaseEvent("testSearchAllAsync001", 2, 132050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0100
    * @tc.name       : testSearchNext001
    * @tc.desc       : test searchNext
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchNext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSearchNext001", 132040)
      Utils.registerBaseEvent("testSearchNext001", true, 132060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0200
    * @tc.name       : testSearchNext002
    * @tc.desc       : test searchNext
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchNext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSearchNext002", 132040)
      Utils.registerBaseEvent("testSearchNext002", true, 132070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0100
    * @tc.name       : testStoreWebArchive001
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive001", 132040)
      Utils.registerBaseEvent("testStoreWebArchive001", "/data/storage/el2/base/index.html.mht", 132080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0200
    * @tc.name       : testStoreWebArchive002
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive002", 132040)
      Utils.registerBaseEvent("testStoreWebArchive002", "/data/storage/el2/base/second.html.mht", 132090, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0300
    * @tc.name       : testStoreWebArchive003
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive003", 132040)
      Utils.registerBaseEvent("testStoreWebArchive003", "/data/storage/el2/base/index.html.mht", 132100, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0400
    * @tc.name       : testStoreWebArchive004
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive004", 132040)
      Utils.registerBaseEvent("testStoreWebArchive004", "/data/storage/el2/base/index.html.mht", 132110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("WebViewControllerPart2Button");
    })
  })
}
