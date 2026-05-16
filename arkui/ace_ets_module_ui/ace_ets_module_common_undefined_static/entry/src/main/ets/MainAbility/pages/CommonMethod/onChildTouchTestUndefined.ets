'use static'
import {
  Entry,
  Component,
  Column,
  Button,
  Text,
  ColumnOptions,
  ClickEvent,
  List,
  ListItem,
  ForEach,
  Padding,
  TextAlign,
  Color,
  Axis,
  BarState,
  EdgeEffect,
  ScrollState,
  FontWeight,
  Margin,
  FlexAlign,
  TouchTestStrategy,
  TouchTestInfo,
  TouchResult
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct OnChildTouchTestUndefined {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  @State text: string = 'button'
  @State isOnChildTouchTestUndefined: boolean = true;

  private handleChildTouchTest(touchinfo: Array<TouchTestInfo>): TouchResult {
    for (let info of touchinfo) {
      if (info.id === 'MyList') {
        return { id: info.id, strategy: TouchTestStrategy.FORWARD }
      }
    }
    return { strategy: TouchTestStrategy.DEFAULT }
  }

  build() {
    Column() {
      Column() {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('Item ' + item)
                .width('100%')
                .height(56)
                .fontSize(16)
                .textAlign(TextAlign.Start)
            }.borderRadius(24)
            .padding({ left: 12, right: 12 } as Padding)
          }, (item: number, index: int) => item.toString() + index)
        }
        .listDirection(Axis.Vertical)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
        .width('100%')
        .height('65%')
        .id('MyList')

        Button(this.text)
          .width(312)
          .height(40)
          .id('MyButtonChildTouchTest')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 80 } as Margin)
          .onClick(() => {
            this.text = 'button1'
          })
      }
      .width('100%')
      .height('80%')
      .justifyContent(FlexAlign.End)
      .padding({ left: 12, right: 12, bottom: 24 } as Padding)
      .onChildTouchTest(this.isOnChildTouchTestUndefined
        ? (touchinfo: Array<TouchTestInfo>): TouchResult => this.handleChildTouchTest(touchinfo) : undefined)

      Column({ space: 5 } as ColumnOptions) {
        Button('resetText')
          .id('Common_resetText')
          .onClick((e: ClickEvent) => {
            this.text = 'button';
          })
          .height(20)
        Button('isOnChildTouchTestUndefined : ' + this.isOnChildTouchTestUndefined)
          .id('Common_OnChildTouchTest')
          .onClick((e: ClickEvent) => {
            this.isOnChildTouchTestUndefined = !this.isOnChildTouchTestUndefined
          })
      }.width('100%')
      .height('20%')
    }
    .width('100%')
    .height('100%')
  }
}