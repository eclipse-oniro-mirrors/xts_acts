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

@Entry
@Component
struct ResourceNormalPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State dynamicLetterSpacing: (Resource | null | undefined)[] = [
    $r('app.float.TextInput_letterSpacing'),
    $r('app.string.TextInput_letterSpacing_str'),
    $r('app.float.TextInput_letterSpacing2'),
    $r('app.float.TextInput_letterSpacing3'),
    $r('app.float.TextInput_letterSpacing_negativeNumber'),
    $r('app.string.TextInput_letterSpacing_str2'),
    $r('app.string.TextInput_letterSpacing_str3'),
    $r('app.string.TextInput_letterSpacing_str4'),
    $r('app.string.TextInput_letterSpacing_negativeNumber'), undefined, null]
  @State dynamicLetterSpacingIndex: number = 0
  @State dynamicBaselineOffset: (Resource | null | undefined)[] = [
    $r('app.float.Text_baseline'),
    $r('app.string.Text_baseline_str'),
    $r('app.float.Text_baseline2'),
    $r('app.float.Text_baseline3'),
    $r('app.float.Text_baseline_negativeNumber'),
    $r('app.string.Text_baseline_str2'),
    $r('app.string.Text_baseline_str3'),
    $r('app.string.Text_baseline_str4'),
    $r('app.string.Text_baseline_negativeNumber'), undefined, null]
  @State dynamicBaselineOffsetIndex: number = 0
  @State dynamicFontWeight: (Resource | null | undefined)[] = [
    $r('app.float.Text_fontWeight3'),
    $r('app.string.Text_fontWeight'),
    $r('app.string.Text_fontWeight2'),
    $r('app.string.Text_fontWeight3'),
    $r('app.string.Text_fontWeight4'),
    $r('app.string.Text_fontWeight_negativeNumber'),
    $r('app.string.Text_fontWeight_str'), undefined, null]
  @State dynamicFontWeightIndex: number = 0
  @State dynamicSearchButton: (Resource | null | undefined)[] = [
    $r('app.string.Search_searchButton'),
    $r('app.string.Search_searchButton_Chinese'),
    $r('app.float.SearchButton_num'), undefined, null]
  @State dynamicSearchButtonIndex: number = 0
  @State dynamicSearch: (Resource | null | undefined)[] = [
    $r('app.string.Search_Create'),$r('app.string.Search_searchButton_En'), undefined, null]
  @State dynamicSearchIndex: number = 0
  controller: RichEditorController = new RichEditorController()
  options: RichEditorOptions = { controller: this.controller }
  @State dynamicAddTextSpan: (Resource | null | undefined)[] = [
    $r('app.string.RichEditor_addTextSpan_two'),
    $r('app.string.RichEditor_addTextSpan'),
    $r('app.float.RichEditor_addTextSpan_num'), undefined, null]
  @State dynamicAddTextSpanIndex: number = 0

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan(this.dynamicAddTextSpan[this.dynamicAddTextSpanIndex], {
            style: {
              fontColor: Color.Black,
              fontSize: 15,
              fontWeight: 400
            }
          })
        })
        .height('10%')

      Text('测试BaselineOffset_LetterSpacing_FontWeight')
        .width('95%')
        .height('10%')
        .backgroundColor('#fff5b6b6')
        .letterSpacing(this.dynamicLetterSpacing[this.dynamicLetterSpacingIndex])
        .baselineOffset(this.dynamicBaselineOffset[this.dynamicBaselineOffsetIndex])
        .fontWeight(this.dynamicFontWeight[this.dynamicFontWeightIndex])
        .id('Text_Resource')

      TextInput({ placeholder: 'TextInput_fontWeight' })
        .width('95%')
        .height('10%')
        .fontWeight(this.dynamicFontWeight[this.dynamicFontWeightIndex])
        .id('TextInput_Resource')

      TextArea({ text: 'TextArea_fontWeight' })
        .width(300)
        .backgroundColor('#b782f1ab')
        .fontWeight(this.dynamicFontWeight[this.dynamicFontWeightIndex])
        .height('10%')
        .id('TextArea_Resource')

      Text() {
        Span('Span_fontWeight_letterSpacing')
          .fontWeight(this.dynamicFontWeight[this.dynamicFontWeightIndex])
          .letterSpacing(this.dynamicLetterSpacing[this.dynamicLetterSpacingIndex])
          .id('Span_Resource')
      }
      .height('10%')
      .width('100%')
      .backgroundColor('#fab7a9f6')

      Search({ value: this.dynamicSearch[this.dynamicSearchIndex] })
        .searchButton(this.dynamicSearchButton[this.dynamicSearchButtonIndex])
        .width('95%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .id('Search_Resource')


      Button('change')
        .onClick(() => {
          //更改LetterSpacing
          this.dynamicLetterSpacingIndex++
          if (this.dynamicLetterSpacingIndex > (this.dynamicLetterSpacing.length - 1)) {
            this.dynamicLetterSpacingIndex = 0
          }
          //更改BaselineOffset
          this.dynamicBaselineOffsetIndex++
          if (this.dynamicBaselineOffsetIndex > (this.dynamicBaselineOffset.length - 1)) {
            this.dynamicBaselineOffsetIndex = 0
          }
          //更改FontWeight
          this.dynamicFontWeightIndex++
          if (this.dynamicFontWeightIndex > (this.dynamicFontWeight.length - 1)) {
            this.dynamicFontWeightIndex = 0
          }
          //更改SearchButton
          this.dynamicSearchButtonIndex++
          if (this.dynamicSearchButtonIndex > (this.dynamicSearchButton.length - 1)) {
            this.dynamicSearchButtonIndex = 0
          }
          //更改Search内容
          this.dynamicSearchIndex++
          if (this.dynamicSearchIndex > (this.dynamicSearch.length - 1)) {
            this.dynamicSearchIndex = 0
          }
          //更改AddTextSpan
          this.dynamicAddTextSpanIndex++
          if (this.dynamicAddTextSpanIndex > (this.dynamicAddTextSpan.length - 1)) {
            this.dynamicAddTextSpanIndex = 0
          }
          this.controller.deleteSpans()
          this.controller.addTextSpan(this.dynamicAddTextSpan[this.dynamicAddTextSpanIndex], {
            style: {
              fontColor: Color.Black,
              fontSize: 15,
              fontWeight: 400
            }
          })
        })
        .fontSize(20)
        .height('5%')
        .id('change_Resource')
      Button('get').onClick(()=>{
        this.controller.getSpans({
          start: -1,
          end: -1
        }).forEach(item => {
          if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
          } else {
            if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
            }else {
              AppStorage.setOrCreate('RichEditorValue',(item as RichEditorTextSpanResult).value)
              console.log('RichEditorValue'+(item as RichEditorTextSpanResult).value)
            }
          }
        })
        let TextJson = getInspectorByKey('Text_Resource');
        let TextObj: ESObject = JSON.parse(TextJson);
        AppStorage.setOrCreate('TextLetterSpacing',TextObj.$attrs.letterSpacing)
        AppStorage.setOrCreate('TextBaselineOffset',TextObj.$attrs.baselineOffset)
        AppStorage.setOrCreate('TextFontWeight',TextObj.$attrs.fontWeight)
        console.log('TextObj--letterSpacing:' + TextObj.$attrs.letterSpacing);
        console.log('TextObj--baselineOffset:' + TextObj.$attrs.baselineOffset);
        console.log('TextObj--fontWeight:' + TextObj.$attrs.fontWeight);
        let TextInputJson = getInspectorByKey('TextInput_Resource');
        let TextInputObj: ESObject = JSON.parse(TextInputJson);
        AppStorage.setOrCreate('TextInputFontWeight',TextInputObj.$attrs.fontWeight)
        console.log('TextInputObj--fontWeight:' + TextInputObj.$attrs.fontWeight);
        let TextAreaJson = getInspectorByKey('TextArea_Resource');
        let TextAreaObj: ESObject = JSON.parse(TextAreaJson);
        AppStorage.setOrCreate('TextAreaFontWeight',TextAreaObj.$attrs.fontWeight)
        console.log('TextAreaObj--fontWeight:' + TextAreaObj.$attrs.fontWeight);
        let SpanJson = getInspectorByKey('Span_Resource');
        let SpanObj: ESObject = JSON.parse(SpanJson);
        AppStorage.setOrCreate('SpanLetterSpacing',SpanObj.$attrs.letterSpacing)
        AppStorage.setOrCreate('SpanFontWeight',SpanObj.$attrs.fontWeight)
        console.log('SpanObj--letterSpacing:' + SpanObj.$attrs.letterSpacing);
        console.log('SpanObj--fontWeight:' + SpanObj.$attrs.fontWeight);
        let SearchJson = getInspectorByKey('Search_Resource');
        let SearchObj: ESObject = JSON.parse(SearchJson);
        AppStorage.setOrCreate('SearchSearchButton',SearchObj.$attrs.searchButton)
        AppStorage.setOrCreate('SearchValue',SearchObj.$attrs.value)
        console.log('SearchObj--searchButton:' + SearchObj.$attrs.searchButton);
        console.log('SearchObj--value:' + SearchObj.$attrs.value);
      })
        .height('5%')
        .id('getObj_Resource')
    }.height('100%').width('100%')
  }
}