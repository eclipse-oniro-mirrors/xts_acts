/*
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

@Entry
@Component
struct TextInputTextAreaSearch{
  controller1: TextInputController = new TextInputController()
  controller2: TextAreaController = new TextAreaController()
  controller3: SearchController = new SearchController()

  // 自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
      Button('x').onClick(() => {
        // 关闭自定义键盘
        this.controller1.stopEditing()
        this.controller2.stopEditing()
        this.controller3.stopEditing()
      }).id('supportAvoidance_stopEditing')
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110)
              .height('5%')
              .onClick(() => {})
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray).height('50%')
  }

  build() {
    Column() {
      Column(){
        Text('test').width('100%')
      }
      .width('100%')
      .height('60%')
      TextInput({ controller: this.controller1 })
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder(), {supportAvoidance: true}).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .height('10%')
        .id('TextInput_supportAvoidance')
      TextArea({ controller: this.controller2 })
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder(), {supportAvoidance: true}).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .height('10%')
        .id('TextArea_supportAvoidance')
      Search({ controller: this.controller3 })
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder(), {supportAvoidance: true}).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .height('10%')
        .id('Search_supportAvoidance')
    }
  }
}