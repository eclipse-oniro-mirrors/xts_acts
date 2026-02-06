'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  RichEditor,
  RichEditorController,
  CopyEvent,
  CutEvent,
  KeyboardAppearance,
  EnterKeyType,
  RichEditorOptions,
  TextRange,
  RichEditorTextSpanResult,
  CopyOptions,
  BarState,
  RichEditorDeleteValue,
  RichEditorInsertValue,
  Grid,
  ForEach,
  GridItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  private controller: RichEditorController = new RichEditorController();
  @State isAboutToDelete: boolean = true;
  @State isAboutToIMEInput: boolean = true;
  @State isOnCut: boolean = true;
  @State cntAboutToDelete: int = 0;
  @State cntAboutToIMEInput: int = 0;
  @State cntCut: int = 0;
  @State message: string = 'hello';

  build() {
    Column({ space: 10 } as ColumnOptions) {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditor_3')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        }
        )
        .aboutToDelete(this.isAboutToDelete ? undefined : (value: RichEditorDeleteValue) => {
          this.cntAboutToDelete++;
          return true;
        })
        .aboutToIMEInput(this.isAboutToIMEInput ? undefined : (value: RichEditorInsertValue) => {
          this.cntAboutToIMEInput++;
          return true;
        })
        .onCut(this.isOnCut ? undefined : (event: CutEvent) => {
          this.cntCut++;
        })
      Row() {
        Text(`aboutToDelete:${this.cntAboutToDelete}`)
          .id('Text_AboutToDelete')
        Text(`aboutToIMEInput:${this.cntAboutToIMEInput}`)
          .id('Text_AboutToIMEInput')
        Text(`cut:${this.cntCut}`)
          .id('RichEditor_text_OnCut')
      }
      Column() {
        Button('btnAboutToDelete : ' + this.isAboutToDelete)
          .id('Btn_AboutToDelete')
          .onClick((e: ClickEvent) => {
            this.isAboutToDelete = !this.isAboutToDelete
          })
        Button('btnAboutToIMEInput : ' + this.isAboutToIMEInput)
          .id('Btn_AboutToIMEInput')
          .onClick((e: ClickEvent) => {
            this.isAboutToIMEInput = !this.isAboutToIMEInput
          })
        Button('btnOnCut : ' + this.isOnCut)
          .id('RichEditor_btn_OnCut')
          .onClick((e: ClickEvent) => {
            this.isOnCut = !this.isOnCut
          })
      }
      Row() {
        Button('setCaretOffset')
          .id('RichEditor_setCaretOffset')
          .onClick((e: ClickEvent) => {
            this.controller.setCaretOffset(3);
          })
      }
    }

  }
}