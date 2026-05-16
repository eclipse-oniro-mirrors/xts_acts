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
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import router from '@ohos.router'
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import advertising from '@ohos.advertising';
import webview from '@ohos.web.webview';
import MyController from './MyController'
import Utils from './Utils';

const TAG: string = 'AdTestTag';
const Domain: number = 0x0000;
const context = getContext(this) as common.Context;
const uiContext = getContext(this) as common.UIAbilityContext;

const adRequest: advertising.AdRequestParams = {
  adId: 'testx9dtjwj8hp',
  adType: 7,
  adCount: 2,
  adWidth: 100,
  adHeight: 100,
  adSearchKeyword: 'key'
};

const multiAdRequest: advertising.AdRequestParams[] = [{
  adId: 'testx9dtjwj8hp',
  adType: 2,
  adCount: 2,
  adWidth: 100,
  adHeight: 100,
} as advertising.AdRequestParams,
  {
    adId: '123456',
    adType: 2,
    adCount: 2,
    adWidth: 100,
    adHeight: 100,
  } as advertising.AdRequestParams
];

const multiAdRequestSuccess: advertising.AdRequestParams[] = [{
  adId: 'testx9dtjwj8hp',
  adType: 7,
  adCount: 2,
  adWidth: 100,
  adHeight: 100,
} as advertising.AdRequestParams,
  {
    adId: '123456',
    adType: 7,
    adCount: 2,
    adWidth: 100,
    adHeight: 100,
  } as advertising.AdRequestParams
];

const adOption: advertising.AdOptions = {
  adContentClassification: 'A',
  nonPersonalizedAd: 1,
  tagForChildProtection: 1,
  isTest: false,
  unDefineValue: undefined
};
const adDisplayOptions: advertising.AdDisplayOptions = {
  customData: '12345',
  userId: '7',
  useMobileDataReminder: false,
  mute: true,
  audioFocusType: 1,
  unDefineValue: undefined,
  numberValue: 1,
  strValue: 'strVal',
  boolVal: false
};

const advertisement: advertising.Advertisement = {
  adType: 7,
  clicked: false,
  rewardVerifyConfig: new Map([
    ["key1", "value1"],
    ["key2", "value2"]
  ]),
  rewarded: false,
  shown: false,
  uniqueId: "5bb42294",
  obj: {
    test: 'test',
    value: false,
  }
};

