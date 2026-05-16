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
  $$
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';


@Component
struct ChildLink2 {
  @Link counterVal: number;

  build() {
    Column() {
      Text(`ChildLink: ${this.counterVal}`).fontSize(9)
        .height('5%')
        .key("ChildLink" + this.counterVal)
        .onClick((e: ClickEvent) => {
          this.counterVal += 2
        })
    }.width('100%')
  }
}

@Component
struct PropLink2 {
  @Link numberl: number;

  build() {
    Column() {
      Text(`PropLink:${this.numberl}`).width("100%")
        .height('5%')
        .key("PropLink" + this.numberl)
        .onClick((e: ClickEvent) => {
          this.numberl += 1
        })
      ChildLink2({counterVal: this.numberl})
    }
  }
}

@Entry
@Component
struct CombinationState2 {
  @State fatherState: number = 1;
  @StorageLink('Prop1') son1: number = 5;
  @State fathState: number = 7;

  onPageShow() {
    AppStorage.setOrCreate<number>('Prop1', 47);
  }

  build() {
    Row() {
      Column() {
        Text('@Link可使用父组件中被@State装饰的变量初始化').height('5%')
        PropLink2({numberl: this.fatherState})

        Text('@Link可使用父组件中被@StorageLink装饰的变量初始化').height('5%')
        PropLink2({numberl: this.son1})

        Text('@Link可使用父组件中被@Link装饰的变量初始化').height('5%')
        PropLink2({numberl: this.fathState})
      }
    }
  }
}