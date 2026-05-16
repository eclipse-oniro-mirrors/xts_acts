'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  LengthMetrics,
  Color,
  TextAlign,
  List,
  ListItem,
  ListScroller,
  Builder,
  ForEach,
  Row,
  FlexAlign,
  ColumnOptions,
  Scroller,
  Stack,
  TouchEvent,
  ListOptions,
  Grid,
  Padding,
  Margin,
  BarState,
  LazyForEach,
  GridDirection,
  NestedScrollMode,
  TouchType,
  Alignment,
  ShadowOptions,
  GridItem,
  OnScrollFrameBeginHandlerResult,
  ScrollState,
  ScrollResult,
  ScrollSource,
  GridItemAlignment,
  EdgeEffect,
  ComputedBarAttribute,
  RowOptions,
  ItemDragInfo,
  Scroll,
  Edge,
  ScrollEdgeOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GridEventUndefined {
  private scroller: Scroller = new Scroller();
  @State onScrollFrameBeginValue: boolean = true;
  @State onDidScrollValue: boolean = true;
  @State onReachStartValue: boolean = true;
  @State onReachEndValue: boolean = true;
  @State onScrollStartValue: boolean = true;
  @State onScrollStopValue: boolean = true;
  @State onScrollBarUpdateValue: boolean = true;
  @State onScrollIndexValue: boolean = true;
  @State message: string = 'Hello World';
  private data: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  build() {
    Column() {
      Text(this.message)
        .id('Grid_text')
      Column() {
        Grid(this.scroller) {
          ForEach(this.data, (day: string) => {
            GridItem() {
              Text(day).fontSize(16)
            }.width(40).height(40).borderWidth(2).borderColor(Color.Red)
          }, (item: string) => item)
        }
        .id('Grid')
        .columnsTemplate('1fr 1fr')
        .height(200)
        .columnsGap(10)
        .rowsGap(10)
        .onScrollFrameBegin(this.onScrollFrameBeginValue ? undefined : (offset: number, state: ScrollState) => {
          this.message = 'onScrollFrameBegin';
          console.log(this.message);
          return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
        })
        .onDidScroll(this.onDidScrollValue ? undefined : (scrollOffset: number, scrollState: ScrollState) => {
          this.message = 'onDidScroll';
          console.log(this.message);
        })
        .onReachStart(this.onReachStartValue ? undefined : () => {
          this.message = 'onReachStart';
          console.log(this.message);
        })
        .onReachEnd(this.onReachEndValue ? undefined : () => {
          this.message = 'onReachEnd';
          console.log(this.message);
        })
        .onScrollStart(this.onScrollStartValue ? undefined : () => {
          this.message = 'onScrollStart';
          console.log(this.message);
        })
        .onScrollStop(this.onScrollStopValue ? undefined : () => {
          this.message = 'onScrollStop';
          console.log(this.message);
        })
        .onScrollBarUpdate(this.onScrollBarUpdateValue ? undefined : (index: int, offset: double) => {
          this.message = 'onScrollBarUpdate';
          console.log(this.message);
          return {
            totalOffset: (index / 5) * (80 + 10) - offset,
            totalLength: 80 * 5 + 10 * 4
          } as ComputedBarAttribute;
        })
        .onScrollIndex(this.onScrollIndexValue ? undefined : (first: int, last: int) => {
          this.message = 'onScrollIndex';
          console.log(this.message);
        })
      }.width('22%')

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('flingTop')
            .id('Grid_flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(4000);
            })
          Button('flingBottom')
            .id('Grid_flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-4000);
            })
          Button('resetText')
            .id('Grid_resetText')
            .onClick((e: ClickEvent) => {
              this.message = 'Hello World';
            })
        }

        Row() {
          Button('' + this.onScrollFrameBeginValue)
            .id('Grid_onScrollFrameBeginValue')
            .onClick((e: ClickEvent) => {
              this.onScrollFrameBeginValue = !this.onScrollFrameBeginValue
            })
          Button('' + this.onDidScrollValue)
            .id('Grid_onDidScrollValue')
            .onClick((e: ClickEvent) => {
              this.onDidScrollValue = !this.onDidScrollValue
            })
          Button('' + this.onReachStartValue)
            .id('Grid_onReachStartValue')
            .onClick((e: ClickEvent) => {
              this.onReachStartValue = !this.onReachStartValue
            })
        }

        Row() {
          Button('' + this.onReachEndValue)
            .id('Grid_onReachEndValue')
            .onClick((e: ClickEvent) => {
              this.onReachEndValue = !this.onReachEndValue
            })
          Button('' + this.onScrollStartValue)
            .id('Grid_onScrollStartValue')
            .onClick((e: ClickEvent) => {
              this.onScrollStartValue = !this.onScrollStartValue
            })
          Button('' + this.onScrollStopValue)
            .id('Grid_onScrollStopValue')
            .onClick((e: ClickEvent) => {
              this.onScrollStopValue = !this.onScrollStopValue
            })
        }

        Row() {
          Button('' + this.onScrollBarUpdateValue)
            .id('Grid_onScrollBarUpdateValue')
            .onClick((e: ClickEvent) => {
              this.onScrollBarUpdateValue = !this.onScrollBarUpdateValue
            })
          Button('' + this.onScrollIndexValue)
            .id('Grid_onScrollIndexValue')
            .onClick((e: ClickEvent) => {
              this.onScrollIndexValue = !this.onScrollIndexValue
            })
        }

      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}