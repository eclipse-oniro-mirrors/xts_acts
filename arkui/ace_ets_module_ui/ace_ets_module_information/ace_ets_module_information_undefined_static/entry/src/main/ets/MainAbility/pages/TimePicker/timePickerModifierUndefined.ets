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
  Text,
  TimePickerAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Observed
export class MyModifier1 implements AttributeModifier<TimePickerAttribute> {
  public dateTimeOptionsValue: boolean = true;
  public useMilitaryTimeValue: boolean = true;
  public loopValue: boolean = true;
  public digitalCrownSensitivityValue: boolean = true;
  public disappearTextStyleValue: boolean = true;
  public enableCascadeValue: boolean = true;
  public enableHapticFeedbackValue: boolean = true;
  public isSelectedTextStyle: boolean = true;
  public isTextStyle: boolean = true;

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance
      .useMilitaryTime(this.useMilitaryTimeValue ? undefined : true)
      .loop(this.loopValue ? undefined : false)
      .digitalCrownSensitivity(this.digitalCrownSensitivityValue ? undefined : CrownSensitivity.LOW)
      .enableCascade(this.enableCascadeValue ? undefined : true)
      .enableHapticFeedback(this.enableHapticFeedbackValue ? undefined : false)
      .disappearTextStyle(this.disappearTextStyleValue ? undefined :
        { color: Color.Yellow, font: { size: 24 } } as PickerTextStyle)
      .selectedTextStyle(this.isSelectedTextStyle ? undefined :
        { color: Color.Yellow, font: { size: 30 } } as PickerTextStyle)
      .textStyle(this.isTextStyle ? undefined :
        { color: Color.Yellow, font: { size: 26 } } as PickerTextStyle)
  }
}


@Observed
export class MyModifier2 implements AttributeModifier<TimePickerAttribute> {
  public msg: string = 'hello';
  public isOnChange: boolean = true;
  public isOnEnterSelectedArea: boolean = true;
  public dateTimeOptionsValue: boolean = true;

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance
      .dateTimeOptions(this.dateTimeOptionsValue ? undefined :
        { hour: 'numeric', minute: 'numeric', second: 'numeric' } as DateTimeOptions)
      .useMilitaryTime(true)
      .onChange(this.isOnChange ? undefined : (value: TimePickerResult) => {
        this.msg = 'onChange';
      })
      .onEnterSelectedArea(this.isOnEnterSelectedArea ? undefined : (value: TimePickerResult) => {
        this.msg = 'onEnterSelectedArea';
      })
  }
}

@Entry
@Component
struct Index {
  private selectedTime1: Date = new Date('2022-07-22T08:00:00');
  private selectedTime2: Date = new Date('2022-07-22T08:00:00');
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      TimePicker().height('15%').id('TimePickerM_0')
      Text(this.myModifier2.msg)
        .id('TimePickerM_Text')
      TimePicker({ selected: this.selectedTime1 })
        .height('18%')
        .id('TimePickerM_1')
        .attributeModifier(this.myModifier1)

      TimePicker({ selected: this.selectedTime1 })
        .height('30%')
        .id('TimePickerM_2')
        .loop(false)
        .attributeModifier(this.myModifier2)

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('' + this.myModifier2.dateTimeOptionsValue)
            .id('TimePickerM_Btn1')
            .onClick((e: ClickEvent) => {
              this.myModifier2.dateTimeOptionsValue = !this.myModifier2.dateTimeOptionsValue
            })
          Button('' + this.myModifier1.useMilitaryTimeValue)
            .id('TimePickerM_Btn2')
            .onClick((e: ClickEvent) => {
              this.myModifier1.useMilitaryTimeValue = !this.myModifier1.useMilitaryTimeValue
            })
          Button('' + this.myModifier1.loopValue)
            .id('TimePickerM_Btn3')
            .onClick((e: ClickEvent) => {
              this.myModifier1.loopValue = !this.myModifier1.loopValue
            })
        }

        Row() {

          Button('' + this.myModifier1.digitalCrownSensitivityValue)
            .id('TimePickerM_Btn4')
            .onClick((e: ClickEvent) => {
              this.myModifier1.digitalCrownSensitivityValue = !this.myModifier1.digitalCrownSensitivityValue
            })
          Button('' + this.myModifier1.disappearTextStyleValue)
            .id('TimePickerM_Btn5')
            .onClick((e: ClickEvent) => {
              this.myModifier1.disappearTextStyleValue = !this.myModifier1.disappearTextStyleValue
            })
          Button('' + this.myModifier1.enableCascadeValue)
            .id('TimePickerM_Btn6')
            .onClick((e: ClickEvent) => {
              this.myModifier1.enableCascadeValue = !this.myModifier1.enableCascadeValue
            })
        }

        Row() {
          Button('' + this.myModifier1.enableHapticFeedbackValue)
            .id('TimePickerM_Btn7')
            .onClick((e: ClickEvent) => {
              this.myModifier1.enableHapticFeedbackValue = !this.myModifier1.enableHapticFeedbackValue
            })
          Button('' + this.myModifier1.isSelectedTextStyle)
            .id('TimePickerM_Btn8')
            .onClick((e: ClickEvent) => {
              this.myModifier1.isSelectedTextStyle = !this.myModifier1.isSelectedTextStyle
            })
          Button('' + this.myModifier1.isTextStyle)
            .id('TimePickerM_Btn9')
            .onClick((e: ClickEvent) => {
              this.myModifier1.isTextStyle = !this.myModifier1.isTextStyle
            })
        }

        Row() {
          Button('reset')
            .id('TimePickerM_resetBtn')
            .onClick((e: ClickEvent) => {
              this.myModifier2.msg = 'hello';
            })
          Button('' + this.myModifier2.isOnChange)
            .id('TimePickerM_Btn10')
            .onClick((e: ClickEvent) => {
              this.myModifier2.isOnChange = !this.myModifier2.isOnChange
            })
          Button('' + this.myModifier2.isOnEnterSelectedArea)
            .id('TimePickerM_Btn11')
            .onClick((e: ClickEvent) => {
              this.myModifier2.isOnEnterSelectedArea = !this.myModifier2.isOnEnterSelectedArea
            })
        }

      }
    }
  }
}
