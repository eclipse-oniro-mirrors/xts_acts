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
class ImageSpanModifier11 implements AttributeModifier<ImageSpanAttribute> {

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.verticalAlign(ImageSpanAlignment.FOLLOW_PARAGRAPH)
  }
}

class ImageSpanModifier12 implements AttributeModifier<ImageSpanAttribute> {

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.verticalAlign(undefined)
  }
}

@Component
@Entry
struct VerticalAlignImageSpanAlignment {
  @State ImageSpanModifier1: ImageSpanModifier11 = new ImageSpanModifier11()
  @State ImageSpanModifier2: ImageSpanModifier12 = new ImageSpanModifier12()

  build() {
    Row() {
      Column() {
        Text() {
          Span('ImageSpanAlignment: FOLLOW_PARAGRAPH').height('5%')
          ImageSpan($r('app.media.icon'))
            .id('ImageSpanAlignment_FOLLOW_PARAGRAPH')
            .width('20%')
            .height('10%')
            .verticalAlign(ImageSpanAlignment.FOLLOW_PARAGRAPH)

          Span('ImageSpanAlignment: default').height('5%')
          ImageSpan($r('app.media.icon'))
            .id('ImageSpanAlignment_default')
            .width('20%')
            .height('10%')

          Span('ImageSpanAlignment: undefined').height('5%')
          ImageSpan($r('app.media.icon'))
            .id('ImageSpanAlignment_undefined')
            .width('20%')
            .height('10%')
            .verticalAlign(undefined)

          Span('Modifier: FOLLOW_PARAGRAPH').height('5%')
          ImageSpan($r('app.media.icon'))
            .id('Modifier_FOLLOW_PARAGRAPH')
            .width('20%')
            .height('10%')
            .attributeModifier(this.ImageSpanModifier1)

          Span('Modifier: undefined').height('5%')
          ImageSpan($r('app.media.icon'))
            .id('Modifier_undefined')
            .width('20%')
            .height('10%')
            .attributeModifier(this.ImageSpanModifier2)
        }
      }.width('100%')
    }.height('100%')
  }
}