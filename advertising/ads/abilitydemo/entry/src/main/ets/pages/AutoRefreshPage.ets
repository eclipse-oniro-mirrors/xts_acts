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
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import systemDateTime from '@ohos.systemDateTime';
import Logger from '../log/HiAdLog';

const TAG = 'AutoRefreshAdPage';
const storage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct AutoRefreshPage {
  @State message: string = 'AutoRefreshPage';
  @State currentTime: string = '';
  @LocalStorageLink('session') session: UIExtensionContentSession = void 0;

  aboutToAppear() {
    Logger.i(TAG, '%{public}s', 'aboutToAppear');
    this.session?.sendData({ status: 'onAdOpen', ad: {}, data: 'AdsTest' });

    this.session.setReceiveDataCallback((data)=> {
      Logger.i(TAG, `setReceiveDataCallback:${(JSON.stringify(data))}`);
      try {
        systemDateTime.getDate((error, date) => {
          if (error) {
            console.info(`Failed to get date. message: ${error.message}, code: ${error.code}`);
            return;
          }
          console.info(`Succeeded in getting date : ${date}`);;
          this.currentTime = this.currentTime + '\n' + date.toString();
        });
      } catch(e) {
        console.info(`Failed to get date. message: ${e.message}, code: ${e.code}`);
      }
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Text(this.currentTime)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
      }
      .backgroundColor(Color.Green)
      .width('100%')
    }
    .height('100%')
  }
}