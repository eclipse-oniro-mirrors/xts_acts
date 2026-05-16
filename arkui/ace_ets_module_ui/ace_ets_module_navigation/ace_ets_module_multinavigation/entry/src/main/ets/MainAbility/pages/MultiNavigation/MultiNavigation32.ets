/**
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { MultiNavigation, MultiNavPathStack, SplitPolicy } from './mainpage/MultiNavigation';

@Entry
@Component
struct MultiNavigation32 {
  @Provide('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();
  @State text:string = ''
  @State text2:string = ''
  @State text3:string = ''

  aboutToAppear(): void {
    this.pageStack.pushPath({
      name: 'PageHome1',
      param: "PageHome1",
      onPop: (popInfo) => {
      }
    }, false, SplitPolicy.HOME_PAGE);
    this.pageStack.setKeepBottomPage(true);
  }

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'PageDetail1') {
      PageDetail1();
    } else if (name === 'PageDetail2') {
      PageDetail2();
    }  else if (name === 'PageHome2') {
      PageHome2();
    } else if (name === 'PageHome1') {
      PageHome1();
    }else if (name === 'PageFull1') {
      PageFull1();
    }
  }

  build() {
    Column() {
      MultiNavigation({
        navDestination: this.PageMap,
        multiStack: this.pageStack,
        onHomeShowInTop: (name) => {
        }
      }).width(350).height(250).border({width:1})


      Button('pushPath PageDetail1').onClick((event: ClickEvent) => {
        this.pageStack.pushPath({ name:'PageDetail1', param: "PageDetail1" }, false, SplitPolicy.DETAIL_PAGE);
      }).id('MultiNavigation32_btn1')

      Button('pushPath PageDetail2').onClick((event: ClickEvent) => {
        this.pageStack.pushPath({ name:'PageDetail2', param: "PageDetail2" }, false, SplitPolicy.DETAIL_PAGE);
      }).id('MultiNavigation32_btn2')

      Button('pushPath PageHome2').onClick((event: ClickEvent) => {
        this.pageStack.pushPath( {name:'PageHome2', param:"PageHome2"}, false, SplitPolicy.HOME_PAGE);
      }).id('MultiNavigation32_btn3')

      Button('moveIndexToTop 10000000000000').onClick(() => {
       this.pageStack.moveIndexToTop(10000000000000)
      }).id('MultiNavigation32_btn4')


      Text(this.text).id('MultiNavigation32_text1')

    }
  }
}

@Component
export struct PageDetail1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail1').id('MultiNavigation32_PageDetail1_text1')
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
        Text('PageDetail2').id('MultiNavigation32_PageDetail2_text1')
      }
    }

  }
}


@Component
export struct PageHome1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('PageHome1').id('MultiNavigation32_PageHome1_text1')

      }
    }
  }
}
@Component
export struct PageHome2 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('PageHome2').id('MultiNavigation32_PageHome2_text1')

      }
    }
  }
}
@Component
export struct PageFull1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('PageFull1').id('MultiNavigation32_PageFull1_text1')
      }
    }
  }
}