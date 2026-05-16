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
  EdgeEffectOptions,
  EffectEdge
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, ScrollAttribute } from '@ohos.arkui.component'
import { State, Observed, Track } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  @Track public edgeEffectVal1: EdgeEffect | undefined = EdgeEffect.Spring;

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.edgeEffect(this.edgeEffectVal1, { alwaysEnabled: false, effectEdge: EdgeEffect.None } as EdgeEffectOptions)
  }
}

@Entry
@Component
struct ScrollCommonExample {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State scrollModifier: ScrollModifier = new ScrollModifier()

  aboutToAppear() {
    this.scrollModifier.edgeEffectVal1 = EdgeEffect.Spring
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .backgroundColor(Color.Red)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
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
      .id('common_edgeEffectModifier');

      Column() {
        Button('切换 EdgeEffect → ' + (this.scrollModifier.edgeEffectVal1 === undefined ? 'undefined' : 'Spring'))
          .onClick(() => {
            this.scrollModifier.edgeEffectVal1 =
              this.scrollModifier.edgeEffectVal1 === undefined ? EdgeEffect.Spring : undefined
          }).margin({ top: 5 } as Margin).id('changeButton')
      }
    }.width('100%').height('100%')
  }
}