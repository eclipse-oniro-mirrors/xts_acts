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
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,IMonitor,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'


@ObservedV2
class Info {
  @Trace
  public id: number = 0;
  @Trace
  public age: number = 20;

  constructor(id: number) {
    this.id = id;
  }
}

@Entry
@ComponentV2
struct makeObserved0060 {
  @Local message: Info = UIUtils.makeObserved(new Info(20));

  @Monitor(['message.id'])
  onStrChange(monitor: IMonitor) {
    console.log(`name change from ${monitor.value<Any>()?.before} to ${monitor.value<Any>()?.now}`);
  }

  @Computed
  get ageId() {
    console.info('---------Computed----------');
    return this.message.id + ' ' + this.message.age;
  }

  build() {
    Column() {
      Text(`id: ${this.message.id}`)
        .fontSize(9)
        .onClick(():void => {
          this.message.id++;
        }).id('makeObserved0060textA')

      Text(`age: ${this.message.age}`)
        .fontSize(9)
        .onClick(():void => {
          this.message.age++;
        }).id('makeObserved0060textB')

      Text(`Computed age+id: ${this.ageId}`)
        .fontSize(9).id('makeObserved0060textC')

      Button('change Info').onClick(():void => {
        this.message = UIUtils.makeObserved(new Info(200));
      }).id('makeObserved0060buttonC')

      Child({ message: this.message })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Param @Require message: Info;

  build() {
    Text(`Child id: ${this.message.id}`)
  }
}