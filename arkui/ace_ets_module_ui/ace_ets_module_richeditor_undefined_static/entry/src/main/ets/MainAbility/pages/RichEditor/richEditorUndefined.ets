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
  RichEditorDeleteValue
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  private controller: RichEditorController = new RichEditorController();
  @State isEnableDataDetector: boolean = false;
  @State isEnableHapticFeedback: boolean = true;
  @State isEnableKeyboardOnFocus: boolean = true;
  @State isKeyboardAppearance: boolean = true;
  @State isMaxLength: boolean = true;
  @State isMaxLines: boolean = true;
  @State isCopyOptions: boolean = true;
  @State isOnCopy: boolean = true;
  @State isOnDeleteComplete: boolean = true;
  @State isOnDidChange: boolean = true;
  @State isOnDidIMEInput: boolean = true;
  @State isOnIMEInputComplete: boolean = true;
  @State isOnEditingChange: boolean = true;
  @State isAboutToDelete: boolean = true;
  @State isEnterKeyType: boolean = true;
  @State isBarState: boolean = true;
  @State isEnablePreviewText: boolean = true;
  @State cnt: int = 0;
  @State cntOnDeleteComplete: int = 0;
  @State cntOnDidChange: int = 0;
  @State cntOnDidIMEInput: int = 0;
  @State cntOnIMEInputComplete: int = 0;
  @State cntOnEditingChange: int = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditor_1')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        }
        )
        .enableDataDetector(this.isEnableDataDetector ? undefined : true)
        .enableHapticFeedback(this.isEnableHapticFeedback ? undefined : false)
        .enableKeyboardOnFocus(this.isEnableKeyboardOnFocus ? undefined : false)
        .keyboardAppearance(this.isKeyboardAppearance ? undefined : KeyboardAppearance.DARK_IMMERSIVE)
        .maxLength(this.isMaxLength ? undefined : 10)
        .maxLines(this.isMaxLines ? undefined : 3)
        .copyOptions(this.isCopyOptions ? undefined : CopyOptions.None)
        .enterKeyType(this.isEnterKeyType ? undefined : EnterKeyType.Search)
        .barState(this.isBarState ? undefined : BarState.On)
        .enablePreviewText(this.isEnablePreviewText ? undefined : false)
        .onCopy(this.isOnCopy ? undefined : (event: CopyEvent) => {
          this.cnt++;
        })
        .onDeleteComplete(this.isOnDeleteComplete ? undefined : () => {
          this.cntOnDeleteComplete++;
        })
        .onDidChange(this.isOnDidChange ? undefined : (rangeBefore: TextRange, rangeAfter: TextRange) => {
          this.cntOnDidChange++;
        })
        .onDidIMEInput(this.isOnDidIMEInput ? undefined : (value: TextRange) => {
          this.cntOnDidIMEInput++;
        })
        .onIMEInputComplete(this.isOnIMEInputComplete ? undefined : (value: RichEditorTextSpanResult) => {
          this.cntOnIMEInputComplete++;
        })
        .onEditingChange(this.isOnEditingChange ? undefined : () => {
          this.cntOnEditingChange++;
        })
      Row() {
        Text(`copy:${this.cnt}`)
          .id('RichEditor_text')
        Text(`onDeleteComplete:${this.cntOnDeleteComplete}`)
          .id('Text_OnDeleteComplete')
      }
      Row() {
        Text(`onDidChange:${this.cntOnDidChange}`)
          .id('Text_OnDidChange')
        Text(`onDidIMEInput:${this.cntOnDidIMEInput}`)
          .id('Text_OnDidIMEInput')
        Text(`onIMEInputComplete:${this.cntOnIMEInputComplete}`)
          .id('Text_OnIMEInputComplete')
      }
      Row() {
        Text(`onEditingChange:${this.cntOnEditingChange}`)
          .id('Text_OnEditingChange')
      }
      Row() {
        Button('btn1 : ' + this.isEnableDataDetector)
          .id('RichEditor_btn1')
          .onClick((e: ClickEvent) => {
            this.isEnableDataDetector = !this.isEnableDataDetector
          })
        Button('btn2 : ' + this.isEnableHapticFeedback)
          .id('RichEditor_btn2')
          .onClick((e: ClickEvent) => {
            this.isEnableHapticFeedback = !this.isEnableHapticFeedback
          })
      }

      Row() {
        Button('btn3 : ' + this.isEnableKeyboardOnFocus)
          .id('RichEditor_btn3')
          .onClick((e: ClickEvent) => {
            this.isEnableKeyboardOnFocus = !this.isEnableKeyboardOnFocus
          })
        Button('btn4 : ' + this.isKeyboardAppearance)
          .id('RichEditor_btn4')
          .onClick((e: ClickEvent) => {
            this.isKeyboardAppearance = !this.isKeyboardAppearance
          })
        Button('btn5 : ' + this.isMaxLength)
          .id('RichEditor_btn5')
          .onClick((e: ClickEvent) => {
            this.isMaxLength = !this.isMaxLength
          })
      }

      Row() {
        Button('btn6 : ' + this.isMaxLines)
          .id('RichEditor_btn6')
          .onClick((e: ClickEvent) => {
            this.isMaxLines = !this.isMaxLines
          })
        Button('btn7 : ' + this.isOnCopy)
          .id('RichEditor_btn7')
          .onClick((e: ClickEvent) => {
            this.isOnCopy = !this.isOnCopy
          })
      }
      Row() {
        Button('btnEnterKeyType : ' + this.isEnterKeyType)
          .id('Btn_EnterKeyType')
          .onClick((e: ClickEvent) => {
            this.isEnterKeyType = !this.isEnterKeyType
          })
        Button('btnOnDeleteComplete : ' + this.isOnDeleteComplete)
          .id('Btn_OnDeleteComplete')
          .onClick((e: ClickEvent) => {
            this.isOnDeleteComplete = !this.isOnDeleteComplete
          })
      }
      Row() {
        Button('btnOnDidChange : ' + this.isOnDidChange)
          .id('Btn_OnDidChange')
          .onClick((e: ClickEvent) => {
            this.isOnDidChange = !this.isOnDidChange
          })
        Button('btnOnDidIMEInput : ' + this.isOnDidIMEInput)
          .id('Btn_OnDidIMEInput')
          .onClick((e: ClickEvent) => {
            this.isOnDidIMEInput = !this.isOnDidIMEInput
          })
      }
      Row() {
        Button('btnOnIMEInputComplete : ' + this.isOnIMEInputComplete)
          .id('Btn_OnIMEInputComplete')
          .onClick((e: ClickEvent) => {
            this.isOnIMEInputComplete = !this.isOnIMEInputComplete
          })
        Button('btnOnEditingChange : ' + this.isOnEditingChange)
          .id('Btn_OnEditingChange')
          .onClick((e: ClickEvent) => {
            this.isOnEditingChange = !this.isOnEditingChange
          })
      }
      Row() {
        Button('btnCopyOptions : ' + this.isCopyOptions)
          .id('Btn_CopyOptions')
          .onClick((e: ClickEvent) => {
            this.isCopyOptions = !this.isCopyOptions
          })
        Button('btnBarState : ' + this.isBarState)
          .id('Btn_BarState')
          .onClick((e: ClickEvent) => {
            this.isBarState = !this.isBarState
          })
      }
      Row() {
        Button('btnEnablePreviewText : ' + this.isEnablePreviewText)
          .id('Btn_EnablePreviewText')
          .onClick((e: ClickEvent) => {
            this.isEnablePreviewText = !this.isEnablePreviewText
          })
      }
    }

  }
}