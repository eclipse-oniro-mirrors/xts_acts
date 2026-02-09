/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction, UIContext } from "@ohos.arkui.UIContext";

@Entry
@Component
struct toastExample {
  @State toastId: number = 0;
  @State code: string = '';
  uiContext: UIContext = this.getUIContext();
  promptAction: PromptAction = this.uiContext.getPromptAction();

  build() {
    Column() {
      Text(this.code).id('code1')
      Button('Open Toast')
        .height(100)
        .type(ButtonType.Capsule)
        .onClick(() => {
          try{
            this.promptAction.openToast({
              message: undefined,
              duration: 1000,
            }).then(ret => {

            }).catch((error: Error) => {
              console.error(`openToast error code is ${(error as BusinessError).code}, message is ${error.message}`);
            });
          } catch (e) {
            const error = e as BusinessError
            this.code = e.code
            console.error(`openToast error code is ${(e as BusinessError).code}, message is ${e.message}`);
          }

        })
      Blank().height(50)

      Button('Close Toast')
        .height(100)
        .type(ButtonType.Capsule)
        .onClick(() => {
          try {
            this.promptAction.closeToast(this.toastId);
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`CloseToast error code is ${code}, message is ${message}`);
          }
        })
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}