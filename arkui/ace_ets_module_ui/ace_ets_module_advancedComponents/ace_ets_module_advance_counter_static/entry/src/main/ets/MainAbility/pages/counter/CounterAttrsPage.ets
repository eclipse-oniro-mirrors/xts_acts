'use static';
import { Column, Component, CounterComponent, CounterType, DateData, Direction, Entry, FlexAlign, HorizontalAlign, Margin, State } from '@kit.ArkUI';

@Entry
@Component
struct CounterAttrsPage {

  build() {
    Column() {
      //列表型Counter  focusable true
      CounterComponent({
        options: {
          direction: Direction.Rtl,
          type: CounterType.LIST,
          numberOptions: {
            focusable: true,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
          }
        }
      }).width('50%')
      //数值型Counter
      CounterComponent({
        options: {
          direction: Direction.Ltr,
          type: CounterType.COMPACT,
          numberOptions: {
            label: '数量',
            value: 10,
            min: 0,
            max: 100,
            step: 10
          }
        }
      }).margin({ top: 10 } as Margin)
      //数值内联型Counter
      CounterComponent({
        options: {
          type: CounterType.INLINE,
          direction: Direction.Auto,
          inlineOptions: {
            value: 100,
            min: 10,
            step: 2,
            max: 1000,
            textWidth: 100,
            onChange: (value: int) => {
              console.log(`onCounterChange Counter: ${value}`);
            }
          }
        }
      }).margin({ top: 10 } as Margin)
      //日期内联型counter
      CounterComponent({
        options: {
          direction: undefined,
          type: CounterType.INLINE_DATE,
          dateOptions: {
            year: 2025,
            month: 3,
            day: 18,
            onDateChange: (date: DateData) => {
              console.log(`onDateChange Date: ${date.toString()}`);
            }
          }
        }
      }).margin({ top: 10 } as Margin)
      //日期内联型counter  undefined/year,month,day
      CounterComponent({
        options: {
          direction: undefined,
          type: CounterType.INLINE_DATE,
          dateOptions: {
            year: undefined,
            month: undefined,
            day: undefined,
            onDateChange: (date: DateData) => {
              console.log(`onDateChange Date: ${date.toString()}`);
              console.log('onDateChange Date: ' + date.year);
              console.log('onDateChange Date: ' + date.month);
              console.log('onDateChange Date: ' + date.day);
            }
          }
        }
      }).margin({ top: 10 } as Margin)
      //列表型Counter focusable false
      CounterComponent({
        options: {
          direction: Direction.Rtl,
          type: CounterType.LIST,
          numberOptions: {
            focusable: false,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
          }
        }
      }).width('50%')
      //列表型Counter focusable undefined
      CounterComponent({
        options: {
          direction: Direction.Rtl,
          type: CounterType.LIST,
          numberOptions: {
            focusable: undefined,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
          }
        }
      }).width('50%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}