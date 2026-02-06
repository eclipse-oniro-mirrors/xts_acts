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

const adOption: advertising.AdOptions = {
  adContentClassification: 'A',
  nonPersonalizedAd: 1,
  tagForChildProtection: 1,
};
const adDisplayOptions: advertising.AdDisplayOptions = {
  customData: '12345',
  userId: '7',
  useMobileDataReminder: false,
  mute: true,
  audioFocusType: 1,
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
  uniqueId: "5bb42294-e601-4d84-9185-b6fd0f6f49b8"
};

export default function adsTest() {
  describe('ActsAdsTest', () => {

    /**
     * @tc.number: SUB_CLOUD_ADS_GET_BODY_0100
     * @tc.name: testGetAdRequestBody
     * @tc.desc: callback data is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it("testGetAdRequestBody", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        await advertising.getAdRequestBody(multiAdRequest, adOption).then((data: string) => {
          hilog.info(Domain, TAG, `testGetAdRequestBody result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
          done();
        }).catch(() => {
          hilog.info(Domain, TAG, `testGetAdRequestBody get some error`);
          done();
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBody failed, ERROR= ${error}`);
        expect(error != null).assertEqual(true);
        expect(error.code).assertEqual(21800001);
        done();
      }
    })

    const multiAdRequestError21800001: advertising.AdRequestParams[] = [{
      adId: 'testx9dtjwj8hp',
      adType: 7,
      adCount: 2,
      adWidth: 100,
      adHeight: 100,
      adSearchKeyword: 'key'
    }];

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0200
     * @tc.name: testMultiLoadAdByCallback_21800001
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testMultiLoadAdByCallback_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testMultiLoadAdByCallback_21800001 Callback load ad error, error code is %{public}d, error message is %{public}s.',
            errorCode, errorMsg);
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
        load.loadAdWithMultiSlots(multiAdRequestError21800001, adOption, adLoaderListener);
      } catch (e) {
        hilog.error(Domain, TAG, `testMultiLoadAdByCallback_21800001 failed, ERROR= ${e}`);
        expect(e != null).assertEqual(true);
        expect(e.code).assertEqual(21800001);
        done();
      }
    })

    const adRequestError: advertising.AdRequestParams = {
      adId: 'testx9dtjwj8hp',
      adType: 7,
      adCount: 2,
      adWidth: 100,
      adHeight: 100,
      adSearchKeyword: 'key'
    };

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0300
     * @tc.name: testLoadAdByCallback_21800001
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
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
        load.loadAd(adRequestError, adOption, adLoaderListener);
      } catch (e) {
        expect(e.code).assertEqual(21800001);
        done();
      }
    })


    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0400
     * @tc.name: testLoadAdByCallback
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testLoadAdByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let adLoaderListener: advertising.AdLoadListener = {
          onAdLoadFailure: (errorCode: number, errorMsg: string) => {
            hilog.error(Domain, TAG, 'testLoadAdByCallback Callback load ad error, error code is %{public}d, error message is %{public}s.',
              errorCode, errorMsg);
            expect(errorCode).assertLarger(0);
            expect(errorMsg).assertInstanceOf('String')
            done();
          },
          onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
            hilog.info(Domain, TAG, 'testLoadAdByCallback request ad success');
            expect(ads[0] != null).assertEqual(true);
            done();
          }
        };
        let load = new advertising.AdLoader(context);
        load.loadAd(adRequest, adOption, adLoaderListener);
      } catch (e) {
        if (e.code == 801) {
          done();
        }
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_AD_SHOW_AD_0500
     * @tc.name: testShowAd
     * @tc.desc: start show ability success.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testShowAd", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.showAd(advertisement, adDisplayOptions, uiContext);
        done();
      } catch (e) {
        if (e.code == 801) {
          done();
        }
        hilog.error(Domain, TAG, 'show ad error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_MULTI_AD_0600
     * @tc.name: testLoadMultiAdByCallback
     * @tc.desc: Load multi ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testLoadMultiAdByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
          onAdLoadFailure: (errorCode: number, errorMsg: string) => {
            hilog.error(Domain, TAG, 'testLoadMultiAdByCallback Callback load ad error, error code is %{public}d, error message is %{public}s.',
              errorCode, errorMsg);
            expect(errorCode).assertLarger(0);
            expect(errorMsg).assertInstanceOf('String')
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
        load.loadAdWithMultiSlots(multiAdRequest, adOption, adLoaderListener);
      } catch (e) {
        if (e.code == 801) {
          done();
        }
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_INTERACTION_LISTENER_0700
     * @tc.name: testAdInteractionListener
     * @tc.desc: callback data is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testAdInteractionListener", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
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
        done();
      } catch (e) {
        expect(e.code).assertLarger(0);
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0800
     * @tc.name: testLoadAd_401
     * @tc.desc: Load ad by err code 401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testLoadAd_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAd_401 Callback load ad error, error code is %{public}d, error message is %{public}s.', errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          hilog.info(Domain, TAG, 'testLoadAd_401 request ad success');
          expect(ads[0] != null).assertEqual(false);
          done();
        }
      };
      let load = new advertising.AdLoader(context);
      try {
        load.loadAd(null, adOption, adLoaderListener);
        done();
      } catch (e) {
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0900
     * @tc.name: testLoadAdMulti_401
     * @tc.desc: Load multi ad by err code 401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testLoadAdMulti_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAdMulti_401 Callback load ad error, error code is %{public}d, error message is %{public}s.', errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
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
        done();
      } catch (e) {
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_AD_SHOW_AD_1000
     * @tc.name: testShowAd_401
     * @tc.desc: testShowAd_401.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testShowAd_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.showAd(null, adDisplayOptions, uiContext);
        done()
      } catch (e) {
        hilog.error(Domain, TAG, 'show ad error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_1100
     * @tc.name: testLoadAdByCallback_01
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testLoadAdByCallback01", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAdByCallback01 Callback load ad error, error code is %{public}d, error message is %{public}s.', errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
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
     * @tc.number: SUB_CLOUD_ADS_LOAD_MULTI_AD_1200
     * @tc.name: testLoadMultiAdByCallback01
     * @tc.desc: Load multi ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testLoadMultiAdByCallback01", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'testLoadAdByCallback01 Callback load ad error, error code is %{public}d, error message is %{public}s.', errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
          hilog.info(Domain, TAG, 'testLoadAdByCallback01 request ad success');
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
    };

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_1300
     * @tc.name: testLoadAdByCallback_21800003
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
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
        load.loadAd(adRequest21800003, adOption, adLoaderListener);
        done();
      } catch (e) {
        expect(e.code).assertEqual(21800003);
        done();
      }
    })

    const advertisement_21800001: advertising.Advertisement = {
      adType: 7,
      clicked: false,
      rewardVerifyConfig: new Map([
        ["key1", "value1"],
        ["key2", "value2"]
      ]),
      rewarded: true,
      shown: true,
      uniqueId: "5bb42294-e601-4d84-9185-b6fd0f6f49b8"
    };

    /**
     * @tc.number: SUB_CLOUD_AD_SHOW_AD_1400
     * @tc.name: testShowAd_21800001
     * @tc.desc: testShowAd_21800001.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testShowAd_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.showAd(advertisement_21800001, adDisplayOptions, uiContext);
        done()
      } catch (e) {
        hilog.error(Domain, TAG, 'show ad error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertEqual(21800001);
        done();
      }
    })

    const advertisement_21800004: advertising.Advertisement = {
      adType: 7,
      clicked: false,
      rewardVerifyConfig: new Map([
        ["key1", "value1"],
        ["key2", "value2"]
      ]),
      rewarded: false,
      shown: false,
      uniqueId: ""
    };

    /**
     * @tc.number: SUB_CLOUD_AD_SHOW_AD_1500
     * @tc.name: testShowAd_21800004
     * @tc.desc: testShowAd_21800004.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testShowAd_21800004", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.showAd(advertisement_21800004, adDisplayOptions, uiContext);
        done()
      } catch (e) {
        hilog.error(Domain, TAG, 'show ad error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertEqual(21800004);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_AD_SHOW_AD_1600
     * @tc.name: testShowAd_two_params
     * @tc.desc: start show ability success.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testShowAd_two_params", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.showAd(advertisement, adDisplayOptions);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'show ad error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_AD_DELETE_WEB_INTERFACE_1700
     * @tc.name: testDeleteWebAdInterface
     * @tc.desc: testDeleteWebAdInterface.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testDeleteWebAdInterface_401", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.deleteWebAdInterface(null, true);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_AD_DELETE_WEB_INTERFACE_1800
     * @tc.name: testDeleteWebAdInterface_21800001
     * @tc.desc: testDeleteWebAdInterface_21800001.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testDeleteWebAdInterface_21800001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        let webController: webview.WebviewController = new MyController();
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.deleteWebAdInterface(webController, true);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code == 21800001).assertTrue();
        done();
      }
    })


    /**
     * @tc.number: SUB_CLOUD_AD_REGISTER_WEB_INTERFACE_1900
     * @tc.name: tesRegisterWebAdInterface_three_param
     * @tc.desc: tesRegisterWebAdInterface_three_param.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("tesRegisterWebAdInterface_three_param", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
      try {
        let webController: webview.WebviewController = new webview.WebviewController();
        advertising.registerWebAdInterface(webController, uiContext, true);
        done();
      } catch (e) {
        expect(e.code).assertLarger(0);
        done()
      }
    })

    /**
     * @tc.number: SUB_CLOUD_AD_DELETE_WEB_INTERFACE_2000
     * @tc.name: testDeleteWebAdInterface
     * @tc.desc: testDeleteWebAdInterface.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("testDeleteWebAdInterface", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        let webController: webview.WebviewController = new webview.WebviewController();
        advertising.deleteWebAdInterface(webController, true);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'deleteWebAdInterface error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })
  })
}
