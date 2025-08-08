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
struct blendMode1 {
  @Builder
  Access() {
    Text('2222')
  }

  build() {
    Column() {
      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column0')
      .blendMode(BlendMode.NONE)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column1')
      .blendMode(BlendMode.CLEAR)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column2')
      .blendMode(BlendMode.SRC)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column3')
      .blendMode(BlendMode.DST)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column4')
      .blendMode(BlendMode.SRC_OVER)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column5')
      .blendMode(BlendMode.DST_OVER)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column6')
      .blendMode(BlendMode.SRC_IN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column7')
      .blendMode(BlendMode.DST_IN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column8')
      .blendMode(BlendMode.SRC_OUT)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column9')
      .blendMode(BlendMode.DST_OUT)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column10')
      .blendMode(BlendMode.SRC_ATOP)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column11')
      .blendMode(BlendMode.DST_ATOP)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column12')
      .blendMode(BlendMode.XOR)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column13')
      .blendMode(BlendMode.PLUS)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column14')
      .blendMode(BlendMode.MODULATE)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column15')
      .blendMode(BlendMode.SCREEN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column16')
      .blendMode(BlendMode.OVERLAY)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column17')
      .blendMode(BlendMode.DARKEN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column18')
      .blendMode(BlendMode.LIGHTEN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column19')
      .blendMode(BlendMode.COLOR_DODGE)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column20')
      .blendMode(BlendMode.COLOR_BURN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column21')
      .blendMode(BlendMode.HARD_LIGHT)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column22')
      .blendMode(BlendMode.SOFT_LIGHT)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column23')
      .blendMode(BlendMode.DIFFERENCE)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column24')
      .blendMode(BlendMode.EXCLUSION)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column25')
      .blendMode(BlendMode.MULTIPLY)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column26')
      .blendMode(BlendMode.HUE)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column27')
      .blendMode(BlendMode.SATURATION)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column28')
      .blendMode(BlendMode.COLOR)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column29')
      .blendMode(BlendMode.LUMINOSITY)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column30')
      .blendMode(BlendMode.LUMINOSITY, BlendApplyType.FAST)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("test")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .key('blend_column31')
      .blendMode(BlendMode.LUMINOSITY, BlendApplyType.OFFSCREEN)
      .height('50%')
      .width('100%')
      .backgroundColor('#ff08ff00')
    }
  }
}