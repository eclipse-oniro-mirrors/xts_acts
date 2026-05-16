/**
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
struct GlobalPxNullUndefined {
  build() {
    Column({ space: 5}) {
      Text('Hello1')
        .id('text1Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
          centerX: this.getUIContext().lpx2px(null),
          centerY: this.getUIContext().lpx2px(undefined)
        })
      Text('Hello2')
        .id('text2Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
          centerX: this.getUIContext().px2lpx(null),
          centerY: this.getUIContext().px2lpx(undefined)
        })
      Text('Hello3')
        .id('text3Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
          centerX: this.getUIContext().fp2px(null),
          centerY: this.getUIContext().fp2px(undefined)
        })
      Text('Hello4')
        .id('text4Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
          centerX: this.getUIContext().px2fp(null),
          centerY: this.getUIContext().px2fp(undefined)
        })
      Text('Hello5')
        .id('text5Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
          centerX: this.getUIContext().vp2px(null),
          centerY: this.getUIContext().vp2px(undefined)
        })
      Text('Hello6')
        .id('text6Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
          centerX: this.getUIContext().px2vp(null),
          centerY: this.getUIContext().px2vp(undefined)
        })
      Text('Hello7')
        .id('text7Id')
        .textAlign(TextAlign.Center)
        .width(100)
        .height('10%')
        .backgroundColor(0xAFEEEE)
        .borderWidth(1)
        .rotate({
          z: 1,
          angle: 0,
        })
    }
    .width('100%')
    .height('100%')
  }
}