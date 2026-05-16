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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  ClickEvent,
  Flex,
  FlexDirection,
  TextInput,
  InputType,
  EnterKeyType,
  FontStyle,
  FontWeight,
  EnterKeyType
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextInputExampleKy {
  @State text: string = ''
  @State textNew: string = ''

  onPageShow() {
    console.info('testInputExampleKey show called');
  }

  onBuildDone() {

  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Flex({ direction: FlexDirection.Row }) {
        TextInput({ placeholder: 'textInput1', text: this.text })
          .type(InputType.Normal)
          .enterKeyType(EnterKeyType.NEW_LINE)
          .placeholderColor('#FFC0C0C0')
          .placeholderFont({ size: 30, weight: 400, family: 'Microsoft YaHei', style: FontStyle.Normal })
          .caretColor('#FF000000')
          .height(60)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontFamily('cursive')
          .fontStyle(FontStyle.Italic)
          .fontColor('#FFFF0000')
          .maxLength(10)
          .onChange((value: string) :void=> {
            this.textNew = value
          })
          .onSubmit((enterKey:EnterKeyType) : void=> {
            this.textNew = 'onSubmit'
          })
          .onEditChange((isEditing) => {
            this.textNew = 'onEditChanged'
          })
          .onCopy((value: string) :void=> {
          })
          .key('textInputkeyN')
      }


    }
    .width('100%')
    .height('100%')
  }
}
