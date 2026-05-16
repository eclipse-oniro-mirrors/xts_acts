/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { UIContext } from '@ohos.arkui.UIContext';
import { ComponentContent, LengthMetrics, ColorMetrics} from '@ohos.arkui.node';
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@ohos.arkui.ArcList';
 import { BusinessError } from '@ohos.base';
 function getResourceColor(red: number, green: number, blue: number, alpha?: number):ColorMetrics {
   let sourceColor:ColorMetrics;
   try {
     sourceColor = ColorMetrics.rgba(red, green, blue, alpha)
   } catch (error) {
     console.log('getBlendColor failed, code = ' + (error as BusinessError).code + ', message = ' + (error as BusinessError).message);
     sourceColor = ColorMetrics.rgba(255, 0, 0, 0.5);
   }
   return sourceColor;
 }


@Builder
function buildText() {
  Stack() {
    Text('head')
      .fontSize(80)
      .padding(0)
      .backgroundColor(0xF9CF93)
      .border({ width: '1px', color: Color.Black })
    Divider().width('100%').height('1px')
  }
  .alignContent(Alignment.Bottom)
}
@Entry
@Component
struct ArcListPage {
  @State listItemText01: string = 'OpenharmonyTest1'
  @State listItemText02: string = 'OpenharmonyTest2'
  @State listItemText03: string = 'OpenharmonyTest3'
  @State listItemText04: string = 'OpenharmonyTest4'
  @State onScrollIndexText: string = 'onScrollIndex'
  @State onReachStartText: string = 'onReachStart'
  @State onReachEndText: string = 'onReachEnd'
  @State onScrollStartText: string = 'onScrollStart'
  @State onScrollStopText: string = 'onScrollStop'
  @State onDidScrollText: string = 'onDidScroll'
  @State onWillScrollText: string = 'onWillScroll'
  scroller: Scroller = new Scroller()
  onPageShow() {
    console.info('ListPage onPageShow')
  }
  context: UIContext = this.getUIContext()
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));
  build() {
    Column() {
      ArcList() {
          ArcListItem() {
            Text(this.listItemText04)
              .width('30%')
              .height('30%')
              .fontSize(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
      }
      .height('30%')
      .width('90%')
      .key('arclist03')
      .onScrollIndex((scrollOffset: number, scrollState: ScrollState) => {
        this.onScrollIndexText = 'onScrollIndex:succ'
        console.info('scrollState:' + scrollState + ', scrollOffset:' + scrollOffset)
      })
      .onReachStart(() => {
        this.onReachStartText = 'onReachStart:succ'
        console.info('onReachStart')
      })
      .onReachEnd(() => {
        this.onReachEndText = 'onReachEnd:succ'
        console.info('onReachEnd')
      })
      .onScrollStart(() => {
        this.onScrollStartText = 'onScrollStart:succ'
        console.info('onScrollStart succ')
      })
      .onScrollStop(() => {
        this.onScrollStopText = 'onScrollStop:succ'
        console.info('onScrollStop  succ')
      })
       .onWillScroll(() => {
         this.onWillScrollText='onWillScroll'
        console.info('onWillScroll succ')
       })
       .onDidScroll(()=>{
         this.onDidScrollText='onDidScroll'
        console.info('onDidScroll succ')
       })
      Text(this.onScrollIndexText).fontSize(10).margin(5).key('onScrollIndexText')
      Text(this.onReachStartText).fontSize(10).margin(5).key('onReachStartText')
      Text(this.onReachEndText).fontSize(10).margin(5).key('onReachEndText')
      Text(this.onScrollStartText).fontSize(10).margin(5).key('onScrollStartText')
      Text(this.onScrollStopText).fontSize(10).margin(5).key('onScrollStopText')
      Text(this.onWillScrollText).fontSize(10).margin(5).key('onWillScrollText')
      Text(this.onDidScrollText).fontSize(10).margin(5).key('onDidScrollText')
      ArcList() {
          ArcListItem() {
            Text(this.listItemText01)
              .width('30%')
              .height('30%')
              .fontSize(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .key('defaultarklistitem01')
          }
      }
	  .opacity(0.4)
      .height('30%')
      .width('90%')
      .border({ width: 3, color: Color.Blue })
      .key('arclistdefault')
      .digitalCrownSensitivity(0)
      ArcList({header: this.tabBar1 , scroller:this.scroller, initialIndex:5}) {
          ArcListItem() {
            Text(this.listItemText02)
              .width('30%')
              .height('30%')
              .fontSize(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .focusable(true)
              .focusOnTouch(true)
          }
          .key('arclistitem01')
          .autoScale(true)
          ArcListItem() {
            Text(this.listItemText03)
              .width('30%')
              .height('30%')
              .fontSize(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .focusable(true)
              .focusOnTouch(true)
              .key('arclistitem02')
          }
          .key('arclistitem02')
      }
      .space(LengthMetrics.px(20))
      .scrollBar(BarState.On)
      .scrollBarWidth(LengthMetrics.vp(5))
      .scrollBarColor(ColorMetrics.numeric(Color.Red))
      .cachedCount(1)
      .enableScrollInteraction(true) 
      .friction(0.6)
      .flingSpeedLimit(5)
      .chainAnimation(true)
      .fadingEdge(true)
      .height('30%')
      .width('90%')
      .border({ width: 3, color: Color.Red })
      .key('arclist01')
      .digitalCrownSensitivity(1)

      ArcList() {
          ArcListItem() {
            Text(this.listItemText01)
              .width('30%')
              .height('30%')
              .fontSize(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .key('defaultarklistitem01')
          }
      }
      .space(LengthMetrics.px(-20))
      .scrollBar(BarState.Auto)
      .scrollBarWidth(LengthMetrics.vp(-5))
      .scrollBarColor(ColorMetrics.numeric(Color.Red))
      .cachedCount(-1)
      .enableScrollInteraction(false) 
      .friction(-0.6)
      .flingSpeedLimit(-5)
      .chainAnimation(false)
      .fadingEdge(false)
      .height('30%')
      .width('90%')
      .border({ width: 3, color: Color.Red })
      .key('arclist02')
      .digitalCrownSensitivity(2)
	  
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}