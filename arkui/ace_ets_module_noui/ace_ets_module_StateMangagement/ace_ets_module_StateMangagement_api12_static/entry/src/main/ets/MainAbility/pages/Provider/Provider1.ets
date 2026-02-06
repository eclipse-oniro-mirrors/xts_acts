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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,Divider,Alignment,BarState,RouteType,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'


@ComponentV2
struct GrandSon {
  //Consume不设置别名，根据变量名去匹配Provide，
  @Consumer() message1: number =0;  //匹配Child的message1
  @Consumer() message2: number=0; //Provide变量名和consume变量名相同
  @Consumer() message3: number=0; //匹配不上
  @Consumer() reviewVotes: number=0;
  @Consumer() message5: number=0;
  @Consumer() message6: number=0;
  @Consumer() message8: number=0;
  @Consumer() reviewVotes3: number=0;

  @Consumer('message9') reviewVotes0: number=0; //首先匹配别名为message9的Provide
  @Consumer('message2') message0: number=0; //无别名为message2的Provide，匹配变量名为message2的Provide
  @Consumer('message10') message9: number=0; //无别名或变量名为message10的Provide，

  build() {
    Column() {
      Button(`GrandSon +4`)
        .onClick(():void => {
          this.message1 += 4
          this.message2 += 4
          this.message3 += 4
          this.reviewVotes += 4
          this.message5 += 4
          this.message6 += 4
          this.message8 += 4
          this.reviewVotes3 += 4
          this.reviewVotes0 += 4
          this.message0 += 4
        }).fontSize(9).id('GrandSon')
      Text('重名场景排列组合').fontSize(9).fontColor('0xCCCCCC').width('100%')
      Column() {
        Text('只有一个设置alias').fontSize(9).fontColor('0xCCCCCC').width('100%')
        Text(`别名和变量名重名：reviewVotes(${this.message1})`).fontSize(9).id('Child1_1')// Text显示10
        Text(`变量名和变量名重名：reviewVotes(${this.message2})`).fontSize(9).id('parent_1') // Text显示40
        Divider()

        Text('两个都设置alias').fontSize(9).fontColor('0xCCCCCC').width('100%')
        Text(`别名和变量名都重名：reviewVotes(${this.message3})`).fontSize(9).id('GrandSon_1')// Text显示0
        Text(`只有alias重名：reviewVotes(${this.reviewVotes})`).fontSize(9).id('Child2_1') // Text显示20
        Text(`只有变量名重名：reviewVotes(${this.message5})`).fontSize(9).id('GrandSon_2') // Text显示0
        Text(`别名和变量名重名：reviewVotes(${this.message6})`).fontSize(9).id('Child1_2') // Text显示10
        Text(`变量名和别名重名：reviewVotes(${this.message8})`).fontSize(9).id('parent_3') // Text显示40
        Text(`同组件内变量名和别名重名：reviewVotes(${this.reviewVotes3})`).fontSize(9).id('Child1_3') // Text显示10
      }.borderWidth(1)

      Text('匹配规则').fontSize(9).fontColor('0xCCCCCC').width('100%')
      Column() {
        Text(`优先别名匹配：reviewVotes(${this.reviewVotes0})`).fontSize(9).id('Child2_2') // Text显示20
        Text(`别名和变量名匹配：reviewVotes(${this.message0})`).fontSize(9).id('parent_2') // Text显示40
        Text(`都不匹配：reviewVotes(${this.message9})`).fontSize(9) // Text显示0
      }.borderWidth(1)


    }
    .width('100%')
  }
}

@ComponentV2
struct ProviderChild {
  @Provider('message1') message0: number = 10;
  @Provider('VarOverride') message2: number = 20;

  @Provider('reviewVotes') message3: number = 10;
  @Provider( 'reviewVotes') message4: number = 20;

  @Provider( 'reviewVotes0') message5: number = 10;

  @Provider('message6') message7: number = 10;
  @Provider('reviewVotes3') message8: number = 10;

  @Provider('message9') reviewVotes3: number = 20;

  build() {
    Column() {
      Row() {
        Button(`ProviderChild (${this.message0}) +2`)
          .onClick(():void => {
            this.message0 += 2
            this.message3 += 2
            this.message5 += 2
            this.message7 += 2
            this.message8 += 2
            // this.child1 += 2 原代码注释
          }).fontSize(9).id('Child1')
        Button(`ProviderChild (${this.message2}) +3`)
          .onClick(():void => {
            this.message2 += 3
            this.message4 += 3
            this.reviewVotes3 += 3
            // this.child2 += 3 原代码注释
          }).fontSize(9).id('Child2')
      }
      GrandSon()
    }
  }
}

@Entry
@ComponentV2
struct Provider1 {
  @Provider() message1: number = 40;
  @Provider() message2: number = 40;

  @Provider('reviewVotes') message3: number = 40;

  @Provider('reviewVotes1') message5: number = 40;

  @Provider('reviewVotes2') message6: number = 40;
  @Provider('message8') message9: number = 40;

  build() {
    Scroll() {
      Column() {
        Text('@Provide支持同名的继承').fontSize(9)
          .fontColor('0xCCCCCC').width('100%')
        Button(`parent (${this.message1}) +1`)
          .onClick(():void => {
            this.message1 += 1
            this.message2 += 1
            this.message3 += 1
            this.message5 += 1
            this.message6 += 1
            this.message9 += 1
          }).fontSize(9).id('parent')
        ProviderChild()
      }.width('100%')
    }.width('100%').height('100%').align(Alignment.Top).scrollBar(BarState.Off)
  }
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}