export default function adsTest() {
  describe('ActsAdsTest', () => {

    /**
     * @tc.name testGetAdRequestBody_21800001
     * @tc.number SUB_CLOUD_ADS_GET_BODY_0100
     * @tc.desc testGetAdRequestBody_21800001.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testGetAdRequestBody_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(multiAdRequest, adOption).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBody_21800001 result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBody_21800001 failed, ERROR= ${error.code}`);
        expect(error != null).assertEqual(true);
        expect(error.code).assertEqual(21800001);
        done();
      }
    })

    const multiAdRequestError21800001: advertising.AdRequestParams[] = [{
      adId: 'multiAdRequestError21800001',
      adType: 7,
      adCount: 2,
      adWidth: 100,
      adHeight: 100,
      adSearchKeyword: 'key'
    }];

    /**
     * @tc.name testMultiLoadAdByCallback_21800001
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_0200
     * @tc.desc testGetAdRequestBody_21800001.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testMultiLoadAdByCallback_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(Domain, TAG, 'testMultiLoadAdByCallback_21800001 start');
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, `testMultiLoadAdByCallback_21800001 Callback load ad error, error code is ${errorCode}, error message is ${errorMsg}`);
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testMultiLoadAdByCallback_21800001 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          done();
        }
      };
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testMultiLoadAdByCallback_21800001 loadAdWithMultiSlots');
        load.loadAdWithMultiSlots(multiAdRequestError21800001, adOption, adLoaderListener);
      } catch (e) {
        hilog.error(Domain, TAG, `testMultiLoadAdByCallback_21800001 failed, ERROR= ${e.code}`);
        expect(e != null).assertEqual(true);
        expect(e.code).assertEqual(21800001);
        done();
      }
    })

    const adRequestError21800001: advertising.AdRequestParams = {
      adId: 'adRequestError21800001',
      adType: 7,
      adCount: 2,
      adWidth: 100,
      adHeight: 100,
      adSearchKeyword: 'key',
      isTest: false,
      unDefineValue: undefined,
      numberValue: 1,
    };

    /**
     * @tc.name testLoadAdByCallback_21800001
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_0300
     * @tc.desc testLoadAdByCallback_21800001.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdByCallback_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAdByCallback_21800001 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertEqual(21800001);
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          hilog.info(Domain, TAG, 'testLoadAdByCallback_21800001 request ad success');
          expect(ads[0] != null).assertEqual(true);
          done();
        }
      };
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testLoadAdByCallback_21800001 loadAd');
        load.loadAd(adRequestError21800001, adOption, adLoaderListener);
      } catch (e) {
        expect(e.code).assertEqual(21800001);
        done();
      }
    })


    /**
     * @tc.name testLoadAdByCallback
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_0400
     * @tc.desc testLoadAdByCallback.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let adLoaderListener: advertising.AdLoadListener = {
          onAdLoadFailure: (errorCode: number, errorMsg: string) => {
            hilog.error(Domain, TAG, 'testLoadAdByCallback Callback load ad error, error code is %{public}d, error message is %{public}s.',
              errorCode, errorMsg);
            expect(errorMsg).assertInstanceOf('String');
            done();
          },
          onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
            hilog.info(Domain, TAG, 'testLoadAdByCallback request ad success');
            expect(ads[0] != null).assertEqual(true);
            done();
          }
        };
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testLoadAdByCallback loadAd');
        load.loadAd(adRequest, adOption, adLoaderListener);
      } catch (e) {
        if (e.code == 801) {
          done();
        }
        done();
      }
    })

    /**
     * @tc.name testShowAd
     * @tc.number SUB_CLOUD_AD_SHOW_AD_0500
     * @tc.desc testShowAd.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAd", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAd enter testShowAd');
        advertising.showAd(advertisement, adDisplayOptions, uiContext);
        await Utils.sleep(2000);
        hilog.info(Domain, TAG, 'testShowAd enter done');
        done();
      } catch (e) {
        if (e.code == 801) {
          done();
        }
        hilog.error(Domain, TAG, 'testShowAd error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testLoadMultiAdByCallback
     * @tc.number SUB_CLOUD_ADS_LOAD_MULTI_AD_0600
     * @tc.desc testLoadMultiAdByCallback.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadMultiAdByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
          onAdLoadFailure: (errorCode: number, errorMsg: string) => {
            hilog.error(Domain, TAG, 'testLoadMultiAdByCallback Callback load ad error, error code is %{public}d, error message is %{public}s.',
              errorCode, errorMsg);
            expect(errorMsg).assertInstanceOf('String');
            done();
          },
          onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
            hilog.info(Domain, TAG, 'testLoadMultiAdByCallback request ad success');
            let returnAds: Array<advertising.Advertisement> = [];
            ads.forEach((adsArray) => returnAds.push(...adsArray));
            expect(returnAds[0] != null).assertEqual(true);
            done();
          }
        };
        let load = new advertising.AdLoader(context);
        load.loadAdWithMultiSlots(multiAdRequestSuccess, adOption, adLoaderListener);
      } catch (e) {
        if (e.code == 801) {
          done();
        }
        done();
      }
    })

    /**
     * @tc.name testAdInteractionListener
     * @tc.number SUB_CLOUD_ADS_INTERACTION_LISTENER_0700
     * @tc.desc testAdInteractionListener.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testAdInteractionListener", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["ACTS_AdComponent_OnListener"],
      }
      let adInteractionListener: advertising.AdInteractionListener = {
        onStatusChanged: (status: string, ad: advertising.Advertisement, data: string) => {
          hilog.debug(Domain, TAG, `get the status is ${status}, ad is : ${ad}, data is : ${data}`);
        }
      };

      commonEventManager.createSubscriber(subscribeInfo, (err, data) => {
        if (err) {
          hilog.error(Domain, TAG, `createSubscriber failed, code is ${err.code}`);
        } else {
          hilog.info(Domain, TAG, `CreateSubscriber success`);
          subscriber = data;
          //
          if (subscriber !== null) {
            commonEventManager.subscribe(subscriber, (err, data) => {
              if (err) {
                hilog.error(Domain, TAG, `subscribe failed, code is ${err.code}`);
                expect(err.code).assertInstanceOf('String');
                done();
              } else {
                hilog.info(Domain, TAG, `SubscribeCallBack data=${JSON.stringify(data)}`);
                done();
              }
            })
          } else {
            hilog.info(Domain, TAG, `Need create subscriber`);
          }
        }
      })

      router.pushUrl({
        url: 'MainAbility/pages/index/p1'
      });
      adInteractionListener.onStatusChanged('1', null, 'dataInfo');
      adInteractionListener.onStatusChanged('onAdLoad', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onAdFail', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onAdOpen', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onAdClick', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onAdClose', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaProgress', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaStart', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaPause', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaStop', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaComplete', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaCountDown', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onMediaError', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onLandscape', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onPortrait', advertisement, 'dataInfo');
      adInteractionListener.onStatusChanged('onBackClicked', advertisement, 'dataInfo');
      await Utils.sleep(3000);
      done();
    })

    /**
     * @tc.name testLoadAd_401
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_0800
     * @tc.desc testLoadAd_401.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAd_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, `testLoadAd_401 Callback load ad error, error code is ${errorCode}d, error message is ${errorMsg}s`);
          expect(errorMsg).assertInstanceOf('String');
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          hilog.info(Domain, TAG, `testLoadAd_401 request ad success`);
          expect(ads[0] != null).assertEqual(false);
          done();
        }
      };
      let load = new advertising.AdLoader(context);
      try {
        load.loadAd(null, adOption, adLoaderListener);
      } catch (e) {
        hilog.info(Domain, TAG, `testLoadAd_401 catch error, ${e.code}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name testLoadAdMulti_401
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_0900
     * @tc.desc testLoadAdMulti_401.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdMulti_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAdMulti_401 Callback load ad error, error code is ${public}d, error message is ${public}s.', errorCode, errorMsg);
          expect(errorMsg).assertInstanceOf('String');
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testLoadAdMulti_401 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(false);
          done();
        }
      };
      let load = new advertising.AdLoader(context);
      try {
        load.loadAdWithMultiSlots(null, adOption, adLoaderListener);
      } catch (e) {
        hilog.info(Domain, TAG, `testLoadAdMulti_401 error code is : ${e.code}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name testShowAd_401
     * @tc.number SUB_CLOUD_AD_SHOW_AD_1000
     * @tc.desc testShowAd_401.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAd_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAd_401 enter testShowAd');
        advertising.showAd(null, adDisplayOptions, uiContext);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, `testShowAd_401 show ad error, error code is ${e.code}, error message is ${e.message}.`);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name testLoadAdByCallback01
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_1100
     * @tc.desc testLoadAdByCallback01.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdByCallback01", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, `testLoadAdByCallback01 Callback load ad error, error code is ${errorCode}, error message is ${errorMsg}` );
          expect(errorMsg).assertInstanceOf('String');
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          hilog.info(Domain, TAG, 'testLoadAdByCallback01 request ad success');
          expect(ads[0] != null).assertEqual(false);
          done();
        }
      };
      adLoaderListener.onAdLoadFailure(423, 'errorMsg');
      let ads: Array<advertising.Advertisement> = new Array();
      adLoaderListener.onAdLoadSuccess(ads);
    })

    /**
     * @tc.name testLoadMultiAdByCallback01
     * @tc.number SUB_CLOUD_ADS_LOAD_MULTI_AD_1200
     * @tc.desc testLoadMultiAdByCallback01.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadMultiAdByCallback01", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadMultiAdByCallback01 Callback load ad error, error code is %{public}d, error message is %{public}s.', errorCode, errorMsg);
          expect(errorMsg).assertInstanceOf('String');
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testLoadMultiAdByCallback01 request ad success');
          let returnAds: Array<advertising.Advertisement> = [];
          ads.forEach((adsArray) => returnAds.push(...adsArray));
          expect(returnAds[0] != null).assertEqual(false);
          done();
        }
      };
      adLoaderListener.onAdLoadFailure(423, 'errorMsg');
      let ads: Map<string, Array<advertising.Advertisement>> = new Map();
      adLoaderListener.onAdLoadSuccess(ads);
    })


    const adRequest21800003: advertising.AdRequestParams = {
      "adId": "adRequest21800003",
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
    };

    /**
     * @tc.name testLoadAdByCallback_21800003
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_1300
     * @tc.desc testLoadAdByCallback_21800003.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdByCallback_21800003", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAdByCallback_21800003 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
          expect(errorCode).assertEqual(21800003);
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          hilog.info(Domain, TAG, 'testLoadAdByCallback_21800003 request ad success');
          expect(ads[0] != null).assertEqual(true);
          done();
        }
      };
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testLoadAdByCallback_21800003 loadAd');
        load.loadAd(adRequest21800003, adOption, adLoaderListener);
      } catch (e) {
        expect(e.code).assertEqual(21800003);
        done();
      }
    })

    const advertisement_21800001: advertising.Advertisement = {
      adType: 21800001,
      clicked: false,
      rewardVerifyConfig: new Map([
        ["key1", "value1"],
        ["key2", "value2"]
      ]),
      rewarded: true,
      shown: true,
      uniqueId: "5bb42294"
    };

    /**
     * @tc.name testShowAd_21800001
     * @tc.number SUB_CLOUD_AD_SHOW_AD_1400
     * @tc.desc testShowAd_21800001.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAd_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAd_21800001 enter testShowAd');
        advertising.showAd(advertisement_21800001, adDisplayOptions, uiContext);
        await Utils.sleep(2100);
        hilog.info(Domain, TAG, 'testShowAd_21800001 enter done');
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testShowAd_21800001 show ad error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertEqual(21800001);
        done();
      }
    })

    /**
     * @tc.name testShowAd_two_params
     * @tc.number SUB_CLOUD_AD_SHOW_AD_1500
     * @tc.desc testShowAd_two_params
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAd_two_params", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAd_two_params enter testShowAd');
        advertising.showAd(advertisement, adDisplayOptions);
        await Utils.sleep(2300);
        hilog.info(Domain, TAG, 'testShowAd_two_params enter done');
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testShowAd_two_params show ad error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testDeleteWebAdInterface_401
     * @tc.number SUB_CLOUD_AD_DELETE_WEB_INTERFACE_1600
     * @tc.desc testDeleteWebAdInterface_401.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testDeleteWebAdInterface_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testDeleteWebAdInterface_401 enter testDeleteWebAdInterface_401');
        advertising.deleteWebAdInterface(null, true);
      } catch (e) {
        hilog.error(Domain, TAG, 'testDeleteWebAdInterface_401 deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name testDeleteWebAdInterface_21800001
     * @tc.number SUB_CLOUD_AD_DELETE_WEB_INTERFACE_1700
     * @tc.desc testDeleteWebAdInterface_21800001.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testDeleteWebAdInterface_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        let webController: webview.WebviewController = new MyController();
        hilog.info(Domain, TAG, 'testDeleteWebAdInterface_21800001 enter');
        advertising.deleteWebAdInterface(webController, true);
      } catch (e) {
        hilog.error(Domain, TAG, 'testDeleteWebAdInterface_21800001 deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code == 21800001).assertTrue();
        done();
      }
    })


    /**
     * @tc.name tesRegisterWebAdInterface_three_param
     * @tc.number SUB_CLOUD_AD_REGISTER_WEB_INTERFACE_1800
     * @tc.desc tesRegisterWebAdInterface_three_param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("tesRegisterWebAdInterface_three_param", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let webController: webview.WebviewController = new webview.WebviewController();
        advertising.registerWebAdInterface(webController, uiContext, true);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'tesRegisterWebAdInterface_three_param deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testDeleteWebAdInterface
     * @tc.number SUB_CLOUD_AD_DELETE_WEB_INTERFACE_1900
     * @tc.desc testDeleteWebAdInterface.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testDeleteWebAdInterface", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testDeleteWebAdInterface');
        let webController: webview.WebviewController = new webview.WebviewController();
        advertising.deleteWebAdInterface(webController, true);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testDeleteWebAdInterface deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testAdLoaderListenerErrorParam
     * @tc.number SUB_CLOUD_AD_DELETE_WEB_INTERFACE_2000
     * @tc.desc testAdLoaderListenerErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testAdLoaderListenerErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        let adLoaderListener: advertising.AdLoadListener = {
          onAdLoadFailure: (errorCode: number, errorMsg: string) => {
            done();
          },
          onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
            done();
          }
        };

        const advertisements: advertising.Advertisement[] = [{
          adType: 7,
          clicked: false,
          rewardVerifyConfig: new Map([
            ["key1", "value1"],
            ["key2", "value2"]
          ]),
          rewarded: false,
          shown: false,
          uniqueId: "5bb42294"
        } as advertising.Advertisement];
        adLoaderListener.onAdLoadSuccess(advertisements);
        adLoaderListener.onAdLoadFailure(undefined, undefined);
        adLoaderListener.onAdLoadFailure(null, null);
        adLoaderListener.onAdLoadFailure(null, '');
        adLoaderListener.onAdLoadSuccess(undefined);
        adLoaderListener.onAdLoadSuccess(null);
      } catch (e) {
        hilog.error(Domain, TAG, 'testAdLoaderListenerErrorParam error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    /**
     * @tc.name testMultiAdLoaderListenerErrorParam
     * @tc.number SUB_CLOUD_AD_DELETE_WEB_INTERFACE_2100
     * @tc.desc testMultiAdLoaderListenerErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testMultiAdLoaderListenerErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
          onAdLoadFailure: (errorCode: number, errorMsg: string) => {
            hilog.error(Domain, TAG, `testMultiAdLoaderListenerErrorParam Callback load ad error, error code is ${errorCode}, error message is ${errorMsg}`);
            done();
          },
          onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
            hilog.info(Domain, TAG, 'testMultiAdLoaderListenerErrorParam request ad success');
            done();
          }
        };

        const advertisements: advertising.Advertisement[] = [{
          adType: 7,
          clicked: false,
          rewardVerifyConfig: new Map([
            ["key1", "value1"],
            ["key2", "value2"]
          ]),
          rewarded: false,
          shown: false,
          uniqueId: "5bb42294"
        } as advertising.Advertisement];
        let ads: Map<string, Array<advertising.Advertisement>> = new Map();
        ads.set('key', advertisements);
        adLoaderListener.onAdLoadFailure(undefined, undefined);
        adLoaderListener.onAdLoadFailure(null, null);
        adLoaderListener.onAdLoadFailure(null, '');
        adLoaderListener.onAdLoadSuccess(ads);
        adLoaderListener.onAdLoadSuccess(undefined);
        adLoaderListener.onAdLoadSuccess(null);

      } catch (e) {
        hilog.error(Domain, TAG, 'testMultiAdLoaderListenerErrorParam error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    /**
     * @tc.name testShowAdChangeParam
     * @tc.number SUB_CLOUD_AD_SHOW_AD_2200
     * @tc.desc testShowAdChangeParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAdChangeParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAdChangeParam enter testShowAd');
        const adDisplayOptionsReminderTrue: advertising.AdDisplayOptions = {
          customData: '12345',
          userId: '7',
          useMobileDataReminder: true,
          mute: false,
          audioFocusType: 1,
          unDefineValue: undefined,
          isTest: true,
          emptyValue: '',
          isNotTest: false,
          numVal: 1
        };
        const advertisementChange: advertising.Advertisement = {
          adType: 7,
          clicked: false,
          rewardVerifyConfig: new Map([
            ["key1", "value1"],
            ["key2", "value2"]
          ]),
          rewarded: false,
          shown: false,
          uniqueId: "5bb42294"
        };
        advertising.showAd(advertisementChange, adDisplayOptionsReminderTrue, uiContext);
        await Utils.sleep(2000);
        hilog.info(Domain, TAG, 'testShowAdChangeParam enter done');
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testShowAdChangeParam error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testShowAdErrorParam
     * @tc.number SUB_CLOUD_AD_SHOW_AD_2300
     * @tc.desc testShowAdErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAdErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAdErrorParam enter testShowAd');
        advertising.showAd(undefined, undefined, undefined);
        await Utils.sleep(2000);
        hilog.info(Domain, TAG, 'testShowAdErrorParam enter done');
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testShowAdErrorParam error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testShowAdNullParam
     * @tc.number SUB_CLOUD_AD_SHOW_AD_2400
     * @tc.desc testShowAdNullParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testShowAdNullParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'testShowAdNullParam enter testShowAd');
        advertising.showAd(null, null, null);
        await Utils.sleep(2000);
        hilog.info(Domain, TAG, 'testShowAdNullParam enter done');
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testShowAdNullParam error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    const adOptionChaneParam: advertising.AdOptions = {
      adContentClassification: 'A',
      nonPersonalizedAd: 1,
      tagForChildProtection: 1,
      isTest: false,
      unDefineValue: undefined,
      strValue: 'strVal',
      numberVal: 1,
      isNotTest: true,
      emptyValue: '',
    };

    const adRequestChangeParam: advertising.AdRequestParams = {
      adId: 'adRequest',
      adType: 7,
      adCount: 2,
      adWidth: 100,
      adHeight: 100,
      adSearchKeyword: 'key',
      isTest: false,
      unDefineValue: undefined,
      emptyValue: '',
      isNotTest: true,
      numVal: 1
    };

    /**
     * @tc.name testLoadAdChangeParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_2500
     * @tc.desc testLoadAdChangeParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdChangeParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          done();
        }
      };
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testLoadAdChangeParam loadAd');
        load.loadAd(adRequestChangeParam, adOptionChaneParam, adLoaderListener);
      } catch (e) {
        hilog.error(Domain, TAG, 'testLoadAdChangeParam error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testLoadAdErrorParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_2600
     * @tc.desc testLoadAdErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testLoadAdErrorParam loadAd');
        load.loadAd(undefined, undefined, undefined);
      } catch (e) {
        hilog.error(Domain, TAG, 'testLoadAdErrorParam error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testLoadAdNullParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_2700
     * @tc.desc testLoadAdNullParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testLoadAdNullParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testLoadAdNullParam loadAd');
        load.loadAd(null, null, null);
      } catch (e) {
        hilog.error(Domain, TAG, 'testLoadAdNullParam error, error code is ${public}d, error message is ${public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    /**
     * @tc.name testMultiLoadAdChangeParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_2800
     * @tc.desc testMultiLoadAdChangeParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testMultiLoadAdChangeParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(Domain, TAG, 'testMultiLoadAdChangeParam start');
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, `testMultiLoadAdChangeParam Callback load ad error, error code is ${errorCode}, error message is ${errorMsg}`);
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testMultiLoadAdChangeParam request ad success');
          done();
        }
      };
      try {
        const multiAdRequestChangeParam: advertising.AdRequestParams[] = [{
          adId: 'multiAdRequestError21800001',
          adType: 7,
          adCount: 2,
          adWidth: 100,
          adHeight: 100,
          adSearchKeyword: 'key',
          isNotTest: true,
          isTest: false,
          emptyValue: '',
          numVal: 1
        }];
        const adOptionChange: advertising.AdOptions = {
          adContentClassification: 'A',
          nonPersonalizedAd: 1,
          tagForChildProtection: 1,
          isTest: false,
          unDefineValue: undefined,
          numVal: 1,
          istNotTest: true,
          strVal: 'str',
          emptyKey: ''
        };
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testMultiLoadAdChangeParam loadAdWithMultiSlots');
        load.loadAdWithMultiSlots(multiAdRequestChangeParam, adOptionChange, adLoaderListener);
      } catch (e) {
        hilog.error(Domain, TAG, `testMultiLoadAdChangeParam failed, ERROR= ${e.code}`);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    /**
     * @tc.name testMultiLoadErrorParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_2900
     * @tc.desc testMultiLoadErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testMultiLoadErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(Domain, TAG, 'testMultiLoadErrorParam start');
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testMultiLoadErrorParam loadAdWithMultiSlots');
        load.loadAdWithMultiSlots(undefined, undefined, undefined);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, `testMultiLoadErrorParam failed, ERROR= ${e.code}`);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testMultiLoadNullParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_3000
     * @tc.desc testMultiLoadNullParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testMultiLoadNullParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(Domain, TAG, 'testMultiLoadNullParam start');
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testMultiLoadNullParam loadAdWithMultiSlots');
        load.loadAdWithMultiSlots(null, null, null);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, `testMultiLoadNullParam failed, ERROR= ${e.code}`);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    /**
     * @tc.name testMultiLoadAdEmptyParam
     * @tc.number SUB_CLOUD_ADS_LOAD_AD_3100
     * @tc.desc testMultiLoadAdEmptyParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testMultiLoadAdEmptyParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(Domain, TAG, 'testMultiLoadAdChangeParam start');
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, `testMultiLoadAdChangeParam Callback load ad error, error code is ${errorCode}, error message is ${errorMsg}`);
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testMultiLoadAdChangeParam request ad success');
          done();
        }
      };
      const emptyArray: advertising.AdRequestParams[] = [];
      try {
        let load = new advertising.AdLoader(context);
        hilog.info(Domain, TAG, 'testMultiLoadAdChangeParam loadAdWithMultiSlots');
        load.loadAdWithMultiSlots(emptyArray, adOption, adLoaderListener);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, `testMultiLoadAdChangeParam failed, ERROR= ${e.code}`);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    const adOptionChangeParam: advertising.AdOptions = {
      adContentClassification: 'A',
      nonPersonalizedAd: 1,
      tagForChildProtection: 1,
      isTest: false,
      isNotTest: true,
      unDefineValue: undefined,
      emptyValue: '',
      numVal: 1
    };

    /**
     * @tc.name testGetAdRequestBodyChangeParam
     * @tc.number SUB_CLOUD_ADS_GET_BODY_3200
     * @tc.desc testGetAdRequestBodyChangeParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testGetAdRequestBodyChangeParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(multiAdRequest, adOptionChangeParam).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBodyChangeParam result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBodyChangeParam failed, ERROR= ${error.code}`);
        expect(error.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testGetAdRequestBodyErrorParam
     * @tc.number SUB_CLOUD_ADS_GET_BODY_3300
     * @tc.desc testGetAdRequestBodyErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testGetAdRequestBodyErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(undefined, undefined).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBodyErrorParam result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBodyErrorParam failed, ERROR= ${error.code}`);
        expect(error.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testGetAdRequestBodyNullParam
     * @tc.number SUB_CLOUD_ADS_GET_BODY_3400
     * @tc.desc testGetAdRequestBodyNullParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testGetAdRequestBodyNullParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(null, null).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBodyNullParam result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBodyNullParam failed, ERROR= ${error.code}`);
        expect(error.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name testGetAdRequestBodyEmptyParam
     * @tc.number SUB_CLOUD_ADS_GET_BODY_3500
     * @tc.desc testGetAdRequestBodyEmptyParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testGetAdRequestBodyEmptyParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        const emptyRequest: advertising.AdRequestParams[] = [];
        await advertising.getAdRequestBody(emptyRequest, adOptionChangeParam).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBodyEmptyParam result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBodyEmptyParam failed, ERROR= ${error.code}`);
        expect(error.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name tesRegisterWebAdInterfaceErrorParam
     * @tc.number SUB_CLOUD_AD_REGISTER_WEB_INTERFACE_3600
     * @tc.desc tesRegisterWebAdInterfaceErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("tesRegisterWebAdInterfaceErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        advertising.registerWebAdInterface(undefined, undefined);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'tesRegisterWebAdInterfaceErrorParam error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name tesRegisterWebAdInterfaceNullParam
     * @tc.number SUB_CLOUD_AD_REGISTER_WEB_INTERFACE_3700
     * @tc.desc tesRegisterWebAdInterfaceNullParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("tesRegisterWebAdInterfaceNullParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        advertising.registerWebAdInterface(null, null);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'tesRegisterWebAdInterfaceNullParam error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })



    /**
     * @tc.name tesRegisterWebAdInterfaceErrorThreeParam
     * @tc.number SUB_CLOUD_AD_REGISTER_WEB_INTERFACE_3800
     * @tc.desc tesRegisterWebAdInterfaceErrorThreeParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("tesRegisterWebAdInterfaceErrorThreeParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        advertising.registerWebAdInterface(undefined, undefined, false);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'tesRegisterWebAdInterfaceErrorThreeParam error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name tesRegisterWebAdInterfaceNullThreeParam
     * @tc.number SUB_CLOUD_AD_REGISTER_WEB_INTERFACE_3900
     * @tc.desc tesRegisterWebAdInterfaceNullThreeParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("tesRegisterWebAdInterfaceNullThreeParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        advertising.registerWebAdInterface(null, null, false);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'tesRegisterWebAdInterfaceNullThreeParam error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })


    /**
     * @tc.name testDeleteWebAdInterfaceErrorParam
     * @tc.number SUB_CLOUD_AD_DELETE_WEB_INTERFACE_4000
     * @tc.desc testDeleteWebAdInterfaceErrorParam.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testDeleteWebAdInterfaceErrorParam", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testDeleteWebAdInterfaceErrorParam');
        advertising.deleteWebAdInterface(undefined, false);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'testDeleteWebAdInterfaceErrorParam deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })
  })
}
