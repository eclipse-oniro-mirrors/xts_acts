'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {attrsManager} from '../../common/AttrsManager';
import {Leave, Enter} from '../../common/Utils'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import  { AnimatorResult, AnimatorOptions, PlayMode } from '@ohos.animator';
import {BadgeParamWithNumber,Divider,ColumnOptions,ListItemGroup,Axis,MenuItemGroup,TabContent,FlowItem,GridRowOptions,BreakpointsReference,GridColOptions,ColumnOptions,SideBarContainerType,HorizontalAlign,VerticalAlign,AlignRuleOption,
GutterOption,BreakPoints,BadgeParam,BadgeStyle,GridColColumnOption,GridColOptions,GridItem,GridCol,GridColColumnOption,GridRowDirection,
ToggleType,TimePicker,SliderStyle,FlexDirection,ProgressType,TextTimerController,PatternLock,ScrollBar,applyStyles,
MenuItemOptions,MenuItem,$r,Entry,Column,Component,Button,ClickEvent,ForEach,Text,Row,List,ListItem,Color,FlexAlign,ExpectedFrameRateRange,Scroll,Margin,
CommonMethod,Curve,AlphabetIndexer,ScrollAnimationOptions,Blank,Checkbox,CheckboxGroup,DataPanel,DatePicker,Gauge,Image,NavDestination,
  ImageAnimator,LoadingProgress,Marquee,Menu,Navigation,Progress,QRCode,Radio,Rating,RichText,Scroller,Flex,BarState,
  ScrollDirection,Search,Select,Slider,TextArea,TextClock,ImageFit,TextInput,TextPicker,TextTimer,Toggle,Web,Circle,Ellipse,Line,Polyline,Polygon,Path,Rect,Shape,Badge
,ColumnSplit,Counter,GridRow,Grid,Refresh,RelativeContainer,RowSplit,TextAlign,SideBarContainer,Stack,Swiper,Tabs,WaterFlow,DataPanelType,
  Builder
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { RouterParams } from '../../common/Utils';
interface VisibleData{
  isVisible: string
  currentRatio?: number
}
interface ViewOption {
targetView: string
componentKey: string
compareTextKey: string
compareTextWidth: number
compareTextHeight: number
scrollWidth: number
scrollHeight: number
columnWidth: number
columnHeight: number
buttonWidth: number
buttonHeight: number
componentWidth: number
componentHeight: number
}
interface RouterParamOptions {
  view: ViewOption
}

@Entry
@Component
struct OnVisibleAreaChangePage {
  @StoragePropRef("_yOffSetValue") _yOffSetValue: number = 0;
  @StoragePropRef("_ratiosLeft") _ratiosLeft: number = 0.0;
  @StoragePropRef("_ratiosRight") _ratiosRight: number = 0.0;
  @State _compositionValue: string = '';
  @State targetView: string = '';
  @State componentKey: string = '';
  @State compareTextKey: string =  '';
  @State compareTextWidth: number = 0
  @State compareTextHeight: number = 0
  @State scrollWidth: number = 0
  @State scrollHeight: number = 0
  @State columnWidth: number = 0
  @State columnHeight: number = 0
  @State buttonWidth: number = 0
  @State buttonHeight: number = 0
  @State componentWidth: number = 0
  @State componentHeight: number = 0
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller()
  private value: string[] = new Array<string>('#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'); //Use by AlphabetIndexer TextPicker
  private src: string = 'Running Marquee starts rolling A B C D E F G H I J'; //Use by Marquee QRCode

  onPageShow() {
    console.info('OnVisibleAreaChangePage show called ')

    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.compareTextKey = routerParamOptions.view.compareTextKey
      this.compareTextWidth = routerParamOptions.view.compareTextWidth
      this.compareTextHeight = routerParamOptions.view.compareTextHeight
      this.scrollWidth = routerParamOptions.view.scrollWidth
      this.scrollHeight = routerParamOptions.view.scrollHeight
      this.columnWidth = routerParamOptions.view.columnWidth
      this.columnHeight = routerParamOptions.view.columnHeight
      this.buttonWidth = routerParamOptions.view.buttonWidth
      this.buttonHeight = routerParamOptions.view.buttonHeight
      this.componentWidth = routerParamOptions.view.componentWidth
      this.componentHeight = routerParamOptions.view.componentHeight
  } catch (error) {
    console.log(' routerParamOptions error ' + error);
  }
  }
  /*
   * Set common style.
   */

commonStyle(instance: CommonMethod) {
    instance.key(this.componentKey)
    instance.width(this.componentWidth)
    instance.height(this.componentHeight)
    instance.onVisibleAreaChange([this._ratiosLeft, this._ratiosRight], (isVisible: boolean, currentRatio: number) => {
      console.info('Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
      this._compositionValue += `@` + JSON.stringify({  //对象转字符串为空 this._compositionValue @{}
        isVisible: `${isVisible}`,
        currentRatio: currentRatio
      } as VisibleData)
    })
  }

  @Builder
  myBuilder() {
    Column() {
      Text("bindSheet")
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
  //Draw screen
  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          Text(this._compositionValue)
            .key(this.compareTextKey)
            .width(this.compareTextWidth as number)
            .height(this.compareTextHeight as number)
          if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Blank') {
            Blank()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Button') {
            Button('button').applyStyles(this.commonStyle)

          } else if (this.targetView == 'Checkbox') {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [25] })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'DatePicker') {
            DatePicker()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Divider') {
            Divider()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Gauge') {
            console.log('++++++1++++++++++')
            Gauge({ value: 75 })
              .colors([['0x317AF7', 1], ['0x5BA854', 1], ['0xE08C3A', 1], ['0x9C554B', 1]])
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            console.log('++++++2++++++++++')
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon')).applyStyles(this.commonStyle)

          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([{ src: $r('app.media.icon') }]).applyStyles(this.commonStyle)

          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress()
              .color(Color.Blue)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              src: this.src
            })
              .fontSize(15)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
            }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'MenuItem') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'MenuItemGroup') {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              }.applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'Navigation') {
            Navigation({})
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'NavDestination') {
            NavDestination(){}.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
          } else if (this.targetView == 'PatternLock') {
            PatternLock()
              .sideLength(this.componentWidth as number)
              .key(this.componentKey)
              .onVisibleAreaChange(new Array<number>(this._ratiosLeft, this._ratiosRight), (isVisible: boolean, currentRatio: number): void => {
                console.info('Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
                let visibleData: VisibleData= {
                  isVisible: String(isVisible),
                  currentRatio: Number(Number(currentRatio).toFixed(2))
                }
                this._compositionValue += '@' + JSON.stringify(visibleData)
              })
          } else if (this.targetView == 'Progress') {
            Progress({ value: 20 })
              .border({ width: 2 })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'QRCode') {
            QRCode(this.src)
              .border({ width: 2 })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Rating') {
            Rating()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'RichText') {
            console.log('1+++++++++++++++++++++++++')
            RichText('RichText')
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
            console.log('2+++++++++++++++++++++++++')
          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: this.scroller, state: BarState.On }) {
              Text('text')
            }
            .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Search') {
            Search()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }])
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Slider') {
            Slider()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Text') {
            Text('text')
              .fontSize(15)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TextArea') {
            TextArea()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TextClock') {
            TextClock()
              .fontSize(15)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TextInput') {
            TextInput()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: this.value })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TextTimer') {
            TextTimer({ controller: this.textTimerController })
              .fontSize(15)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TimePicker') {
            TimePicker()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Badge') {
            Badge({
              count: 50,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } as BadgeStyle
            } as BadgeParamWithNumber) {
              Button('message').backgroundColor(0x317aff)
            }
            .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Column') {
            Column()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Text('1').backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
              Text('2').backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
            }
            .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Flex') {
            Flex()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'FlowItem') {
            WaterFlow() {
              FlowItem().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'GridRow') {
            GridRow()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'GridCol') {
            GridRow() {
              GridCol() {
                Text('GridCol')
              }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'Grid') {
            Grid() {
              GridItem() {
                Text('Grid').backgroundColor(Color.White)
              }
            }
            .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'GridItem') {
            Grid() {
              GridItem().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'List') {
            List()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'ListItem') {
            List() {
              ListItem() {
                Button('ListItem')
              }
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'ListItemGroup') {
            List() {
              ListItemGroup().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          }  else if (this.targetView == 'Panel') {

            Column(){
            }
            .applyStyles(this.commonStyle)
            .bindSheet(true,this.myBuilder)
          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: false })
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'RelativeContainer') {
            RelativeContainer() {
              Row()
                .width(100)
                .height(50)
                .backgroundColor('#FF3333')
                .alignRules({
                  top: { anchor: '__container__', align: VerticalAlign.Top },
                  left: { anchor: '__container__', align: HorizontalAlign.Start }
                } as AlignRuleOption)
                .id('OnVisibleAreaChange')
            }
            .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Row') {
            Row()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }.applyStyles(this.commonStyle)

          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item:number) => {
                  Text('Scroll' + String(item))
                    .width('90%')
                    .height(150)
                    .backgroundColor(Color.White)
                    .textAlign(TextAlign.Center)
                }, (item:number) => String(item))
              }.width('100%')
            }.scrollBar(BarState.On).applyStyles(this.commonStyle)

          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                ForEach(new Array<number>(1, 2, 3), (item:number) => {
                  Column({ space: 5 } as ColumnOptions) {
                    Image($r('app.media.icon'))
                      .width(50)
                      .height(50)
                    Text('Index0' + item)
                      .fontSize(25)
                  }
                })
              }.width('100%')
              .justifyContent(FlexAlign.SpaceEvenly)
              .backgroundColor(Color.Green)

              Column() {
                Text('SideBarContainer content')
                  .fontSize(25)
              }.backgroundColor(Color.Orange)
            }.applyStyles(this.commonStyle)

          } else if (this.targetView == 'Stack') {
            Stack()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach(new Array<number>(1, 2, 3), (item: number) => {
                Text('Swiper' + item)
              }, (item:number) => String(item))
            }
            .indicator(true)
            .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Tabs') {
            Tabs()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'TabContent') {
            Tabs() {
              TabContent() {
                Text('TabContent Test')
              }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
            }
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Circle') {
            Circle()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Ellipse') {
            Ellipse()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Line') {
            Line()
              .backgroundColor(Color.Pink)
              .startPoint([0, 0])
              .endPoint([50, 100]).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Polyline') {
            Polyline()
              .points([[0,0], [20,60],[100,100]])
              .fillOpacity(0)
              .stroke(Color.Blue)
              .strokeWidth(3)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Polygon') {
            Polygon()
              .points([[0,0], [0,100],[100,100], [100,0]])
              .fillOpacity(0)
              .strokeWidth(5)
              .stroke(Color.Blue)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Path') {
            Path()
              .commands('M100 0 L200 240 L0 240 Z')
              .fillOpacity(0)
              .stroke(Color.Black)
              .strokeWidth(3)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Rect') {
            Rect()
              .fillOpacity(0)
              .stroke(Color.Red)
              .strokeWidth(3)
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Shape') {
            Shape()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          } else if (this.targetView == 'Counter') {
            Counter()
              .backgroundColor(Color.Pink).applyStyles(this.commonStyle)

          }
        }.width(this.columnWidth as number).height(this.columnHeight as number)
      }
      .width(this.scrollWidth as number)
      .height(this.scrollHeight as number)
      .backgroundColor(Color.Blue)

      Button('Button')
        .id('OnVisibleAreaChangeButton')
        .width(this.buttonWidth as number)
        .height(this.buttonHeight as number)
        .onClick((e: ClickEvent) => {
          console.log('++++++++++++++++++++++++click1')
          this._compositionValue = ''
          console.log('++++++++++++++++++++++++click2')
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: this._yOffSetValue,
            animation: { duration: 3000, curve: Curve.Linear } as ScrollAnimationOptions
          })
          console.log('++++++++++++++++++++++++_yOffSetValue'+this._yOffSetValue)
          console.log('++++++++++++++++++++++++click3')
        })
    }
  }
}