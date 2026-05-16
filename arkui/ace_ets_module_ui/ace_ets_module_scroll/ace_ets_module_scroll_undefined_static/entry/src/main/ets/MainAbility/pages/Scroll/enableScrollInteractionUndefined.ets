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
import { State } from '@ohos.arkui.stateManagement'
import { ComponentContent } from '@kit.ArkUI'
import { FrameNode, UIContext } from '@kit.ArkUI'

@Entry
@Component
struct ScrollPage {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State enableScrollInteraction:boolean | undefined = false;

  build() {
    Stack() {
      Column() {
          List() {
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
          }
          .scrollBar(BarState.On)
          .enableScrollInteraction(this.enableScrollInteraction)
          .id('common_enableScrollInteraction')
      }
      Column() {
        Button('切换 enableScrollInteraction → ' + (this.enableScrollInteraction === undefined ? 'undefined' : 'false'))
          .height('5%')
          .onClick(() => {
            this.enableScrollInteraction = this.enableScrollInteraction === undefined ? false : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_enableScrollInteraction')
      }
    }.width('100%').height('100%')
  }
}