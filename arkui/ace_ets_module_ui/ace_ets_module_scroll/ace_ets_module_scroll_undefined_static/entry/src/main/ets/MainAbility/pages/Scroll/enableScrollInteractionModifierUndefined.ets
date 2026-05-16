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
  FadingEdgeOptions
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, ListAttribute } from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ListModifier implements AttributeModifier<ListAttribute> {
  @Track public enableScrollInteraction: boolean | undefined = false;

  applyNormalAttribute(instance: ListAttribute): void {
    instance.enableScrollInteraction(this.enableScrollInteraction)
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State listModifier: ListModifier = new ListModifier()

  aboutToAppear() {
    this.listModifier.enableScrollInteraction = false
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
      .id('common_enableScrollInteractionModifier')

      Column() {
        Button('切换 enableScrollInteraction → ' +
          (this.listModifier.enableScrollInteraction === undefined ? 'undefined' : 'false'))
          .height('5%')
          .onClick(() => {
            this.listModifier.enableScrollInteraction =
              this.listModifier.enableScrollInteraction === undefined ? false : undefined
          }).margin({ top: 5 } as Margin)
          .id('changeButton')
      }
    }.width('100%').height('100%')
  }
}