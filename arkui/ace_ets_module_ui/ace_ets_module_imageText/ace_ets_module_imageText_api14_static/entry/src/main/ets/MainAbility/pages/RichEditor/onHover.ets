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
import {
  Entry, Component, Column, ColumnOptions, Text, TextArea,HoverEvent,
  RichEditorController, RichEditorOptions, RichEditor , Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct RichEditorOnHover1 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State hoverFlag1: string = "Init";
  @State hoverFlag2: string = "Init";

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(this.hoverFlag1).id("onHover_text1_id")
        .width('90%').height('10%').fontSize(50)

      Text(this.hoverFlag2).id("onHover_text2_id")
        .width('90%').height('10%').fontSize(50)

      RichEditor(this.options).id("RichEditor_onHover_id")
        .width('90%').height('50%').backgroundColor(Color.Green)
        .onHover((isHover: boolean, event: HoverEvent):void => {
          console.info('RichEditor isHover: ' + isHover.toString())
          this.hoverFlag1 = isHover.toString()
          if(isHover){
            this.hoverFlag2 = isHover.toString()
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}