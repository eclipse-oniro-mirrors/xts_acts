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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebAttributeTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_INITIALSCALE_0100
    * @tc.name        : testInitialScale001
    * @tc.desc        : test initialScale from 100 to 120
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testInitialScale001', 0, async (done: Function) => {
      Utils.emitEvent("emitInitialScale001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInitialScale001", 'oldScale=100,newScale=120', 70001, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_INITIALSCALE_0200
    * @tc.name        : testInitialScale002
    * @tc.desc        : test initialScale from 100 to 80
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testInitialScale002', 0, async (done: Function) => {
      Utils.emitEvent("emitInitialScale002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInitialScale001", 'oldScale=100,newScale=90', 70003, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONSCALECHANGE_0100
    * @tc.name        : testOnScaleChange001
    * @tc.desc        : test onScaleChange
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnScaleChange001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnScaleChange", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScaleChange001", 'oldScale=100,newScale=110', 70005, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEEND_0100
    * @tc.name        : testOnPageEnd001
    * @tc.desc        : test onPageEnd normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageEnd001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPageEnd001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageEnd001", "resource://rawfile/second.html", 70007, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEEND_0200
    * @tc.name        : testOnPageEnd002
    * @tc.desc        : test onPageEnd with iframe
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageEnd002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPageEnd002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageEnd002", "resource://rawfile/iframe.html", 70008, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEBEGIN_0100
    * @tc.name        : testOnPageBegin001
    * @tc.desc        : test onPageBegin normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageBegin001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPageBegin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageBegin001", "resource://rawfile/second.html", 70009, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEBEGIN_0200
    * @tc.name        : testOnPageBegin002
    * @tc.desc        : test onPageBegin with iframe
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageBegin002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPageBegin002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageBegin002", "resource://rawfile/iframe.html", 70010, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPROGRESSCHANGE_0100
    * @tc.name        : testOnProgressChange001
    * @tc.desc        : test onProgressChange normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnProgressChange001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnProgressChange001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnProgressChange001", "100", 700012, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONTITLERECEIVE_0100
    * @tc.name        : testOnTitleReceive001
    * @tc.desc        : test onTitleReceive normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnTitleReceive001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnTitleReceive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnTitleReceive001", "ChangeTitle", 70014, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONTITLERECEIVE_0200
    * @tc.name        : testOnTitleReceive002
    * @tc.desc        : test onTitleReceive when js changed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnTitleReceive002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnTitleReceive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnTitleReceive002", "123", 70016, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONGEOLOCATIONSHOW_0100
    * @tc.name        : testOnGeolocationShow001
    * @tc.desc        : test onGeolocationShow normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnGeolocationShow001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnGeolocationShow", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnGeolocationShow001", "onGeolocationShow", 70011, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONREQUESTSELECTED_0100
    * @tc.name        : testOnRequestSelected001
    * @tc.desc        : test onRequestSelected after requestFocus
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnRequestSelected001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnRequestSelected001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnRequestSelected001", true, 70015, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })


    /*
    * @tc.number      : SUB_WEB_ONALERT_0100
    * @tc.name        : testOnAlert001
    * @tc.desc        : test onAlert callback
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnAlert001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnAlert001", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testOnAlert001", "alert test", 70017, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONCONFIRM_0100
    * @tc.name        : testOnConfirm001
    * @tc.desc        : test onConfirm normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnConfirm001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnConfirm001", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testOnConfirm001", "confirm test", 70018, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPROMPT_0100
    * @tc.name        : testOnPrompt001
    * @tc.desc        : test onPrompt normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPrompt001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPrompt001", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testOnPrompt001", "prompt test", 70019, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLECANCEL_0100
    * @tc.name        : testJsResultHandleCancel001
    * @tc.desc        : test JsResultHandle.cancel()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandleCancel001', 0, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandleCancel001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsResultHandleCancel001", "false", 70021, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLECONFIRM_0100
    * @tc.name        : testJsResultHandleConfirm001
    * @tc.desc        : test JsResultHandle.confirm()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandleConfirm001', 0, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandleConfirm001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsResultHandleConfirm001", "true", 70023, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLEPROMPTCONFIRM_0100
    * @tc.name        : testJsResultHandlePromptConfirm001
    * @tc.desc        : test JsResultHandle.promptConfirm()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandlePromptConfirm001', 0, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandlePromptConfirm001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsResultHandlePromptConfirm001", "\"handlePromptConfirm\"", 70025, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_USERAGENT_0100
    * @tc.name        : testUserAgent001
    * @tc.desc        : test userAgent normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testUserAgent001', 0, async (done: Function) => {
      Utils.emitEvent("emitUserAgent001", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testUserAgent001", "Mozilla/5.0 (Windows NT 10.0; WOW64)", 60063, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONCONSOLE_0100
    * @tc.name        : testOnConsole001
    * @tc.desc        : test onConsole message
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnConsole001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnConsole001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnConsole001", "console test", 70040, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_CONSOLEMESSAGE_0100
    * @tc.name        : testConsoleMessage001
    * @tc.desc        : test onConsole info
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testConsoleMessage001', 0, async (done: Function) => {
      Utils.emitEvent("emitConsoleMessage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testConsoleMessage001", 51, 70042, done);
      Utils.registerEvent("testConsoleMessage001", 'resource://rawfile/index.html', 70044, done);
      Utils.registerEvent("testConsoleMessage001", MessageLevel.Info, 70046, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONERRORRECEIVE_0100
    * @tc.name        : testOnErrorReceive001
    * @tc.desc        : test onErrorReceive whit error url
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnErrorReceive001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnErrorReceive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnErrorReceive001", "http://testonerrorexample.com/", 60065, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONERRORRECEIVE_0200
    * @tc.name        : testOnErrorReceive002
    * @tc.desc        : test onErrorReceive with out network
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnErrorReceive002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnErrorReceive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnErrorReceive002", "https://openharmony.cn/", 60066, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0100
    * @tc.name        : testOnHttpErrorReceive001
    * @tc.desc        : test onHttpErrorReceive normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnHttpErrorReceive001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnHttpErrorReceive", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnHttpErrorReceive", true, 60067, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONDOWNLOADSTART_0100
    * @tc.name        : testOnDownloadStart001
    * @tc.desc        : test onDownloadStart normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadStart001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnDownloadStart", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnDownloadStart001", "https://consumer.huawei.com/" +
        "content/dam/huawei-cbg-site/cn/mkt/mobileservices/2022/download/" +
        "PC107f1b3947c942ffaa14334a879065d8.2107261020.exe", 60068, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONREFRESHACCESSEDHISTORY_0100
    * @tc.name        : testOnRefreshAccessedHistory001
    * @tc.desc        : test onRefreshAccessedHistory when loadUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnRefreshAccessedHistory001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnRefreshAccessedHistory001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnRefreshAccessedHistory001", "resource://rawfile/second.html", 60116, done);
      Utils.registerEvent("testOnRefreshAccessedHistory001", false, 60117, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONREFRESHACCESSEDHISTORY_0200
    * @tc.name        : testOnRefreshAccessedHistory002
    * @tc.desc        : test onRefreshAccessedHistory when refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnRefreshAccessedHistory002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnRefreshAccessedHistory002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnRefreshAccessedHistory002", "resource://rawfile/second.html", 60118, done);
      Utils.registerEvent("testOnRefreshAccessedHistory002", true, 60119, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONURLLOADINTERCEPT_0100
    * @tc.name        : testOnUrlLoadIntercept001
    * @tc.desc        : test onUrlLoadIntercept normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnUrlLoadIntercept001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnUrlLoadIntercept", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnUrlLoadIntercept001", "https://gitee.com/", 60104, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONRENDEREXITED_0100
    * @tc.name        : testOnRenderExited001
    * @tc.desc        : test onRenderExited RenderExitReason.ProcessCrashed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnRenderExited001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnRenderExited", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnRenderExited001", RenderExitReason.ProcessCrashed, 60106, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_HEADER_0100
    * @tc.name        : testHeader001
    * @tc.desc        : test custom header
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testHeader001', 0, async (done: Function) => {
      Utils.emitEvent("emitHeader001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHeader001", true, 412, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONSEARCHRESULTRECEIVE_0100
    * @tc.name        : testOnSearchResultReceive001
    * @tc.desc        : test onSearchResultReceive when have results
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnSearchResultReceive001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnSearchResultReceive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnSearchResultReceive001", 3, 60414, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONSEARCHRESULTRECEIVE_0200
    * @tc.name        : testOnSearchResultReceive002
    * @tc.desc        : test onSearchResultReceive when have no results
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnSearchResultReceive002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnSearchResultReceive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnSearchResultReceive002", 0, 60416, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_BLOCKNETWORK_0100
    * @tc.name        : testBlockNetWork001
    * @tc.desc        : test blockNetWork true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testBlockNetWork001', 0, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBlockNetWork001", 'https://openharmony.cn/', 60418, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_BLOCKNETWORK_0200
    * @tc.name        : testBlockNetWork002
    * @tc.desc        : test blockNetWork false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testBlockNetWork002', 0, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBlockNetWork002", 'OpenAtom OpenHarmony', 60420, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_BLOCKNETWORK_0300
    * @tc.name        : testBlockNetWork003
    * @tc.desc        : test blockNetWork true when load raw file
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testBlockNetWork003', 0, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBlockNetWork003", '', 60800, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_BLOCKNETWORK_0400
    * @tc.name        : testBlockNetWork004
    * @tc.desc        : test blockNetWork true when load resources
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testBlockNetWork004', 0, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBlockNetWork004", '', 60802, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_BLOCKNETWORK_0500
    * @tc.name        : testBlockNetWork005
    * @tc.desc        : test blockNetWork true when local file
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testBlockNetWork005', 0, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBlockNetWork005", '', 60805, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONFAVICONRECEIVED_0100
    * @tc.name        : testOnFaviconReceived001
    * @tc.desc        : test onFaviconReceived normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnFaviconReceived001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnFaviconReceived", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnFaviconReceived001", true, 60421, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTKEYEVENT_0100
    * @tc.name        : testOnInterceptKeyEvent001
    * @tc.desc        : test onInterceptKeyEvent normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptKeyEvent001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptKeyEvent", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInterceptKeyEvent001", 2017, 60422, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETCERTIFICATE_0100
    * @tc.name        : testGetCertificate001
    * @tc.desc        : test getCertificate with return promise
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetCertificate001', 0, async (done: Function) => {
      Utils.emitEvent("emitGetCertificate001", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testGetCertificate001", "getCertificate success: len = 1", 60423, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETCERTIFICATE_0200
    * @tc.name        : testGetCertificate002
    * @tc.desc        : test getCertificate with callback function
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetCertificate002', 0, async (done: Function) => {
      Utils.emitEvent("emitGetCertificate002", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testGetCertificate002", "getCertificate success: len = 1", 60424, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
