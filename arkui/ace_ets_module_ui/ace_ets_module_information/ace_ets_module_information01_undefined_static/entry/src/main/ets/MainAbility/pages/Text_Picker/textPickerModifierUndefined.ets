'use static'
import {
  Entry,
  Flex,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  Optional,
  DateTimeOptions,
  Callback,
  FontWeight,
  CrownSensitivity,
  PickerTextStyle,
  ColumnOptions,
  RowOptions,
  Row,
  Text,
  AttributeModifier,
  FontStyle,
  TextPicker,
  TextPickerAttribute,
  DividerOptions
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Observed
export class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  public textPickerMOnChangeFlag: boolean | undefined = true;
  public gradientHeightMFlag: boolean | undefined = true;
  public digitalCrownSensitivityMFlag: boolean | undefined = true;
  public dividerFlagMFlag: boolean | undefined = true;
  public selectedIndexMFlag: boolean | undefined = true;
  public onEnterSelectedAreaMFlag: boolean | undefined = true;
  public onScrollStopFlagMFlag: boolean | undefined = true;
  public enableHapticFeedbackMFlag: boolean | undefined = true;
  public textPickerMOnChangeStr: string = '-1';

  applyNormalAttribute(instance: TextPickerAttribute): void {

    instance
      .onChange(this.textPickerMOnChangeFlag ? undefined : (selectItem: string | string[], index: Int | Int[]) => {
        this.textPickerMOnChangeStr = 'onChange';
      })
      .enableHapticFeedback(this.enableHapticFeedbackMFlag ? undefined : false)
      .selectedIndex(this.selectedIndexMFlag ? undefined : [2, 1, 0])
      .gradientHeight(this.gradientHeightMFlag ? undefined : 15.0)
      .digitalCrownSensitivity(this.digitalCrownSensitivityMFlag ? undefined : CrownSensitivity.HIGH)
      .divider(this.dividerFlagMFlag ? undefined : {
        strokeWidth: '30px',
        startMargin: 10,
        endMargin: 20,
        color: '#33f50505'
      } as DividerOptions)
      .onEnterSelectedArea(this.onEnterSelectedAreaMFlag ? undefined :
        (value: string | string[], index: Int | Int[]): void => {
          this.textPickerMOnChangeStr = 'onEnterSelectedArea';
        })
      .onScrollStop(this.onScrollStopFlagMFlag ? undefined :
        (value: string | string[], index: Int | Int[]) => {
          this.textPickerMOnChangeStr = 'onScrollStopFlag';
        })
  }
}

@Entry
@Component
struct Index {
  @State textPickerModifier1: TextPickerModifier = new TextPickerModifier()
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4']
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      TextPicker({ range: this.multi })
        .id('textPicker_M_1')
        .attributeModifier(this.textPickerModifier1)

      Text('textPickerMChangeText is ' + this.textPickerModifier1.textPickerMOnChangeStr)
        .id('textPicker_onChange_M_Text')
        .fontSize(20)

      Column({ space: 5 } as ColumnOptions) {
        Button('reset_Text')
          .id('textPickerChange_M_resetBtn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.textPickerMOnChangeStr = '-1';
          })
        Button('切换 textPicker_enableHapticFeedback_M → ' +
          (this.textPickerModifier1.enableHapticFeedbackMFlag ? 'undefined' : 'false'))
          .id('textPicker_enableHapticFeedback_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.enableHapticFeedbackMFlag = !this.textPickerModifier1.enableHapticFeedbackMFlag
          })
        Button('切换 textPicker_onChange_M → ' +
          (this.textPickerModifier1.textPickerMOnChangeFlag ? 'undefined' : 'true'))
          .id('textPicker_onChange_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.textPickerMOnChangeFlag = !this.textPickerModifier1.textPickerMOnChangeFlag
          })
        Button('切换 textPicker_gradientHeight_M → ' +
          (this.textPickerModifier1.gradientHeightMFlag ? 'undefined' : '15.0'))
          .id('textPicker_gradientHeight_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.gradientHeightMFlag = !this.textPickerModifier1.gradientHeightMFlag
          })
        Button('切换 textPicker_digitalCrownSensitivity_M → ' +
          (this.textPickerModifier1.digitalCrownSensitivityMFlag ? 'undefined' : 'CrownSensitivity.HIGH'))
          .id('textPicker_digitalCrownSensitivity_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.digitalCrownSensitivityMFlag =
              !this.textPickerModifier1.digitalCrownSensitivityMFlag
          })
        Button('切换 textPicker_dividerFlag_M → ' +
          (this.textPickerModifier1.dividerFlagMFlag ? 'undefined' : 'dividerChange'))
          .id('textPicker_dividerFlag_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.dividerFlagMFlag =
              !this.textPickerModifier1.dividerFlagMFlag
          })
        Button('切换 textPicker_selectedIndexFlag_M → ' +
          (this.textPickerModifier1.selectedIndexMFlag ? 'undefined' : '[2, 1, 0]'))
          .id('textPicker_selectedIndexFlag_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.selectedIndexMFlag =
              !this.textPickerModifier1.selectedIndexMFlag
          })
        Button('切换 textPicker_onEnterSelectedAreaMFlag_M → ' +
          (this.textPickerModifier1.onEnterSelectedAreaMFlag ? 'undefined' : 'onEnterSelectedAreaChange'))
          .id('textPicker_onEnterSelectedAreaMFlag_M_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.onEnterSelectedAreaMFlag =
              !this.textPickerModifier1.onEnterSelectedAreaMFlag
          })
        Button('切换 textPicker_onScrollStopFlagMFlag_M → ' +
          (this.textPickerModifier1.onScrollStopFlagMFlag ? 'undefined' : 'onScrollStopChange'))
          .id('textPicker_onScrollStopFlagMFlag_Btn')
          .onClick((e: ClickEvent) => {
            this.textPickerModifier1.onScrollStopFlagMFlag =
              !this.textPickerModifier1.onScrollStopFlagMFlag
          })
      }
    }
  }
}