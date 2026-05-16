/**
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
struct RichEditor2 {
  controller: RichEditorController = new RichEditorController()
  @State builder1: Boolean = true;
  // 自定义键盘组件
  @State keyHeight:number = 250
  @Builder CustomKeyboardBuilder() {
    Column() {
      Row(){
        Button('按钮高度+').onClick(() => {
          this.keyHeight += 5
        })
        Button('按钮高度+').onClick(() => {
          this.keyHeight -= 5
        })
      }
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + "")
              .width('10%').onClick(() => {
              this.controller.addTextSpan(item + '', {
                offset: this.controller.getCaretOffset(),
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 10
                }
              })
              this.controller.setCaretOffset(this.controller.getCaretOffset() + item.toString().length)
            })
          }
        })
      }.maxCount(3).columnsGap('1%').rowsGap('1%').padding('1%')
    }.backgroundColor(Color.Gray)
    .height('50%')
  }

  build() {
    Column() {
      Text("占位").height("80%")
      RichEditor({ controller: this.controller })// 绑定自定义键盘
        .customKeyboard( this.CustomKeyboardBuilder(), { supportAvoidance: true })
        .margin(10)
        .border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .backgroundColor(Color.Pink)
        .width("100%")
        .id("RichEditor_supportAvoidance")
        .height('20%')
    }.height('100%')
  }
}