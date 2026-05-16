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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 114080;
const driver = Driver.create();
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
          console.info("push webErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("ErrorCodeTestSuiteButton"), 10000);
      console.log("waitForComponent ErrorCodeTestSuiteButton");
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
     * @tc.name   testSearchAllAsyncError001
     * @tc.number SUB_WEB_ERRORCODE_SEARCHALLASYNC_0100
     * @tc.desc   test searchAllAsync error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSearchAllAsyncError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSearchAllAsync", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSearchAllAsyncError001", '17100001', 114090, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetUserAgentError001
     * @tc.number SUB_WEB_ERRORCODE_GETUSERAGENT_0100
     * @tc.desc   test GetUserAgent error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetUserAgentError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetUserAgent", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetUserAgentError001", '17100001', 114100, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testClearMatchesError001
     * @tc.number SUB_WEB_ERRORCODE_CLEARMATCHES_0100
     * @tc.desc   test ClearMatches error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearMatchesError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitClearMatches", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearMatchesError001", '17100001', 114110, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testSearchNextError001
     * @tc.number SUB_WEB_ERRORCODE_SEARCHNEXT_0100
     * @tc.desc   test SearchNext error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSearchNextError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSearchNext", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSearchNextError001", '17100001', 114120, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testClearSslCacheError001
     * @tc.number SUB_WEB_ERRORCODE_CLEARSSLCACHE_0100
     * @tc.desc   test ClearSslCache error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearSslCacheError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitClearSslCache", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearSslCacheError001", '17100001', 114130, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testClearClientAuthenticationCacheError001
     * @tc.number SUB_WEB_ERRORCODE_CLEARCLIENTAUTHENTICATIONCACHE_0100
     * @tc.desc   test ClearClientAuthenticationCache error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearClientAuthenticationCacheError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitClearClientAuthenticationCache", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearClientAuthenticationCacheError001", '17100001', 114140, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })


    /**
     * @tc.name   testZoomInError001
     * @tc.number SUB_WEB_ERRORCODE_ZOOMIN_0100
     * @tc.desc   test zoomIn error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZoomInError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomIn", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomInError001", '17100001', 114150, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testZoomInError002
     * @tc.number SUB_WEB_ERRORCODE_ZOOMIN_0200
     * @tc.desc   test zoomIn error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZoomInError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomIn2", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomInError002", '17100004', 114160, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })


    /**
     * @tc.name   testWebMessagePortError001
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEPORT_0100
     * @tc.desc   test WebMessagePort error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessagePortError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebMessagePort", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessagePortError001", '17100010', 114170, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testCreateWebMessagePortsError001
     * @tc.number SUB_WEB_ERRORCODE_CREATEWEBMESSAGEPORTS_0100
     * @tc.desc   test CreateWebMessagePorts error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateWebMessagePortsError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitCreateWebMessagePort", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCreateWebMessagePortsError001", '17100001', 114180, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testPostMessageError001
     * @tc.number SUB_WEB_ERRORCODE_POSTMESSAGE_0100
     * @tc.desc   test PostMessage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostMessageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitPostMessage", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostMessageError001", '17100001', 114190, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testRequestFocusError001
     * @tc.number SUB_WEB_ERRORCODE_REQUESTFOCUS_0100
     * @tc.desc   test RequestFocus error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestFocusError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRequestFocus", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRequestFocusError001", '17100001', 114200, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testRefreshError001
     * @tc.number SUB_WEB_ERRORCODE_REFRESH_0100
     * @tc.desc   test Refresh error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefreshError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRefresh", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRefreshError001", '17100001', 114210, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testLoadDataError001
     * @tc.number SUB_WEB_ERRORCODE_LOADDATA_0100
     * @tc.desc   test loadData error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadDataError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadData", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testLoadDataError001", '17100001', 114220, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testLoadUrlError001
     * @tc.number SUB_WEB_ERRORCODE_LOADURL_0100
     * @tc.desc   test LoadUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadUrl", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testLoadUrlError001", '17100001', 114230, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testZoomOutError001
     * @tc.number SUB_WEB_ERRORCODE_ZOOMOUT_0100
     * @tc.desc   test zoomOut error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZoomOutError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomOut", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomOutError001", '17100001', 114240, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testSlideScrollError001
     * @tc.number SUB_WEB_ERRORCODE_SLIDESCROLL_0100
     * @tc.desc   test slideScroll error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlideScrollError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSlideScroll", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSlideScrollError001", '17100001', 114250, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testScrollByError001
     * @tc.number SUB_WEB_ERRORCODE_SCROLLBY_0100
     * @tc.desc   test scrollBy error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitScrollBy", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testScrollByError001", '17100001', 114260, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testSerializeWebStateError001
     * @tc.number SUB_WEB_ERRORCODE_SERIALIZEWEBSTATE_0100
     * @tc.desc   test serializeWebState error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSerializeWebStateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSerializeWebState", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSerializeWebStateError001", '17100001', 114270, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testRestoreWebStateError001
     * @tc.number SUB_WEB_ERRORCODE_RESTOREWEBSTATE_0100
     * @tc.desc   test restoreWebState error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreWebStateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRestoreWebState", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRestoreWebStateError001", '17100001', 114280, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testStopError001
     * @tc.number SUB_WEB_ERRORCODE_STOP_0100
     * @tc.desc   test stop error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStopError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitStop", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStopError001", '17100001', 114290, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyError001
     * @tc.number SUB_WEB_ERRORCODE_REGISTERJAVASCRIPTPROXY_0100
     * @tc.desc   test registerJavaScriptProxy error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterJavaScriptProxyError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRegisterJavaScriptProxy", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRegisterJavaScriptProxyError001", '17100001', 114300, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testDeleteJavaScriptRegisterError001
     * @tc.number SUB_WEB_ERRORCODE_DELETEJAVASCRIPTREGISTER_0100
     * @tc.desc   test deleteJavaScriptRegister error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteJavaScriptRegisterError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitDeleteJavaScriptRegister", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteJavaScriptRegisterError001", '17100001', 114310, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testDeleteJavaScriptRegisterError002
     * @tc.number SUB_WEB_ERRORCODE_DELETEJAVASCRIPTREGISTER_0200
     * @tc.desc   test deleteJavaScriptRegister error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteJavaScriptRegisterError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitDeleteJavaScriptRegister2", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteJavaScriptRegisterError002", '17100008', 114320, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetHitTestError001
     * @tc.number SUB_WEB_ERRORCODE_GETHITTEST_0100
     * @tc.desc   test getHitTest error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetHitTestError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetHitTestError001", '17100001', 114330, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })


    /**
     * @tc.name   testGetTitleError001
     * @tc.number SUB_WEB_ERRORCODE_GETTITLE_0100
     * @tc.desc   test getTitle error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetTitleError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetTitle", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetTitleError001", '17100001', 114340, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetPageHeightError001
     * @tc.number SUB_WEB_ERRORCODE_GETPAGEHEIGHT_0100
     * @tc.desc   test getPageHeight error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPageHeightError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetPageHeight", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetPageHeightError001", '17100001', 114350, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetHitTestValueError001
     * @tc.number SUB_WEB_ERRORCODE_GETHITTESTVALUE_0100
     * @tc.desc   test getHitTestValue error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetHitTestValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetHitTestValueError001", '17100001', 114360, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetWebIdError001
     * @tc.number SUB_WEB_ERRORCODE_GETWEBID_0100
     * @tc.desc   test getWebId error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetWebIdError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitGetWebId", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetWebIdError001", '17100001', 114370, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testBackOrForwardError001
     * @tc.number SUB_WEB_ERRORCODE_BACKORFORWARD_0100
     * @tc.desc   test backOrForward error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBackOrForwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitBackOrForward", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testBackOrForwardError001", '17100001', 114380, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testZoomError001
     * @tc.number SUB_WEB_ERRORCODE_ZOOM_0100
     * @tc.desc   test zoom error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZoomError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoom", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomError001", '17100001', 114390, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testZoomError002
     * @tc.number SUB_WEB_ERRORCODE_ZOOM_0200
     * @tc.desc   test zoom error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZoomError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoom2", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomError002", '17100004', 114400, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testLoadUrlError002
     * @tc.number SUB_WEB_ERRORCODE_LOADURL_0200
     * @tc.desc   test LoadUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testLoadUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
    //   Utils.emitEvent("emitLoadUrl2", EVENT_ID_SET_EMIT_KEY)
    //   Utils.registerEvent("testLoadUrlError002", '17100002', 114410, done);
    //   await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    // })

    /**
     * @tc.name   testLoadUrlError003
     * @tc.number SUB_WEB_ERRORCODE_LOADURL_0300
     * @tc.desc   test LoadUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitLoadUrl3", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testLoadUrlError003", '17100003', 114420, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testWebMessagePortError002
     * @tc.number SUB_WEB_ERRORCODE_WEBMESSAGEPORT_0200
     * @tc.desc   test WebMessagePort error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessagePortError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebMessagePort2", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebMessagePortError002", '17100010', 114430, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testZoomOutError002
     * @tc.number SUB_WEB_ERRORCODE_ZOOMOUT_0200
     * @tc.desc   test zoomOut error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZoomOutError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitZoomOut2", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomOutError002", '17100004', 114440, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testAccessForwardError001
     * @tc.number SUB_WEB_ERRORCODE_ACCESSFORWARD_0100
     * @tc.desc   test accessAccessForward error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessForwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testAccessForwardError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAccessForwardError001", '17100001', 114450, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testAccessBackwardError001
     * @tc.number SUB_WEB_ERRORCODE_ACCESSBACKWARD_0100
     * @tc.desc   test accessBackward error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessBackwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testAccessBackwardError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAccessBackwardError001", '17100001', 114460, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testAccessStepError001
     * @tc.number SUB_WEB_ERRORCODE_ACCESSSTEP_0100
     * @tc.desc   test accessStep error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessStepError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testAccessStepError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAccessStepError001", '17100001', 114470, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testForwardError001
     * @tc.number SUB_WEB_ERRORECODE_FORWARD_0100
     * @tc.desc   test forward error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testForwardError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testForwardError001", '17100001', 114480, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testBackwardError001
     * @tc.number SUB_WEB_ERRORECODE_BACKWARD_0100
     * @tc.desc   test backward error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBackwardError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testBackwardError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testBackwardError001", '17100001', 114490, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testClearHistoryError001
     * @tc.number SUB_WEB_ERRORECODE_CLEARHISTORY_0100
     * @tc.desc   test clearhistory error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearHistoryError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testClearHistoryError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearHistoryError001", '17100001', 114500, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testOnActiveError001
     * @tc.number SUB_WEB_ERRORECODE_ONACTIVE_0100
     * @tc.desc   test onActive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnActiveError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnActiveError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnActiveError001", '17100001', 114510, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testOnInactiveError001
     * @tc.number SUB_WEB_ERRORECODE_ONINACTIVE_0100
     * @tc.desc   test onInactive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnInactiveError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnInactiveError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnInactiveError001", '17100001', 114520, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetCertificateError001
     * @tc.number SUB_WEB_ERRORECODE_GETCERTIFICATE_0100
     * @tc.desc   test GetCertificate error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCertificateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCertificateError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCertificateError001", '17100001', 114530, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testSetAudioMutedError001
     * @tc.number SUB_WEB_ERRORECODE_SETAUDIOMUTED_0100
     * @tc.desc   test SetAudioMuted error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetAudioMutedError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetAudioMutedError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetAudioMutedError001", '17100001', 114540, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testPerFetchPageError001
     * @tc.number SUB_WEB_ERRORECODE_PREFETCHPAGE_0100
     * @tc.desc   test PerFetchPage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPerFetchPageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPerFetchPageError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPerFetchPageError001", '17100001', 114550, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testPerFetchPageError002
     * @tc.number SUB_WEB_ERRORECODE_PREFETCHPAGE_0200
     * @tc.desc   test PerFetchPage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPerFetchPageError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPerFetchPageError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPerFetchPageError002", '17100002', 114560, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testSetCustomUserAgentError001
     * @tc.number SUB_WEB_ERRORECODE_SETCUSTOMUSERAGENT_0100
     * @tc.desc   test CustomUserAgent error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCustomUserAgentError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetCustomUserAgentError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetCustomUserAgentError001", '17100001', 114570, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testGetCustomUserAgentError001
     * @tc.number SUB_WEB_ERRORECODE_GETCUSTOMUSERAGENT_0100
     * @tc.desc   test getCustomUserAgent error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCustomUserAgentError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetCustomUserAgentError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCustomUserAgentError001", '17100001', 114580, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testPrepareForPageLoadError001
     * @tc.number SUB_WEB_ERRORECODE_PREPAREFORPAGELOAD_0100
     * @tc.desc   test prepareForPageLoad error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPrepareForPageLoadError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPrepareForPageLoadError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPrepareForPageLoadError001", "17100013", 114590, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })
    /**
     * @tc.name   testPrepareForPageLoadError002
     * @tc.number SUB_WEB_ERRORECODE_PREPAREFORPAGELOAD_0200
     * @tc.desc   test prepareForPageLoad error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPrepareForPageLoadError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPrepareForPageLoadError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPrepareForPageLoadError002", "17100002", 114600, done);
      await Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })
  })
}