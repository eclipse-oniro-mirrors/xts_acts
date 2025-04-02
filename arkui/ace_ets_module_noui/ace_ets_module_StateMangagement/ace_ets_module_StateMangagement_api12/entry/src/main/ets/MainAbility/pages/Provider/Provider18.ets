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
@ComponentV2
struct GrandSon2 {
  @Consumer() message1: number = 0;
  @Consumer() message2: number = 0;
  @Consumer('message2') message0: number = 0;
  @Consumer('message2') message3: number = 0;

  build() {
    Column() {
      Button(`GrandSon +4`)
        .id('btnChild')
        .onClick(() => {
          this.message1 += 4
          this.message2 += 4
        }).fontSize(14)
      Column() {
        Text(`reviewVotes(${this.message1})`)
          .id('tvChild1')
          .fontSize(14)
        Text(`reviewVotes(${this.message2})`)
          .id('tvChild2')
          .fontSize(14)
          .onClick(() => {
            this.message2 += 1
          })
        Text(`reviewVotes(${this.message0})`)
          .id('tvChild3')
          .fontSize(14)
          .onClick(() => {
            this.message0 += 1
          })
        Text(`reviewVotes(${this.message3})`)
          .id('tvChild4')
          .fontSize(14)
          .onClick(() => {
            this.message3 += 1
          })
        Divider()
      }.borderWidth(1)
    }
    .width('100%')
  }
}

@ComponentV2
struct ChildTest2 {

  build() {
    Column({ space: 5 }) {
      GrandSon2()
    }
  }
}

@Entry
@ComponentV2
struct Provider18 {
  @Provider() message1: number = 40;
  @Provider() message2: number = 50;
  @Provider('message2') message: number = 60;

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Button(`parent (${this.message2}) +1`)
          .id('btnParent')
          .onClick(() => {
            this.message1 += 1
            this.message2 += 1

          }).fontSize(14)
        ChildTest2()
      }.width('100%')
    }.width('100%').height('100%').align(Alignment.Top).scrollBar(BarState.Off)
  }
}
