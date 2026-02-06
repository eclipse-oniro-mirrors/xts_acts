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
  ListItem,
  Color,Scroller,Divider,Flex,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'

class Info {
  public id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

let test: Record<string, number> = { 'a': 123 };
let testJsonStr: string = JSON.stringify(test);
let test2: Record<string, Info> = { 'a': new Info(20) };
let test2JsonStr: string = JSON.stringify(test2);

@Entry
@ComponentV2
struct makeObserved0050 {
  message: jsonx.JsonElement = UIUtils.makeObserved<jsonx.JsonElement>(JSON.parseJsonElement(testJsonStr));
  message2: jsonx.JsonElement = UIUtils.makeObserved<jsonx.JsonElement>(JSON.parseJsonElement(test2JsonStr));

  build() {
    Column() {
      Text(`${this.message.getDouble('a')}`)
        .height('3%')
        .fontSize(9)
        .onClick(():void => {
          // this.message.getString('a')++;
          //
          let currentA = this.message.getDouble('a');
          currentA++;
          console.log("====================================== currentA: " + currentA);
          this.message.getElement('a').setDouble(currentA) // 假设 set 方法用于设置值
          console.log("====================================== setDouble: " + this.message.getDouble('a'));
        }).id('makeObserved0050textA')

      Text(`${this.message2.getElement('a').getDouble('id')}`)
        .height('3%')
        .fontSize(9)
        .onClick(():void => {
          let currentA = this.message2.getElement('a').getDouble('id');
          currentA++;
          console.log("====================================== currentA22:  " + currentA);
          this.message.getElement('a').getElement('id').setDouble(currentA); //10-24: app died
          console.log("====================================== currentA22:  " + this.message2.getElement('a').getDouble('id'));
        }).id('makeObserved0050textB')
    }
    .height('100%')
    .width('100%')
  }
}