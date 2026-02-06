'use static';
/**
 //  * Copyright (C) 2025 Huawei Device Co., Ltd.
 //  * Licensed under the Apache License, Version 2.0 (the "License");
 //  * you may not use this file except in compliance with the License.
 //  * You may obtain a copy of the License at
 //  *
 //  *     http://www.apache.org/licenses/LICENSE-2.0
 //  *
 //  * Unless required by applicable law or agreed to in writing, software
 //  * distributed under the License is distributed on an "AS IS" BASIS,
 //  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 //  * See the License for the specific language governing permissions and
 //  * limitations under the License.
 //  */
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
  ListItem,
  Color,Scroller,Divider,Flex,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2,Trace
} from '@ohos.arkui.stateManagement'

@ObservedV2
class Info {
  @Trace
  public id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

@Entry
@ComponentV2
struct makeObserved0030 {
  mapCollect: Map<string, Info> =
    UIUtils.makeObserved(new Map<string, Info>([['a', new Info(10)], ['b', new Info(20)]]));

  build() {
    Column() {
      // this.mapCollect.keys()返回迭代器。Foreach不支持迭代器，所以要Array.From浅拷贝生成数据。
      ForEach(Array.from(this.mapCollect.keys()), (item: string, index: int) => {
        Text(`${this.mapCollect.get(item)?.id}`).onClick(():void => {
          let value: Info | undefined = this.mapCollect.get(item);
          if (value) {
            value.id++;
          }
        }).id(`makeObserved0030text${index}`)
      }, (item: string, index:int ) => item + index.toString())
      Text(`${this.mapCollect.get('c')?.id}`).id('makeObserved0030deleteText')
      Text(`${this.mapCollect.get('b')?.id}_${this.mapCollect.get('a')?.id}`).id('makeObserved0030clearText')
      // set c
      Button('set c').onClick(():void => {
        this.mapCollect.set('c', new Info(30));
      }).id('makeObserved0030setC')
      // delete c
      Button('delete c').onClick(():void => {
        if (this.mapCollect.has('c')) {
          this.mapCollect.delete('c');
        }
      }).id('makeObserved0030deleteC')
      // clear
      Button('clear').onClick(():void => {
        this.mapCollect.clear();
      }).id('makeObserved0030clear')
    }
    .height('100%')
    .width('100%')
  }
}