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
  RichEditorChangeValue,
  AttributeModifier,
  RichEditorAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyPointModifier implements AttributeModifier<RichEditorAttribute> {
  public message: string = 'hello';
  public isStopBackPress: boolean = true;
  public isOnSelect: boolean = true;
  public isOnSubmit: boolean = true;
  public isPlaceholder: boolean = true;
  public isOnPaste: boolean = true;
  public isOnSelectionChange: boolean = false;
  public isOnWillChange: boolean = false;
  public startMessage: string = 'Hello World';

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct SoftKeyboardEnterTypeExample {
  @State modifier: MyPointModifier = new MyPointModifier()
  controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditorM_2')
        .onReady(() => {
          this.controller.addTextSpan('0123456789')
        })
        .attributeModifier(this.modifier)
        .height('20%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .width('100%')

      Text(this.modifier.message)
        .id('RichEditorM_text')
      Row() {
        Button('resetText')
          .id('RichEditorM_resetText')
          .onClick((e: ClickEvent) => {
            this.modifier.message = 'hello';
          })
        Button('setCaretOffset')
          .id('RichEditorM_setCaretOffset')
          .onClick((e: ClickEvent) => {
            this.controller.setCaretOffset(3);
          })
        Button('isStopBackPress: ' + this.modifier.isStopBackPress)
          .id('RichEditorM_stopBackPress')
          .onClick((e: ClickEvent) => {
            this.modifier.isStopBackPress = !this.modifier.isStopBackPress
          })
      }
      Row() {
        Button('isOnSelect: ' + this.modifier.isOnSelect)
          .id('RichEditorM_onSelect')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSelect = !this.modifier.isOnSelect
          })
        Button('isOnSubmit: ' + this.modifier.isOnSubmit)
          .id('RichEditorM_onSubmit')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSubmit = !this.modifier.isOnSubmit
          })
        Button('isOnPaste: ' + this.modifier.isOnPaste)
          .id('RichEditorM_onPaste')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnPaste = !this.modifier.isOnPaste
          })
      }
      Row() {
        Button('isOnSelectionChange: ' + this.modifier.isOnSelectionChange)
          .id('RichEditorM_onSelectionChange')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSelectionChange = !this.modifier.isOnSelectionChange
          })
        Button('isOnWillChange: ' + this.modifier.isOnWillChange)
          .id('RichEditorM_onWillChange')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnWillChange = !this.modifier.isOnWillChange
          })
      }
      Row() {
        Button('isPlaceholder: ' + this.modifier.isPlaceholder)
          .id('RichEditor_placeholder')
          .onClick((e: ClickEvent) => {
            this.modifier.isPlaceholder = !this.modifier.isPlaceholder
          })
      }
    }.height('60%').justifyContent(FlexAlign.Center)
  }
}