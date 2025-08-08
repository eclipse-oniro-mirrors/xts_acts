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

import { edgeWidths, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct sheetBorderWidth {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('close modal')
        .margin(10)
        .onClick(() => {
          this.isShow = false;
          this.isShow1 = false;
          this.isShow2 = false;
        })
        .id('close1_border')
    }
    .width('100%')
  }
  build() {
    Column({space: 5}) {
      Button('bindSheet1')
        .height('8%')
        .id('bindSheet_borderWidth')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet(this.isShow, this.myBuilder(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: LengthMetrics.vp(50),
          borderWidth: edgeWidths(10),
          preferType:SheetType.BOTTOM
        })
      Button('bindSheet2')
        .height('8%')
        .id('bindSheet_borderWidth1')
        .onClick(() => {
          this.isShow1 = true
        })
        .bindSheet(this.isShow1, this.myBuilder(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: LengthMetrics.vp(50),
          borderWidth: {
            top:'10px',
            right:'5vp',
            left:5,
            bottom:0
          },
          preferType:SheetType.BOTTOM
        })

      Button('bindSheet3')
        .height('8%')
        .id('bindSheet_borderWidth2')
        .onClick(() => {
          this.isShow2 = true
        })
        .bindSheet(this.isShow2, this.myBuilder(), {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          title: { title: 'title', subtitle: 'subtitle' },
          radius: LengthMetrics.vp(50),
          borderWidth: undefined,
          preferType:SheetType.BOTTOM
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}