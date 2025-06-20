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
struct ButtonTouch {
  @State monopolize: boolean = false
  @State message: string = 'set monopolizeEvents false'
  @State logMsg1: string = ''
  @State logMsg2: string = ''
  build() {
    Column({space:20}) {
      Text(this.logMsg2 + ';' + this.logMsg1)
        .id('buttonText')
        .fontSize(16)
        .fontColor(Color.Pink)
        .margin(10)
      Button("button1")
        .id("button1")
        .width(100)
        .height(80)
        .monopolizeEvents(this.monopolize)
        .onTouch((event:TouchEvent)=>{
          if (event.type == TouchType.Down) {
            this.logMsg1 = 'onTouch1 success'
          }
        })
      Button("button2")
        .id('button2')
        .width(100)
        .height(80)
        .onTouch((event:TouchEvent)=>{
          if (event.type == TouchType.Down) {
            this.logMsg2 = 'onTouch2 success'
          }
        })
      Text(this.message)
        .fontSize(16)
        .margin(10)
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}