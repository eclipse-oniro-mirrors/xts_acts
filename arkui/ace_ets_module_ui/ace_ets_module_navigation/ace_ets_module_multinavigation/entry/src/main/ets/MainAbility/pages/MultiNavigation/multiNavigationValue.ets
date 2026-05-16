/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base'

@Entry
@Component
struct MultiNavigationValue1 {
  @Provide('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();
  @State text:string = 'page'

  aboutToAppear(): void {
    this.pageStack.pushPath({
      name: 'PageDetail',
      param: 'paramTest',
      onPop: (popInfo) => {
      }
    }, false, SplitPolicy.HOME_PAGE);
  }

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'PageDetail') {
      PageDetail();
    } else if (name === 'PageDetail2') {
      PageDetail2();
    }
  }

  build() {
    Column() {
      MultiNavigation({
        navDestination: this.PageMap,
        multiStack: this.pageStack,
      }).width('90%').height('20%').border({width:1})

      Button('PageDetail2')
        .height('5%')
        .onClick((event: ClickEvent) => {
            this.pageStack.pushPath({ name:'PageDetail2',param: 'paramTest' }, false, SplitPolicy.DETAIL_PAGE);
        }).id('MultiNavigation_btn_push2')

      Row(){
        Button('popToIndex: -1').onClick((event: ClickEvent) => {
          this.pageStack.popToIndex(-1);
        }).id('MultiNavigation_popToIndex_neg1')

        Button('popToIndex: 0').onClick((event: ClickEvent) => {
          this.pageStack.popToIndex(0);
        }).id('MultiNavigation_popToIndex_0')
      }.height('5%')

      Row(){
        Button('popToIndex: -1').onClick((event: ClickEvent) => {
          this.pageStack.popToIndex(-1, 'popToIndex');
        }).id('MultiNavigation_popToIndex2_neg1')

        Button('popToIndex: 0').onClick((event: ClickEvent) => {
          this.pageStack.popToIndex(0, 'popToIndex');
        }).id('MultiNavigation_popToIndex2_0')
      }.height('5%')

      Button('getAllPathName')
        .id('getAllPathName_page')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.text =  JSON.stringify(this.pageStack.getAllPathName())
        })

      Text(this.text).id('getAllPathName_page_text')

      Text('setHomeWidthRange')
      Row(){
        Button('-1')
          .onClick(() => {
            if (this.pageStack !== undefined && this.pageStack !== null) {
              this.pageStack.setHomeWidthRange(-1, -1);
            }
          })
          .id('setHomeWidthRange_neg1')

        Button('0')
          .onClick(() => {
            if (this.pageStack !== undefined && this.pageStack !== null) {
              this.pageStack.setHomeWidthRange(0, 0);
            }
          })
          .id('setHomeWidthRange_0')
      }.height('5%')

      Row(){
        Button('100')
          .onClick(() => {
            if (this.pageStack !== undefined && this.pageStack !== null) {
              this.pageStack.setHomeWidthRange(100, 100);
            }
          })
          .id('setHomeWidthRange_100')

        Button('101')
          .onClick(() => {
            if (this.pageStack !== undefined && this.pageStack !== null) {
              this.pageStack.setHomeWidthRange(101, 101);
            }
          })
          .id('setHomeWidthRange_101')
      }.height('5%')
    }
  }
}

@Component
export struct PageDetail {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail')
      }
    }

  }
}
@Component
export struct PageDetail2 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail2')
      }
    }
  }
}
