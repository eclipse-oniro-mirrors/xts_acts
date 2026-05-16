/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import Utils from './Utils';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewController state success " + JSON.stringify(pages));
        if (!("webViewController" == pages.name)) {
          console.info("get webViewController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewController page error: " + err);
      }
      await waitForComponent("WebViewControllerButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })

    /**
     * @tc.name   testHistoryItemIcon001
     * @tc.number SUB_WEB_HISTORYITEM_ICON_0100
     * @tc.desc   test HistoryItem icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoryItemIcon001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHistoryItemIcon001", 133100)
      Utils.registerEvent("testHistoryItemIcon001", true, 133110, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /**
     * @tc.name   testHistoryItemHistoryUrl001
     * @tc.number SUB_WEB_HISTORYITEM_HISTORYURL_0100
     * @tc.desc   test HistoryItem historyUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoryItemHistoryUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHistoryItemHistoryUrl001", 133100)
      Utils.registerEvent("testHistoryItemHistoryUrl001", "resource://rawfile/HistoryItem.html", 133120, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /**
     * @tc.name   testHistoryRawUrl001
     * @tc.number SUB_WEB_HISTORYITEM_HISTORYRAWURL_0100
     * @tc.desc   test HistoryItem historyRawUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoryRawUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHistoryRawUrl001", 133100)
      Utils.registerEvent("testHistoryRawUrl001", "resource://rawfile/HistoryItem.html", 133130, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /**
     * @tc.name   testHistoryItemTitle001
     * @tc.number SUB_WEB_HISTORYITEM_TITLE_0100
     * @tc.desc   test HistoryItem title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoryItemTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHistoryItemTitle001", 133100)
      Utils.registerEvent("testHistoryItemTitle001", "index", 133140, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /**
     * @tc.name   testBackForwardListCurrentIndex001
     * @tc.number SUB_WEB_BACKFORWARDLIST_CURRENTINDEX_TITLE_0100
     * @tc.desc   test BackForwardList CurrentIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBackForwardListCurrentIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackForwardListCurrentIndex001", 133100)
      Utils.registerEvent("testBackForwardListCurrentIndex001", 0, 133150, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /**
     * @tc.name   testBackForwardListCurrentSize001
     * @tc.number SUB_WEB_BACKFORWARDLIST_SIZE_TITLE_0100
     * @tc.desc   test BackForwardList Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBackForwardListCurrentSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackForwardListCurrentSize001", 133100)
      Utils.registerEvent("testBackForwardListCurrentSize001", 1, 133160, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

  })
}
