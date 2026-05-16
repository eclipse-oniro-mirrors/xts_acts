'use static'
import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Alignment,
  Tabs,
  BarPosition,
  TabContent,
  NestedScrollMode,
  Refresh,
  Button,
  List,
  RefreshStatus,
  ForEach,
  LazyForEach,
  ListItemAlign,
  ListItem,
  NestedScrollMode,
  ScrollState,
  Text,
  Scroller,
  TextAlign,
  BarState,
  Scroll,
  Edge,
  ContentClipMode,
  CrownSensitivity,
  EdgeEffect,
  Color,
  ClickEvent,
  Margin,
  ScrollDirection,
  ScrollSource,
  LengthMetrics,
  FadingEdgeOptions,
  Resource
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, ListAttribute } from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ListModifier implements AttributeModifier<ListAttribute> {
  @Track public friction: number | Resource | undefined = 100;

  applyNormalAttribute(instance: ListAttribute): void {
    instance.friction(this.friction)
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: String[] =
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
      '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37'];
  @State listModifier: ListModifier = new ListModifier()

  aboutToAppear() {
    this.listModifier.friction = 100.0
  }

  build() {
    Stack() {
      List() {
        Column() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
          }, (item: string) => item)
        }.width('100%')
      }
      .scrollBar(BarState.On)
      .attributeModifier(this.listModifier)
      .id('common_frictionModifier')

      Column() {
        Button('切换 friction → ' + (this.listModifier.friction === undefined ? 'undefined' : '100'))
          .height('5%')
          .onClick(() => {
            this.listModifier.friction = this.listModifier.friction === undefined ? 100.0 : undefined
          }).margin({ top: 5 } as Margin)
          .id('changeButton')
      }
    }.width('100%').height('100%')
  }
}