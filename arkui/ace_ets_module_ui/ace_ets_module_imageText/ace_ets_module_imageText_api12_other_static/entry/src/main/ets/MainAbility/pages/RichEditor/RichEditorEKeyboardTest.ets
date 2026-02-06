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
import { Entry, Component, Column, RichEditor, RichEditorController, RichEditorOptions } from '@ohos.arkui.component';

@Entry
@Component
struct RichEditorEKeyboardTest {
  controller: RichEditorController = new RichEditorController();
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();

  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .margin(10)
        .width('95%')
        .backgroundColor('rgb(240,250,255)')
        .id('RichEditor')
      RichEditor({ controller: this.controller1 } as RichEditorOptions)
        .margin(10)
        .width('95%')
        .backgroundColor('rgb(240,250,255)')
        // .enableKeyboardOnFocus(null)
        .id('RichEditor1')
      RichEditor({ controller: this.controller2 } as RichEditorOptions)
        .margin(10)
        .width('95%')
        .backgroundColor('rgb(240,250,255)')
        .enableKeyboardOnFocus(false)
        .id('RichEditor2')
      RichEditor({ controller: this.controller3 } as RichEditorOptions)
        .margin(10)
        .width('95%')
        .backgroundColor('rgb(240,250,255)')
        .enableKeyboardOnFocus(true)
        .id('RichEditor3')
    }
    .height('100%')
  }
}