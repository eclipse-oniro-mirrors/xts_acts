'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Flex,
  Row,
  HorizontalAlign,
  Font,
  TextClockController,
  TextClock,
  Button,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  Margin,
  DateTimeOptions,
  ShadowOptions,
  Color,
  FontWeight,
  FontStyle,
  UIContext,
  $rawfile,
  WrappedBuilder,
  Builder,
  TextClockConfiguration,
  ContentModifier,
  wrapBuilder,
  TimePicker,
  TimePickerFormat
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  controller: TextClockController = new TextClockController();
  @State dateTimeOptionsFlag: boolean = true;
  @State fontFeatureFlag: boolean = true;
  @State fontFamilyFlag: boolean = true;
  @State fontWeightFlag: boolean = true;
  @State fontSizeFlag: boolean = true;
  @State fontColorFlag: boolean = true;
  @State fontStyleFlag: boolean = true;
  @State textShadowFlag: boolean = true;
  @State onDateChangeFlag: boolean = true;
  @State accumulateTime: Long = 0;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Button('切换 dateTimeOptions → ' + (this.dateTimeOptionsFlag ? 'undefined' : 'hour: "2-digit"'))
          .id('dateTimeOptions_Btn')
          .height('5%')
          .onClick(() => {
            this.dateTimeOptionsFlag = !this.dateTimeOptionsFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 fontFeature → ' + (this.fontFeatureFlag ? 'undefined' : '\"sinf\" on'))
          .id('fontFeature_Btn')
          .height('5%')
          .onClick(() => {
            this.fontFeatureFlag = !this.fontFeatureFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 fontFamily → ' + (this.fontFamilyFlag ? 'undefined' : 'sans-serif'))
          .id('fontFamily_Btn')
          .height('5%')
          .onClick(() => {
            this.fontFamilyFlag = !this.fontFamilyFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 fontWeight → ' + (this.fontWeightFlag ? 'undefined' : 'FontWeight.Bold'))
          .id('fontWeight_Btn')
          .height('5%')
          .onClick(() => {
            this.fontWeightFlag = !this.fontWeightFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 fontSize → ' + (this.fontSizeFlag ? 'undefined' : '50.0'))
          .id('fontSize_Btn')
          .height('5%')
          .onClick(() => {
            this.fontSizeFlag = !this.fontSizeFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 fontColor → ' + (this.fontColorFlag ? 'undefined' : 'Red'))
          .id('fontColor_Btn')
          .height('5%')
          .onClick(() => {
            this.fontColorFlag = !this.fontColorFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 fontStyle → ' + (this.fontStyleFlag ? 'undefined' : 'FontStyle.Italic'))
          .id('fontStyle_Btn')
          .height('5%')
          .onClick(() => {
            this.fontStyleFlag = !this.fontStyleFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 textShadow → ' + (this.textShadowFlag ? 'undefined' : 'default'))
          .id('textShadow_Btn')
          .height('5%')
          .onClick(() => {
            this.textShadowFlag = !this.textShadowFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 onDateChange → ' + (this.onDateChangeFlag ? 'undefined' : 'true'))
          .id('onDateChange_Btn')
          .height('5%')
          .onClick(() => {
            this.onDateChangeFlag = !this.onDateChangeFlag
          }).margin({ top: 5 } as Margin)
        Button('reset_Text')
          .id('text_resetBtn')
          .onClick((e: ClickEvent) => {
            this.accumulateTime = 0;
          })
      }

      Column() {
        Text('Current milliseconds is ' + this.accumulateTime)
          .id('onDateChange_Text')
          .fontSize(20)
        TextClock({ controller: this.controller })
          .fontColor(undefined)
          .id('textClock_origin')
        TextClock({ controller: this.controller })
          .id('textClock_1')
          .dateTimeOptions(this.dateTimeOptionsFlag ?
            undefined : { hour: '2-digit' } as DateTimeOptions)
          .fontFeature(this.fontFeatureFlag ? undefined : '\"sinf\" on')
          .fontFamily(this.fontFamilyFlag ? undefined : 'sans-serif')
          .fontWeight(this.fontWeightFlag ? undefined : FontWeight.Bold)
          .fontSize(this.fontSizeFlag ? undefined : 50.0)
          .fontColor(this.fontColorFlag ? undefined : Color.Red)
          .fontStyle(this.fontStyleFlag ? undefined : FontStyle.Italic)
          .textShadow(this.textShadowFlag ? undefined : [{
            radius: 10,
            color: Color.Red
          }] as Array<ShadowOptions>)
          .onDateChange(this.onDateChangeFlag ? undefined : (value: Long) => {
            if (value !== 0) {
              this.accumulateTime = 1;
            }
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}