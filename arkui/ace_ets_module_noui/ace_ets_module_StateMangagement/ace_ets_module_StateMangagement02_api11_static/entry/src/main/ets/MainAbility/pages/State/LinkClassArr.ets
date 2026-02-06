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
import { AppStorage, Observed, Track } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

@Observed
class LinkAC {
  @Track public value: number

  constructor(value: number) {
    this.value = value
  }
}

@Component
struct SonLinkAC {
  @Link arrSon: Array<number>
  @Link classSon: LinkAC
  @Link classArrSon: Array<LinkAC>

  build() {
    Column() {
      Text(`arrSon: ${this.arrSon}`).key("arr_SonAC").height('5%')
      Text(`classSon: ${this.classSon.value}`).key("class_SonAC").height('5%')
      Text(`classArrSon: ${this.classArrSon[0].value}`).key("classArr_SonAC").height('5%')

      Button(`son change arr`)
        .key("arrBtn_SonAC")
        .onClick((e: ClickEvent) => {
          this.arrSon.reverse();
        })
        .height('5%')
      Button(`son change class`)
        .key("casBtn_SonAC")
        .onClick((e: ClickEvent) => {
          this.classSon.value += 1;
        })
        .height('5%')
      Button(`son change classArr`)
        .key("caBtn_SonAC")
        .onClick((e: ClickEvent) => {
          this.classArrSon[0].value += 1;
        })
        .height('5%')

    }
  }
}

@Entry
@Component
struct ParentLinkAC {
  @State arr1: Array<number> = new Array<number>(1,2,3)
  @State class1: LinkAC = new LinkAC(1)
  @State classArr: Array<LinkAC> = [new LinkAC(1), new LinkAC(2)]

  build() {
    Column() {
      Button("Reset").id("ParentLinkAC_reset")
        .onClick((e: ClickEvent) => {
          this.arr1 = [1,2,3]
          this.class1 = new LinkAC(1)
          this.classArr = [new LinkAC(1), new LinkAC(2)]
        })
        .height('5%')
      Text(`arrPar: ${this.arr1}`).key("arr_ParentAC").height('5%')
      Text(`classPar: ${this.class1.value}`).key("class_ParentAC").height('5%')
      Text(`classArrPar: ${this.classArr[0].value}`).key("classArr_ParentAC").height('5%')

      Button(`parent change arr`)
        .key("arrBtn_ParentAC")
        .onClick((e: ClickEvent) => {
          this.arr1.reverse();
        })
        .height('5%')
      Button(`parent change class`)
        .key("casBtn_ParentAC")
        .onClick((e: ClickEvent) => {
          this.class1.value += 2;
        })
        .height('5%')
      Button(`parent change classArr`)
        .key("caBtn_ParentAC")
        .onClick((e: ClickEvent) => {
          this.classArr[0].value += 2;
        })
        .height('5%')

      SonLinkAC({arrSon: this.arr1, classSon: this.class1, classArrSon: this.classArr})

    }.width('100%')
  }
}