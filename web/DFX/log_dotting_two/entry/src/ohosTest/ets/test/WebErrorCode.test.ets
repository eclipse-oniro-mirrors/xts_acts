/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webErrorCode() {

  describe('WebErrorCodeTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webErrorCode state success " + JSON.stringify(pages));
        if (!("webErrorCode" == pages.name)) {
          console.info("get webErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webErrorCode page error: " + err);
      }
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

    afterEach(async (done: Function) => {
      console.info("ErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("ErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SEARCHALLASYNC_0100
    * @tc.name       : testSearchAllAsyncError001
    * @tc.desc       : test searchAllAsync error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSearchAllAsyncError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSearchAllAsync", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchAllAsyncError001", '17100001', 1000, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETUSERAGENT_0100
    * @tc.name       : testGetUserAgentError001
    * @tc.desc       : test GetUserAgent error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetUserAgentError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetUserAgent", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUserAgentError001", '17100001', 1006, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CLEARMATCHES_0100
    * @tc.name       : testClearMatchesError001
    * @tc.desc       : test ClearMatches error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testClearMatchesError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitClearMatches", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearMatchesError001", '17100001', 1007, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SEARCHNEXT_0100
    * @tc.name       : testSearchNextError001
    * @tc.desc       : test SearchNext error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSearchNextError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSearchNext", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchNextError001", '17100001', 1009, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CLEARSSLCACHE_0100
    * @tc.name       : testClearSslCacheError001
    * @tc.desc       : test ClearSslCache error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testClearSslCacheError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitClearSslCache", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearSslCacheError001", '17100001', 1010, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CLEARCLIENTAUTHENTICATIONCACHE_0100
    * @tc.name       : testClearClientAuthenticationCacheError001
    * @tc.desc       : test ClearClientAuthenticationCache error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testClearClientAuthenticationCacheError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitClearClientAuthenticationCache", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearClientAuthenticationCacheError001", '17100001', 1011, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMIN_0100
    * @tc.name       : testZoomInError001
    * @tc.desc       : test zoomIn error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testZoomInError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomIn", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomInError001", '17100001', 1012, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMIN_0200
    * @tc.name       : testZoomInError002
    * @tc.desc       : test zoomIn error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testZoomInError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomIn2", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomInError002", '17100004', 1013, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEPORT_0100
    * @tc.name       : testWebMessagePortError001
    * @tc.desc       : test WebMessagePort error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessagePortError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebMessagePort", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessagePortError001", '17100010', 1014, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CREATEWEBMESSAGEPORTS_0100
    * @tc.name       : testCreateWebMessagePortsError001
    * @tc.desc       : test CreateWebMessagePorts error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testCreateWebMessagePortsError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreateWebMessagePort", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCreateWebMessagePortsError001", '17100001', 1021, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_POSTMESSAGE_0100
    * @tc.name       : testPostMessageError001
    * @tc.desc       : test PostMessage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPostMessageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitPostMessage", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPostMessageError001", '17100001', 1022, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_REQUESTFOCUS_0100
    * @tc.name       : testRequestFocusError001
    * @tc.desc       : test RequestFocus error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRequestFocusError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRequestFocus", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRequestFocusError001", '17100001', 1023, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_REFRESH_0100
    * @tc.name       : testRefreshError001
    * @tc.desc       : test Refresh error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRefreshError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRefresh", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRefreshError001", '17100001', 1024, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_LOADDATA_0100
    * @tc.name       : testLoadDataError001
    * @tc.desc       : test loadData error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testLoadDataError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadData", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadDataError001", '17100001', 1025, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_LOADURL_0100
    * @tc.name       : testLoadUrlError001
    * @tc.desc       : test LoadUrl error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testLoadUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadUrl", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrlError001", '17100001', 1027, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMOUT_0100
    * @tc.name       : testZoomOutError001
    * @tc.desc       : test zoomOut error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testZoomOutError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomOut", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomOutError001", '17100001', 1028, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SLIDESCROLL_0100
    * @tc.name       : testSlideScrollError001
    * @tc.desc       : test slideScroll error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSlideScrollError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSlideScroll", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSlideScrollError001", '17100001', 1033, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SCROLLBY_0100
    * @tc.name       : testScrollByError001
    * @tc.desc       : test scrollBy error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testScrollByError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitScrollBy", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollByError001", '17100001', 1034, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SERIALIZEWEBSTATE_0100
    * @tc.name       : testSerializeWebStateError001
    * @tc.desc       : test serializeWebState error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSerializeWebStateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSerializeWebState", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSerializeWebStateError001", '17100001', 1035, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_RESTOREWEBSTATE_0100
    * @tc.name       : testRestoreWebStateError001
    * @tc.desc       : test restoreWebState error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRestoreWebStateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRestoreWebState", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRestoreWebStateError001", '17100001', 1036, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOP_0100
    * @tc.name       : testStopError001
    * @tc.desc       : test stop error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStopError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitStop", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStopError001", '17100001', 1037, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_REGISTERJAVASCRIPTPROXY_0100
    * @tc.name       : testRegisterJavaScriptProxyError001
    * @tc.desc       : test registerJavaScriptProxy error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRegisterJavaScriptProxyError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRegisterJavaScriptProxy", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRegisterJavaScriptProxyError001", '17100001', 1038, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEJAVASCRIPTREGISTER_0100
    * @tc.name       : testDeleteJavaScriptRegisterError001
    * @tc.desc       : test deleteJavaScriptRegister error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteJavaScriptRegisterError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitDeleteJavaScriptRegister", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteJavaScriptRegisterError001", '17100001', 1039, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEJAVASCRIPTREGISTER_0200
    * @tc.name       : testDeleteJavaScriptRegisterError002
    * @tc.desc       : test deleteJavaScriptRegister error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteJavaScriptRegisterError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitDeleteJavaScriptRegister2", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteJavaScriptRegisterError002", '17100008', 1040, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETHITTEST_0100
    * @tc.name       : testGetHitTestError001
    * @tc.desc       : test getHitTest error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetHitTestError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestError001", '17100001', 1041, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETTITLE_0100
    * @tc.name       : testGetTitleError001
    * @tc.desc       : test getTitle error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetTitleError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetTitle", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetTitleError001", '17100001', 1044, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETPAGEHEIGHT_0100
    * @tc.name       : testGetPageHeightError001
    * @tc.desc       : test getPageHeight error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetPageHeightError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetPageHeight", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetPageHeightError001", '17100001', 1045, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETHITTESTVALUE_0100
    * @tc.name       : testGetHitTestValueError001
    * @tc.desc       : test getHitTestValue error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetHitTestValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValueError001", '17100001', 1046, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETWEBID_0100
    * @tc.name       : testGetWebIdError001
    * @tc.desc       : test getWebId error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetWebIdError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetWebId", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetWebIdError001", '17100001', 1047, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_BACKORFORWARD_0100
    * @tc.name       : testBackOrForwardError001
    * @tc.desc       : test backOrForward error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testBackOrForwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitBackOrForward", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForwardError001", '17100001', 1048, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOM_0100
    * @tc.name       : testZoomError001
    * @tc.desc       : test zoom error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testZoomError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoom", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomError001", '17100001', 1049, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOM_0200
    * @tc.name       : testZoomError002
    * @tc.desc       : test zoom error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testZoomError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoom2", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomError002", '17100004', 1050, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_LOADURL_0200
    * @tc.name       : testLoadUrlError002
    * @tc.desc       : test LoadUrl error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    // it('testLoadUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
    //   Utils.emitEvent("emitLoadUrl2", 10)
    //   await Utils.sleep(2000);
    //   Utils.registerEvent("testLoadUrlError002", '17100002', 1058, done);
    //   sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    // })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_LOADURL_0300
    * @tc.name       : testLoadUrlError003
    * @tc.desc       : test LoadUrl error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testLoadUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadUrl3", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrlError003", '17100003', 1059, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEPORT_0200
    * @tc.name       : testWebMessagePortError002
    * @tc.desc       : test WebMessagePort error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessagePortError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebMessagePort2", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessagePortError002", '17100010', 1064, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ZOOMOUT_0200
    * @tc.name       : testZoomOutError002
    * @tc.desc       : test zoomOut error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testZoomOutError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomOut2", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomOutError002", '17100004', 1065, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ACCESSFORWARD_0100
    * @tc.name       : testAccessForwardError001
    * @tc.desc       : test accessAccessForward error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAccessForwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testAccessForwardError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForwardError001", '17100001', 50002, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ACCESSBACKWARD_0100
    * @tc.name       : testAccessBackwardError001
    * @tc.desc       : test accessBackward error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAccessBackwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testAccessBackwardError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackwardError001", '17100001', 50005, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ACCESSSTEP_0100
    * @tc.name       : testAccessStepError001
    * @tc.desc       : test accessStep error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAccessStepError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testAccessStepError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStepError001", '17100001', 50008, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_FORWARD_0100
    * @tc.name       : testForwardError001
    * @tc.desc       : test forward error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testForwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testForwardError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForwardError001", '17100001', 50009, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_BACKWARD_0100
    * @tc.name       : testBackwardError001
    * @tc.desc       : test backward error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testBackwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testBackwardError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackwardError001", '17100001', 50010, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_CLEARHISTORY_0100
    * @tc.name       : testClearHistoryError001
    * @tc.desc       : test clearhistory error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testClearHistoryError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testClearHistoryError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearHistoryError001", '17100001', 50011, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_ONACTIVE_0100
    * @tc.name       : testOnActiveError001
    * @tc.desc       : test onActive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOnActiveError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnActiveError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnActiveError001", '17100001', 50012, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_ONINACTIVE_0100
    * @tc.name       : testOnInactiveError001
    * @tc.desc       : test onInactive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOnInactiveError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnInactiveError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInactiveError001", '17100001', 50013, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_GETCERTIFICATE_0100
    * @tc.name       : testGetCertificateError001
    * @tc.desc       : test GetCertificate error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCertificateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCertificateError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCertificateError001", '17100001', 50015, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_SETAUDIOMUTED_0100
    * @tc.name       : testSetAudioMutedError001
    * @tc.desc       : test SetAudioMuted error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetAudioMutedError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetAudioMutedError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetAudioMutedError001", '17100001', 50016, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_PREFETCHPAGE_0100
    * @tc.name       : testPerFetchPageError001
    * @tc.desc       : test PerFetchPage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPerFetchPageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPerFetchPageError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPerFetchPageError001", '17100001', 50018, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_PREFETCHPAGE_0200
    * @tc.name       : testPerFetchPageError002
    * @tc.desc       : test PerFetchPage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPerFetchPageError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPerFetchPageError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPerFetchPageError002", '17100002', 50019, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_SETCUSTOMUSERAGENT_0100
    * @tc.name       : testSetCustomUserAgentError001
    * @tc.desc       : test CustomUserAgent error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCustomUserAgentError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCustomUserAgentError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCustomUserAgentError001", '17100001', 50023, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_GETCUSTOMUSERAGENT_0100
    * @tc.name       : testGetCustomUserAgentError001
    * @tc.desc       : test getCustomUserAgent error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCustomUserAgentError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCustomUserAgentError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCustomUserAgentError001", '17100001', 50024, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORECODE_PREPAREFORPAGELOAD_0100
    * @tc.name       : testPrepareForPageLoadError001
    * @tc.desc       : test prepareForPageLoad error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPrepareForPageLoadError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPrepareForPageLoadError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPrepareForPageLoadError001", "17100013", 50025, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_ERRORECODE_PREPAREFORPAGELOAD_0200
    * @tc.name       : testPrepareForPageLoadError002
    * @tc.desc       : test prepareForPageLoad error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPrepareForPageLoadError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPrepareForPageLoadError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPrepareForPageLoadError002", "17100002", 50026, done);
      sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
    })
  })
}
