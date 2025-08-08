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
import { UIExtensionContentSession } from '@kit.AbilityKit';
import advertising from '@ohos.advertising';
import Logger from '../log/HiAdLog';

const TAG = 'UIExtensionAbilityPage';
const storage = LocalStorage.GetShared();
const advertisement: advertising.Advertisement = {
  adType: 7,
  clicked: false,
  rewardVerifyConfig: new Map([
    ['key1', 'value1'],
    ['key2', 'value2']
  ]),
  rewarded: false,
  shown: false,
  uniqueId: '5bb42294-e601-4114-9185-b6fd0f6f49b8'
};

@Entry(storage)
@Component
struct UIExtensionAbilityPage {
  @State message: string = 'UIExtensionAbilityPage+aaa';
  private session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session');

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .backgroundColor(Color.Green)
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear() {
    Logger.i(TAG, 'UIExtensionAbilityPage aboutToAppear');
    let data: Record<string, Object> = {
      'status': 'onAdOpen',
      'ad': advertisement,
      'data': 'AdsTest',
    };
    this.session?.sendData(data);
  }
}