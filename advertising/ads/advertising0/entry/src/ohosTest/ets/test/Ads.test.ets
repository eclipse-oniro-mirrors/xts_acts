/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import advertising from '@ohos.advertising';

const TAG: string = 'AdTestTag';
const Domain: number = 0x0000;
const context = getContext(this) as common.Context;
const adRequest: advertising.AdRequestParams = {
  adId: 'testx9dtjwj8hp',
  adType: 7,
  adCount: 2,
  adWidth: 100,
  adHeight: 100,
};

const multiAdRequest: advertising.AdRequestParams[] = [{
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
  adContentClassification: 'W',
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
  uniqueId: "5bb42294-e601-44-9185-b6fd0f6f49b8"
};

export default function adsTestPart1() {
  describe('ActsAdsTest', () => {

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_AD_0100
     * @tc.name: testLoadAdByCallback
     * @tc.desc: Load ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testLoadAdByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let adLoaderListener: advertising.AdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'Callback load ad error, error code is %{public}d, error message is %{public}s.',
              errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Array<advertising.Advertisement>) => {
          hilog.info(Domain, TAG, 'request ad success');
          expect(ads[0] != null).assertEqual(true);
          done();
        }
      };
      let load = new advertising.AdLoader(context);
      load.loadAd(adRequest, adOption, adLoaderListener);
    })

    /**
     * @tc.number: SUB_CLOUD_AD_SHOW_AD_0200
     * @tc.name: testShowAd
     * @tc.desc: start show ability success.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testShowAd", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, (done: Function) => {
      try {
        hilog.info(Domain, TAG, 'enter testShowAd');
        advertising.showAd(advertisement, adDisplayOptions);
        done();
      } catch (e) {
        hilog.error(Domain, TAG, 'show ad error, error code is %{public}d, error message is %{public}s.', e.code,
            e.message);
        expect(e.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.number: SUB_CLOUD_ADS_LOAD_MULTI_AD_0300
     * @tc.name: testLoadMultiAdByCallback
     * @tc.desc: Load multi ad by callback is not null.
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testLoadMultiAdByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let adLoaderListener: advertising.MultiSlotsAdLoadListener = {
        onAdLoadFailure: (errorCode: number, errorMsg: string) => {
          hilog.error(Domain, TAG, 'Callback load ad error, error code is %{public}d, error message is %{public}s.',
              errorCode, errorMsg);
          expect(errorCode).assertLarger(0);
          expect(errorMsg).assertInstanceOf('String')
          done();
        },
        onAdLoadSuccess: (ads: Map<string, Array<advertising.Advertisement>>) => {
        hilog.info(Domain, TAG, 'request ad success');
        let returnAds: Array<advertising.Advertisement> = [];
        ads.forEach((adsArray) => returnAds.push(...adsArray));
        expect(returnAds[0] != null).assertEqual(true);
        done();
      }
    };
      let load = new advertising.AdLoader(context);
      load.loadAdWithMultiSlots(multiAdRequest, adOption, adLoaderListener);
    })
  })
}
