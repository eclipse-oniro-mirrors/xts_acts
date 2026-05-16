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

@Entry
@Component
struct TextContentAlignTest {
  build() {
    Row(){
      Column(){
        Column(){
          Text('这是一个长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长')
          .id('textTop')
          .backgroundColor(Color.Green)
          .fontColor(Color.Yellow)
          .width(160)
          .height(60)
          .fontSize(16)
          .textContentAlign(TextContentAlign.TOP)
          .margin({ bottom: 30 })
          
          Text('这是一个长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长')
          .id('textCenter')
          .backgroundColor(Color.Green)
          .fontColor(Color.Yellow)
          .width(160)
          .height(60)
          .fontSize(16)
          .textContentAlign(TextContentAlign.CENTER)
          .margin({ bottom: 30 })

          Text('这是一个长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长')
          .id('textBottom')
          .backgroundColor(Color.Green)
          .fontColor(Color.Yellow)
          .width(160)
          .height(60)
          .fontSize(16)
          .textContentAlign(TextContentAlign.BOTTOM)
          .margin({ bottom: 30 })
        }
      }
      .width('100%')
    }
    .height('100%').backgroundColor('#BCC0C2')
  }
}