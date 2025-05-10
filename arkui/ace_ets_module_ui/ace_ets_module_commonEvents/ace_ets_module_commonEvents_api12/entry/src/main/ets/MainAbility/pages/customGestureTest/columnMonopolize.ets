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
struct ColumnGesture1 {
  @State monopolize: boolean = true
  @State logMsg1: string = ''
  @State logMsg2: string = ''
  build() {
    Column({space:20}) {
      Text("monopolize--" + this.monopolize)
        .fontSize(20)
        .margin(10)
      Text(this.logMsg1 + ";" + this.logMsg2)
        .id('columnText')
        .fontSize(20)
        .fontColor(Color.Pink)
        .margin(10)
      Column(){}
      .id('column1')
      .width(100)
      .height(80)
      .backgroundColor(Color.Pink)
      .monopolizeEvents(this.monopolize)
      .gesture(
        LongPressGesture()
          .onAction((event: GestureEvent) => {
            if (event) {
              console.info('长按触发')
              this.logMsg1 = 'LongPressGesture onAction success'
            }
          })
      )
      Column(){}
      .id('column2')
      .backgroundColor(Color.Blue)
      .width(100)
      .height(80)
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event: GestureEvent) => {
            if (event) {
              console.info('tap触发')
              this.logMsg2 = 'TapGesture success'
            }
          })
      )
      Button('change monopolize')
        .id('buttonBoolean')
        .width(200)
        .height(80)
        .margin(10)
        .onClick(()=>{
          console.info('按钮触发')
          this.monopolize = !this.monopolize
        })
      Button('clean')
        .id('button_clean')
        .width(200)
        .height(80)
        .margin(10)
        .onClick(()=>{
          this.logMsg1 = ''
          this.logMsg2 = ''
        })
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}