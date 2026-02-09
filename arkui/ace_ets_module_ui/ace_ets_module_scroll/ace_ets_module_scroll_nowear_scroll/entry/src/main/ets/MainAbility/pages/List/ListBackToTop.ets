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
import { StatusClickComponent } from './publishStatusClick';
@Entry
@Component
struct ListExampleA {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State message:string=''
  @State message1:string=''
  @State message2:string=''
  @State message3:string=''
  @State message4:string=''
  @State buttonNumber: number = 0;
  @State isBackToTop: boolean|undefined|null = false
  @State scrollCount: number = 0;
  @State scrollOffset: number = 0;
  private currentIndex: number = 0;
  build() {
    Column() {
      StatusClickComponent()
      Button('switch').onClick(() => {
        if (this.currentIndex !== 0) {
          this.scrollCount ++;
        }
        switch (this.isBackToTop) {
          case false:
            this.isBackToTop = undefined
            break;
          case undefined:
            this.isBackToTop = null
            break;
          case null:
            this.isBackToTop = true
            break;
          case true:
            this.isBackToTop = false
            break;
        }
      }).id('Switch')
      Text('offset:' + this.scrollOffset)
      Text('count:' + this.scrollCount)
      Text(this.message).id('listScroll_1')
      Text(this.message1).id('listScroll_2')
      Text(this.message2).id('listScroll_3')
      Text(this.message3).id('listBackToTop')
      Text(this.message4).id('listAbnormal')
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }
          .onAppear(() => {
            this.currentIndex = index;
          })
        }, (item: string) => item)
      }
      .backToTop(this.isBackToTop)
      .id('listScroll_4')
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.Off)
      .friction(0.6)
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .edgeEffect(EdgeEffect.Spring)
      .onWillScroll(() => {
        this.message='onWillScroll'
        this.message3 = 'NotListBackToTop';
      })
      .onDidScroll(()=>{
        this.message1='onDidScroll'
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        this.message2='onScrollVisibleContentChange'
      })
      .onDidScroll((offset: number) => {
        this.scrollOffset = offset;
        // 判断是否滚动到顶部以及回滚次数是否达标
        if (this.scrollCount === 3) {
          this.message4 = 'DidAbnormal';
        }
      })
      .onReachStart(() => {
        this.message3 = 'onDidListBackToTop';
      })
      .width('70%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}
