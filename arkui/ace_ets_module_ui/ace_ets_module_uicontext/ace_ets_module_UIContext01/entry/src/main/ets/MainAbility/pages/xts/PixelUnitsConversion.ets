/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PixelUnitsConversion {
  @State px2vp: string = ''
  @State vp2px: string = ''
  @State fp2px: string = ''
  @State px2fp: string = ''
  @State lpx2px: string = ''
  @State px2lpx: string = ''
  private scroller: Scroller = new Scroller()
  uiContext: UIContext = this.getUIContext();

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        Text('' + this.px2vp)
          .fontColor(0x000000)
          .fontSize(12)
          .width('90%')
          .key('px2vp_text')
          .height('5%')

        Text('' + this.vp2px)
          .fontColor(0x000000)
          .fontSize(12)
          .width('90%')
          .key('vp2px_text')
          .height('5%')

        Text('' + this.fp2px)
          .fontColor(0x000000)
          .fontSize(12)
          .width('90%')
          .key('fp2px_text')
          .height('5%')

        Text('' + this.px2fp)
          .fontColor(0x000000)
          .fontSize(12)
          .width('90%')
          .key('px2fp_text')
          .height('5%')

        Text('' + this.lpx2px)
          .fontColor(0x000000)
          .fontSize(12)
          .width('90%')
          .key('lpx2px_text')
          .height('5%')

        Text('' + this.px2lpx)
          .fontColor(0x000000)
          .fontSize(12)
          .width('90%')
          .key('px2lpx_text')
          .height('5%')

        Button('px2vp')
          .width('100%')
          .height('5%')
          .id('px2vp_01')
          .onClick(() => {
            this.uiContext.px2vp(220)
            console.info('PixelUnitsConversion_0100 start')
            this.px2vp = '220'
          })
        Button('vp2px')
          .width('100%')
          .height('5%')
          .id('vp2px_01')
          .onClick(() => {
            this.uiContext.vp2px(220)
            console.info('PixelUnitsConversion_0200 start')
            this.vp2px = '220'
          })
        Button('fp2px')
          .width('100%')
          .height('5%')
          .id('fp2px_01')
          .onClick(() => {
            this.uiContext.fp2px(220)
            console.info('PixelUnitsConversion_0300 start')
            this.fp2px = '220'
          })
        Button('px2fp')
          .width('100%')
          .height('5%')
          .id('px2fp_01')
          .onClick(() => {
            this.uiContext.px2fp(220)
            console.info('PixelUnitsConversion_0400 start')
            this.px2fp = '220'
          })
        Button('lpx2px')
          .width('100%')
          .height('5%')
          .id('lpx2px_01')
          .onClick(() => {
            this.uiContext.lpx2px(220)
            console.info('PixelUnitsConversion_0500 start')
            this.lpx2px = '220'
          })
        Button('px2lpx')
          .width('100%')
          .height('5%')
          .id('px2lpx_01')
          .onClick(() => {
            this.uiContext.px2lpx(220)
            console.info('PixelUnitsConversion_0600 start')
            this.px2lpx = '220'
          })
      }
    }.width('100%').height('100%')
  }
}