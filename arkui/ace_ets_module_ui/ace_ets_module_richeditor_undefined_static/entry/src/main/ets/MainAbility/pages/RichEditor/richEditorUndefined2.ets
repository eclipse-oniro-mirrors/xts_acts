'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Scroll,
  Component,
  Color,
  Margin,
  Button,
  ClickEvent,
  RichEditorOptions,
  FlexAlign,
  ResourceColor,
  Curve,
  TextAlign,
  IDataSource,
  CopyEvent,
  DataChangeListener,
  RichEditor,
  RichEditorController,
  RichEditorSelection,
  EnterKeyType,
  SubmitEvent,
  RichEditorChangeValue
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct SoftKeyboardEnterTypeExample {
  controller: RichEditorController = new RichEditorController();
  @State message: string = 'hello';
  @State isStopBackPress: boolean = true;
  @State isOnSelect: boolean = true;
  @State isOnSubmit: boolean = true;
  @State isOnPaste: boolean = true;
  @State isPlaceholder: boolean = true;
  @State isOnSelectionChange: boolean = false;
  @State isOnWillChange: boolean = false;
  @State startMessage: string = 'Hello World';

  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditor')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        })
        .stopBackPress(this.isStopBackPress ? false : undefined)
        .onSelect(this.isOnSelect ? (value: RichEditorSelection) => {
          this.message = 'onSelect'
        } : undefined)
        .onSubmit(this.isOnSubmit ? (enterKey: EnterKeyType, event: SubmitEvent) => {
          this.message = 'onSubmit'
        } : undefined)
        .placeholder(this.isPlaceholder ? undefined : 'hello')
        .onPaste(this.isOnPaste ? () => {
          this.message = 'onPaste'
        } : undefined)
        .onSelectionChange(this.isOnSelectionChange ? () => {
          this.message = 'onSelectionChange'
        } : undefined)
        .onWillChange(this.isOnWillChange ? (value: RichEditorChangeValue) => {
          this.message = 'onWillChange';
          return true;
        } : undefined)
        .height('20%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .width('100%')

      Text(this.message)
        .id('RichEditor_text')
      Row() {
        Button('resetText')
          .id('RichEditor_resetText')
          .onClick((e: ClickEvent) => {
            this.message = 'hello';
          })
        Button('setCaretOffset')
          .id('RichEditor_setCaretOffset')
          .onClick((e: ClickEvent) => {
            this.controller.setCaretOffset(3);
          })
        Button('isStopBackPress: ' + this.isStopBackPress)
          .id('RichEditor_stopBackPress')
          .onClick((e: ClickEvent) => {
            this.isStopBackPress = !this.isStopBackPress
          })
      }

      Row() {
        Button('isOnSelect: ' + this.isOnSelect)
          .id('RichEditor_onSelect')
          .onClick((e: ClickEvent) => {
            this.isOnSelect = !this.isOnSelect
          })
        Button('isOnSubmit: ' + this.isOnSubmit)
          .id('RichEditor_onSubmit')
          .onClick((e: ClickEvent) => {
            this.isOnSubmit = !this.isOnSubmit
          })
        Button('isOnPaste: ' + this.isOnPaste)
          .id('RichEditor_onPaste')
          .onClick((e: ClickEvent) => {
            this.isOnPaste = !this.isOnPaste
          })
      }
      Row() {
        Button('isOnSelectionChange: ' + this.isOnSelectionChange)
          .id('RichEditor_onSelectionChange')
          .onClick((e: ClickEvent) => {
            this.isOnSelectionChange = !this.isOnSelectionChange
          })
        Button('isOnWillChange: ' + this.isOnWillChange)
          .id('RichEditor_onWillChange')
          .onClick((e: ClickEvent) => {
            this.isOnWillChange = !this.isOnWillChange
          })
      }
      Row() {
        Button('isPlaceholder: ' + this.isPlaceholder)
          .id('RichEditor_placeholder')
          .onClick((e: ClickEvent) => {
            this.isPlaceholder = !this.isPlaceholder
          })
      }
    }.height('60%').justifyContent(FlexAlign.Center)
  }
}