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
struct RichEditorSymbolSpanStyleTest {
  controller: RichEditorController = new RichEditorController();
  build() {
    Column() {
      Button('addSymbolSpan1').onClick(() => {
        this.controller.addSymbolSpan($r('sys.symbol.ohos_lungs'),
          {
            offset: 10,
            style: {
              fontColor: [Color.Red],
              fontSize: 30,
              fontWeight: 200,
              renderingStrategy: SymbolRenderingStrategy.SINGLE,
              effectStrategy: SymbolEffectStrategy.NONE
            }
          })
      })
        .id('addSymbolSpan1')
        .height('5%')
      Button('addSymbolSpan2').onClick(() => {
        this.controller.addSymbolSpan($r('sys.symbol.ohos_wifi'),
          {
            offset: 20,
            style: {
              fontColor: [Color.Red, Color.Blue, Color.Pink],
              fontSize: '40',
              fontWeight: FontWeight.Normal,
              renderingStrategy: SymbolRenderingStrategy.MULTIPLE_COLOR,
              effectStrategy: SymbolEffectStrategy.SCALE
            }
          })
      })
        .id('addSymbolSpan2')
        .height('5%')
      Button('addSymbolSpan3').onClick(() => {
        this.controller.addSymbolSpan($r('sys.symbol.ohos_lock'),
          {
            offset: 30,
            style: {
              fontColor: [$r('app.color.red'), Color.Blue, Color.Pink],
              fontSize: $r('app.string.fontSize'),
              fontWeight: '900',
              renderingStrategy: SymbolRenderingStrategy.MULTIPLE_OPACITY,
              effectStrategy: SymbolEffectStrategy.HIERARCHICAL
            }
          })
      })
        .id('addSymbolSpan3')
        .height('5%')
      RichEditor({ controller: this.controller })
        .margin(10)
        .width('95%')
        .backgroundColor('rgb(240,250,255)')
        .id('RichEditorMaxLines')

      Button('获取symbolSpan属性')
        .id('getSymbolSpanStyle')
        .onClick(() => {
          this.controller.getSpans({
            start: 0,
          }).forEach((item) => {
            if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
            } else {
              if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                (item as RichEditorTextSpanResult).symbolSpanStyle?.fontColor
                console.log('fontColor'+(item as RichEditorTextSpanResult).symbolSpanStyle?.fontColor)
                console.log('fontSize'+(item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize)
                console.log('fontWeight'+(item as RichEditorTextSpanResult).symbolSpanStyle?.fontWeight)
                console.log('effectStrategy'+(item as RichEditorTextSpanResult).symbolSpanStyle?.effectStrategy)
                console.log('spanIndex'+(item as RichEditorTextSpanResult).spanPosition?.spanIndex)
                console.log('item'+JSON.stringify(item))
                AppStorage.setOrCreate('symbolSpanStyleFontColor',(item as RichEditorTextSpanResult).symbolSpanStyle?.fontColor)
                AppStorage.setOrCreate('symbolSpanStyleFontSize',(item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize)
                AppStorage.setOrCreate('symbolSpanStyleFontWeight',(item as RichEditorTextSpanResult).symbolSpanStyle?.fontWeight)
                AppStorage.setOrCreate('symbolSpanStyleEffectStrategy',(item as RichEditorTextSpanResult).symbolSpanStyle?.effectStrategy)
                AppStorage.setOrCreate('symbolSpanStyleSpanIndex',(item as RichEditorTextSpanResult).spanPosition?.spanIndex)
              }else {
              }
            }
          })
        })
    }
    .height('100%')
  }
}