'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TimePicker,
  Optional,
  DateTimeOptions,
  OnTimePickerChangeCallback,
  TimePickerResult,
  Callback,
  FontWeight,
  CrownSensitivity,
  PickerTextStyle,
  ColumnOptions,
  RowOptions,
  Row,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct Index {
  private selectedTime1: Date = new Date('2022-07-22T08:00:00');
  private selectedTime2: Date = new Date('2022-07-22T08:00:00');
  @State dateTimeOptionsValue: boolean = true;
  @State useMilitaryTimeValue: boolean = true;
  @State loopValue: boolean = true;
  @State digitalCrownSensitivityValue: boolean = true;
  @State disappearTextStyleValue: boolean = true;
  @State enableCascadeValue: boolean = true;
  @State enableHapticFeedbackValue: boolean = true;
  @State isSelectedTextStyle: boolean = true;
  @State isTextStyle: boolean = true;
  @State msg: string = 'Hello World';
  @State isOnChange: boolean = true;
  @State isOnEnterSelectedArea: boolean = true;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      TimePicker().height('15%').id('TimePicker_0')
      Text(this.msg)
        .id('TimePicker_Text')
      TimePicker({ selected: this.selectedTime1 })
        .height('18%')
        .id('TimePicker_1')
        .loop(this.loopValue ? undefined : false)
        .useMilitaryTime(this.useMilitaryTimeValue ? undefined : true)
        .digitalCrownSensitivity(this.digitalCrownSensitivityValue ? undefined : CrownSensitivity.LOW)
        .enableCascade(this.enableCascadeValue ? undefined : true)
        .enableHapticFeedback(this.enableHapticFeedbackValue ? undefined : false)
        .disappearTextStyle(this.disappearTextStyleValue ? undefined :
          { color: Color.Yellow, font: { size: 24 } } as PickerTextStyle)
        .selectedTextStyle(this.isSelectedTextStyle ? undefined :
          { color: Color.Yellow, font: { size: 30 } } as PickerTextStyle)
        .textStyle(this.isTextStyle ? undefined :
          { color: Color.Yellow, font: { size: 26 } } as PickerTextStyle)

      TimePicker({ selected: this.selectedTime1 })
        .height('30%')
        .id('TimePicker_2')
        .loop(false)
        .dateTimeOptions(this.dateTimeOptionsValue ? undefined :
          { hour: 'numeric', minute: 'numeric', second: 'numeric' } as DateTimeOptions)
        .useMilitaryTime(true)
        .onChange(this.isOnChange ? undefined : (value: TimePickerResult) => {
          this.msg = 'onChange';
        })
        .onEnterSelectedArea(this.isOnEnterSelectedArea ? undefined : (value: TimePickerResult) => {
          this.msg = 'onEnterSelectedArea';
        })

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('' + this.dateTimeOptionsValue)
            .id('TimePicker_Btn1')
            .onClick((e: ClickEvent) => {
              this.dateTimeOptionsValue = !this.dateTimeOptionsValue
            })
          Button('' + this.useMilitaryTimeValue)
            .id('TimePicker_Btn2')
            .onClick((e: ClickEvent) => {
              this.useMilitaryTimeValue = !this.useMilitaryTimeValue
            })
          Button('' + this.loopValue)
            .id('TimePicker_Btn3')
            .onClick((e: ClickEvent) => {
              this.loopValue = !this.loopValue
            })
        }

        Row() {
          Button('' + this.digitalCrownSensitivityValue)
            .id('TimePicker_Btn4')
            .onClick((e: ClickEvent) => {
              this.digitalCrownSensitivityValue = !this.digitalCrownSensitivityValue
            })
          Button('d' + this.disappearTextStyleValue)
            .id('TimePicker_Btn5')
            .onClick((e: ClickEvent) => {
              this.disappearTextStyleValue = !this.disappearTextStyleValue
            })
          Button('' + this.enableCascadeValue)
            .id('TimePicker_Btn6')
            .onClick((e: ClickEvent) => {
              this.enableCascadeValue = !this.enableCascadeValue
            })
        }

        Row() {
          Button('' + this.enableHapticFeedbackValue)
            .id('TimePicker_Btn7')
            .onClick((e: ClickEvent) => {
              this.enableHapticFeedbackValue = !this.enableHapticFeedbackValue
            })
          Button('' + this.isSelectedTextStyle)
            .id('TimePicker_Btn8')
            .onClick((e: ClickEvent) => {
              this.isSelectedTextStyle = !this.isSelectedTextStyle
            })
          Button('' + this.isTextStyle)
            .id('TimePicker_Btn9')
            .onClick((e: ClickEvent) => {
              this.isTextStyle = !this.isTextStyle
            })
        }

        Row() {
          Button('reset')
            .id('TimePicker_resetBtn')
            .onClick((e: ClickEvent) => {
              this.msg = 'hello';
            })
          Button('' + this.isOnChange)
            .id('TimePicker_Btn10')
            .onClick((e: ClickEvent) => {
              this.isOnChange = !this.isOnChange
            })
          Button('' + this.isOnEnterSelectedArea)
            .id('TimePicker_Btn11')
            .onClick((e: ClickEvent) => {
              this.isOnEnterSelectedArea = !this.isOnEnterSelectedArea
            })
        }

      }
    }
  }
}
