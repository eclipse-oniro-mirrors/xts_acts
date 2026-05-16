'use static'

import {
  TabContentAnimatedTransition,
  ListScroller,
  LengthConstrain,
  AttributeModifier,
  UIGridEvent,
  ScrollSource,
  NodeContainer,
  ImageAttribute,
  ScrollAttribute,
  GridAttribute,
  ListAttribute,
  ResourceColor,
  ScrollBarMargin,
  TabContentTransitionProxy,
  FocusWrapMode,
  TabsController,
  BarPosition,
  Divider,
  EdgeEffect,
  BarMode,
  AnimationMode,
  Position,
  LocalizedEdgeColors,
  OutlineStyle,
  WaterFlowAttribute,
  EdgeOutlineStyles,
  EdgeOutlineWidths,
  EdgeColors,
  OutlineRadiuses,
  Circle,
  ExpectedFrameRateRange,
  PlayMode,
  OnAlphabetIndexerRequestPopupDataCallback,
  OnAlphabetIndexerPopupSelectCallback,
  AlphabetIndexerOptions,
  Column,
  OnAlphabetIndexerSelectCallback,
  IndexerAlign,
  TextAlign,
  AlphabetIndexer,
  ListItem,
  Stack,
  ButtonType,
  HoverModeAreaType,
  Length,
  SheetSize,
  SheetType,
  EffectEdge,
  FontWeight,
  FontStyle,
  Font,
  PopupOptions,
  RefreshStatus,
  PopupMessageOptions,
  Placement,
  LocalizedBorderRadiuses,
  BorderRadiuses,
  LengthMetrics,
  TextInput,
  Margin,
  $$,
  SheetKeyboardAvoidMode,
  SheetOptions,
  SheetTitleOptions,
  Orientation,
  ThemeColorMode,
  BlurStyle,
  ScrollBar,
  BackgroundBlurStyleOptions,
  MoreButtonOptions,
  BlurOptions,
  AdaptiveColor,
  BackgroundEffectOptions,
  ItemFillPolicy,
  NavDestinationActiveReason,
  $r,
  HorizontalAlign,
  ForEach,
  List,
  NavigationMode,
  Alignment,
  Refresh,
  Entry,
  Builder,
  PopInfo,
  NavBarPosition,
  Callback,
  Text,
  TextAttribute,
  BarStyle,
  Image,
  Color,
  Row,
  ScrollBarDirection,
  NavDestinationCommonTitle,
  Component,
  Button,
  ButtonAttribute,
  Scroll,
  ClickEvent,
  Curve,
  NavPathStack,
  Navigation,
  LayoutSafeAreaEdge,
  LaunchMode,
  NavigationMenuItem,
  NavPathInfo,
  NavDestination,
  LayoutSafeAreaType,
  NavigationOptions,
  NavigationTitleMode,
  NavigationCommonTitle,
  ScrollSnapAnimationSpeed,
  ScrollSnapAlign,
  ScrollDirection,
  NavDestinationMode,
  NavDestinationContext,
  PinchGesture,
  GestureEvent,
  Visibility,
  WaterFlow,
  FlowItem,
  ItemDragInfo,
  ScrollState,
  Scroller,
  LazyForEach,
  Blank,
  GridDirection,
  BarState,
  GridItem,
  Grid,
  GridLayoutOptions,
  ScrollBarAttribute,
  ColorMetrics,
  PresetFillType
} from '@ohos.arkui.component'

import { State, Consume, AppStorage, Observed } from '@ohos.arkui.stateManagement'

import hilog from '@ohos.hilog'

import { UIContext } from '@ohos.arkui.UIContext'

import { LengthUnit, typeNode } from '@ohos.arkui.node'

