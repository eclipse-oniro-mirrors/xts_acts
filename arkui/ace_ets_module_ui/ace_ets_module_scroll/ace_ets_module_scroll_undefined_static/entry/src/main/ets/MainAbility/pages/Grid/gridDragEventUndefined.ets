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
  Scroll
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GridDragEventUndefined {
  private scroller: Scroller = new Scroller();
  @State onItemDragStartValue: boolean = true;
  @State onItemDragEnterValue: boolean = true;
  @State onItemDragLeaveValue: boolean = true;
  @State onItemDragMoveValue: boolean = true;
  @State onItemDropValue: boolean = true;
  @State text: string = 'drag';
  @State message: string = 'Hello World';

  @Builder
  pixelMapBuilder() { //拖拽过程样式
    Column() {
      Text('drag')
        .fontSize(16)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.message)
        .id('Grid_text')
      Row({ space: 10 } as RowOptions) {
        Grid(this.scroller) {
          GridItem() {
            Text('GridItem1')
              .fontSize(16)
          }
          .id('Grid_item1')
          .borderWidth(2)
          .borderColor(Color.Red)
        }
        .id('Grid_1')
        .height('10%')
        .width('30%')
        .borderWidth(2)
        .borderColor(Color.Black)
        .editMode(true)
        .supportAnimation(true)
        .onItemDragStart(this.onItemDragStartValue ? undefined : (event: ItemDragInfo) => {
          this.message = 'onItemDragStart';
          console.log(this.message);
          return this.pixelMapBuilder;
        })
        .onItemDragEnter(this.onItemDragEnterValue ? undefined : (event: ItemDragInfo) => {
          this.message = 'onItemDragEnter';
          console.log(this.message);
        })
        .onItemDrop((event: ItemDragInfo, itemIndex: int, insertIndex: int,
          isSuccess: boolean) => {
        })

        Grid(this.scroller) {
          GridItem() {
            Text('GridItem2')
              .fontSize(16)
          }
          .id('Grid_item2')
          .borderWidth(2)
          .borderColor(Color.Red)
        }
        .id('Grid_2')
        .height('10%')
        .width('30%')
        .borderWidth(2)
        .borderColor(Color.Blue)
        .editMode(true)
        .supportAnimation(true)
        .onItemDragStart((event: ItemDragInfo) => {
          return this.pixelMapBuilder;
        })
        .onItemDragLeave(this.onItemDragLeaveValue ? undefined : (event: ItemDragInfo) => {
          this.message = 'onItemDragLeave';
          console.log(this.message);
        })
        .onItemDragMove(this.onItemDragMoveValue ? undefined :
          (event: ItemDragInfo, itemIndex: int, insertIndex: int) => {
            this.message = 'onItemDragMove';
            console.log(this.message);
          })
        .onItemDrop((event: ItemDragInfo, itemIndex: int, insertIndex: int,
          isSuccess: boolean) => {
        })

        Grid(this.scroller) {
          GridItem() {
            Text('GridItem3')
              .fontSize(16)
          }
          .id('Grid_item3')
          .borderWidth(2)
          .borderColor(Color.Red)
        }
        .id('Grid_3')
        .height('10%')
        .width('30%')
        .borderWidth(2)
        .borderColor(Color.Blue)
        .editMode(true)
        .supportAnimation(true)
        .onItemDrop(this.onItemDropValue ? undefined : (event: ItemDragInfo, itemIndex: int, insertIndex: int,
          isSuccess: boolean) => {
          this.message = 'onItemDrop';
          console.log(this.message);
        })
      }

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('resetText')
            .id('Grid_resetText')
            .onClick((e: ClickEvent) => {
              this.message = 'Hello World';
            })
          Button('' + this.onItemDragStartValue)
            .id('Grid_onItemDragStartValue')
            .onClick((e: ClickEvent) => {
              this.onItemDragStartValue = !this.onItemDragStartValue;
            })
          Button('' + this.onItemDragEnterValue)
            .id('Grid_onItemDragEnterValue')
            .onClick((e: ClickEvent) => {
              this.onItemDragEnterValue = !this.onItemDragEnterValue;
            })
        }

        Row() {
          Button('' + this.onItemDragLeaveValue)
            .id('Grid_onItemDragLeaveValue')
            .onClick((e: ClickEvent) => {
              this.onItemDragLeaveValue = !this.onItemDragLeaveValue;
            })
          Button('' + this.onItemDragMoveValue)
            .id('Grid_onItemDragMoveValue')
            .onClick((e: ClickEvent) => {
              this.onItemDragMoveValue = !this.onItemDragMoveValue;
            })

          Button('' + this.onItemDropValue)
            .id('Grid_onItemDropValue')
            .onClick((e: ClickEvent) => {
              this.onItemDropValue = !this.onItemDropValue;
            })
        }

      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}