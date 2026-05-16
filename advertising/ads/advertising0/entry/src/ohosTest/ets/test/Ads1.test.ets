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
import router from '@ohos.router';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import advertising from '@ohos.advertising';

const TAG: string = 'AdTestTag';
const Domain: number = 0x0000;
const context = getContext(this) as common.Context;
const uiContext: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

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
const adResponse =
    "{\n" +
    "  \"clientAdRequestId\":\"763fa78c-0d9a-4908-bab4-25a1498012\",\n" +
    "  \"cost\":\"18,11,0,10,3,0,1,10,1\",\n" +
    "  \"ctrlSwitchs\":\"0\",\n" +
    "  \"multiad\":[\n" +
    "    {\n" +
    "      \"adtype\":12,\n" +
    "      \"configMap\":{\n" +
    "        \"insreCacheAdEnable\":\"0\"\n" +
    "      },\n" +
    "      \"content\":[\n" +
    "      ],\n" +
    "      \"retcode30\":200,\n" +
    "      \"slotid\":\"testb4znbuh3n2\"\n" +
    "    }\n" +
    "  ],\n" +
    "  \"retcode\":200,\n" +
    "  \"sig\":\"\",\n" +
    "  \"totalCacheSize\":300\n" +
    "}";

export default function adsTestPart2() {
  describe('ActsAdsTest1', () => {
    /**
     * @tc.name   testGetAdRequestBody
     * @tc.number SUB_CLOUD_ADS_INTERACTION_LISTENER_0500
     * @tc.desc   callback data is not null.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetAdRequestBody", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        advertising.getAdRequestBody(multiAdRequest, adOption).then((data) => {
          hilog.info(Domain, TAG, `testGetAdRequestBody result = ${JSON.stringify(JSON.parse(data))}`);
          expect(data != null).assertEqual(true);
          done();
        }).catch(() => {
          hilog.info(Domain, TAG, `testGetAdRequestBody get some error`);
          done();
        })
      } catch (error) {
        hilog.error(Domain, TAG, `testGetAdRequestBody failed, ERROR= ${error}`);
        expect(error.code).assertLarger(0);
        done();
      }
    })

    /**
     * @tc.name   testParseAdResponse
     * @tc.number SUB_CLOUD_ADS_INTERACTION_LISTENER_0600
     * @tc.desc   callback data is not null.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testParseAdResponse", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
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
      try {
        advertising.parseAdResponse(adResponse, adLoaderListener, uiContext);
      } catch (e) {
        hilog.error(Domain, TAG, `testParseAdResponse failed, ERROR= ${e}`);
        expect(e != null).assertEqual(true);
        done();
      }

    })
  })
}
