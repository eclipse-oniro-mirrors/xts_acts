'use static'
import { CustomTransition, AnimateCallback } from './CustomNavigationUtils'
import {
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
  Entry
} from '@ohos.arkui.component'
import { Provide, State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct NavigationExample {
  pageInfos: NavPathStack = new NavPathStack();
  @State isHideToolBar: Boolean = false;

  aboutToAppear() {
    if (this.pageInfos === undefined) {
      this.pageInfos = new NavPathStack();
    }
    const pathInfo = new NavPathInfo(
      'pageOne',
      CustomTransition.getInstance().getAnimationId()
    );
    this.pageInfos.pushPath(pathInfo);
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        Text('this navigation bar')
      }
      .id('MyNavigation1')
      .titleMode(NavigationTitleMode.Mini)
      .title('NavIndex')
      .hideToolBar(this.isHideToolBar ? undefined : true)
      .toolbarConfiguration([
        {
          // $r("app.string.navigation_toolbar_add")和$r("app.media.ic_public_highlights_ed")需要替换为开发者所需的资源文件
          value: $r('app.string.module_desc'),
          icon: $r('app.media.startIcon')
        },
        {
          // $r("app.string.navigation_toolbar_app")和$r("app.media.ic_public_highlights")需要替换为开发者所需的资源文件
          value: $r('app.string.EntryAbility_desc'),
          icon: $r('app.media.background')
        },
        {
          // $r("app.string.navigation_toolbar_collect")和$r("app.media.ic_public_highlights")需要替换为开发者所需的资源文件
          value: $r('app.string.EntryAbility_label'),
          icon: $r('app.media.foreground')
        }
      ])

      Button('isHideToolBarUndefined=' + this.isHideToolBar)
        .onClick((event: ClickEvent)=> {
          this.isHideToolBar = !this.isHideToolBar
        })
        .id('hideToolBar')
    }.height('50%')
  }
}