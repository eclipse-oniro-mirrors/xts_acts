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

 class TextAreaModifier31 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.lineSpacing(LengthMetrics.px(20), { onlyBetweenLines: true })
  }
}

class TextAreaModifier32 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.lineSpacing(LengthMetrics.vp(20), { onlyBetweenLines: false })
  }
}

class TextAreaModifier33 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.lineSpacing(LengthMetrics.fp(20), undefined)
  }
}

class TextAreaModifier34 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.lineSpacing(undefined)
  }
}

@Entry
@Component
struct TextAreaLineSpacing {
  @State TextAreaModifier1: TextAreaModifier31 = new TextAreaModifier31()
  @State TextAreaModifier2: TextAreaModifier32 = new TextAreaModifier32()
  @State TextAreaModifier3: TextAreaModifier33 = new TextAreaModifier33()
  @State TextAreaModifier4: TextAreaModifier34 = new TextAreaModifier34()

  build() {
    Column({ space: 1 }) {
      Text('TextArea：lineSpacing test').height('5%')
      TextArea({
        text:'onlyBetweenLines: true',
      })
        .id('TextArea_lineSpacing_true')
        .lineSpacing(LengthMetrics.lpx(20), { onlyBetweenLines: true })
        .height('5%')

      TextArea({
        text:'onlyBetweenLines: false',
      })
        .id('TextArea_lineSpacing_false')
        .lineSpacing(LengthMetrics.percent(0.3), { onlyBetweenLines: false })
        .height('5%')

      TextArea({
        text:'TextArea：lineSpacing(default)',
      })
        .id('TextArea_lineSpacing_default')
        .height('5%')

      TextArea({
        text:'TextArea：lineSpacing(undefined)',
      })
        .id('TextArea_lineSpacing_undefined_all')
        .lineSpacing(undefined)
        .height('5%')

      TextArea({
        text:'TextArea：lineSpacing(LengthMetrics.vp(20), undefined)',
      })
        .id('TextArea_lineSpacing_undefined')
        .lineSpacing(LengthMetrics.vp(20), undefined)
        .height('5%')

      TextArea({
        text:'TextAreaModifier: true',
      })
        .attributeModifier(this.TextAreaModifier1)
        .id('TextAreaModifier_lineSpacing_true')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: false',
      })
        .attributeModifier(this.TextAreaModifier2)
        .id('TextAreaModifier_lineSpacing_false')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: undefined',
      })
        .attributeModifier(this.TextAreaModifier3)
        .id('TextAreaModifier_lineSpacing_undefined')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: undefined all',
      })
        .attributeModifier(this.TextAreaModifier4)
        .id('TextAreaModifier_lineSpacing_undefined_all')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}