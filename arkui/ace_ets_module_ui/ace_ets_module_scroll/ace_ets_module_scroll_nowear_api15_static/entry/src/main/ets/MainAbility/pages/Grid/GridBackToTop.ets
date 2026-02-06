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
import { Entry, Text, Column, Component,Padding, Button, ClickEvent, Grid, ForEach, GridItem, TextAlign, BarState,
  EdgeEffect, ScrollSource, ScrollResult, ScrollState} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridExampleA {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
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
      Button('switch').onClick((e: ClickEvent) => {
        if (this.currentIndex !== 0) {
          this.scrollCount ++;
        }
        console.log('Grid-----' + this.scrollCount)
        if (this.isBackToTop == false) {
          this.isBackToTop = undefined
          // } else if (this.isBackToTop === undefined) {
          //   this.isBackToTop = null;
          // } else if (this.isBackToTop === null) {
          //   this.isBackToTop = true;
        } else if (this.isBackToTop == true) {
          this.isBackToTop = false
        }
      }).id('Switch')
      Text('offset:' + this.scrollOffset)
      Text('count:' + this.scrollCount)
      Text(this.message).id('gridScroll_1')
      Text(this.message1).id('gridScroll_2')
      Text(this.message2).id('gridScroll_3')
      Text(this.message3).id('gridBackToTop')
      Text(this.message4).id('gridAbnormal')
      Grid() {
        ForEach(this.arr, (item: number, index: int) => {
          GridItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }
          .onAppear(() => {
            this.currentIndex = index;
          })
        }, (item: number) => String(item))
      }
      .backToTop(this.isBackToTop)
      .columnsTemplate('1fr')
      .id('gridScroll_4')
      .scrollBar(BarState.Off)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)

      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
          this.message='onWillScroll'
          this.message3 = 'NotBackToTop';
      })
      .onDidScroll((scrollOffset: number): void => {
        this.message1='onDidScroll'
      })
      .onDidScroll((offset: number): void => {
        this.scrollOffset = offset;
        console.log('Grid-----DidAbnormal')
          if (this.scrollCount === 3) {
            console.log('DidAbnormal---------')
            this.message4 = 'DidAbnormal';
          }
      })
      .onReachStart(() => {
        this.message3 = 'onDidGridBackToTop';
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
