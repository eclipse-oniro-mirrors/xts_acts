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
//001 测试自定义组件冻结V2  TabContent
// import prompt from '@system.prompt';
import { PromptAction } from '@ohos.arkui.UIContext';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,Tabs,TabContent,
  Row,CommonAttribute,TextAttribute,TabsController,
  List,AttributeModifier,ButtonAttribute,BorderStyle,
  ListItem,GridLayoutOptions,Grid,GridItem,BarState,TextAlign,
  Color,Scroller,Divider,Flex,ChildrenMainSize,ListScroller,
  FlexAlign,ComponentV2,HorizontalAlign,FontWeight
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,IMonitor,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'
import { CommonModifier, TextModifier } from '@ohos.arkui.modifier'

let prompt= new PromptAction()

@Entry
@ComponentV2
struct TabContentTest {
  @Local message: number = 0;
  @Local data: Array<number>= [0, 1] as Array<number>;
  private controller: TabsController = new TabsController()

  build() {
    Row() {
      Column() {
        Button('change message').onClick(():void => {
          this.message++
        })
          .id('changeMessage')

        Button('changeIndex').onClick(():void => {
          this.controller.changeIndex(1);
        })
          .id('changeIndex')

        Button('changeIndex0').onClick(():void => {
          this.controller.changeIndex(0);
        })
          .id('changeIndex0')

        Tabs({ controller: this.controller }) {
          ForEach(this.data, (item: number) => {
            TabContent() {
              FreezeChild2({ message: this.message, index: item })
            }.tabBar(`tab${item}`)
          }, (item: number) => item.toString())
        }
        .layoutWeight(1)
      }
      .width('100%')
    }
    .height('100%')
  }
}

// @ComponentV2({ freezeWhenInactive: true })
@ComponentV2
struct FreezeChild2 {
  @Param message: number = 0;
  @Param index: number = 0;

  @Monitor(['message'])
  onMessageUpdated(mon: IMonitor) {
    prompt.showToast({
      message: `FreezeChild message callback func ${this.message}, index: ${this.index}`,
      duration: 500
    })
  }

  build() {
    Text('message' + `${this.message}, index: ${this.index}`)
      .fontSize(9)
      .fontWeight(FontWeight.Bold)
  }
}