/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@system.router';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Second {
  private content: string = "Second Page"
  @State test: string = 'test'

  aboutToAppear(): void {
    let context = this.getUIContext();
    context.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('back to index')
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        router.back()
      })
      TextInput({ placeholder: 'welcome', text: this.content })
        .type(InputType.Normal)
        .width(300)
        .height(50)
        .enabled(true)
        .id('changTest')
        .margin({ top: 20 })
      TextInput()
        .type(InputType.Normal)
        .width(300)
        .height(50)
        .enabled(true)
        .id('changContext')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
  }
}