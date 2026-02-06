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
import { Entry, Component, RichEditorController,RichEditorOptions,Builder,
  Text,Column,RichEditorTextSpanResult,ClickEvent,ColumnOptions,RichEditor,
  Button,RichEditorSpanType,RichEditorResponseType,Color,$r,SymbolRenderingStrategy,
  SymbolEffectStrategy,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RichEditorApi22Com {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  controller2: RichEditorController = new RichEditorController();
  options2: RichEditorOptions = { controller: this.controller2 } as RichEditorOptions;
  @State text1: string = '';
  @State text2: string = '';
  @State text3: string = '';

  @Builder
  panel() {
    Text("Select")
      .borderWidth(1)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {

      Text(this.text1).id('RichEditorApi2_text1')

      RichEditor(this.options)
        .id('RichEditorApi2_RichEditor1')
        .onReady(():void => {
          this.controller.addTextSpan('paragraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraph')
        })
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, RichEditorResponseType.SELECT, {
          onAppear: () => {
            this.text1 = 'SelectMenuAppear'
          }
        })
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')

      Button('getSpans')
        .id('RichEditorApi2_getSpans')
        .onClick((e:ClickEvent) => {
          this.controller2!.getSpans()!
            .forEach(item => {
              if (typeof ((item as RichEditorTextSpanResult).symbolSpanStyle) != 'undefined') {
                this.text2 += (item as RichEditorTextSpanResult).symbolSpanStyle?.renderingStrategy
                this.text3 += (item as RichEditorTextSpanResult).symbolSpanStyle?.effectStrategy
              }
            })

        })

      Text(`renderingStrategy:${this.text2},effectStrategy:${this.text3}`).id('RichEditorApi2_text2')

      RichEditor(this.options2)
        .id('RichEditorApi2_RichEditor2')
        .onReady(():void => {
          this.controller2.addSymbolSpan($r("sys.symbol.ohos_trash"),
            {
              style:
              {
                renderingStrategy: SymbolRenderingStrategy.SINGLE,
                effectStrategy: SymbolEffectStrategy.NONE
              }
            })
        })
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')

    }.width('100%')
  }
}
