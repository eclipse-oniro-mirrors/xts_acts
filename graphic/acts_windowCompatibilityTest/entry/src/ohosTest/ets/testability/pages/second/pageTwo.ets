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
struct PageTwo {
  private content: string = "Page two"

  build() {
    Row() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
        Text(`${this.content}`)
          .fontWeight(FontWeight.Bold)
        TextInput()
          .key('pageTwoinput')
          .style(TextInputStyle.Inline)
        Button('点击按钮获取焦点')
          .focusable(true)
          .focusOnTouch(true)
          .onClick(() => {
            console.log("click the button name: 点击按钮获取焦点")
          })
        TextInput()
          .key('pageTwoinputSecond')
          .style(TextInputStyle.Inline)
        Button() {
          Text('点击pageTwo')
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          console.log("click the button")
        })
      }
      .width('100%')
      .height('100%')
    }.width('100%')
    .height('100%')
    .backgroundColor("#ffefcdcd")

  }
}