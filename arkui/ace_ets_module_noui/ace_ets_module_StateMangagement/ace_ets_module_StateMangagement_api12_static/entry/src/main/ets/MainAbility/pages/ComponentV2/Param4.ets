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
//父组件传递对象给子组件的@Param变量，父组件修改对象本身，修改子组件的属性值
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
  Color,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Require,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
@ObservedV2
class Info {
  @Trace name: string;
  constructor(name: string) {
    this.name = name;
  }
}
@Entry
@ComponentV2
struct paramObject2 {
  @Local info: Info = new Info('Tom');
  build() {
    Column() {
      Text(`Parent info.name ${this.info.name}`).id('object_parent')
      Button('Parent change info').id('btn_parent')
        .onClick(():void => {
          this.info = new Info('Lucy');
        })
      paramObjectChild2({
        info: this.info
      })
    }
  }
}
@ComponentV2
struct paramObjectChild2 {
  @Require @Param info: Info
  build() {
    Column() {
      Text(`info.name: ${this.info.name}`).id('object_child')
      Button('Child change info.name').id('name_child')
        .onClick(():void => {
          this.info.name = 'Jack'
        })
    }
  }

}