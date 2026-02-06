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


import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import advertising from '@ohos.advertising';
import webview from '@ohos.web.webview';
import MyController from './MyController';

const TAG: string = 'AdTestTag';
const Domain: number = 0x0000;
const uiContext: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
const context = getContext(this) as common.Context;

const adOption: advertising.AdOptions = {
  adContentClassification: 'W',
  nonPersonalizedAd: 1,
  tagForChildProtection: 1,
};

export default function adsTest1() {
  describe('ActsAdsTest1', () => {

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0100
     * @tc.name: tesRegisterWebAdInterface_401
     * @tc.desc: tesRegisterWebAdInterface_401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("tesRegisterWebAdInterface_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        advertising.registerWebAdInterface(null, uiContext);
        done();
      } catch (e) {
        expect(e.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0200
     * @tc.name: testRegisterWebAdInterface_21800001
     * @tc.desc: testRegisterWebAdInterface_21800001.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testRegisterWebAdInterface_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let webController: webview.WebviewController = new MyController();
        advertising.registerWebAdInterface(webController, uiContext);
        done();
      } catch (e) {
        expect(e.code).assertEqual(21800001);
        done()
      }
    })

    const adResponse_21800001 = "{\n" +
      "  \"clientAdRequestId\": \"763fa78c-0d9a-4908-bab4-25a1498012\",\n" +
      "  \"cost\": \"18,11,0,10,3,0,1,10,1\",\n" +
      "  \"ctrlSwitchs\": \"0\",\n" +
      "  \"multiad\": [\n" +
      "    {\n" +
      "      \"adtype\": 12,\n" +
      "      \"configMap\": {\n" +
      "        \"insreCacheAdEnable\": \"0\"\n" +
      "      },\n" +
      "      \"content\": [],\n" +
      "      \"retcode30\": 200,\n" +
      "      \"slotid\": \"testb4znbuh3n2\"\n" +
      "    }\n" +
      "  ],\n" +
      "  \"retcode\": 200,\n" +
      "  \"sig\": \"\",\n" +
      "  \"totalCacheSize\": 300,\n" +
      "  \"testType\": \"21800001\"\n" +
      "}";



    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0300
     * @tc.name: testParseAdResponse_21800001
     * @tc.desc: testParseAdResponse_21800001.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testParseAdResponse_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testParseAdResponse_21800001 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testParseAdResponse_21800001 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(true);
          done();
        }
      };
      try {
        advertising.parseAdResponse(adResponse_21800001, adLoaderListener, uiContext);
      } catch (e) {
        hilog.error(Domain, TAG, `testParseAdResponse failed, ERROR= ${e}`);
        expect(e != null).assertTrue();
        expect(e.code).assertEqual(21800001);
        done();
      }
    })

    const adResponse = "{\n" +
      "  \"clientAdRequestId\": \"763fa78c-0d9a-4908-bab4-25a1498012\",\n" +
      "  \"cost\": \"18,11,0,10,3,0,1,10,1\",\n" +
      "  \"ctrlSwitchs\": \"0\",\n" +
      "  \"multiad\": [\n" +
      "    {\n" +
      "      \"adtype\": 12,\n" +
      "      \"configMap\": {\n" +
      "        \"insreCacheAdEnable\": \"0\"\n" +
      "      },\n" +
      "      \"content\": [],\n" +
      "      \"retcode30\": 200,\n" +
      "      \"slotid\": \"testb4znbuh3n2\"\n" +
      "    }\n" +
      "  ],\n" +
      "  \"retcode\": 200,\n" +
      "  \"sig\": \"\",\n" +
      "  \"totalCacheSize\": 300,\n" +
      "  \"testType\": \"21800001\"\n" +
      "}";

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0400
     * @tc.name: testParseAdResponse
     * @tc.desc: callback data is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testParseAdResponse", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testParseAdResponse Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testParseAdResponse request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(true);
          done();
        }
      };
      try {
        advertising.parseAdResponse(adResponse, adLoaderListener, uiContext);
      } catch (e) {
        hilog.error(Domain, TAG, `testParseAdResponse failed, ERROR= ${e}`);
        expect(e != null).assertEqual(true);
        if (e.code == 801) {
          done();
        }
        done();
      }
    })

    const adResponse_21800005 = "{\n" +
      "  \"clientAdRequestId\": \"763fa78c-0d9a-4908-bab4-25a1498012\",\n" +
      "  \"cost\": \"18,11,0,10,3,0,1,10,1\",\n" +
      "  \"ctrlSwitchs\": \"0\",\n" +
      "  \"multiad\": [\n" +
      "    {\n" +
      "      \"adtype\": 12,\n" +
      "      \"configMap\": {\n" +
      "        \"insreCacheAdEnable\": \"0\"\n" +
      "      },\n" +
      "      \"content\": [],\n" +
      "      \"retcode30\": 200,\n" +
      "      \"slotid\": \"testb4znbuh3n2\"\n" +
      "    }\n" +
      "  ],\n" +
      "  \"retcode\": 200,\n" +
      "  \"sig\": \"\",\n" +
      "  \"totalCacheSize\": 300,\n" +
      "  \"testType\": \"21800005\"\n" +
      "}";

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0500
     * @tc.name: testParseAdResponse_err
     * @tc.desc: testParseAdResponse_err.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testParseAdResponse_21800005", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testParseAdResponse_21800005 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertEqual(21800005);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testParseAdResponse_21800005 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(true);
          done();
        }
      };
      try {
        advertising.parseAdResponse(adResponse_21800005, adLoaderListener, uiContext);
      } catch (e) {
        hilog.error(Domain, TAG, `testParseAdResponse failed, ERROR= ${e}`);
        expect(e != null).assertEqual(true);
        expect(e.code).assertEqual(21800005);
        done();
      }
    })


    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0600
     * @tc.name: testParseAdResponse_401
     * @tc.desc: testParseAdResponse_401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testParseAdResponse_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testParseAdResponse_401 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testParseAdResponse_401 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(true);
          done();
        }
      };
      try {
        advertising.parseAdResponse(null, adLoaderListener, uiContext);
      } catch (e) {
        hilog.error(Domain, TAG, `testParseAdResponse failed, ERROR= ${e}`);
        expect(e != null).assertEqual(true);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0700
     * @tc.name: testGetAdRequestBody_801
     * @tc.desc: testGetAdRequestBody_401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testGetAdRequestBody_801", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(null, adOption).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBody_801 result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
          done();
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBody_801 failed, ERROR= ${error}`);
        if(error.code == 801) {
          done();
        }
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0800
     * @tc.name: testGetAdRequestBody_401
     * @tc.desc: testGetAdRequestBody_401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testGetAdRequestBody_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(null, adOption).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBody_401 result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
          done();
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBody_401 failed, ERROR= ${error}`);
        expect(error != null).assertEqual(true);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    const multiAdRequestError21800003: advertising.AdRequestParams[] = [{
      "adId": "12345",
      "adType": 7,
      "adCount": 2,
      "adWidth": 100,
      "adHeight": 100,
      "oaid": "00000000-0000-0000-0000-000000000000",
      "needSelfRendering": false,
      "isPreload": "",
      "tMax": 100,
      "cur": "CNY",
      "bidFloor": 12,
      "bidFloorCur": "CNY",
      "bpkgName": "com.test.a,com.test.a"
    }];


    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0900
     * @tc.name: testMultiLoadAdByCallback_21800003
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testMultiLoadAdByCallback_21800003", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testMultiLoadAdByCallback_21800003 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertEqual(21800003);
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testMultiLoadAdByCallback_21800003 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(false);
          done();
        }
      };
      try {
        let load = new advertising.AdLoader(context);
        load.loadAdWithMultiSlots(multiAdRequestError21800003, adOption, adLoaderListener);
        done()
      } catch (e) {
        expect(e.code).assertEqual(21800003);
        done()
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0100
     * @tc.name: tesRegisterWebAdInterface_three_param_401
     * @tc.desc: tesRegisterWebAdInterface_three_param_401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("tesRegisterWebAdInterface_three_param_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        advertising.registerWebAdInterface(null, uiContext, false);
        done();
      } catch (e) {
        expect(e.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0200
     * @tc.name: testRegisterWebAdInterface_three_param_21800001
     * @tc.desc: testRegisterWebAdInterface_three_param_21800001.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testRegisterWebAdInterface_three_param_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let webController: webview.WebviewController = new MyController();
        advertising.registerWebAdInterface(webController, uiContext, false);
        done();
      } catch (e) {
        expect(e.code).assertEqual(21800001);
        done()
      }
    })
  })
}
