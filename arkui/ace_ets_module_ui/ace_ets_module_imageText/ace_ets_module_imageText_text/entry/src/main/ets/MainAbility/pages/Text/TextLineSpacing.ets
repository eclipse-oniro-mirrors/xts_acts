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

class TextModifier21 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.lineSpacing(LengthMetrics.px(20), { onlyBetweenLines: true })
  }
}

class TextModifier22 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.lineSpacing(LengthMetrics.vp(20), { onlyBetweenLines: false })
  }
}

class TextModifier23 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.lineSpacing(LengthMetrics.fp(20), undefined)
  }
}

class TextModifier24 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.lineSpacing(undefined)
  }
}

@Entry
@Component
struct TextLineSpacing {
  @State TextModifier1: TextModifier21 = new TextModifier21()
  @State TextModifier2: TextModifier22 = new TextModifier22()
  @State TextModifier3: TextModifier23 = new TextModifier23()
  @State TextModifier4: TextModifier24 = new TextModifier24()

  build() {
    Column({ space: 1 }) {
      Text('Text: lineSpacing test').height('5%')
      Text('onlyBetweenLines: true')
        .id('Text_lineSpacing_true')
        .lineSpacing(LengthMetrics.lpx(20), { onlyBetweenLines: true })
        .height('5%')

      Text('onlyBetweenLines: false')
        .id('Text_lineSpacing_false')
        .lineSpacing(LengthMetrics.percent(0.5), { onlyBetweenLines: false })
        .height('5%')

      Text('Text: lineSpacing(default)')
        .id('Text_lineSpacing_default')
        .height('5%')

      Text('Text: lineSpacing(undefined)')
        .id('Text_lineSpacing_undefined_all')
        .lineSpacing(undefined)
        .height('5%')

      Text('Text: lineSpacing(LengthMetrics.vp(20), undefined)')
        .id('Text_lineSpacing_undefined')
        .lineSpacing(LengthMetrics.vp(20), undefined)
        .height('5%')

      Text('TextModifier: true')
        .attributeModifier(this.TextModifier1)
        .id('TextModifier_lineSpacing_true')
        .height('5%')
        .borderWidth(1)

      Text('TextModifier: false')
        .attributeModifier(this.TextModifier2)
        .id('TextModifier_lineSpacing_false')
        .height('5%')
        .borderWidth(1)

      Text('TextModifier: undefined')
        .attributeModifier(this.TextModifier3)
        .id('TextModifier_lineSpacing_undefined')
        .height('5%')
        .borderWidth(1)

      Text('TextModifier: undefined all')
        .attributeModifier(this.TextModifier4)
        .id('TextModifier_lineSpacing_undefined_all')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}