'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  LengthMetrics,
  WaterFlow,
  LazyForEach,
  Color,
  TextAlign,
  Builder,
  Row,
  Blank,
  Scroller,
  ScrollState,
  OnScrollFrameBeginHandlerResult,
  ColumnOptions,
  Edge,
  EdgeEffect,
  FlexDirection,
  ConstraintSizeOptions,
  NestedScrollMode,
  NestedScrollOptions,
  Scroll,
  ForEach,
  FlowItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { MyDataSource } from './MyDataSource'

@Entry
@Component
struct WaterFlowEventPage {
  scroller: Scroller = new Scroller();
  private arr: MyDataSource<Int> = new MyDataSource<Int>();
  @State message: string = 'Hello World';
  @State onScrollFrameBeginValue: boolean = true;
  @State onScrollIndexValue: boolean = false;
  @State onReachStartValue: boolean = true;
  @State onReachEndValue: boolean = true;
  @State frictionValue: boolean = true;
  @State enableScrollInteractionValue: boolean = true;
  @State layoutDirectionValue: boolean = true;
  @State rowsGapValue: boolean = true;
  @State columnsGapValue: boolean = true;
  @State rowsTemplateValue: boolean = true;
  @State columnsTemplateValue: boolean = true;
  @State itemConstraintSizeValue: boolean = true;
  @State nestedScrollValue: boolean = true;
  @State cachedCountValue: boolean = true;

