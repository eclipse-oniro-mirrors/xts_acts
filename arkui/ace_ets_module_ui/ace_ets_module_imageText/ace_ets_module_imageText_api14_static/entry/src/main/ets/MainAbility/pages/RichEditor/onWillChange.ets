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
import { Entry, Component, Column, ColumnOptions, Button,ClickEvent, Text, TextArea, RichEditor, Color,RichEditorController,RichEditorOptions, RichEditorChangeValue } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct RichEditorOnWillChange1 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State range: string = '[-1, -1]';

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(this.range).id('onWillChange_range')
        .width('90%').height('10%').fontSize(50)

      RichEditor(this.options).id('RichEditor_onWillChange_id')
        .width('90%').height('50%').backgroundColor(Color.Green)
        .onAppear(() => {
          this.controller.addTextSpan('12345')
        })
        .onWillChange((value: RichEditorChangeValue):boolean => {
          console.log('RichEditorController：onWillChange');
          console.log('RichEditorController：value' + JSON.stringify(value));
          let start = value.rangeBefore.start;
          let end = value.rangeBefore.end;
          this.range = '[' + start + ', ' + end + ']'
          return true;
        })
      Button('光标定位').onClick((e:ClickEvent) => {
        this.controller.setCaretOffset(0);
      }).id('setCaretOffset')
    }
    .width('100%')
    .height('100%')
  }
}