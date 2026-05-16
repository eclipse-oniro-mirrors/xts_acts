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
  NestedScrollOptions,
  AttributeModifier,
  GridAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<GridAttribute> {
  public alignItemsValue: boolean = true;
  public cachedCountValue: boolean = true;
  public cellLengthValue: boolean = true;
  public edgeEffectValue: boolean = true;
  public enableScrollInteractionValue: boolean = true;
  public frictionValue: boolean = true;
  public layoutDirectionValue: boolean = true;
  public minCountValue: boolean = true;
  public nestedScrollValue: boolean = true;
  public supportAnimationValue: boolean = true;

  applyNormalAttribute(instance: GridAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct GridAttrUndefined {
  private scroller: Scroller = new Scroller();
  @State myModifier: MyModifier = new MyModifier();
  private data: string[] =
    ['1', '2', '3', '4', '5', '6'];

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('GridAttrsModifier')
      Grid(this.scroller) {
        ForEach(this.data, (day: string) => {
          GridItem() {
            Text(day)
              .textAlign(TextAlign.Center)
          }.borderWidth(2)
          .borderColor(Color.Red)
        }, (item: string) => item)
      }
      .id('GridM')
      .columnsTemplate('1fr 1fr')
      .width('30%')
      .height('10%')
      .columnsGap(10)
      .rowsGap(10)
      .attributeModifier(this.myModifier)

      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('' + this.myModifier.alignItemsValue)
            .id('GridM_alignItemsValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.alignItemsValue = !this.myModifier.alignItemsValue
            })
          Button('' + this.myModifier.cachedCountValue)
            .id('GridM_cachedCountValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.cachedCountValue = !this.myModifier.cachedCountValue
            })
          Button('' + this.myModifier.cellLengthValue)
            .id('GridM_cellLengthValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.cellLengthValue = !this.myModifier.cellLengthValue
            })
        }

        Row() {

          Button('' + this.myModifier.edgeEffectValue)
            .id('GridM_edgeEffectValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.edgeEffectValue = !this.myModifier.edgeEffectValue
            })
          Button('' + this.myModifier.enableScrollInteractionValue)
            .id('GridM_enableScrollInteractionValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.enableScrollInteractionValue = !this.myModifier.enableScrollInteractionValue
            })
          Button('' + this.myModifier.frictionValue)
            .id('GridM_frictionValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.frictionValue = !this.myModifier.frictionValue
            })
        }

        Row() {
          Button('' + this.myModifier.layoutDirectionValue)
            .id('GridM_layoutDirectionValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.layoutDirectionValue = !this.myModifier.layoutDirectionValue
            })

          Button('' + this.myModifier.minCountValue)
            .id('GridM_minCountValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.minCountValue = !this.myModifier.minCountValue
            })
          Button('' + this.myModifier.nestedScrollValue)
            .id('GridM_nestedScrollValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.nestedScrollValue = !this.myModifier.nestedScrollValue
            })
        }

        Row() {
          Button('' + this.myModifier.supportAnimationValue)
            .id('GridM_supportAnimationValue')
            .onClick((e: ClickEvent) => {
              this.myModifier.supportAnimationValue = !this.myModifier.supportAnimationValue
            })
        }

      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}