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
  NestedScrollOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GridAttrUndefined {
  private scroller: Scroller = new Scroller();
  @State alignItemsValue: boolean = true;
  @State cachedCountValue: boolean = true;
  @State cellLengthValue: boolean = true;
  @State edgeEffectValue: boolean = true;
  @State enableScrollInteractionValue: boolean = true;
  @State frictionValue: boolean = true;
  @State layoutDirectionValue: boolean = true;
  @State minCountValue: boolean = true;
  @State nestedScrollValue: boolean = true;
  @State supportAnimationValue: boolean = true;
  private data: string[] =
    ['1', '2', '3', '4', '5', '6'];

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('GridAttrs')
      Grid(this.scroller) {
        ForEach(this.data, (day: string) => {
          GridItem() {
            Text(day)
              .textAlign(TextAlign.Center)
          }.borderWidth(2)
          .borderColor(Color.Red)
        }, (item: string) => item)
      }
      .id('Grid')
      .columnsTemplate('1fr 1fr')
      .width('30%')
      .height('10%')
      .columnsGap(10)
      .rowsGap(10)
      .alignItems(this.alignItemsValue ? undefined : GridItemAlignment.STRETCH)
      .cachedCount(this.cachedCountValue ? undefined : 2, this.cachedCountValue ? undefined : true)
      .cellLength(this.cellLengthValue ? undefined : 60.0)
      .edgeEffect(this.edgeEffectValue ? undefined : EdgeEffect.Fade)
      .enableScrollInteraction(this.enableScrollInteractionValue ? undefined : false)
      .friction(this.frictionValue ? undefined : 1000000.0)
      .layoutDirection(this.layoutDirectionValue ? undefined : GridDirection.Column)
      .minCount(this.minCountValue ? undefined : 3)
      .nestedScroll(this.nestedScrollValue ? undefined : {
        scrollForward: NestedScrollMode.SELF_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      } as NestedScrollOptions)
      .supportAnimation(this.supportAnimationValue ? undefined : true)

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('' + this.alignItemsValue)
            .id('Grid_alignItemsValue')
            .onClick((e: ClickEvent) => {
              this.alignItemsValue = !this.alignItemsValue
            })
          Button('' + this.cachedCountValue)
            .id('Grid_cachedCountValue')
            .onClick((e: ClickEvent) => {
              this.cachedCountValue = !this.cachedCountValue
            })
          Button('' + this.cellLengthValue)
            .id('Grid_cellLengthValue')
            .onClick((e: ClickEvent) => {
              this.cellLengthValue = !this.cellLengthValue
            })
        }

        Row() {

          Button('' + this.edgeEffectValue)
            .id('Grid_edgeEffectValue')
            .onClick((e: ClickEvent) => {
              this.edgeEffectValue = !this.edgeEffectValue
            })
          Button('' + this.enableScrollInteractionValue)
            .id('Grid_enableScrollInteractionValue')
            .onClick((e: ClickEvent) => {
              this.enableScrollInteractionValue = !this.enableScrollInteractionValue
            })
          Button('' + this.frictionValue)
            .id('Grid_frictionValue')
            .onClick((e: ClickEvent) => {
              this.frictionValue = !this.frictionValue
            })
        }

        Row() {
          Button('' + this.layoutDirectionValue)
            .id('Grid_layoutDirectionValue')
            .onClick((e: ClickEvent) => {
              this.layoutDirectionValue = !this.layoutDirectionValue
            })

          Button('' + this.minCountValue)
            .id('Grid_minCountValue')
            .onClick((e: ClickEvent) => {
              this.minCountValue = !this.minCountValue
            })
          Button('' + this.nestedScrollValue)
            .id('Grid_nestedScrollValue')
            .onClick((e: ClickEvent) => {
              this.nestedScrollValue = !this.nestedScrollValue
            })
        }

        Row() {
          Button('' + this.supportAnimationValue)
            .id('Grid_supportAnimationValue')
            .onClick((e: ClickEvent) => {
              this.supportAnimationValue = !this.supportAnimationValue
            })
        }

      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}