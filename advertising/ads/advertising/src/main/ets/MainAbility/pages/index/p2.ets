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
import commonEventManager from '@ohos.commonEventManager';
import advertising from '@ohos.advertising';
import { AutoAdComponent } from '@ohos.advertising.AutoAdComponent';

const TAG: string = '[P2]';
const sleepTimeOne = 1000;

@Entry
@Component
struct P2 {
  private ads: Array<advertising.Advertisement> = [];
  private adRequest = {
    adId: 'testx9dtjwj8hp',
    adType: 7,
    adCount: 2,
    adWidth: 100,
    adHeight: 100,
    adSearchKeyword: 'test'
  };
  private adOption = {
    adContentClassification: 'W',
    nonPersonalizedAd: 1,
    tagForChildProtection: 1,
  };
  private displayOptions: advertising.AdDisplayOptions = {
    // 是否静音，默认不静音
    mute: false,
  }

  aboutToAppear() {
    console.info(TAG + 'TestAbility index aboutToAppear');
  }

  build() {
    Column() {
      // AutoAdComponent组件用于展示原生广告
      AutoAdComponent({ adParam: this.adRequest, adOptions: this.adOption, displayOptions: this.displayOptions,
        interactionListener: {
          onStatusChanged: (status: string, ad: advertising.Advertisement, data: string) => {
            console.log(TAG + `onStatusChanged: ${status}, data: ${data}`);
            console.log(TAG + `onAdOpen`);
            const onListenerEvent = 'ACTS_AutoAdComponent_OnListener';
            const options = {
              parameters: {
                'result': data
              }
            }
            setTimeout(async () => {
              commonEventManager.publish(onListenerEvent, options, (err) => {
                console.log(TAG + 'ACTS_AutoAdComponent_OnListener publish');
              });
            }, sleepTimeOne);
          }}})
        .width('100%')
        .height('100%')

    }.width('100%').height('100%')
  }
}