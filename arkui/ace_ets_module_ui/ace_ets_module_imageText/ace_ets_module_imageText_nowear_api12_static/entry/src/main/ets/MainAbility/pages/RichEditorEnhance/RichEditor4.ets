'use static';
/**
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
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { Entry, Column, Color, Component, RichEditor, Margin, RichEditorController, RichEditorOptions} from '@ohos.arkui.component'

@Entry
@Component
struct RichEditor4 {
  controller: RichEditorController = new RichEditorController()
  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady((): void=>{
          this.controller.addTextSpan("\uD83D\uDE0A\uD83D\uDE0A\uD83D\uDE0A\uD83D\uDE0A")
        })
        .margin({ top:50 } as Margin)
        .border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .backgroundColor(Color.Pink)
        .width("100%")
        .id("RichEditor_emoji")
    }
  }
}