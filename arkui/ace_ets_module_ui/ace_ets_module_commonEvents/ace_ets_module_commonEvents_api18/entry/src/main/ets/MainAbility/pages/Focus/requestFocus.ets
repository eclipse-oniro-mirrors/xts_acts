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

@Entry
@Component
struct RequestFocusExample {
  @State idList: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'LastPageId'];
  @State selectId: string = 'LastPageId';

  build() {
    Column() {
      Button("id: " + this.idList[5])
        .width('70%').height('20%').fontColor(Color.White)
        .id('Button')
      Button("RequestFocus")
        .width('70%').height('20%').fontColor(Color.White)
        .id('RequestFocus')
        .onClick(() => {
          let res = focusControl.requestFocus('Button')
          AppStorage.setOrCreate('RequestTrue', res)
          if (res) {
            this.getUIContext().getPromptAction().showToast({ message: 'Request success' })
          } else {
            this.getUIContext().getPromptAction().showToast({ message: 'Request failed' })
          }
        })
      Button("RequestFocusFalse")
        .width('70%').height('20%').fontColor(Color.White)
        .id('RequestFocusFalse')
        .onClick(() => {
          let res = focusControl.requestFocus('aaa')
          AppStorage.setOrCreate('RequestFalse', res)
          if (res) {
            this.getUIContext().getPromptAction().showToast({ message: 'Request success' })
          } else {
            this.getUIContext().getPromptAction().showToast({ message: 'Request failed' })
          }
        })

    }.width('100%').height('90%').margin({ top: 20 })
  }
}