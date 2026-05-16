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
import { promptAction } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct closeDialogTest {
  private customDialogComponentId: number = 0

  @Builder
  customDialogComponent() {
    Column() {
      Button('确认')
        .height('8%')
        .id('ok')
        .onClick(() => {
          try {
            promptAction.closeCustomDialog(this.customDialogComponentId)
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
          }
        })
    }.padding(5).justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column({ space: 5 }) {
      Button('customDialog')
        .id('customDialog')
        .height('8%')
        .onClick(() => {
          promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            alignment: DialogAlignment.Bottom,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info('reason' + JSON.stringify(dismissDialogAction.reason))
              console.log('dialog onWillDismiss')
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            }
          }).then((dialogId: number) => {
            this.customDialogComponentId = dialogId
          })
            .catch((error: BusinessError) => {
              console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`)
            })
          setTimeout(() => {
            try {
              promptAction.closeCustomDialog(0)
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
            }
          }, 1500)
          setTimeout(() => {
            try {
              promptAction.closeCustomDialog(null)
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
            }
          }, 3000)
          setTimeout(() => {
            try {
              promptAction.closeCustomDialog(undefined)
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
            }
          }, 4500)
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}