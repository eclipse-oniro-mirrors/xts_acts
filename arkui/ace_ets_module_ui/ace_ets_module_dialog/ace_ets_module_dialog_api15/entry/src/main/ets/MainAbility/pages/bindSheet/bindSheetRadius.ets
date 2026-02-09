/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LengthMetrics } from '@kit.ArkUI';
@Entry
@Component
struct bindSheetRadius {
  @State isShow: boolean = false
  @State radius: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses | undefined | null = LengthMetrics.px(20)

  @Builder
  myBuilder() {
    Column() {
      Button('radius:20px')
        .height('8%')
        .id('radiusPX')
        .onClick(() => {
          this.radius = LengthMetrics.px(20);
        })
      Button('radius:20vp')
        .height('8%')
        .id('radiusVP')
        .onClick(() => {
          this.radius = LengthMetrics.vp(20);
        })
      Button('radius:20fp')
        .height('8%')
        .id('radiusFP')
        .onClick(() => {
          this.radius = LengthMetrics.fp(20);
        })
      Button('radius:BorderRadiuses')
        .height('8%')
        .id('borderRadiuses')
        .onClick(() => {
          this.radius = {
            topLeft: '10px',
            topRight: '20vp',
            bottomLeft: '10fp',
            bottomRight: '10%'
          }
        })
      Button('radius:LocalizedBorderRadiuses')
        .height('8%')
        .id('localizedBorderRadiuses')
        .onClick(() => {
          this.radius = {
            topStart: LengthMetrics.px(100),
            topEnd: LengthMetrics.vp(0),
            bottomStart: LengthMetrics.fp(100),
            bottomEnd: LengthMetrics.px(100),
          }
        })
      Button('radius:undefined')
        .height('8%')
        .id('undefined')
        .onClick(() => {
          this.radius = undefined
        })
      Button('radius:null')
        .height('8%')
        .id('null')
        .onClick(() => {
          this.radius = null;
        })


      Button('close modal 1')
        .height('8%')
        .id('close')
        .margin(10)
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('transition modal 1')
        .id('bindSheet')
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          radius: this.radius,
          height: '80%',
          backgroundColor: Color.Green,
          preferType: SheetType.BOTTOM,
          onWillAppear: () => {
            console.log('BindSheet onWillAppear.')
          },
          onAppear: () => {
            console.log('BindSheet onAppear.')
          },
          onWillDisappear: () => {
            console.log('BindSheet onWillDisappear.')
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.')
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
