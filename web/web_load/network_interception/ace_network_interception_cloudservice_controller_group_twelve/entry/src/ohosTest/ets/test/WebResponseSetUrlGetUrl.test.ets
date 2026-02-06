/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = '';
const  driver = Driver.create();
export default function webviewNApi() {

  describe('OH_ArkWebRequestHeader', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('Index' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4751
     * @tc.name testWebResponse_SetUrl_Url_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetUrlUrlIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetUrl_Url_IsNone', 124611);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_IsNone', 17100101, 124680, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4752
     * @tc.name testWebResponse_SetUrl_Url_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetUrlUrlNotString'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetUrl_Url_NotString', 124612);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_NotString', 17100101, 124690,done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4753
     * @tc.name testWebResponse_SetUrl_Url_NotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetUrlUrlNotExist'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetUrl_Url_NotExist', 124613);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_NotExist', 17100101, 124700, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4754
     * @tc.name testWebResponse_SetUrl_Url_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetUrlUrlError'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetUrl_Url_Error', 124614);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_Error', 0, 124710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4801
     * @tc.name testWebResponse_GetUrl_Url_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetUrlUrlIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_GetUrl_Url_IsNone', 124615);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_IsNone', 17100101, 124720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4802
     * @tc.name testWebResponse_GetUrl_Url_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetUrlUrlNotString'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_GetUrl_Url_NotString', 124616);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_NotString', 17100101, 124730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4803
     * @tc.name testWebResponse_GetUrl_Url_NotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetUrlUrlNotExist'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_GetUrl_Url_NotExist', 124617);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_NotExist', false, 124740, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4804
     * @tc.name testWebResponse_GetUrl_Url_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetUrlUrlError'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_GetUrl_Url_Error', 124618);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_Error', "https:" + "//www.baidu.com/", 124750, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetUrl",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5151
     * @tc.name testWebResponse_SetStatus_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetStatusIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetStatus_IsNone', 124619);
      Utils.registerBaseEvent('testWebResponse_SetStatus_IsNone', 0, 124760, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetStatus",driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5152
     * @tc.name testWebResponse_SetStatus_NotNum
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetStatusNotNum'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetStatus_NotNum', 124620);
      Utils.registerBaseEvent('testWebResponse_SetStatus_NotNum', 17100101, 124770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetStatus", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5153
     * @tc.name testWebResponse_SetStatus_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetStatusError'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetStatus_Error', 124621);
      Utils.registerBaseEvent('testWebResponse_SetStatus_Error', 0, 124780, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetStatus", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5350
     * @tc.name testWebResponse_SetStatusText_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetStatusTextIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetStatusText_IsNone', 124622);
      Utils.registerBaseEvent('testWebResponse_SetStatusText_IsNone', 17100101, 124790, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetStatusText", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5351
     * @tc.name testWebResponse_SetStatusText_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetStatusTextNotString'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetStatusText_NotString', 124623);
      Utils.registerBaseEvent('testWebResponse_SetStatusText_NotString', 17100101, 124800, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetStatusText", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5400
     * @tc.name testWebResponse_GetStatusText_NetErr
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetStatusTextNetErr'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_GetStatusText_NetErr', 124624);
      Utils.registerBaseEvent('testWebResponse_GetStatusText_NetErr', false, 124810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetStatusText", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_5710
     * @tc.name testWebResponse_SetCharset_Param_None
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_5710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetCharsetParamNone'
      });
      router.clear();
      Utils.emitEvent('testWebResponse_SetCharset_Param_None', 124625);
      Utils.registerBaseEvent('testWebResponse_SetCharset_Param_None', 17100101, 124820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetCharset", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_4151
     * @tc.name testWebSchemeHandler_SetUserData_ParamIsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_4151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/SetUserDataParamIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebSchemeHandler_SetUserData_ParamIsNone', 124626);
      Utils.registerBaseEvent('testWebSchemeHandler_SetUserData_ParamIsNone', 17100101, 124830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("SetUserData", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1115
     * @tc.name testWebRequestHeaderList_GetHeader_KeyParam_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetHeaderKeyParamNotString'
      });
      router.clear();
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_KeyParam_NotString', 124627);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_KeyParam_NotString', true, 124840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetHeader", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1116
     * @tc.name testWebRequestHeaderList_GetHeader_KeyParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetHeaderKeyParamIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_KeyParam_IsNone', 124628);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_KeyParam_IsNone', false, 124850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetHeader", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1117
     * @tc.name testWebRequestHeaderList_GetHeader_ValueParam_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetHeaderValueParamNotString'
      });
      router.clear();
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_ValueParam_NotString', 124629);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_ValueParam_NotString', true, 124860, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetHeader", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1118
     * @tc.name testWebRequestHeaderList_GetHeader_ValueParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/GetHeaderValueParamIsNone'
      });
      router.clear();
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_ValueParam_IsNone', 124630);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_ValueParam_IsNone', false, 124870, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetHeader", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1410
     * @tc.name testWebResourceRequest_GetMethod_get
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/RequestGetMethodGet'
      });
      router.clear();
      Utils.emitEvent('testWebResourceRequest_GetMethod_get', 124631);
      Utils.registerBaseEvent('testWebResourceRequest_GetMethod_get', "GET", 124880, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("GetMethod", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1510
     * @tc.name testWebResourceRequest_GetUrl_Fail_URL_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ResourceRequestGetUrlResourceRequestNull'
      });
      router.clear();
      Utils.emitEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNone', 124632);
      Utils.registerBaseEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNone', true, 124890, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1520
     * @tc.name testWebResourceRequest_GetUrl_Fail_URL_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ResourceRequestGetUrlUrlNull'
      });
      router.clear();
      Utils.emitEvent('testWebResourceRequest_GetUrl_Fail_URL_NotString', 124633);
      Utils.registerBaseEvent('testWebResourceRequest_GetUrl_Fail_URL_NotString', true, 124900, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_1530
     * @tc.name testWebResourceRequest_GetUrl_Fail_URL_IsNotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ResourceRequestGetUrlAllNull'
      });
      router.clear();
      Utils.emitEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNotExist', 124634);
      Utils.registerBaseEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNotExist', true, 124910, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_6710
     * @tc.name testWeb_ReleaseString_Fail_Param_NotNSDK
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_6710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebReleaseStringNotNDK'
      });
      router.clear();
      Utils.emitEvent('testWeb_ReleaseString_Fail_Param_NotNDK', 124635);
      Utils.registerBaseEvent('testWeb_ReleaseString_Fail_Param_NotNDK', true, 124920, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });


    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_6720
     * @tc.name testWeb_ReleaseString_Fail_Param_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_6720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebReleaseStringString'
      });
      router.clear();
      Utils.emitEvent('testWeb_ReleaseString_Fail_Param_IsNone', 124636);
      Utils.registerBaseEvent('testWeb_ReleaseString_Fail_Param_IsNone', true, 124930, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });


    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_6730
     * @tc.name testWeb_ReleaseString_Fail_Param_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_6730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebReleaseStringStringNull'
      });
      router.clear();
      Utils.emitEvent('testWeb_ReleaseString_Fail_Param_NotString', 124637);
      Utils.registerBaseEvent('testWeb_ReleaseString_Fail_Param_NotString', false, 124940, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });


    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_6810
     * @tc.name testWeb_ReleaseByteArray_Fail_Param_NotNSDK
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_6810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebReleaseByteArrayNotNDK'
      });
      router.clear();
      Utils.emitEvent('testWeb_ReleaseByteArray_Fail_Param_NotNDK', 124638);
      Utils.registerBaseEvent('testWeb_ReleaseByteArray_Fail_Param_NotNDK', true, 124950, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_6820
     * @tc.name testWeb_ReleaseByteArray_Fail_Param_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_6820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebReleaseByteArrayString'
      });
      router.clear();
      Utils.emitEvent('testWeb_ReleaseByteArray_Fail_Param_IsNone', 124639);
      Utils.registerBaseEvent('testWeb_ReleaseByteArray_Fail_Param_IsNone', true, 124960, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_6830
     * @tc.name testWeb_ReleaseByteArray_Fail_Param_NotArray
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_6830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebReleaseByteArrayStringNull'
      });
      router.clear();
      Utils.emitEvent('testWeb_ReleaseByteArray_Fail_Param_NotArray', 124640);
      Utils.registerBaseEvent('testWeb_ReleaseByteArray_Fail_Param_NotArray', false, 124970, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_2920
     * @tc.name testWebResourceRequest_GetReferrer_Param_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_2920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ResourceRequestGetReferrer'
      });
      router.clear();
      Utils.emitEvent('testWebResourceRequest_GetReferrer_Param_Error', 124641);
      Utils.registerBaseEvent('testWebResourceRequest_GetReferrer_Param_Error', false, 124980, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3601
     * @tc.name testWeb_SetSchemeHandler_Fail_schemeParam_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerSchemeNull'
      });
      router.clear();
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_schemeParam_NotString', 124642);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_schemeParam_NotString', false, 124990, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3602
     * @tc.name testWeb_SetSchemeHandler_Fail_schemeParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerScheme'
      });
      router.clear();
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_schemeParam_IsNone', 124643);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_schemeParam_IsNone', false, 124500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3603
     * @tc.name testWeb_SetSchemeHandler_Fail_webTagParam_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerWebTagNull'
      });
      router.clear();
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotString', 124644);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotString', false, 148610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3604
     * @tc.name testWeb_SetSchemeHandler_Fail_webTagParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerWebTag'
      });
      router.clear();
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_IsNone', 124645);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_IsNone', false, 148620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3605
     * @tc.name testWeb_SetSchemeHandler_Fail_webTagParam_NotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerSchemeHandlerNull'
      });
      router.clear();
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotExist', 124646);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotExist', false, 148630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });


    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3502
     * @tc.name testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ServiceWorkerSetSchemeHandlerScheme'
      });
      router.clear();
      Utils.emitEvent('testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone', 124647);
      Utils.registerBaseEvent('testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone', false, 148640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("Click", driver)
    });
  });
}