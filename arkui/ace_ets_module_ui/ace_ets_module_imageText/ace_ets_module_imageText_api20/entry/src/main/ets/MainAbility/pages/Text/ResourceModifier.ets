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
import { TextModifier, SpanModifier, TextAreaModifier, TextInputModifier, SearchModifier } from '@kit.ArkUI';

class MyTextModifier1 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance
      .baselineOffset($r('app.float.Text_baseline'))
      .letterSpacing($r('app.float.TextInput_letterSpacing'))
      .fontWeight($r('app.float.Text_fontWeight'))
  }
}
class MyTextModifier2 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance
      .baselineOffset($r('app.string.Text_baseline_str'))
      .letterSpacing($r('app.string.TextInput_letterSpacing_str'))
      .fontWeight($r('app.string.Text_fontWeight'))
  }
}
class MyTextModifier3 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance
      .baselineOffset($r('app.float.Text_baseline2'))
      .letterSpacing($r('app.float.TextInput_letterSpacing2'))
      .fontWeight($r('app.string.Text_fontWeight2'))
  }
}

class MySpanModifier1 extends SpanModifier {
  applyNormalAttribute(instance: SpanModifier): void {
    instance
      .letterSpacing($r('app.float.TextInput_letterSpacing'))
      .fontWeight($r('app.float.Text_fontWeight'))
  }
}
class MySpanModifier2 extends SpanModifier {
  applyNormalAttribute(instance: SpanModifier): void {
    instance
      .letterSpacing($r('app.string.TextInput_letterSpacing_str'))
      .fontWeight($r('app.string.Text_fontWeight'))
  }
}
class MySpanModifier3 extends SpanModifier {
  applyNormalAttribute(instance: SpanModifier): void {
    instance
      .letterSpacing($r('app.float.TextInput_letterSpacing2'))
      .fontWeight($r('app.string.Text_fontWeight2'))
  }
}

class MyTextInputModifier1 extends TextInputModifier {
  applyNormalAttribute(instance: TextInputModifier): void {
    instance
      .fontWeight($r('app.float.Text_fontWeight'))
  }
}
class MyTextInputModifier2 extends TextInputModifier {
  applyNormalAttribute(instance: TextInputModifier): void {
    instance
      .fontWeight($r('app.string.Text_fontWeight'))
  }
}
class MyTextInputModifier3 extends TextInputModifier {
  applyNormalAttribute(instance: TextInputModifier): void {
    instance
      .fontWeight($r('app.string.Text_fontWeight2'))
  }
}

class MyTextAreaModifier1 extends TextAreaModifier {
  applyNormalAttribute(instance: TextAreaModifier): void {
    instance
      .fontWeight($r('app.float.Text_fontWeight'))
  }
}
class MyTextAreaModifier2 extends TextAreaModifier {
  applyNormalAttribute(instance: TextAreaModifier): void {
    instance
      .fontWeight($r('app.string.Text_fontWeight'))
  }
}
class MyTextAreaModifier3 extends TextAreaModifier {
  applyNormalAttribute(instance: TextAreaModifier): void {
    instance
      .fontWeight($r('app.string.Text_fontWeight2'))
  }
}

class MySearchModifier1 extends SearchModifier {
  applyNormalAttribute(instance: SearchModifier): void {
    instance
      .searchButton($r('app.string.Search_searchButton'))
  }
}
class MySearchModifier2 extends SearchModifier {
  applyNormalAttribute(instance: SearchModifier): void {
    instance
      .searchButton($r('app.string.Search_searchButton_Chinese'))
  }
}
class MySearchModifier3 extends SearchModifier {
  applyNormalAttribute(instance: SearchModifier): void {
    instance
      .searchButton($r('app.float.SearchButton_num'))
  }
}

@Entry
@Component
struct ResourceModifierPage {
  @State MyTextModifier:(MyTextModifier1|MyTextModifier2|MyTextModifier3)[] = [
    new MyTextModifier1(),new MyTextModifier2(),new MyTextModifier3()]
  @State MySpanModifier:(MySpanModifier1|MySpanModifier2|MySpanModifier3)[] = [
    new MySpanModifier1(),new MySpanModifier2(),new MySpanModifier3()]
  @State MyTextInputModifier:(MyTextInputModifier1|MyTextInputModifier2|MyTextInputModifier2)[] = [
    new MyTextInputModifier1(),new MyTextInputModifier2(),new MyTextInputModifier3()]
  @State MyTextAreaModifier:(MyTextAreaModifier1|MyTextAreaModifier2|MyTextAreaModifier3)[] = [
    new MyTextAreaModifier1(),new MyTextAreaModifier2(),new MyTextAreaModifier3()]
  @State MySearchModifier:(MySearchModifier1|MySearchModifier2|MySearchModifier3)[] = [
    new MySearchModifier1(),new MySearchModifier2(),new MySearchModifier3()]
  @State MyModifierIndex:number =0

