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
import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction, UIContext } from '@kit.ArkUI';

@Entry
@Component
struct PromptActionToastErrorCode {
  @State str : string = '0'
  @State toastId: number = 0;
  uiContext: UIContext = this.getUIContext();
  promptAction: PromptAction = this.uiContext.getPromptAction();

  build() {
    Column({ space: 3 }) {
      Column({space:3}) {
        Text(this.str).height(30).id('ToastErrorCodeThree')
        Button('OpenToast')
          .id('OpenToastErrorCodeFirst')
          .height(30)
          .width(90)
          .type(ButtonType.Capsule)
          .onClick(() => {
            try {
              this.promptAction.openToast(undefined)
            } catch (e) {
              let error = e as BusinessError;
              if (typeof (e as BusinessError)) {
                this.str = error.code.toString()
              } else {
                console.info('error code is error');
              }
            }
          })
        Button('CloseToast1')
          .id('CloseToastErrorCodeSecond')
          .height(30)
          .width(90)
          .type(ButtonType.Capsule)
          .onClick(() => {
            try {
              this.promptAction.closeToast(6000)
            } catch (e) {
              let error = e as BusinessError;
              if (typeof (e as BusinessError)) {
                this.str = error.code.toString()
              } else {
                console.info('error code is error');
              }
            }
          })
        Button('CloseToast2')
          .id('CloseToastErrorCodeThird')
          .height(30)
          .width(90)
          .type(ButtonType.Capsule)
          .onClick(() => {
            try {
              this.promptAction.closeToast(undefined)
            } catch (e) {
              let error = e as BusinessError;
              if (typeof (e as BusinessError)) {
                this.str = error.code.toString()
              } else {
                console.info('error code is error');
              }
            }
          })
      }
    }
    .width('100%')
  }
}