  build() {
    Column() {
      Text(this.message)
        .id('WaterFlow_text')

      Column() {
        WaterFlow({ scroller: this.scroller }) {
          LazyForEach(this.arr, (item: int, index: int) => {
            Text('item' + item.toString())
              .height(64)
              .width('100%')
              .borderRadius(5)
              .backgroundColor('#ffe77e7e')
              .textAlign(TextAlign.Center)
          })
        }
        .id('WaterFlow')
        .columnsTemplate(this.columnsTemplateValue ? '1fr 1fr' : undefined)
        .rowsTemplate(this.rowsTemplateValue ? '1fr 1fr' : undefined)
        .friction(this.frictionValue ? 20.0 : undefined)
        .enableScrollInteraction(this.enableScrollInteractionValue ? false : undefined)
        .layoutDirection(this.layoutDirectionValue ? FlexDirection.Row : undefined)
        .rowsGap(this.rowsGapValue ? 10.0 : undefined)
        .columnsGap(this.columnsGapValue ? 10.0 : undefined)
        .itemConstraintSize(this.itemConstraintSizeValue ? {
          minWidth: 100,
          maxWidth: 100,
          minHeight: 100,
          maxHeight: 100
        } as ConstraintSizeOptions : undefined)
        .nestedScroll(this.nestedScrollValue ? {
          scrollForward: NestedScrollMode.SELF_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        } as NestedScrollOptions : undefined)
        .cachedCount(this.cachedCountValue ? 2 : undefined, true)
        .onScrollFrameBegin(this.onScrollFrameBeginValue ? (offset: number, state: ScrollState) => {
          this.message = 'onScrollFrameBegin';
          console.log(this.message);
          return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
        } : undefined)
        .onScrollIndex(this.onScrollIndexValue ? (first: int, last: int) => {
          this.message = 'onScrollIndex';
          console.log(this.message);
        } : undefined)
        .onReachStart(this.onReachStartValue ? () => {
          this.message = 'onReachStart';
          console.log(this.message);
        } : undefined)
        .onReachEnd(this.onReachEndValue ? () => {
          this.message = 'onReachEnd';
          console.log(this.message);
        } : undefined)
        .padding(10)
        .height('20%')
      }

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('flingTop')
            .id('WaterFlow_flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(4000);
            })
          Button('flingBottom')
            .id('WaterFlow_flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-4000);
            })
        }

        Row() {
          Button('toBottom')
            .id('WaterFlow_toBottom')
            .onClick((e: ClickEvent) => {
              console.log('scrollToBottom')
              this.scroller.scrollEdge(Edge.Bottom)
            })
          Button('toTop')
            .id('WaterFlow_toTop')
            .onClick((e: ClickEvent) => {
              console.log('scrollToBottom')
              this.scroller.scrollEdge(Edge.Top)
            })
          Button('resetText')
            .id('WaterFlow_resetText')
            .onClick((e: ClickEvent) => {
              this.message = 'Hello World';
            })
        }

        Row() {
          Button('onScrollFrameBeginValue:' + this.onScrollFrameBeginValue)
            .id('WaterFlow_onScrollFrameBeginValue')
            .onClick((e: ClickEvent) => {
              this.onScrollFrameBeginValue = !this.onScrollFrameBeginValue
            })
          Button('onScrollIndexValue:' + this.onScrollIndexValue)
            .id('WaterFlow_onScrollIndexValue')
            .onClick((e: ClickEvent) => {
              this.onScrollIndexValue = !this.onScrollIndexValue
            })
        }

        Row() {
          Button('onReachStartValue:' + this.onReachStartValue)
            .id('WaterFlow_onReachStart')
            .onClick((e: ClickEvent) => {
              this.onReachStartValue = !this.onReachStartValue
            })
          Button('onReachEndValue:' + this.onReachEndValue)
            .id('WaterFlow_onReachEnd')
            .onClick((e: ClickEvent) => {
              this.onReachEndValue = !this.onReachEndValue
            })
        }

        Row() {
          Button('frictionValue:' + this.frictionValue)
            .id('WaterFlow_friction')
            .onClick((e: ClickEvent) => {
              this.frictionValue = !this.frictionValue
            })
          Button('enableScrollInteractionValue:' + this.enableScrollInteractionValue)
            .id('WaterFlow_enableScrollInteraction')
            .onClick((e: ClickEvent) => {
              this.enableScrollInteractionValue = !this.enableScrollInteractionValue
            })
        }

        Row() {
          Button('layoutDirectionValue:' + this.layoutDirectionValue)
            .id('WaterFlow_layoutDirection')
            .onClick((e: ClickEvent) => {
              this.layoutDirectionValue = !this.layoutDirectionValue
            })
          Button('rowsGapValue:' + this.rowsGapValue)
            .id('WaterFlow_rowsGapValue')
            .onClick((e: ClickEvent) => {
              this.rowsGapValue = !this.rowsGapValue
            })
        }

        Row() {
          Button('columnsGapValue:' + this.columnsGapValue)
            .id('WaterFlow_columnsGapValue')
            .onClick((e: ClickEvent) => {
              this.columnsGapValue = !this.columnsGapValue
            })
          Button('rowsTemplateValue:' + this.rowsTemplateValue)
            .id('WaterFlow_rowsTemplateValue')
            .onClick((e: ClickEvent) => {
              this.rowsTemplateValue = !this.rowsTemplateValue
            })
        }

        Row() {
          Button('columnsTemplateValue:' + this.columnsTemplateValue)
            .id('WaterFlow_columnsTemplateValue')
            .onClick((e: ClickEvent) => {
              this.columnsTemplateValue = !this.columnsTemplateValue
            })
          Button('itemConstraintSizeValue:' + this.itemConstraintSizeValue)
            .id('WaterFlow_itemConstraintSizeValue')
            .onClick((e: ClickEvent) => {
              this.itemConstraintSizeValue = !this.itemConstraintSizeValue
            })
        }

        Row() {
          Button('nestedScrollValue:' + this.nestedScrollValue)
            .id('WaterFlow_nestedScrollValue')
            .onClick((e: ClickEvent) => {
              this.nestedScrollValue = !this.nestedScrollValue
            })
          Button('cachedCountValue:' + this.cachedCountValue)
            .id('WaterFlow_cachedCountValue')
            .onClick((e: ClickEvent) => {
              this.cachedCountValue = !this.cachedCountValue
            })
        }
      }
    }
  }

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.pushData(i);
    }
  }
}