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
struct MarqueeStop400 {
  @State change :boolean = true;
  @State isString: String = '正向滚动';
  @State marqueeText: string =
    'This is the text with the text overflow set marquee This is the text with the text overflow set marquee This is the text with the text overflow set marquee';
  @State numberSTART: number = 0;
  @State numberBOUNCE: number = 0;
  @State numberSTOP: number = 0;

  build() {
    Scroll() {
      Column() {
        Row() {
          Column() {
            Text('Start')
            Text(this.numberSTART.toString())
          }
          .id('Start')
          .margin(10)

          Column() {
            Text('Bounce')
            Text(this.numberBOUNCE.toString())
          }
          .id('Bounce').margin(10)

          Column() {
            Text('Stop')
            Text(this.numberSTOP.toString())
            .id('Stop')
          }.margin(10)
          

        }.margin(20)

        Marquee({
          start: true,
          step: 6,
          loop: 1,
          fromStart: this.change,
          src: this.marqueeText
        })
          .marqueeUpdateStrategy(MarqueeUpdateStrategy.DEFAULT)
          .margin(20)
          .onStart(null)
          .onBounce(null)
          .onStop(null)
        Button(this.isString.toString()).onClick(() => {
          if (this.change) {
            this.change = false
            this.isString = '反向滚动';
          } else {
            this.change = true
            this.isString = '正向滚动';
          }
        }).id('button001')
          .margin(20)
      }.height(600).width('100%').padding({ left: 35, right: 35, top: 35 })
    }
  }
}