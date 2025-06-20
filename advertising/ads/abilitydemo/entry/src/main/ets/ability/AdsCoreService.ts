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
import AdsServiceExtensionAbility from '@ohos.advertising.AdsServiceExtensionAbility';
import { RespCallback } from '@ohos.advertising.AdsServiceExtensionAbility';
import advertising from '@ohos.advertising';
import Logger from '../log/HiAdLog';


const TAG: string = "AdsExtensionAbility";

export default class AdsExtensionAbility extends AdsServiceExtensionAbility {

  onLoadAd(adParam: advertising.AdRequestParams, adOptions: advertising.AdOptions, respCallback: RespCallback) {
    try {
      Logger.i(TAG, `onLoadAd, adParam: ${JSON.stringify(adParam)}, adOptions: ${JSON.stringify(adOptions)}`);
      const ads: Array<advertising.Advertisement> = [];
      ads.push({adType: 7, uniqueId: '122222', rewardVerifyConfig: null, rewarded: false, shown: false,  clicked: false})
      const slot1: string = "test1";
      const resMap: Map<string, Array<advertising.Advertisement>> = new Map();
      resMap.set(slot1, ads);
      Logger.i(TAG, `onLoadAd, resMap: ${JSON.stringify(resMap.get(slot1))}`);
      test();
      Logger.i(TAG, `onLoadAd, respCallback`);
      respCallback(resMap);
    } catch(e) {
      Logger.i(TAG, `onLoadAd, error: ${JSON.stringify(e)}`);
    }
  }

  onLoadAdWithMultiSlots(adParams: advertising.AdRequestParams[], adOptions: advertising.AdOptions, respCallback: RespCallback) {
    Logger.i(TAG, `onLoadAdWithMultiSlots, adParams: ${JSON.stringify(adParams)}, adOptions: ${JSON.stringify(adOptions)}`);
    const ads: Array<advertising.Advertisement> = [];
    ads.push({adType: 7, uniqueId: '122222', rewardVerifyConfig: null, rewarded: false, shown: false,  clicked: false})
    ads.push({adType: 7, uniqueId: '133333', rewardVerifyConfig: null, rewarded: false, shown: false,  clicked: false})
    const slot1: string = "test1";
    const resMap: Map<string, Array<advertising.Advertisement>> = new Map();
    resMap.set(slot1, ads);
    Logger.i(TAG, `onLoadAdWithMultiSlots, resMap: ${JSON.stringify(resMap.get(slot1))}`);
    respCallback(resMap);
  }
}

function test() {
  Logger.i(TAG, `onLoadAd, test`);
}