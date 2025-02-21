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

import autoFillManager from '@ohos.app.ability.autoFillManager'
import hilog from '@ohos.hilog';

let storage = LocalStorage.getShared();
let saveRequestCallback = storage.get<autoFillManager.SaveRequestCallback>('saveCallback');

function SuccessFunc(success: boolean) {
  if (saveRequestCallback) {
    if (success) {
      saveRequestCallback.onSuccess();
      return;
    }
    saveRequestCallback.onFailure();
  }
  hilog.error(0x0000, 'testTag', 'saveRequestCallback is nullptr!')
}

@Entry
@Component
struct SavePage {
  @State message: string = 'Save Account?'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
        Row() {
          Button('OK')
            .type(ButtonType.Capsule)
            .fontSize(20)
            .margin({ top: 30, right: 30 })
            .onClick(() => {
              SuccessFunc(true);
            })
            .id('ok_btn')

          Button('No')
            .type(ButtonType.Capsule)
            .fontSize(20)
            .margin({ top: 30, left: 30 })
            .onClick(() => {
              SuccessFunc(false);
            })
            .id('no_btn')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}