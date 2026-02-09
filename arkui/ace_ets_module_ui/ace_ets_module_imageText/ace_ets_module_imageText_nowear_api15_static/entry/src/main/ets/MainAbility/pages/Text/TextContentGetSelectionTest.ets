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
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  TextArea,
  CopyOptions,
  Margin,
  ClickEvent,
  TextAreaController,
  SearchController,
  TextInputController,
  Search,
  TextInput,
  Row,
  Button
} from '@ohos.arkui.component'

import {
  State
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TextContentGetSelectionTest {
  controller1: TextAreaController = new TextAreaController();
  controller2: SearchController = new SearchController();
  controller3: TextInputController = new TextInputController();
  build() {
    Column({ space: 0 } as ColumnOptions) {
      TextArea({
        text:'0123456',
        controller:this.controller1
      })
        .height('30vp')
        .borderWidth(1)
        .id('TextArea')
      Search({
        value:'012345',
        controller:this.controller2
      })
        .height('30vp')
        .borderWidth(1)
        .id('Search')
      TextInput({
        text:'01234567',
        controller:this.controller3
      })
        .height('30vp')
        .borderWidth(1)
        .id('TextInput')
      Row(){
        Button('getSelectionTextArea').onClick((e:ClickEvent) => {
          AppStorage.setOrCreate<int>('TextAreaSelectionStart', this.controller1!.getSelection()!.start as int);
          AppStorage.setOrCreate<int>('TextAreaSelectionEnd', this.controller1!.getSelection()!.end as int);
        }).id('getTextArea').width('30%')
        Button('getSelectionSearch').onClick((e:ClickEvent): void => {
          AppStorage.setOrCreate<int>('SearchSelectionStart', this.controller2!.getSelection()!.start as int);
          AppStorage.setOrCreate<int>('SearchSelectionEnd', this.controller2!.getSelection()!.end as int);
        }).id('getSearch').width('30%')
        Button('getSelectionTextInput').onClick((e:ClickEvent): void => {
          AppStorage.setOrCreate<int|undefined>('TextInputSelectionStart', this.controller3!.getSelection()!.start as int);
          AppStorage.setOrCreate<int|undefined>('TextInputSelectionEnd', this.controller3!.getSelection()!.end as int);
        }).id('getTextInput').width('30%')
      }.height('5%').margin({top:25} as Margin)
    }.width('100%').height('100%')
  }
}