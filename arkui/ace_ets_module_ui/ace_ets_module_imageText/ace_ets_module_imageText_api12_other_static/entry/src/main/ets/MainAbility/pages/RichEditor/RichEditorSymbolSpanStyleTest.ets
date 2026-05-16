'use static';
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
import {
  Entry,
  Component,
  Column,
  RichEditor,
  RichEditorImageSpanResult,
  RichEditorOptions,
  RichEditorController,
  ClickEvent,
  FontWeight,
  RichEditorTextSpanResult,
  Button,
  Color,
  $r,
  SymbolRenderingStrategy,
  SymbolEffectStrategy
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RichEditorSymbolSpanStyleTest {
  controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      Button('addSymbolSpan1').onClick((e: ClickEvent) => {
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
      Button('addSymbolSpan2').onClick((e: ClickEvent) => {
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
      Button('addSymbolSpan3').onClick((e: ClickEvent) => {
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
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .margin(10)
        .width('95%')
        .backgroundColor('rgb(240,250,255)')
        .id('RichEditorMaxLines')

      Button('获取symbolSpan属性')
        .id('getSymbolSpanStyle')
        .onClick((e: ClickEvent) => {
          this.controller.getSpans({
            start: 0,
          })!.forEach((item) => {
            if (item instanceof RichEditorImageSpanResult && item.imageStyle !== undefined) {
            } else {
              if (item instanceof RichEditorTextSpanResult && item.symbolSpanStyle !== undefined) {
                (item as RichEditorTextSpanResult).symbolSpanStyle?.fontColor
                console.log('fontColor' + (item as RichEditorTextSpanResult).symbolSpanStyle?.fontColor)
                console.log('fontSize' + (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize)
                console.log('fontWeight' + (item as RichEditorTextSpanResult).symbolSpanStyle?.fontWeight)
                console.log('effectStrategy' + (item as RichEditorTextSpanResult).symbolSpanStyle?.effectStrategy)
                console.log('spanIndex' + (item as RichEditorTextSpanResult).spanPosition?.spanIndex)
                console.log('item' + JSON.stringify(item))
                AppStorage.setOrCreate<string>('symbolSpanStyleFontColor',
                 "" + (item as RichEditorTextSpanResult).symbolSpanStyle?.fontColor)
                AppStorage.setOrCreate<string>('symbolSpanStyleFontSize',
                  "" +  (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize)
                AppStorage.setOrCreate<string>('symbolSpanStyleFontWeight',
                  "" +   (item as RichEditorTextSpanResult).symbolSpanStyle?.fontWeight)
                AppStorage.setOrCreate<string>('symbolSpanStyleEffectStrategy',
                  "" +   (item as RichEditorTextSpanResult).symbolSpanStyle?.effectStrategy)
                AppStorage.setOrCreate<string>('symbolSpanStyleSpanIndex',
                  "" +  (item as RichEditorTextSpanResult).spanPosition?.spanIndex)
              } else {
              }
            }
          })
        })
    }
    .height('100%')
  }
}