  build() {
    Column() {
      // 文本组件
      Text('测试BaselineOffset_LetterSpacing_FontWeight')
        .width('95%')
        .height('10%')
        .backgroundColor('#fff5b6b6')
        .attributeModifier(this.MyTextModifier[this.MyModifierIndex])
        .id('Text_Modifier')
      // 输入框
      TextInput({ placeholder: 'TextInput_fontWeight' })
        .width('95%')
        .height('10%')
        .margin(20)
        .attributeModifier(this.MyTextInputModifier[this.MyModifierIndex])
        .id('TextInput_Modifier')
      // 文本域
      TextArea({ text: 'TextArea_fontWeight' })
        .width(300)
        .backgroundColor('#b782f1ab')
        .attributeModifier(this.MyTextAreaModifier[this.MyModifierIndex])
        .height('10%')
        .id('TextArea_Modifier')
      // 富文本段落
      Text() {
        Span('Span_fontWeight_letterSpacing')
          .attributeModifier(this.MySpanModifier[this.MyModifierIndex])
          .id('Span_Modifier')
      }
      .height('10%')
      .width('100%')
      .backgroundColor('#fab7a9f6');
      // 搜索组件
      Search()
        .width('95%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .attributeModifier(this.MySearchModifier[this.MyModifierIndex])
        .id('Search_Modifier')

      Button('change')
        .onClick(() =>{
          this.MyModifierIndex++
        })
        .fontSize(20)
        .id('change_Modifier')
        .height('5%')

      Button('get')
        .onClick(()=>{
          let TextJson = getInspectorByKey('Text_Modifier');
          let TextObj: ESObject = JSON.parse(TextJson);
          AppStorage.setOrCreate('TextLetterSpacing',TextObj.$attrs.letterSpacing)
          AppStorage.setOrCreate('TextBaselineOffset',TextObj.$attrs.baselineOffset)
          AppStorage.setOrCreate('TextFontWeight',TextObj.$attrs.fontWeight)
          console.log('TextObj--letterSpacing:' + TextObj.$attrs.letterSpacing);
          console.log('TextObj--baselineOffset:' + TextObj.$attrs.baselineOffset);
          console.log('TextObj--fontWeight:' + TextObj.$attrs.fontWeight);
          let TextInputJson = getInspectorByKey('TextInput_Modifier');
          let TextInputObj: ESObject = JSON.parse(TextInputJson);
          AppStorage.setOrCreate('TextInputFontWeight',TextInputObj.$attrs.fontWeight)
          console.log('TextInputObj--fontWeight:' + TextInputObj.$attrs.fontWeight);
          let TextAreaJson = getInspectorByKey('TextArea_Modifier');
          let TextAreaObj: ESObject = JSON.parse(TextAreaJson);
          AppStorage.setOrCreate('TextAreaFontWeight',TextAreaObj.$attrs.fontWeight)
          console.log('TextAreaObj--fontWeight:' + TextAreaObj.$attrs.fontWeight);
          let SpanJson = getInspectorByKey('Span_Modifier');
          let SpanObj: ESObject = JSON.parse(SpanJson);
          AppStorage.setOrCreate('SpanLetterSpacing',SpanObj.$attrs.letterSpacing)
          AppStorage.setOrCreate('SpanFontWeight',SpanObj.$attrs.fontWeight)
          console.log('SpanObj--letterSpacing:' + SpanObj.$attrs.letterSpacing);
          console.log('SpanObj--fontWeight:' + SpanObj.$attrs.fontWeight);
          let SearchJson = getInspectorByKey('Search_Modifier');
          let SearchObj: ESObject = JSON.parse(SearchJson);
          AppStorage.setOrCreate('SearchSearchButton',SearchObj.$attrs.searchButton)
          console.log('SearchObj--searchButton:' + SearchObj.$attrs.searchButton);
        })
        .height('5%')
        .id('getObj_Modifier')
    }.height('100%').width('100%');
  }
}
