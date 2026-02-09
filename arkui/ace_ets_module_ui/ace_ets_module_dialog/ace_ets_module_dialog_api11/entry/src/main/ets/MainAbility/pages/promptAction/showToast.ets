/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct showToastExample {
  @State content: string = 'undefined'

  build() {
    Column() {
      Text(this.content)
      Row() {
        Button('showToast')
          .id('showToastExample_showToast')
          .onClick(() => {
            promptAction.showToast({
              message: 'Message Info',
              duration: 2000
            });
          })

        Button('showToast401error')
          .id('showToastExample_ErrorCode')
          .onClick(() => {
            try {
              promptAction.showToast(undefined);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              this.content = code.toString();
              console.error(`showToast args error code is ${code}, message is ${message}`);
              AppStorage.SetOrCreate('showToastExample_ErrorCode', code);
            };
          })
      }
    }.width('100%')
  }
}