'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { ComponentContent, ReactiveComponentContent } from '@ohos.arkui.node';
import { Entry, Row, Column, Component, Builder, Text, Button, wrapBuilder, FontWeight, ClickEvent } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Builder
function buildText() {
  Column() {
    Text('hello')
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }.backgroundColor('#FFF0F0F0')
}

@Entry
@Component
struct ComponentContentIsDisposed {
  build() {
    Row() {
      Column() {
        Button('ComponentContentIsDisposed')
          .id('btn_componentContent_isDisposed')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let componentContent = new ComponentContent(uiContext, wrapBuilder(buildText));
            AppStorage.setOrCreate<boolean>('componentContentIsDisposed1',componentContent.isDisposed());
            componentContent.dispose();
            AppStorage.setOrCreate<boolean>('componentContentIsDisposed2',componentContent.isDisposed());
          })
        Button('ReactiveComponentContentIsDisposed')
          .id('btn_reactiveComponentContent_isDisposed')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let reactiveComponentContent = new ReactiveComponentContent(uiContext, buildText);
            AppStorage.setOrCreate<boolean>('reactiveComponentContentIsDisposed1',reactiveComponentContent.isDisposed());
            reactiveComponentContent.dispose();
            AppStorage.setOrCreate<boolean>('reactiveComponentContentIsDisposed2',reactiveComponentContent.isDisposed());
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
