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
struct MultiNavigation20 {
  @Provide('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();
  @State text:string = ''

  aboutToAppear(): void {
    this.pageStack.pushPath({
      name: 'PageHome1',
      param: "paramTest",
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

      Button('pushDestination PageHome1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestination({ name: 'PageHome1', param: "paramTest"}, false, SplitPolicy.HOME_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn1')

      Button('pushDestination PageDetail1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestination({ name: 'PageDetail1', param: "paramTest"}, false, SplitPolicy.DETAIL_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn2')

      Button('pushDestination PageFull1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestination({ name: 'PageDetail2', param: "paramTest"}, false, SplitPolicy.FULL_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn3')

      Button('pushDestinationByName PageHome1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestinationByName( 'PageHome1', "paramTest", false, SplitPolicy.HOME_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn4')

      Button('pushDestinationByName PageDetail1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestinationByName( 'PageDetail1', "paramTest", false, SplitPolicy.DETAIL_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn5')

      Button('pushDestinationByName PageFull1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestinationByName( 'PageFull1', "paramTest", false, SplitPolicy.FULL_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn6')

      Button('pushDestinationByName PageHome1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestinationByName( 'PageHome1', "paramTest",(popInfo) => {}, false, SplitPolicy.HOME_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn7')

      Button('pushDestinationByName PageDetail1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestinationByName( 'PageDetail1', "paramTest",(popInfo) => {}, false, SplitPolicy.DETAIL_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn8')

      Button('pushDestinationByName PageFull1').onClick((event: ClickEvent) => {
        this.pageStack.pushDestinationByName( 'PageFull1', "paramTest",(popInfo) => {}, false, SplitPolicy.FULL_PAGE);
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation20_btn9')

      Text(this.text).id('MultiNavigation20_text1')

    }
  }
}

@Component
export struct PageDetail1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail1').id('MultiNavigation20_PageDetail1_text1')
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
        Text('PageDetail2').id('MultiNavigation20_PageDetail2_text1')
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
        Text('PageHome1').id('MultiNavigation20_PageHome1_text1')

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
        Text('PageHome2').id('MultiNavigation20_PageHome2_text1')

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
        Text('PageFull1').id('MultiNavigation20_PageFull1_text1')
      }
    }
  }
}