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

@Entry
@Component
struct PromptActionShowMode {
  @State message: string = 'Hello World'
  build() {
    Column({ space: 5 }) {
	  Button(this.message)
	    .id('mess_mode')
      Button('DEFAULT').key('ShowMode_p1')
        .onClick(() => {
		  this.message = 'Message DEFAULT'
          promptAction.showToast({
            message: this.message,
            duration: 2000,
            bottom: 100,
            showMode: promptAction.ToastShowMode.DEFAULT
          })
        }).backgroundColor(0x317aff)

      Button('TOP_MOST').id('ShowMode_p2')
        .onClick(() => {
		  this.message = 'Message TOP_MOST'
          promptAction.showToast({
            message: this.message,
            duration: 2000,
            bottom: 100,
            showMode: promptAction.ToastShowMode.TOP_MOST
          })
        }).backgroundColor(0x317aff)
    }.width('100%').height('100%')
  }
}