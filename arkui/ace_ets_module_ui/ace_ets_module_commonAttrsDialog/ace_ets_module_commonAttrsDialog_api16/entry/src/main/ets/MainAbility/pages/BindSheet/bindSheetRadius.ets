/**
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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('close modal')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow = false;
        })
        .id('close1')
    }
    .width('100%')
  }
  @Builder
  myBuilder1() {
    Column() {
      Button('close modal')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow1 = false;
        })
        .id('close2')
    }
    .width('100%')
  }
  @Builder
  myBuilder2() {
    Column() {
      Button('close modal')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow2 = false;
        })
        .id('close3')
    }
    .width('100%')
  }
  @Builder
  myBuilder3() {
    Column() {
      Button('close modal')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow3 = false;
        })
        .id('close4')
    }
    .width('100%')
  }
  build() {
    Column() {
      Text($r('sys.float.window_radius_small'))
        .id('window_radius_small')
      Button('bindSheet 1')
        .id('bindSheet_001')
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: LengthMetrics.vp(-100),
          preferType:SheetType.BOTTOM
        })
      Button('bindSheet 2')
        .id('bindSheet_002')
        .onClick(() => {
          this.isShow1 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow1, this.myBuilder1(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: LengthMetrics.vp(0),
          preferType:SheetType.BOTTOM
        })
      Button('bindSheet 3')
        .id('bindSheet_003')
        .onClick(() => {
          this.isShow2 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow2, this.myBuilder2(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: {topLeft: '100vp'},
          preferType:SheetType.BOTTOM
        })
      Button('bindSheet 4')
        .id('bindSheet_004')
        .onClick(() => {
          this.isShow3 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow3, this.myBuilder3(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: undefined,
          preferType:SheetType.BOTTOM
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
