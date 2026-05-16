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
struct DeleteBackwardMultiTest {
  controller1: RichEditorController = new RichEditorController()

  build() {
    Scroll(){
      Column({ space: 15 }) {
        Text('deleteBackward 测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin(10)

        this.buildSpecialTestItem1()
        
      }
      .padding(10)
      .width('100%')
    }
  }

  @Builder
  buildSpecialTestItem1() {
    Column({ space: 5 }) {
      RichEditor({ controller: this.controller1 })
        .id('rich1')
        .border({ width: 1, color: Color.Blue })
        .height(80)
        .width('100%')
        .onReady(() => {
          this.controller1.addTextSpan('delete测试123😊🐶🌊🌄🍔☕🥄💻📡🚀⚽🎸🎮🎃🎏✌️🐋📦✨👩💻👪👬🤼‍♂️🏆🇨🇳', {
            style: { fontColor: Color.Black, fontSize: 15 }
          })
        })

      Button(`deleteBackward`)
        .id('button1')
        .fontSize(14)
        .width('100%')
        .onClick(() => {
          this.controller1.deleteBackward()
        })
    }
    .padding(5)
    .backgroundColor('#f5f5f5')
    .borderRadius(5)
  }
}
