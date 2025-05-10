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
struct ImageText {
  @State align1: ImageSpanAlignment = ImageSpanAlignment.BASELINE
  @State align2: ImageSpanAlignment = ImageSpanAlignment.CENTER
  @State align3: ImageSpanAlignment = ImageSpanAlignment.TOP
  @State align4: ImageSpanAlignment = ImageSpanAlignment.BOTTOM
  @State fontSize1: number = 20
  @State fontSize2: number = 20
  @State fontSize3: number = 20
  @State fontSize4: number = 20
  @State w: number = 276
  @State h: number = 183
  @State indent: number = 50

  build() {
    Scroll() {
      Column() {
        Text() {
          ImageSpan($r('app.media.icon'))
            .width('114px')
            .height("114px")
            .verticalAlign(this.align1)
            .key('ImageText_ImageSpan1')
          Span('Span')
            .fontSize(this.fontSize1)
          ImageSpan('/pages/images/img1.png')
            .width('150px')
            .height("150px")
            .verticalAlign(this.align2)
            .key('ImageText_ImageSpan2')
          Span('Span')
            .fontSize(this.fontSize2)
          ImageSpan($r('app.media.icon'))
            .width('114px')
            .height("114px")
            .verticalAlign(this.align3)
            .key('ImageText_ImageSpan3')
          Span('Span')
            .fontSize(this.fontSize3)
          ImageSpan('/pages/images/img1.png')
            .width('150px')
            .height("150px")
            .verticalAlign(this.align4)
            .key('ImageText_ImageSpan4')
          Span('Span Text4')
            .fontSize(this.fontSize4)
        }
        .borderWidth(1).borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width(this.w+'px')
            .height(this.h+'px')
            .objectFit(ImageFit.Contain)
            .key('ImageText_ImageSpan5')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width(this.w+'px')
            .height(this.h+'px')
            .objectFit(ImageFit.Cover)
            .key('ImageText_ImageSpan6')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width(this.w+'px')
            .height(this.h+'px')
            .objectFit(ImageFit.Auto)
            .key('ImageText_ImageSpan7')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width(this.w+'px')
            .height(this.h+'px')
            .objectFit(ImageFit.Fill)
            .key('ImageText_ImageSpan8')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width(this.w+'px')
            .height(this.h+'px')
            .objectFit(ImageFit.ScaleDown)
            .key('ImageText_ImageSpan9')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width(this.w+'px')
            .height(this.h+'px')
            .objectFit(ImageFit.None)
            .key('ImageText_ImageSpan10')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5, bottom: 15 })
        .width('90%')

        Text() {
          Span('Span Text1 ')
            .fontSize(20)
            .key('ImageText_Span1')
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .key('ImageText_ImageSpan11')
          Span('Span Text2 ')
            .fontSize(20)
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({top: 15})
        .width('90%')
        .textIndent(this.indent)
        .key('ImageText_Text1')
        Button("indent+50")
          .margin(10)
          .width('30%')
          .height(45)
          .fontSize(15)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .stateEffect(true)
          .onClick(() => {
            this.indent += 50;
          })
          .key('ImageText_Button1')

        Text() {
          ImageSpan(null)
            .width('276px')
            .height("183px")
            .key('ImageText_ImageSpan12')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan(undefined)
            .width('276px')
            .height("183px")
            .key('ImageText_ImageSpan13')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('')
            .width('276px')
            .height("183px")
            .key('ImageText_ImageSpan14')
        }
        .borderWidth(1).borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')


        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .verticalAlign(null)
            .key('ImageText_ImageSpan15')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .verticalAlign(undefined)
            .key('ImageText_ImageSpan16')
        }
        .borderWidth(1).borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .objectFit(null)
            .key('ImageText_ImageSpan17')
        }
        .borderWidth(1).borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .objectFit(undefined)
            .key('ImageText_ImageSpan18')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .key('ImageText_ImageSpan19')
        }
        .borderWidth(1)
        .borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')
        .textIndent(null)

        Text() {
          ImageSpan('/pages/images/test1.jpg')
            .width('276px')
            .height("183px")
            .key('ImageText_ImageSpan20')
        }
        .borderWidth(1).borderColor(Color.Green)
        .margin({ top: 5 })
        .width('90%')
        .textIndent(undefined)
      }
    }
  }
}