'use static'
import { CustomTransition, AnimateCallback } from './CustomNavigationUtils'
import {
  NavigationAnimatedTransition,
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
  NavDestination,
  ColumnOptions
} from '@ohos.arkui.component'
import { Provide, State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct NavigationExample {
  pageInfos: NavPathStack = new NavPathStack();
  @State num: int = 0;
  @State def: boolean = true;
  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Text('pageOne2')
          .id('NavPathStackApi2_text_pageOne')
          .onClick(() => {
            this.pageInfos.pop()
          })
      }.width('100%').height('100%')
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column() {
      Text(this.num.toString()).id('changeCountText')

      Navigation(this.pageInfos) {
        Text('this navigation bar')

        Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule })
          .id('pushButton')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            //将name指定的NavDestination页面信息入栈，传递的数据为param
            this.pageInfos.pushDestinationByName('pageOne', CustomTransition.getInstance().getAnimationId());
          })
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
      .customNavContentTransition(this.def ?
        (from: NavContentInfo, to: NavContentInfo, operation: NavigationOperation):
        NavigationAnimatedTransition | undefined => {
          this.num = to.index
          // 返回 undefined 表示使用默认转场动效
          return undefined
        } : undefined)
      .height('50%')

      Button('customNavContentTransition:' + this.num + this.def)
        .id('toggleButton')
        .onClick((e: ClickEvent) => {
          this.def = !this.def
        })
    }
  }
}