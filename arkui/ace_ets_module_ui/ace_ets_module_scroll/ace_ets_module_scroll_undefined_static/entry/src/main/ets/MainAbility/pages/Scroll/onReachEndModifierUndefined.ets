'use static'
import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Alignment,
  WaterFlow,
  Refresh,
  Button,
  List,
  RefreshStatus,
  ForEach,
  LazyForEach,
  ListItemAlign,
  ListItem,
  ScrollState,
  Text,
  Scroller,
  TextAlign,
  BarState,
  Scroll,
  EdgeEffect,
  Color,
  ClickEvent,
  PanGesture,
  FlexAlign,
  HorizontalAlign,
  ColumnOptions,
  Margin
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute , ScrollAttribute} from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  @Track public change: boolean = true;
  @Track public count: Int = 1;

  applyNormalAttribute(instance: ScrollAttribute): void {
    if (this.change) {
      instance.onReachEnd(() => {
        this.count += 1;
      })
    } else {
      instance.onReachEnd(undefined)
    }
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: Int[] = [0, 1, 2, 3, 4];
  @State scrollModifier: ScrollModifier = new ScrollModifier()
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    this.scrollModifier.change = true
  }

  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('10%')
                .backgroundColor(Color.Red)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
                .id('scrollItem' + item)
            }
            .width('80%')
            .padding(20)
            .borderRadius(15)
            .backgroundColor(Color.Blue)
            .margin({ top: 30, bottom: 30 } as Margin)
          })
        }.width('100%').backgroundColor('rgb(213,213,213)')
      }
      .backgroundColor('rgb(213,213,213)')
      .scrollBar(BarState.On)
      .attributeModifier(this.scrollModifier)
      .height('80%')

      Column() {
        Text('Count' + this.scrollModifier.count)
          .id('common_onReachEndModifier')
        Button('切换 change → ' + this.scrollModifier.change)
          .height('5%')
          .onClick(() => {
            this.scrollModifier.change = !this.scrollModifier.change
          }).margin({ top: 5 } as Margin).id('changeButton')
        Row() {
          Button('flingTop')
            .id('flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(4000);
            })
          Button('flingBottom')
            .id('flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-4000);
            })
        }
      }
    }.width('100%').height('100%')
  }
}