import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct GridContentSizeDemo {
  // 测试数据
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  // 创建滚动控制器 - 改为Grid对应的Scroller
  private scroller: Scroller = new Scroller();

  // 状态变量
  @State private contentWidth: number = 0;
  @State private contentHeight: number = 0;
  @State private statusText: string = '点击按钮测试 contentSize 方法';
  @State private lastCallResult: string = '';

  build() {
    Column() {
      Button('正常获取')
        .onClick(() => {
          try {
            const size = this.scroller.contentSize();
            this.contentWidth = size.width;
            this.contentHeight = size.height;
            this.statusText = '正常获取内容尺寸成功';
            this.lastCallResult = `成功: width=${size.width.toFixed(1)}, height=${size.height.toFixed(1)}`;
          } catch (error) {
            this.handleError(error as BusinessError, '正常获取');
          }
        })
        .layoutWeight(1)
        .key('normal')
      // 显示区域
      Text('contentSize() 方法测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(this.statusText)
        .fontSize(16)
        .fontColor(Color.Blue)

      Text(`${this.contentWidth.toFixed(1)}`)
        .fontSize(14)
        .key('contentWidth')
      Text(`${this.contentHeight.toFixed(1)}`)
        .fontSize(14)
        .key('contentHeight')

      Text(`上次调用: ${this.lastCallResult}`)
        .fontSize(12)
        .fontColor(0x666666)
        .maxLines(2)

      Divider()

      // 滚动测试区域 - 主要改动在这里
      Grid(this.scroller) {  // List改为Grid
        ForEach(this.data, (item: number) => {
          GridItem() {  // ListItem改为GridItem
            Text(`项目 ${item}`)
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
              .borderRadius(8)
              .backgroundColor(0xE6F3FF)  // 添加背景色以便更好区分
          }
        }, (item: number) => item.toString())
      }
      .columnsTemplate('1fr 1fr 1fr')  // 添加网格列模板：3列
      // .columnsGap(10)  // 列间距
      // .rowsGap(10)     // 行间距
      .width('100%')
      .scrollBar(BarState.On)
      .width('100%')
      .height(300)
      .backgroundColor(0xF5F5F5)

      // 测试按钮区域（保持不变）
      Text('基础功能测试').fontSize(16).fontWeight(FontWeight.Medium).width('100%')

      Row() {
        Button('滚动后获取')
          .onClick(() => {
            // 先滚动到某个位置再获取尺寸
            this.scroller.scrollTo({ xOffset: 200, yOffset: 200 });
            setTimeout(() => {
              try {
                const size = this.scroller.contentSize();
                this.contentWidth = size.width;
                this.contentHeight = size.height;
                this.statusText = '滚动后获取内容尺寸';
                this.lastCallResult = `滚动后: width=${size.width.toFixed(1)}, height=${size.height.toFixed(1)}`;
              } catch (error) {
                this.handleError(error as BusinessError, '滚动后获取');
              }
            }, 100);
          })
          .layoutWeight(1)
      }
      .width('100%')

      Text('边界情况测试').fontSize(16).fontWeight(FontWeight.Medium).width('100%')

      Row() {
        Button('空数据')
          .onClick(() => {
            // 测试空数据场景
            const emptyScroller = new Scroller();
            try {
              const size = emptyScroller.contentSize();
              this.contentWidth = size.width;
              this.contentHeight = size.height;
              this.statusText = '空控制器内容尺寸';
              this.lastCallResult = `空控制器: width=${size.width.toFixed(1)}, height=${size.height.toFixed(1)}`;
            } catch (error) {
              this.handleError(error as BusinessError, '空数据测试');
            }
          })
          .layoutWeight(1)

        Button('变化布局')
          .onClick(() => {
            // 改变数据量后测试尺寸变化
            this.data = (() => {
              let arr: number[] = [];
              for (let i = 1; i <= 50; i++) { // 增加数据量
                arr.push(i);
              }
              return arr;
            })();

            setTimeout(() => {
              try {
                const size = this.scroller.contentSize();
                this.contentWidth = size.width;
                this.contentHeight = size.height;
                this.statusText = '布局变化后内容尺寸';
                this.lastCallResult = `布局变化: width=${size.width.toFixed(1)}, height=${size.height.toFixed(1)}`;
              } catch (error) {
                this.handleError(error as BusinessError, '布局变化测试');
              }
            }, 200);
          })
          .layoutWeight(1)
      }
      .width('100%')

      // 高级功能测试
      Text('高级测试').fontSize(16).fontWeight(FontWeight.Medium).width('100%')

      Row() {
        Button('重置状态')
          .onClick(() => {
            this.contentWidth = 0;
            this.contentHeight = 0;
            this.statusText = '状态已重置';
            this.lastCallResult = '重置完成';
            this.scroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
          .layoutWeight(1)
      }
      .width('100%')

    }
    .padding(16)
    .width('100%')
    .height('100%')
    .onAppear(() => {
      // 组件出现时初始化内容尺寸
      setTimeout(() => {
        try {
          const size = this.scroller.contentSize();
          this.contentWidth = size.width;
          this.contentHeight = size.height;
          this.statusText = '组件初始化完成';
          this.lastCallResult = `初始化: width=${size.width.toFixed(1)}, height=${size.height.toFixed(1)}`;
        } catch (error) {
          this.handleError(error as BusinessError, '初始化');
        }
      }, 100);
    })
  }

  // 错误处理函数
  private handleError(error: BusinessError, scenario: string): void {
    this.statusText = `${scenario}失败`;
    this.lastCallResult = `错误: code=${error.code}, message=${error.message}`;
    console.error(`contentSize test failed in ${scenario}, code=${error.code}, message=${error.message}`);
  }
}