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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = '';

export default function webviewNApi() {

  describe('OH_ArkWebRequestHeader', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('Index' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          await Utils.sleep(1000);
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
      await Utils.sleep(500);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      console.info('web afterEach start:' + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            'ACTION': ''
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('start send emitKey');
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info('emit emitKey  err: ' + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
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
      await Utils.sleep(3000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_IsNone', 10);
      await Utils.sleep(3000);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_IsNone', 17100101, 5101, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(3000);
      sendEventByKey('SetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_NotString', 17100101, 5102, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_NotExist', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_NotExist', 17100101, 5103, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_Error', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_Error', 0, 5104, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_IsNone', 17100101, 5105, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_NotString', 17100101, 5106, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_NotExist', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_NotExist', false, 5107, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_Error', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_Error', "https:" + "//www.baidu.com/", 5108, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetUrl', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetStatus_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetStatus_IsNone', 0, 5110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetStatus', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatus_NotNum', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetStatus_NotNum', 17100101, 5111, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetStatus', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatus_Error', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetStatus_Error', 0, 5112, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetStatus', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatusText_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetStatusText_IsNone', 17100101, 5113, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetStatusText', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatusText_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetStatusText_NotString', 17100101, 5114, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetStatusText', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_GetStatusText_NetErr', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_GetStatusText_NetErr', false, 5115, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetStatusText', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetCharset_Param_None', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResponse_SetCharset_Param_None', 17100101, 5116, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetCharset', 10, '');
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
      await Utils.sleep(800);
      Utils.emitEvent('testWebSchemeHandler_SetUserData_ParamIsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebSchemeHandler_SetUserData_ParamIsNone', 17100101, 5117, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('SetUserData', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_KeyParam_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_KeyParam_NotString', true, 5122, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetHeader', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_KeyParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_KeyParam_IsNone', false, 5123, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetHeader', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_ValueParam_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_ValueParam_NotString', true, 5124, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetHeader', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebRequestHeaderList_GetHeader_ValueParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebRequestHeaderList_GetHeader_ValueParam_IsNone', false, 5125, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetHeader', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResourceRequest_GetMethod_get', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResourceRequest_GetMethod_get', "GET", 5126, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('GetMethod', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNone', true, 5200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResourceRequest_GetUrl_Fail_URL_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResourceRequest_GetUrl_Fail_URL_NotString', true, 5201, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNotExist', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResourceRequest_GetUrl_Fail_URL_IsNotExist', true, 5202, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_ReleaseString_Fail_Param_NotNDK', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_ReleaseString_Fail_Param_NotNDK', true, 5209, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_ReleaseString_Fail_Param_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_ReleaseString_Fail_Param_IsNone', true, 5210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_ReleaseString_Fail_Param_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_ReleaseString_Fail_Param_NotString', false, 5211, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_ReleaseByteArray_Fail_Param_NotNDK', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_ReleaseByteArray_Fail_Param_NotNDK', true, 5212, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_ReleaseByteArray_Fail_Param_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_ReleaseByteArray_Fail_Param_IsNone', true, 5213, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_ReleaseByteArray_Fail_Param_NotArray', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_ReleaseByteArray_Fail_Param_NotArray', false, 5214, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResourceRequest_GetReferrer_Param_Error', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResourceRequest_GetReferrer_Param_Error', false, 5216, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_schemeParam_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_schemeParam_NotString', false, 5217, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_schemeParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_schemeParam_IsNone', false, 5218, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotString', false, 5219, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_IsNone', false, 5220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotExist', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotExist', false, 5221, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
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
      await Utils.sleep(1000);
      Utils.emitEvent('testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone', false, 5223, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });
  });
}