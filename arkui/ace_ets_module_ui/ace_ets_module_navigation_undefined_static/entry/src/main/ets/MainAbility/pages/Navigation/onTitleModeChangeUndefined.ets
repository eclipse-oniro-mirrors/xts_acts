'use static'
import { CustomTransition, AnimateCallback } from './CustomNavigationUtils'
import {
  ButtonType,
  NavDestinationMode,
  NavPathInfo,
  TextAlign,
  ForEach,
  List,
  ListItem,
  HorizontalAlign,
  NavigationTransitionProxy,
  NavigationAnimatedTransition,
  NavContentInfo,
  Row,
  NavigationMenuItem,
  ToolbarItem,
  NavigationTitleMode,
  Navigation,
  NavigationMode,
  NavigationOperation,
  NavDestinationContext,
  NavPathStack,
  LengthMetrics,
  DividerMode,
  DividerStyleOptions,
  CancelButtonStyle,
  TextInput,
  AvoidanceMode,
  SelectAttribute,
  AttributeModifier,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Menu,
  Scroll,
  Scroller,
  MenuAttribute,
  MenuElement,
  Builder,
  MenuItem,
  MenuItemOptions,
  CustomBuilder,
  Color,
  ResponseType,
  Select,
  SelectOption,
  DividerOptions,
  Font,
  ResourceColor,
  Length,
  Offset,
  $r,
  OnSelectCallback,
  ArrowPosition,
  FontStyle,
  FontWeight,
  MenuAlignType,
  ControlSize,
  BlurStyle,
  Image,
  Resource,
  ResourceStr,
  OptionWidthMode,
  Dimension,
  Entry,
  Edge
} from '@ohos.arkui.component'
import { Provide, State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct NavigationExample {
  pageInfos: NavPathStack = new NavPathStack();
  @State num: number = 0;
  @State def: boolean = true;
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  private titleModeArray: Array<NavigationTitleMode | undefined> = [
    NavigationTitleMode.Free,
    NavigationTitleMode.Full,
    NavigationTitleMode.Mini,
  ]
  @State titleModeIndex: int = 0

  build() {
    Column() {
      Navigation(this.pageInfos) {
        Column() {
          Button('titleModeChange:' + this.num)
            .id('text')
          Button('set undefined:' + this.def).onClick((e: ClickEvent) => {
            this.def = !this.def
          })
            .id('Navigation_onTitleModeChange')
        }

        Column() {
          Scroll(this.scroller) {
            Column() {
              ForEach(this.arr, (item: number) => {
                Text(item.toString())
                  .width('90%')
                  .height(150)
                  // .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin(10)
              }, (item: number) => item.toString())
            }.width('100%')
          }
        }

      }
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Free)
      .onTitleModeChange(this.def ? (titleModel: NavigationTitleMode) => {
        console.log('[tjm] titleMode')
        this.num = this.num + 1
      } : undefined)
      .id('MyNavigation2')
      .height('50%')

      Column() {
        Row() {
          Button('flingTop')
            .id('flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(4000);
            })
          Button('flingBottom')
            .id('flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-4000);
            })
        }

      }
    }
  }
}