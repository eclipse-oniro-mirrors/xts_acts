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
  AttributeModifier,
  RichEditorAttribute,
  TextRange,
  RichEditorTextSpanResult,
  CopyOptions,
  BarState,
  RichEditorDeleteValue,
  RichEditorInsertValue
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyModifier implements AttributeModifier<RichEditorAttribute> {
  public isAboutToDelete: boolean = true;
  public isAboutToIMEInput: boolean = true;
  public isOnCut: boolean = true;
  public cntAboutToDelete: int = 0;
  public cntAboutToIMEInput: int = 0;
  public cntCut: int = 0;

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct Index {
  private controller: RichEditorController = new RichEditorController();
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditorM_3')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        }
        )
        .attributeModifier(this.myModifier)

      Row() {
        Text(`aboutToDelete:${this.myModifier.cntAboutToDelete}`)
          .id('Text_AboutToDelete')
        Text(`aboutToIMEInput:${this.myModifier.cntAboutToIMEInput}`)
          .id('Text_AboutToIMEInput')
        Text(`cut:${this.myModifier.cntCut}`)
          .id('RichEditor_text_OnCut')
      }
      Column() {
        Button('btnAboutToDelete : ' + this.myModifier.isAboutToDelete)
          .id('Btn_AboutToDelete')
          .onClick((e: ClickEvent) => {
            this.myModifier.isAboutToDelete = !this.myModifier.isAboutToDelete
          })
        Button('btnAboutToIMEInput : ' + this.myModifier.isAboutToIMEInput)
          .id('Btn_AboutToIMEInput')
          .onClick((e: ClickEvent) => {
            this.myModifier.isAboutToIMEInput = !this.myModifier.isAboutToIMEInput
          })
        Button('btnOnCut : ' + this.myModifier.isOnCut)
          .id('RichEditor_btn_OnCut')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnCut = !this.myModifier.isOnCut
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