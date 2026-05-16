/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct MarqueeStop4 {
  @State change :boolean = true;
  @State isString: String = '正向滚动';
  @State marqueeText: string =
    'This is the text with the text overflow set marquee This is the text with the text overflow set marquee This is the text overflow set marquee';
  @State numberSTOP: number = 0;

  build() {
    Scroll() {
      Column() {
        Row() {
          Column() {
            Text('Stop')
            Text(this.numberSTOP.toString())
          }.margin(5)
          .id('onStopTest')
        }.margin(10)

        Marquee({
          start: true,
          step: 6,
          loop: 1,
          fromStart: this.change,
          src: this.marqueeText
        })
          .marqueeUpdateStrategy(MarqueeUpdateStrategy.DEFAULT)
          .margin(10)
          .onStop(() => {
            this.numberSTOP++;
          })
        Button(this.isString.toString())
          .onClick(() => {
            if (this.change) {
              this.change = false
              this.isString = '反向滚动';
            } else {
              this.change = true
              this.isString = '正向滚动';
            }
          }).id('onStopbutton')
          .margin(10)
      }
      .height(350)
      .width('90%')
      .padding({ left: 15, right: 15, top: 15 }) // 内边距大幅缩小
    }
  }
}