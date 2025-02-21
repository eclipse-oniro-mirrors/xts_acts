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

import router from '@ohos.router';
import hilog from '@ohos.hilog';

let options: router.RouterOptions = {
  url: 'pages/Index'
}

@Entry
@Component
struct LoggedInPage {
  @State message: string = 'You\'ve Logged In'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)

        Button("Back")
          .type(ButtonType.Capsule)
          .fontSize(20)
          .margin({ top: 30 })
          .onClick(() => {
            router.pushUrl(options, (err, data) => {
              hilog.info(0x0000, 'testTag', "back to Index page got err: %{public}s, and data: %{public}s",
                JSON.stringify(err), JSON.stringify(data))
            })
          })
          .id("back_btn")
      }
      .width('100%')
    }
    .height('100%')
  }
}