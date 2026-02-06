'use static';
/*
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
import events_emitter from '@ohos.events.emitter';
import { LengthMetrics } from '@ohos.arkui.node'
import {
  Entry,
  MutableStyledString,
  ColorFilter,
  ClickEvent,
  Component,
  RichEditor,
  Column,
  Text,
  ImageSpan,
  Visibility,
  $r,
  FlexAlign,
  HorizontalAlign,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  ColumnOptions,
  ImageAttachment,
  Button,
  Row,
  Margin,
  SymbolGlyphAttribute,
  AttributeModifier,
  SymbolGlyph
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

class SymbolGlyphModifier implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale(undefined)
      .minFontScale(undefined)
  }
}

class SymbolGlyphModifier2 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.string.maxFontScale'))
      .minFontScale($r('app.string.minFontScale'))
  }
}

class SymbolGlyphModifier3 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale(2)
      .minFontScale(0.5)
  }
}

class SymbolGlyphModifier4 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale(0.5)
      .minFontScale(-1)
  }
}

class SymbolGlyphModifier5 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale(0.5)
      .minFontScale(2)
  }
}

class SymbolGlyphModifier6 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.boolean.maxFontScale'))
      .minFontScale($r('app.boolean.minFontScale'))
  }
}

class SymbolGlyphModifier7 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.color.maxFontScale'))
      .minFontScale($r('app.color.minFontScale'))
  }
}

class SymbolGlyphModifier8 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.float.maxFontScale'))
      .minFontScale($r('app.float.minFontScale'))
  }
}

class SymbolGlyphModifier9 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.integer.maxFontScale'))
      .minFontScale($r('app.integer.minFontScale'))
  }
}

class SymbolGlyphModifier10 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.intarray.maxFontScale'))
      .minFontScale($r('app.intarray.minFontScale'))
  }
}

class SymbolGlyphModifier11 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.pattern.maxFontScale'))
      .minFontScale($r('app.pattern.minFontScale'))
  }
}

class SymbolGlyphModifier12 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.plural.maxFontScale'))
      .minFontScale($r('app.plural.minFontScale'))
  }
}

class SymbolGlyphModifier13 implements AttributeModifier<SymbolGlyphAttribute> {
  applyNormalAttribute(instance: SymbolGlyphAttribute): void {
    instance.maxFontScale($r('app.strarray.maxFontScale'))
      .minFontScale($r('app.strarray.minFontScale'))
  }
}

@Entry
@Component
struct symbolGlyphFontScaleTest {

  @State symbolGlyphModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
  @State symbolGlyphModifier2: SymbolGlyphModifier2 = new SymbolGlyphModifier2();
  @State symbolGlyphModifier3: SymbolGlyphModifier3 = new SymbolGlyphModifier3();
  @State symbolGlyphModifier4: SymbolGlyphModifier4 = new SymbolGlyphModifier4();
  @State symbolGlyphModifier5: SymbolGlyphModifier5 = new SymbolGlyphModifier5();
  @State symbolGlyphModifier6: SymbolGlyphModifier6 = new SymbolGlyphModifier6();
  @State symbolGlyphModifier7: SymbolGlyphModifier7 = new SymbolGlyphModifier7();
  @State symbolGlyphModifier8: SymbolGlyphModifier8 = new SymbolGlyphModifier8();
  @State symbolGlyphModifier9: SymbolGlyphModifier9 = new SymbolGlyphModifier9();
  @State symbolGlyphModifier10: SymbolGlyphModifier10 = new SymbolGlyphModifier10();
  @State symbolGlyphModifier11: SymbolGlyphModifier11 = new SymbolGlyphModifier11();
  @State symbolGlyphModifier12: SymbolGlyphModifier12 = new SymbolGlyphModifier12();
  @State symbolGlyphModifier13: SymbolGlyphModifier13 = new SymbolGlyphModifier13();

  build() {
    Column() {
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier)
        .id('symbolGlyph1')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier2)
        .id('symbolGlyph2')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier3)
        .id('symbolGlyph3')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier4)
        .id('symbolGlyph4')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier5)
        .id('symbolGlyph5')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier6)
        .id('symbolGlyph6')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier7)
        .id('symbolGlyph7')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier8)
        .id('symbolGlyph8')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier9)
        .id('symbolGlyph9')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier10)
        .id('symbolGlyph10')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier11)
        .id('symbolGlyph11')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier12)
        .id('symbolGlyph12')
        .height('5%')
        .margin(0)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .attributeModifier(this.symbolGlyphModifier13)
        .id('symbolGlyph13')
        .height('5%')
        .margin(0)

    }
    .height('100%')
  }
}