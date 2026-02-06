'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { StatusClickComponent } from './publishStatusClick';
import {
  Entry, Component, Text, ForEach, ClickEvent, Button , Scroll, Column,TextAlign, EdgeEffect, BarState, Padding,
  OffsetResult, ScrollState, ScrollSource
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct ScrollExampleA {
  private arr: Array<Number> =new Array<Number> (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  @State message:string=''
  @State message1:string=''
  @State message2:string=''
  @State message3:string=''
  @State message4:string=''
  @State buttonNumber: number = 0;
  @State isBackToTop: boolean|undefined = false
  @State scrollCount: number = 0;
  @State scrollOffset: number = 0;
  private currentIndex: int = 0;

  build() {
    Column() {
      StatusClickComponent()
      Button('switch').onClick((e:ClickEvent) => {
        console.log('-----onClick index = ' + this.currentIndex)
        if (this.currentIndex !== 0) {
          this.scrollCount ++;
        }
        console.log('-----onClick scrollCount = ' + this.scrollCount)
        if (this.isBackToTop === false) {
          this.isBackToTop = undefined;
        // } else if (this.isBackToTop === undefined) {
        //   this.isBackToTop = null;
        // } else if (this.isBackToTop === null) {
        //   this.isBackToTop = true;
        } else if (this.isBackToTop === true) {
          this.isBackToTop = false;
        }
      }).id('Switch')
      Text('offset:' + this.scrollOffset)
      Text('count:' + this.scrollCount)
      Text(this.message).id('Scroll_1')
      Text(this.message1).id('Scroll_2')
      Text(this.message2).id('Scroll_3')
      Text(this.message3).id('ScrollBackToTop')
      Text(this.message4).id('ScrollAbnormal')
      Scroll() {
        Column(){
          ForEach(this.arr, (item: number, index: int) => {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
              .onAppear(() => {
                console.log('-----onAppear index = ' + index)
                this.currentIndex = index;
              })
          }, (item: number) => String(item))
        }
      }
      .backToTop(this.isBackToTop)
      .id('Scroll_4')
      .scrollBar(BarState.Off)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .onWillScroll((xOffset: Double, yOffset: Double, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.log('----xxx----onWillScroll')
        this.message='onWillScroll'
        this.message3 = 'NotBackToTop';
      })
      .onDidScroll((offset: number):void=>{
        console.log('----xxx----message1')
        this.message1='onDidScroll'
      })
      .onDidScroll((offset: number):void => {
        console.log('----xxx----onDidScroll')
        this.scrollOffset = offset;
        // 判断是否滚动到顶部以及回滚次数是否达标
        if (this.scrollCount === 3) {
          this.message4 = 'DidAbnormal';
        }
      })
      .onReachStart(() => {
        this.message3 = 'onDidScrollBackToTop';
      })
      .width('70%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}
