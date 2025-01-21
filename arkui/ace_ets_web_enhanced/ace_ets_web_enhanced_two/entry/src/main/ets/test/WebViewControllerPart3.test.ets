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

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerPart3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages));
        if (!("WebViewControllerPart3" == pages.name)) {
          console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerPart3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPart3 page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebViewControllerPart3 beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_0100
    * @tc.name       : testAccessForward001
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward001", false, 50520, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_0200
    * @tc.name       : testAccessForward002
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward002", true, 50522, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_0300
    * @tc.name       : testAccessForward003
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward003", false, 200000, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_0400
    * @tc.name       : testAccessForward004
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward004", true, 200002, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_0100
    * @tc.name       : testAccessBackward001
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward001", false, 50526, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_0200
    * @tc.name       : testAccessBackward002
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward002", true, 50528, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_0300
    * @tc.name       : testAccessBackward003
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward003", false, 200001, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_0400
    * @tc.name       : testAccessBackward004
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward004", true, 200003, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0100
    * @tc.name       : testAccessStep001
    * @tc.desc       : test accessStep(1) when has no forward history can return false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep001", false, 50530, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0200
    * @tc.name       : testAccessStep002
    * @tc.desc       : test accessStep(1) when has forward history can return true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep002", true, 50532, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0300
    * @tc.name       : testAccessStep003
    * @tc.desc       : test accessStep(-1) when has no backward history can return false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep003", false, 50534, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0400
    * @tc.name       : testAccessStep004
    * @tc.desc       : test accessStep(-1) when has backward history can return true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep004", true, 50536, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0500
    * @tc.name       : testAccessStep005
    * @tc.desc       : test accessStep(1) when has no forward history can return false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep005', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep005", false, 100096, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0600
    * @tc.name       : testAccessStep006
    * @tc.desc       : test accessStep(1) when has forward history can return true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep006', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep006", true, 100097, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0700
    * @tc.name       : testAccessStep007
    * @tc.desc       : test accessStep(-1) when has no backward history can return false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep007', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep007", false, 100098, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0800
    * @tc.name       : testAccessStep008
    * @tc.desc       : test accessStep(-1) when has backward history can return true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep008', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep008", true, 100099, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0100
    * @tc.name       : testScrollTo001
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo001', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo001", "[0,0]", 100042, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0200
    * @tc.name       : testScrollTo002
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo002', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo002", true, 100043, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0300
    * @tc.name       : testScrollTo003
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo003', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo003", "[0,100]", 100044, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0400
    * @tc.name       : testScrollTo004
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo004', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo004", "[100,0]", 100045, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0500
    * @tc.name       : testScrollTo005
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo005', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo005", true, 100046, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0600
    * @tc.name       : testScrollTo006
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo006', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo006", "[100,100]", 100047, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0700
    * @tc.name       : testScrollTo007
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo007', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo007", true, 100048, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0100
    * @tc.name       : testHasImage001
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage001', 0, async (done: Function) => {
      Utils.emitEvent("testHasImage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage001", true, 100049, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0200
    * @tc.name       : testHasImage002
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage002', 0, async (done: Function) => {
      Utils.emitEvent("testHasImage002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage002", false, 100050, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0300
    * @tc.name       : testHasImage003
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage003', 0, async (done: Function) => {
      Utils.emitEvent("testHasImage003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage003", true, 100051, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0400
    * @tc.name       : testHasImage004
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage004', 0, async (done: Function) => {
      Utils.emitEvent("testHasImage004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage004", true, 100052, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0500
    * @tc.name       : testHasImage005
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage005', 0, async (done: Function) => {
      Utils.emitEvent("testHasImage005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage005", false, 100053, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0600
    * @tc.name       : testHasImage006
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage006', 0, async (done: Function) => {
      Utils.emitEvent("testHasImage006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage006", true, 100054, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0100
    * @tc.name       : testSetNetworkAvailable001
    * @tc.desc       : test setNetworkAvailable
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetNetworkAvailable001', 0, async (done: Function) => {
      Utils.emitEvent("testSetNetworkAvailable001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetNetworkAvailable001", 'false', 100055, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0200
    * @tc.name       : testSetNetworkAvailable002
    * @tc.desc       : test setNetworkAvailable
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetNetworkAvailable002', 0, async (done: Function) => {
      Utils.emitEvent("testSetNetworkAvailable002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetNetworkAvailable002", 'true', 100056, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETFAVICON_0100
    * @tc.name       : testGetFavicon001
    * @tc.desc       : test getFavicon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetFavicon001', 0, async (done: Function) => {
      Utils.emitEvent("testGetFavicon001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetFavicon001", false, 100057, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETFAVICON_0200
    * @tc.name       : testGetFavicon002
    * @tc.desc       : test getFavicon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetFavicon002', 0, async (done: Function) => {
      Utils.emitEvent("testGetFavicon002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetFavicon002", '32_32', 100058, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETORIGINALURL_0100
    * @tc.name       : testGetOriginalUrl001
    * @tc.desc       : test getOriginalUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetOriginalUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginalUrl001", 'resource://rawfile/secondCopy.html', 100059, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETORIGINALURL_0200
    * @tc.name       : testGetOriginalUrl002
    * @tc.desc       : test getOriginalUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetOriginalUrl002', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginalUrl002", true, 100060, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETURL_0100
    * @tc.name       : testGetUrl001
    * @tc.desc       : test getUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUrl001", 'resource://rawfile/secondCopy.html', 100061, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETURL_0200
    * @tc.name       : testGetUrl002
    * @tc.desc       : test getUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetUrl002', 0, async (done: Function) => {
      Utils.emitEvent("testGetUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUrl002", 'https://www.example.com/', 100062, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEDOWN_0100
    * @tc.name       : testPageDown001
    * @tc.desc       : test pageDown
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageDown001', 0, async (done: Function) => {
      Utils.emitEvent("testPageDown001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageDown001", true, 100063, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEDOWN_0200
    * @tc.name       : testPageDown002
    * @tc.desc       : test pageDown
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageDown002', 0, async (done: Function) => {
      Utils.emitEvent("testPageDown002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageDown002", true, 100064, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEUP_0100
    * @tc.name       : testPageUp001
    * @tc.desc       : test pageUp
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageUp001', 0, async (done: Function) => {
      Utils.emitEvent("testPageUp001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageUp001", true, 100065, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEUP_0200
    * @tc.name       : testPageUp002
    * @tc.desc       : test pageUp
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageUp002', 0, async (done: Function) => {
      Utils.emitEvent("testPageUp002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageUp002", true, 100066, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKWARD_0100
    * @tc.name       : testBackward001
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward001', 0, async (done: Function) => {
      Utils.emitEvent("testBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward001", "index", 100071, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKWARD_0200
    * @tc.name       : testBackward002
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward002', 0, async (done: Function) => {
      Utils.emitEvent("testBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward002", "index", 200004, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKWARD_0300
    * @tc.name       : testBackward003
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward003', 0, async (done: Function) => {
      Utils.emitEvent("testBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward003", "second", 200005, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_FORWARD_0100
    * @tc.name       : testForward001
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward001', 0, async (done: Function) => {
      Utils.emitEvent("testForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward001", "second", 100072, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_FORWARD_0200
    * @tc.name       : testForward002
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward002', 0, async (done: Function) => {
      Utils.emitEvent("testForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward002", "LoadData", 100085, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_FORWARD_0300
    * @tc.name       : testForward003
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward003', 0, async (done: Function) => {
      Utils.emitEvent("testForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward003", "index", 100086, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETPAGEHEIGHT_0100
    * @tc.name       : testGetPageHeight001
    * @tc.desc       : test getPageHeight
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetPageHeight001', 0, async (done: Function) => {
      Utils.emitEvent("testGetPageHeight001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetPageHeight001", true, 100074, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_0100
    * @tc.name       : testRegisterJavaScriptProxy001
    * @tc.desc       : test registerJavaScriptProxy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRegisterJavaScriptProxy001', 0, async (done: Function) => {
      Utils.emitEvent("testRegisterJavaScriptProxy001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRegisterJavaScriptProxy001", "backToEts", 100075, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_DELETEJAVASCRIPTREGISTER_0100
    * @tc.name       : testDeleteJavaScriptRegister001
    * @tc.desc       : test deleteJavaScriptRegister
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteJavaScriptRegister001', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteJavaScriptRegister001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteJavaScriptRegister001", true, 100076, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ONINACTIVE_0100
    * @tc.name       : testOnInactive001
    * @tc.desc       : test onInactive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnInactive001', 0, async (done: Function) => {
      Utils.emitEvent("testOnInactive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInactive001", "second", 100077, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ONACTIVE_0100
    * @tc.name       : testOnActive001
    * @tc.desc       : test onActive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnActive001', 0, async (done: Function) => {
      Utils.emitEvent("testOnActive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnActive001", "second", 100078, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PREFETCHPAGE_0100
    * @tc.name       : testPrefetchPage001
    * @tc.desc       : test prefetchPage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrefetchPage001', 0, async (done: Function) => {
      Utils.emitEvent("testPrefetchPage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPrefetchPage001", true, 100079, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SLIDESCROLL_0100
    * @tc.name       : testSlideScroll001
    * @tc.desc       : test slideScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSlideScroll001', 0, async (done: Function) => {
      Utils.emitEvent("testSlideScroll001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSlideScroll001", true, 100082, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RESTOREWEBSTATE_0100
    * @tc.name       : testRestoreWebState001
    * @tc.desc       : test restoreWebState
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRestoreWebState001', 0, async (done: Function) => {
      Utils.emitEvent("testRestoreWebState001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRestoreWebState001", "index", 100083, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ONMESSAGEEVENT_0100
    * @tc.name       : testOnMessageEvent001
    * @tc.desc       : test onMessageEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnMessageEvent001', 0, async (done: Function) => {
      Utils.emitEvent("testOnMessageEvent001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnMessageEvent001", 1, 100084, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

  })
}
