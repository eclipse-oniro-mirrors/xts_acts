'use static';
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
import { Entry, Column, Component,RichEditorController ,Column,RichEditorOptions,RichEditorRange,
  Flex,TextRange,ColumnOptions,Text,RichEditor,Color

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
@Entry
@Component
struct RichEditorOnDidIMEInput {
  controller: RichEditorController = new RichEditorController()
  @State flag: string = 'Init'

  build() {
    Column({ space: 100 } as ColumnOptions) {
      Text(this.flag).id('OnDidIMEInput_id')
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditor_OnDidIMEInput')
        .onDidIMEInput((value: TextRange):void => {
          console.log('onDidIMEInput succ')
          this.flag = 'onDidIMEInput succ'
        })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
    }
  }
}