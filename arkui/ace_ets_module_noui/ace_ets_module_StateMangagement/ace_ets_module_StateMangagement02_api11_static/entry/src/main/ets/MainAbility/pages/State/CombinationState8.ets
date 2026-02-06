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
  Row
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';


let storage008 = new LocalStorage({ 'PropA8':1 } as Record<string, number> )
storage008.set<number>('PropA8',47)

@Component
struct SubState8 {
  @State num1: number = 2;

  build() {
    Column() {
      Text('@State:'+ this.num1).id("SubState_text")
        .id("SubState1")
        .onClick((e: ClickEvent) => {
          this.num1 += 1
        })
        .height('5%')
    }
  }
}

@Component
struct SubProp8 {
  @PropRef num1: number;

  build() {
    Column() {
      Text('@PropRef:'+ this.num1).id("SubProp_text")
        .id("SubProp1")
        .onClick((e: ClickEvent) => {
          this.num1 += 1
        })
        .height('5%')
    }
  }
}

@Component
struct SubProvide8 {
  @Provide num1: number = 5;

  build() {
    Column() {
      Text('@Provide:'+ this.num1).id("SubProvide_text")
        .id("SubProvide1")
        .onClick((e: ClickEvent) => {
          this.num1 += 1
        })
        .height('5%')
    }
  }
}

@Component
struct SubLink8 {
  @Link num1: number;

  build() {
    Column() {
      Text('@Link:'+ this.num1).id("SubLink_text")
        .id("SubLink1")
        .onClick((e: ClickEvent) => {
          this.num1 += 1
        })
        .height('5%')
    }
  }
}

const get_storage = (): LocalStorage => storage008
@Entry({storage: 'get_storage' })
@Component
struct CombinationState8 {
  @LocalStoragePropRef('PropA') num: number = 1

  build() {
    Row() {
      Column() {
        Text('@LocalStorageProp支持初始化@State修饰的数据').height('5%')
        SubState8({num1: this.num})

        Text('@LocalStorageProp支持初始化@Prop修饰的数据').height('5%')
        SubProp8({num1: this.num})

        Text('@LocalStorageProp支持初始化@Provid修饰的数据').height('5%')
        SubProvide8({num1: this.num})

        Text('@LocalStorageProp支持初始化@Link修饰的数据').height('5%')
        SubLink8({num1: this.num})
      }
    }
  }
}