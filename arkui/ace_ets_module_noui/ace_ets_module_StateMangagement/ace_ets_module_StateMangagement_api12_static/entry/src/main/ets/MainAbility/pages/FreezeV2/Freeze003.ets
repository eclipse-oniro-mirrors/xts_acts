'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
// 003 changelog变更，父组件无冻结选项，子组件冻结，子组件冻结生效
import router from '@ohos.router';
import { PromptAction } from '@ohos.arkui.UIContext';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,NavigationMode,
  ForEach,NavDestination,Navigation,ButtonType,
  Text,Tabs,TabContent,NavPathStack,Builder,NavPathInfo,
  Row,CommonAttribute,TextAttribute,TabsController,
  List,AttributeModifier,ButtonAttribute,BorderStyle,
  ListItem,GridLayoutOptions,Grid,GridItem,BarState,TextAlign,
  Color,Scroller,Divider,Flex,ChildrenMainSize,ListScroller,
  FlexAlign,ComponentV2,HorizontalAlign,FontWeight
} from '@ohos.arkui.component'
import {
  State,
  Watch,Provider,Consumer,IMonitor,
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'
import { CommonModifier, TextModifier } from '@ohos.arkui.modifier'
import { PromptAction } from '@ohos.arkui.UIContext'


@ObservedV2
export class Book {
  @Trace public name: string = '100';

  constructor(page: string) {
    this.name = page;
  }
}

@Entry
@ComponentV2
struct Page1 {
  build() {
    Column() {
      Child()
    }
  }
}

// @ComponentV2({ freezeWhenInactive: true })
@ComponentV2
export struct Child {
  @Local bookTest: Book = new Book('A Midsummer Night’s Dream');

  @Monitor(['bookTest.name'])
  onMessageChange(monitor: IMonitor) {
    this.getUIContext().getPromptAction().showToast({
      message: `The book name change from ${monitor.value<Any>()?.before} to ${monitor.value<Any>()?.now}`,
      duration: 500
    })
  }

  textUpdate(): number {
    console.log('The text is update');
    return 25;
  }

  build() {
    Column() {
      Text(`The book name is  ${this.bookTest.name}`).fontSize(this.textUpdate())
      Button('go to next page').fontSize(9)
        .onClick(():void => {
          this.getUIContext().getRouter().pushUrl({ url: 'MainAbility/pages/FreezeV2/Freeze003Page' });
          setTimeout(() => {
            this.bookTest = new Book('Jane Austen oPride and Prejudice');
          }, 1000);
        })
        .id('FreezeV2ChildNextPage')
    }
  }
}