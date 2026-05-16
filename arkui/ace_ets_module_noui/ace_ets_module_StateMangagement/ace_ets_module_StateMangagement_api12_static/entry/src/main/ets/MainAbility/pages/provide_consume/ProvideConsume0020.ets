'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  ListItem
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  Consume,
  Provide
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

enum ProvideConsume0020Enum {
  PA = 'PA',
  PB = 'PB'
}

class ProvideConsume0020Class {
  age: number = 0
}

@Component
struct ChildProvideConsume0020 {
  @Consume('classValue') classValue: ProvideConsume0020Class = new ProvideConsume0020Class()
  @Consume('numberValue') numberValue: number = 1.0
  @Consume('booleanValue') booleanValue: boolean = false
  @Consume('stringValue') stringValue: string =''
  @Consume('objectValue') objectValue: Object = {}
  @Consume('arrValue') arrValue: Array<number>= new Array<number>()
  @Consume('enumValue') enumValue: ProvideConsume0020Enum = ProvideConsume0020Enum.PA

  build() {
    Column() {
      Text(String(this.classValue.age)).id('tvClass')
      Text(String(this.numberValue)).id('tvNumber')
      Text(String(this.booleanValue)).id('tvBoolean')
      Text(this.stringValue).id('tvString')
      Text(String(this.objectValue)).id('tvObject')
      Text(String(this.arrValue[0])).id('tvArr')
      Text(this.enumValue).id('tvEnum')
    }
  }
}

@Entry
@Component
struct ProvideConsume0020 {
  @Provide({ alias: 'classValue' }) classValue: ProvideConsume0020Class = new ProvideConsume0020Class()
  @Provide({ alias: 'numberValue' }) numberValue: number = 0.0
  @Provide({ alias: 'booleanValue' }) booleanValue: boolean = false
  @Provide({ alias: 'stringValue' }) stringValue: string = 'hello'
  @Provide({ alias: 'objectValue' }) objectValue: object = 'hello'
  @Provide({ alias: 'arrValue' }) arrValue: Array<number>= [1.0, 2.0, 3.0] as Array<number>
  @Provide({ alias: 'enumValue' }) enumValue: ProvideConsume0020Enum = ProvideConsume0020Enum.PA

  build() {
    Column() {
      ChildProvideConsume0020()
    }
  }
}