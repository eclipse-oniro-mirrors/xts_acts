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
  ScrollEdgeOptions,
  AttributeModifier,
  GridAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<GridAttribute> {
  public onScrollFrameBeginValue: boolean = true;
  public onDidScrollValue: boolean = true;
  public onReachStartValue: boolean = true;
  public onReachEndValue: boolean = true;
  public onScrollStartValue: boolean = true;
  public onScrollStopValue: boolean = true;
  public onScrollBarUpdateValue: boolean = true;
  public onScrollIndexValue: boolean = true;
  public message: string = 'Hello World';

  applyNormalAttribute(instance: GridAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct GridEventUndefined {
  private scroller: Scroller = new Scroller();
  private data: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Text('GridEventModifier')
      Text(this.myModifier.message)
        .id('GridM_text')
      Column() {
        Grid(this.scroller) {
          ForEach(this.data, (day: string) => {
            GridItem() {
              Text(day).fontSize(16)
            }.width(40).height(40).borderWidth(2).borderColor(Color.Red)
          }, (item: string) => item)
        }
        .id('GridM')
        .columnsTemplate('1fr 1fr')
        .height(200)
        .columnsGap(10)
        .rowsGap(10)
        .attributeModifier(this.myModifier)
      }.width('22%')

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('flingTop')
            .id('GridM_flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(4000);
            })
          Button('flingBottom')
            .id('GridM_flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-4000);
            })
          Button('resetText')
            .id('GridM_resetText')
            .onClick((e: ClickEvent) => {
              this.myModifier.message = 'Hello World';
            })
        }

        Row() {
          Button('' + this.myModifier.onScrollFrameBeginValue)
            .id('GridM_onScrollFrameBeginValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onScrollFrameBeginValue = !this.myModifier.onScrollFrameBeginValue
            })
          Button('' + this.myModifier.onDidScrollValue)
            .id('GridM_onDidScrollValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onDidScrollValue = !this.myModifier.onDidScrollValue
            })
          Button('' + this.myModifier.onReachStartValue)
            .id('GridM_onReachStartValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onReachStartValue = !this.myModifier.onReachStartValue
            })
        }

        Row() {
          Button('' + this.myModifier.onReachEndValue)
            .id('GridM_onReachEndValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onReachEndValue = !this.myModifier.onReachEndValue
            })
          Button('' + this.myModifier.onScrollStartValue)
            .id('GridM_onScrollStartValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onScrollStartValue = !this.myModifier.onScrollStartValue
            })
          Button('' + this.myModifier.onScrollStopValue)
            .id('GridM_onScrollStopValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onScrollStopValue = !this.myModifier.onScrollStopValue
            })
        }

        Row() {
          Button('' + this.myModifier.onScrollBarUpdateValue)
            .id('GridM_onScrollBarUpdateValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onScrollBarUpdateValue = !this.myModifier.onScrollBarUpdateValue
            })
          Button('' + this.myModifier.onScrollIndexValue)
            .id('GridM_onScrollIndexValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.onScrollIndexValue = !this.myModifier.onScrollIndexValue
            })
        }

      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}