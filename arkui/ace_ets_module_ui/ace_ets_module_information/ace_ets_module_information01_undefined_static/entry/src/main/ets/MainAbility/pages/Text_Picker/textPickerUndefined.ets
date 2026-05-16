'use static'
import {
  Entry,
  Flex,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  FlexAttribute,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  OffsetOptions,
  TextPicker,
  FontWeight,
  TextPickerTextStyle,
  TextOverflow,
  PickerTextStyle,
  Margin,
  DividerOptions,
  ColumnOptions,
  FlexAlign,
  HorizontalAlign,
  Scroll,
  BarState,
  CrownSensitivity
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State selectedIndexFlag: boolean = true;
  @State gradientHeightFlag: boolean = true;
  @State textPickerChangeFlag: boolean = true;
  @State textPickerChangeStr: string = '-1';
  @State digitalCrownSensitivityFlag: boolean = true;
  @State dividerFlag: boolean = true;
  @State onEnterSelectedAreaFlag: boolean = true;
  @State onScrollStopFlag: boolean = true;
  @State enableHapticFeedbackFlag: boolean = true;
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4']
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        TextPicker({ range: this.multi })
          .id('textPicker_1')
          .enableHapticFeedback(this.enableHapticFeedbackFlag ? undefined : false)
          .selectedIndex(this.selectedIndexFlag ? undefined : [2, 1, 0])
          .gradientHeight(this.gradientHeightFlag ? undefined : 15.0)
          .digitalCrownSensitivity(this.digitalCrownSensitivityFlag ? undefined : CrownSensitivity.HIGH)
          .divider(this.dividerFlag ? undefined : {
            strokeWidth: '20px',
            startMargin: 10,
            endMargin: 20,
            color: '#33f50505'
          } as DividerOptions)
          .onChange(this.textPickerChangeFlag ? undefined : (selectItem: string | string[], index: Int | Int[]) => {
            this.textPickerChangeStr = 'onChange';
          })
          .onEnterSelectedArea(this.onEnterSelectedAreaFlag ? undefined :
            (value: string | string[], index: Int | Int[]): void => {
              this.textPickerChangeStr = 'onEnterSelectedArea';
            })
          .onScrollStop(this.onScrollStopFlag ? undefined :
            (value: string | string[], index: Int | Int[]) => {
              this.textPickerChangeStr = 'onScrollStopFlag';
            })

        Text('textPickerChange is ' + this.textPickerChangeStr)
          .id('textPickerChangeFlag_Text')
          .fontSize(20)

        Button('reset_Text')
          .id('textPickerChange_resetBtn')
          .onClick((e: ClickEvent) => {
            this.textPickerChangeStr = '-1';
          })
        Button('切换 textPickerChangeFlag → ' + (this.textPickerChangeFlag ? 'undefined' : 'true'))
          .id('textPickerChangeFlag_Btn')
          .height('5%')
          .onClick(() => {
            this.textPickerChangeFlag = !this.textPickerChangeFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 selectedIndex → ' + (this.selectedIndexFlag ? 'undefined' : 2))
          .id('selectedIndex_Btn')
          .height('5%')
          .onClick(() => {
            this.selectedIndexFlag = !this.selectedIndexFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 gradientHeight → ' + (this.gradientHeightFlag ? 'undefined' : 15.0))
          .id('gradientHeight_Btn')
          .height('5%')
          .onClick(() => {
            this.gradientHeightFlag = !this.gradientHeightFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 digitalCrownSensitivity → ' +
          (this.digitalCrownSensitivityFlag ? 'undefined' : 'CrownSensitivity.HIGH'))
          .id('digitalCrownSensitivity_Btn')
          .height('5%')
          .onClick(() => {
            this.digitalCrownSensitivityFlag = !this.digitalCrownSensitivityFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 divider → ' + (this.dividerFlag ? 'undefined' : 'dividerChange'))
          .id('divider_Btn')
          .height('5%')
          .onClick(() => {
            this.dividerFlag = !this.dividerFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 onEnterSelectedArea → ' +
          (this.onEnterSelectedAreaFlag ? 'undefined' : 'onEnterSelectedAreaChange'))
          .id('onEnterSelectedAreaFlag_Btn')
          .height('5%')
          .onClick(() => {
            this.onEnterSelectedAreaFlag = !this.onEnterSelectedAreaFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 onScrollStop → ' + (this.onScrollStopFlag ? 'undefined' : 'onScrollStopFlagChange'))
          .id('onScrollStopFlag_Btn')
          .height('5%')
          .onClick(() => {
            this.onScrollStopFlag = !this.onScrollStopFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 enableHapticFeedback → ' + (this.enableHapticFeedbackFlag ? 'undefined' : 'false'))
          .id('enableHapticFeedbackFlag_Btn')
          .height('5%')
          .onClick(() => {
            this.enableHapticFeedbackFlag = !this.enableHapticFeedbackFlag
          }).margin({ top: 5 } as Margin)
      }
      .width('100%')
    }
    .scrollBar(BarState.On)
  }
}