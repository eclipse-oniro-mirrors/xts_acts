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
struct columnMonopolize {
  @State message: string = 'set monopolizeEvents false';
  @State messageOut: string = ' ';
  @State messageInner: string = ' ';
  @State monopolize: boolean = false;

  build() {
    Scroll() {
      Column() {
        Text(this.message)
          .height('10%')
        Text(this.messageOut)
          .height('10%')
          .id('outer')
        Text(this.messageInner)
          .height('10%')
          .id('inner')
        Button('clean')
          .height('10%')
          .id('clean')
          .onClick(() => {
            this.messageOut = ' '
            this.messageInner = ' '
          })
        Button('change monopolizeEvents')
          .height('10%')
          .id('change')
          .onClick(() => {
            this.monopolize = !this.monopolize
            if (!this.monopolize) {
              this.message = 'set monopolizeEvents false'
            } else {
              this.message = 'set monopolizeEvents true'
            }
          })
        Column() {
          Column() {
          }
          .monopolizeEvents(this.monopolize)
          .width('100%')
          .height('40%')
          .id('innerColnum')
          .backgroundColor(Color.Blue)
          .onTouch((event: TouchEvent) => {
            if (event.type == TouchType.Down) {
              console.info('inner column touch down')
              this.messageInner = 'inner column touch down'
            }
          })
        }
        .backgroundColor(Color.Gray)
        .height('100%')
        .width('100%')
        .id('outerColnum')
        .onTouch((event) => {
          if (event.type == TouchType.Down) {
            console.info('outside column touch down')
            this.messageOut = 'outside column touch down'
          }
        })
      }
      .height('100%')
    }.height('90%').width('100%')
  }
}