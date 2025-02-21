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
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewController state success " + JSON.stringify(pages));
        if (!("webViewController" == pages.name)) {
          console.info("get webViewController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewController page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewController beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSCROLL_0100
    * @tc.name       : testOnScroll001
    * @tc.desc       : test onScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScroll001', 0, async (done: Function) => {
      Utils.emitEvent("testOnScroll001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScroll001", true, 31022, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONSCROLL_0200
    * @tc.name       : testOnScroll002
    * @tc.desc       : test onScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScroll002', 0, async (done: Function) => {
      Utils.emitEvent("testOnScroll002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScroll002", true, 100068, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONSCROLL_0300
    * @tc.name       : testOnScroll003
    * @tc.desc       : test onScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScroll003', 0, async (done: Function) => {
      Utils.emitEvent("testOnScroll003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScroll002", true, 100069, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_ICON_0100
    * @tc.name       : testHistoryItemIcon001
    * @tc.desc       : test HistoryItem icon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryItemIcon001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryItemIcon001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryItemIcon001", true, 31023, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_HISTORYURL_0100
    * @tc.name       : testHistoryItemHistoryUrl001
    * @tc.desc       : test HistoryItem historyUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryItemHistoryUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryItemHistoryUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryItemHistoryUrl001", "resource://rawfile/HistoryItem.html", 31024, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_HISTORYRAWURL_0100
    * @tc.name       : testHistoryRawUrl001
    * @tc.desc       : test HistoryItem historyRawUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryRawUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryRawUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryRawUrl001", "resource://rawfile/HistoryItem.html", 31025, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_TITLE_0100
    * @tc.name       : testHistoryItemTitle001
    * @tc.desc       : test HistoryItem title
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryItemTitle001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryItemTitle001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryItemTitle001", "index", 31026, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKFORWARDLIST_CURRENTINDEX_TITLE_0100
    * @tc.name       : testBackForwardListCurrentIndex001
    * @tc.desc       : test BackForwardList CurrentIndex
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackForwardListCurrentIndex001', 0, async (done: Function) => {
      Utils.emitEvent("testBackForwardListCurrentIndex001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackForwardListCurrentIndex001", 0, 31027, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKFORWARDLIST_SIZE_TITLE_0100
    * @tc.name       : testBackForwardListCurrentSize001
    * @tc.desc       : test BackForwardList Size
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackForwardListCurrentSize001', 0, async (done: Function) => {
      Utils.emitEvent("testBackForwardListCurrentSize001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackForwardListCurrentSize001", 1, 31028, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONSHOWFILESELECTOR_0100
    * @tc.name       : testOnShowFileSelector001
    * @tc.desc       : test onShowFileSelector
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnShowFileSelector001', 0, async (done: Function) => {
      Utils.emitEvent("testOnShowFileSelector001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnShowFileSelector001", true, 31029, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETTITLE_0100
    * @tc.name       : testFileSelectorParamGetTitle001
    * @tc.desc       : test FileSelectorParam getTitle
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetTitle001', 0, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamGetTitle001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorParamGetTitle001", 'open file', 31030, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETMODE_0100
    * @tc.name       : testFileSelectorParamGetMode001
    * @tc.desc       : test FileSelectorParam getMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetMode001', 0, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamGetMode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorParamGetMode001", 0, 31031, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETACCEPTTYPE_0100
    * @tc.name       : testFileSelectorParamGetAcceptType001
    * @tc.desc       : test FileSelectorParam getAcceptType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetAcceptType001', 0, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamGetAcceptType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorParamGetAcceptType001", '.json', 31032, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
   * @tc.number     : SUB_WEB_FILESELECTORPARAM_ISCAPTURE_0100
   * @tc.name       : testFileSelectorParamIsCapture001
   * @tc.desc       : test FileSelectorParam isCapture
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testFileSelectorParamIsCapture001', 0, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamIsCapture001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorParamIsCapture001", false, 31033, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORRESULT_HANDLEFILELIST_0100
    * @tc.name       : testFileSelectorResultHandleFileList001
    * @tc.desc       : test FileSelectorResult handleFileList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorResultHandleFileList001', 0, async (done: Function) => {
      Utils.emitEvent("testFileSelectorResultHandleFileList001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorResultHandleFileList001", "\"1.json\"", 31034, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SECUREDNSMODE_OFF_0100
    * @tc.name       : testSecureDnsModeOFF001
    * @tc.desc       : test SecureDnsMode OFF
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSecureDnsModeOFF001', 0, async (done: Function) => {
      Utils.emitEvent("testSecureDnsModeOFF001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSecureDnsModeOFF001", "Example Domain", 31035, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SECUREDNSMODE_AUTO_0100
    * @tc.name       : testSecureDnsModeAUTO001
    * @tc.desc       : test SecureDnsMode AUTO
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSecureDnsModeAUTO001', 0, async (done: Function) => {
      Utils.emitEvent("testSecureDnsModeAUTO001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSecureDnsModeAUTO001", "Example Domain", 31036, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SECUREDNSMODE_SECURE_ONLY_0100
    * @tc.name       : testSecureDnsModeSECURE_ONLY001
    * @tc.desc       : test SecureDnsMode SECURE_ONLY
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSecureDnsModeSECURE_ONLY001', 0, async (done: Function) => {
      Utils.emitEvent("testSecureDnsModeSECURE_ONLY001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSecureDnsModeSECURE_ONLY001", true, 31037, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0100
    * @tc.name       : testOnOverScroll001
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll001', 0, async (done: Function) => {
      Utils.emitEvent("testOnOverScroll001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll001", true, 31038, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0200
    * @tc.name       : testOnOverScroll002
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll002', 0, async (done: Function) => {
      Utils.emitEvent("testOnOverScroll002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll002", true, 100034, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0300
    * @tc.name       : testOnOverScroll003
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll003', 0, async (done: Function) => {
      Utils.emitEvent("testOnOverScroll003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll003", true, 100035, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0400
    * @tc.name       : testOnOverScroll004
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll004', 0, async (done: Function) => {
      Utils.emitEvent("testOnOverScroll004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll004", true, 100036, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_DARKMODE_0100
    * @tc.name       : testDarkMode001
    * @tc.desc       : test darkMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDarkMode001', 0, async (done: Function) => {
      Utils.emitEvent("testDarkMode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDarkMode001", "true", 31039, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DARKMODE_0200
    * @tc.name       : testDarkMode002
    * @tc.desc       : test darkMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDarkMode002', 0, async (done: Function) => {
      Utils.emitEvent("testDarkMode002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDarkMode002", "false", 31040, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORCEDARKACCESS_0100
    * @tc.name       : testForceDarkAccess001
    * @tc.desc       : test forceDarkAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForceDarkAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testForceDarkAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForceDarkAccess001", "false", 31041, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

  })
}
