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
  AttributeModifier,
  GridAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Builder
function pixelMapBuilder() { //拖拽过程样式
  Column() {
    Text('drag')
      .fontSize(16)
      .width(80)
      .height(80)
      .textAlign(TextAlign.Center)
  }
}

@Observed
export class MyModifier1 implements AttributeModifier<GridAttribute> {
  public onItemDragStartValue: boolean = true;
  public onItemDragEnterValue: boolean = true;
  public message: string = 'hello';

  applyNormalAttribute(instance: GridAttribute): void {
    instance
      .onItemDragStart(this.onItemDragStartValue ? undefined : (event: ItemDragInfo) => {
        this.message = 'onItemDragStart';
        console.log(this.message);
        return pixelMapBuilder;
      })
      .onItemDragEnter(this.onItemDragEnterValue ? undefined : (event: ItemDragInfo) => {
        this.message = 'onItemDragEnter';
        console.log(this.message);
      })
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<GridAttribute> {
  public onItemDragLeaveValue: boolean = true;
  public onItemDragMoveValue: boolean = true;
  public message: string = 'hello';

  applyNormalAttribute(instance: GridAttribute): void {
    instance
      .onItemDragLeave(this.onItemDragLeaveValue ? undefined : (event: ItemDragInfo) => {
        this.message = 'onItemDragLeave';
        console.log(this.message);
      })
      .onItemDragMove(this.onItemDragMoveValue ? undefined :
        (event: ItemDragInfo, itemIndex: int, insertIndex: int) => {
          this.message = 'onItemDragMove';
          console.log(this.message);
        })
  }
}

@Observed
export class MyModifier3 implements AttributeModifier<GridAttribute> {
  public onItemDropValue: boolean = true;
  public message: string = 'hello';

  applyNormalAttribute(instance: GridAttribute): void {
    instance
      .onItemDrop(this.onItemDropValue ? undefined : (event: ItemDragInfo, itemIndex: int, insertIndex: int,
        isSuccess: boolean) => {
        this.message = 'onItemDrop';
        console.log(this.message);
      })
  }
}

@Entry
@Component
struct GridDragEventUndefined {
  private scroller: Scroller = new Scroller();
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();
  @State myModifier3: MyModifier3 = new MyModifier3();

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Row({ space: 10 } as RowOptions) {
        Column() {
          Text(this.myModifier1.message)
            .id('GridM_text1')
          Grid(this.scroller) {
            GridItem() {
              Text('GridItem_M1')
                .fontSize(16)
            }
            .id('GridM_item1')
            .borderWidth(2)
            .borderColor(Color.Red)
          }
          .id('GridM_1')
          .height('10%')
          .width('30%')
          .borderWidth(2)
          .borderColor(Color.Black)
          .editMode(true)
          .supportAnimation(true)
          .attributeModifier(this.myModifier1)
          .onItemDrop((event: ItemDragInfo, itemIndex: int, insertIndex: int,
            isSuccess: boolean) => {
          })
        }

        Column() {
          Text(this.myModifier2.message)
            .id('GridM_text2')
          Grid(this.scroller) {
            GridItem() {
              Text('GridItem_M2')
                .fontSize(16)
            }
            .id('GridM_item2')
            .borderWidth(2)
            .borderColor(Color.Red)
          }
          .id('GridM_2')
          .height('10%')
          .width('30%')
          .borderWidth(2)
          .borderColor(Color.Blue)
          .editMode(true)
          .supportAnimation(true)
          .onItemDragStart((event: ItemDragInfo) => {
            return pixelMapBuilder;
          })
          .attributeModifier(this.myModifier2)
          .onItemDrop((event: ItemDragInfo, itemIndex: int, insertIndex: int,
            isSuccess: boolean) => {
          })

        }

        Column() {
          Text(this.myModifier3.message)
            .id('GridM_text3')
          Grid(this.scroller) {
            GridItem() {
              Text('GridItem3')
                .fontSize(16)
            }
            .id('GridM_item3')
            .borderWidth(2)
            .borderColor(Color.Red)
          }
          .id('GridM_3')
          .height('10%')
          .width('30%')
          .borderWidth(2)
          .borderColor(Color.Blue)
          .editMode(true)
          .supportAnimation(true)
          .attributeModifier(this.myModifier3)
        }

      }

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('resetText')
            .id('GridM_resetText')
            .onClick((e: ClickEvent) => {
              this.myModifier1.message = 'Hello World';
              this.myModifier2.message = 'Hello World';
              this.myModifier3.message = 'Hello World';
            })
          Button('' + this.myModifier1.onItemDragStartValue)
            .id('GridM_onItemDragStartValue')
            .onClick((e: ClickEvent) => {
              this.myModifier1.onItemDragStartValue = !this.myModifier1.onItemDragStartValue;
            })
          Button('' + this.myModifier1.onItemDragEnterValue)
            .id('GridM_onItemDragEnterValue')
            .onClick((e: ClickEvent) => {
              this.myModifier1.onItemDragEnterValue = !this.myModifier1.onItemDragEnterValue;
            })
        }

        Row() {
          Button('' + this.myModifier2.onItemDragLeaveValue)
            .id('GridM_onItemDragLeaveValue')
            .onClick((e: ClickEvent) => {
              this.myModifier2.onItemDragLeaveValue = !this.myModifier2.onItemDragLeaveValue;
            })
          Button('' + this.myModifier2.onItemDragMoveValue)
            .id('GridM_onItemDragMoveValue')
            .onClick((e: ClickEvent) => {
              this.myModifier2.onItemDragMoveValue = !this.myModifier2.onItemDragMoveValue;
            })

          Button('' + this.myModifier3.onItemDropValue)
            .id('GridM_onItemDropValue')
            .onClick((e: ClickEvent) => {
              this.myModifier3.onItemDropValue = !this.myModifier3.onItemDropValue;
            })
        }

      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}