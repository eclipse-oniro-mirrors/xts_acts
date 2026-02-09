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
  BarState
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyModifier implements AttributeModifier<RichEditorAttribute> {
  public isEnableDataDetector: boolean = true;
  public isEnableHapticFeedback: boolean = true;
  public isEnableKeyboardOnFocus: boolean = true;
  public isKeyboardAppearance: boolean = true;
  public isMaxLength: boolean = true;
  public isMaxLines: boolean = true;
  public isCopyOptions: boolean = true;
  public isOnCopy: boolean = true;
  public isOnDeleteComplete: boolean = true;
  public isOnDidChange: boolean = true;
  public isOnDidIMEInput: boolean = true;
  public isOnIMEInputComplete: boolean = true;
  public isOnEditingChange: boolean = true;
  public isEnterKeyType: boolean = true;
  public isBarState: boolean = true;
  public isEnablePreviewText: boolean = true;
  public cnt: int = 0;
  public cntOnDeleteComplete: int = 0;
  public cntOnDidChange: int = 0;
  public cntOnDidIMEInput: int = 0;
  public cntOnIMEInputComplete: int = 0;
  public cntOnEditingChange: int = 0;

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance
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
        .id('RichEditorM_1')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        }
        )
        .attributeModifier(this.myModifier)

      Row() {
        Text(`copy:${this.myModifier.cnt}`)
          .id('RichEditorM_text')
        Text(`onDeleteComplete:${this.myModifier.cntOnDeleteComplete}`)
          .id('Text_OnDeleteComplete')
      }
      Row() {
        Text(`onDidChange:${this.myModifier.cntOnDidChange}`)
          .id('Text_onDidChange')
        Text(`onDidIMEInput:${this.myModifier.cntOnDidIMEInput}`)
          .id('Text_OnDidIMEInput')
        Text(`onIMEInputComplete:${this.myModifier.cntOnIMEInputComplete}`)
          .id('Text_OnIMEInputComplete')
      }
      Row() {
        Text(`onEditingChange:${this.myModifier.cntOnEditingChange}`)
          .id('Text_OnEditingChange')
      }
      Row() {
        Button('btn1 : ' + this.myModifier.isEnableDataDetector)
          .id('RichEditorM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEnableDataDetector = !this.myModifier.isEnableDataDetector
          })
        Button('btn2 : ' + this.myModifier.isEnableHapticFeedback)
          .id('RichEditorM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEnableHapticFeedback = !this.myModifier.isEnableHapticFeedback
          })
      }

      Row() {
        Button('btn3 : ' + this.myModifier.isEnableKeyboardOnFocus)
          .id('RichEditorM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEnableKeyboardOnFocus = !this.myModifier.isEnableKeyboardOnFocus
          })
        Button('btn4 : ' + this.myModifier.isKeyboardAppearance)
          .id('RichEditorM_btn4')
          .onClick((e: ClickEvent) => {
            this.myModifier.isKeyboardAppearance = !this.myModifier.isKeyboardAppearance
          })
      }

      Row() {
        Button('btn5 : ' + this.myModifier.isMaxLength)
          .id('RichEditorM_btn5')
          .onClick((e: ClickEvent) => {
            this.myModifier.isMaxLength = !this.myModifier.isMaxLength
          })
        Button('btn6 : ' + this.myModifier.isMaxLines)
          .id('RichEditorM_btn6')
          .onClick((e: ClickEvent) => {
            this.myModifier.isMaxLines = !this.myModifier.isMaxLines
          })
        Button('btn7 : ' + this.myModifier.isOnCopy)
          .id('RichEditorM_btn7')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnCopy = !this.myModifier.isOnCopy
          })
      }
      Row() {
        Button('btnOnDeleteComplete : ' + this.myModifier.isOnDeleteComplete)
          .id('Btn_OnDeleteComplete')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnDeleteComplete = !this.myModifier.isOnDeleteComplete
          })
        Button('btnOnDidChange : ' + this.myModifier.isOnDidChange)
          .id('Btn_OnDidChange')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnDidChange = !this.myModifier.isOnDidChange
          })
      }
      Row() {
        Button('btnOnDidIMEInput : ' + this.myModifier.isOnDidIMEInput)
          .id('Btn_OnDidIMEInput')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnDidIMEInput = !this.myModifier.isOnDidIMEInput
          })
        Button('btnOnIMEInputComplete : ' + this.myModifier.isOnIMEInputComplete)
          .id('Btn_OnIMEInputComplete')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnIMEInputComplete = !this.myModifier.isOnIMEInputComplete
          })
      }
      Row() {
        Button('btnOnEditingChange : ' + this.myModifier.isOnEditingChange)
          .id('Btn_OnEditingChange')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnEditingChange = !this.myModifier.isOnEditingChange
          })
        Button('btnCopyOptions : ' + this.myModifier.isCopyOptions)
          .id('Btn_CopyOptions')
          .onClick((e: ClickEvent) => {
            this.myModifier.isCopyOptions = !this.myModifier.isCopyOptions
          })
      }
      Row() {
        Button('btnBarState : ' + this.myModifier.isBarState)
          .id('Btn_BarState')
          .onClick((e: ClickEvent) => {
            this.myModifier.isBarState = !this.myModifier.isBarState
          })
        Button('btnEnablePreviewText : ' + this.myModifier.isEnablePreviewText)
          .id('Btn_EnablePreviewText')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEnablePreviewText = !this.myModifier.isEnablePreviewText
          })
      }
      Row() {
        Button('btnEnterKeyType : ' + this.myModifier.isEnterKeyType)
          .id('Btn_EnterKeyType')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEnterKeyType = !this.myModifier.isEnterKeyType
          })
      }
    }

  }
}