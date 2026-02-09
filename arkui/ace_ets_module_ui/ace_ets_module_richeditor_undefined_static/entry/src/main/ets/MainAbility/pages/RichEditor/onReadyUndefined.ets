'use static'

import {
  Entry,
  Column,
  Component,
  Button,
  Scroll,
  RichEditor,
  RichEditorController,
  FlexAlign,
  RichEditorOptions,
  Color,
  EnterKeyType,
  Text,
  TextRange,
  RichEditorTextSpanResult,
  CutEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct richEditorExample {
  @State count: int = 0
  @State isOnReady: boolean = true;
  controller: RichEditorController = new RichEditorController();

  build() {
    Scroll() {
      Column() {
        Text('count:' + this.count)
          .id('richEditor_text')

        RichEditor({ controller: this.controller } as RichEditorOptions)
          .id('RichEditor_1')
          .margin(10)
          .border({ width: 1 })
          .height(100)
          .borderWidth(1)
          .borderColor(Color.Red)
          .width('90%')
          .enterKeyType(EnterKeyType.Search)
          .onReady(this.isOnReady ? undefined : () => {
            this.count++;
          })
      }.height('100%')
    }
  }
}