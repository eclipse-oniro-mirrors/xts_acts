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
struct MultiNavigation6 {
  @Provide('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();
  @State text:string = ''

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'PageDetail1') {
      PageDetail1();
    } else if (name === 'pageHome1') {
      pageHome1();
    }else if (name === 'pageFull') {
      pageFull();
    }
  }

  build() {
    Column() {
      MultiNavigation({
        navDestination: this.PageMap,
        multiStack: this.pageStack,
        onHomeShowInTop: (name) => {
        }
      }).width(350).height(400).border({width:1})

      Button('pushPath PageDetail1').onClick((event: ClickEvent) => {
        this.pageStack.pushPath({ name: 'PageDetail1', param: "paramTest", onPop: (popInfo) => {}

        }, false, SplitPolicy.HOME_PAGE);
      }).id('MultiNavigation6_btn1')

      Text(this.text).id('MultiNavigation6_text1')
      Button('getAllPathName').onClick(() => {
        if (this.pageStack !== undefined && this.pageStack !== null){
          this.text = JSON.stringify(this.pageStack.getAllPathName())
        }
      }).id('MultiNavigation6_btn2')
    }
  }
}

@Component
export struct PageDetail1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail1').id('MultiNavigation6_PageDetail1_text1')
        Button('replacePath pageHome1').onClick(() => {
          if (this.pageStack !== undefined && this.pageStack !== null){
            this.pageStack.replacePathByName('pageHome1','a')
          }
        }).id('MultiNavigation6_PageDetail1_btn1')

        Button('replacePath pageFull').onClick(() => {
          if (this.pageStack !== undefined && this.pageStack !== null){
            this.pageStack.replacePath({name:'pageFull'})
          }
        }).id('MultiNavigation6_PageDetail1_btn2')
      }
    }

  }
}


@Component
export struct pageHome1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('pageHome1').id('MultiNavigation6_pageHome1_text1')

        Button('replacePath PageDetail1').onClick(() => {
          if (this.pageStack !== undefined && this.pageStack !== null){
            this.pageStack.replacePathByName('PageDetail1','a')
          }
        }).id('MultiNavigation6_pageHome1_btn1')

      }
    }

  }
}
@Component
export struct pageFull {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('pageFull').id('MultiNavigation6_pageFull_text1')
      }
    }
  }
}