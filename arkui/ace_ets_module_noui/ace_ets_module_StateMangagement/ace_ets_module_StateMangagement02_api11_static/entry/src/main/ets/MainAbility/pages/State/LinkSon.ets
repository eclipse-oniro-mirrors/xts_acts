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
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign
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
import common from '@ohos.app.ability.common';
@Entry
@Component
struct ParentLink {
  @State str: string = "before"
  @State num: number = 0
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LinkSon', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Button("Reset").id("ParentLink_reset")
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.str = "before"
          this.num = 0
        })
      Text('父组件').fontSize(9).height('5%')
      Text('Parent str: ' + this.str).key("str_parText").height('5%')
      Button(`change parStr`)
        .height('5%')
        .key("str_parLink")
        .onClick((e: ClickEvent) => {
          this.str = 'Link Parent';
        })
      Text('Parent num: ' + this.num).key("num_parText").height('5%')
      Button(`change parNum1`)
        .height('5%')
        .key("num_parLink")
        .onClick((e: ClickEvent) => {
          this.num += 3;
        })

      SonLink1({str1: this.str, num1: this.num})


    }.width('100%')
  }
}

@Component
struct SonLink1 {
  @Link str1: string= ''
  @Link num1: number = 1

  build() {
    Column() {
      Text('子组件Son1').fontSize(9).height('5%')
      Text('@Link str1: ' + this.str1).key("str1_tSon1").height('5%')
      Button(`change sonStr1`)
        .height('5%')
        .key("str_son1")
        .onClick((e: ClickEvent) => {
          this.str1 = 'Link Son1';
        })
      Text('@Link num1: ' + this.num1).key("num1_tSon1").height('5%')
      Button(`change sonNum1`)
        .height('5%')
        .key("num_son1")
        .onClick((e: ClickEvent) => {
          this.num1 += 2;
        })

      SonLink2({str2: this.str1, num2: this.num1})

    }
  }
}

@Component
struct SonLink2 {
  @Link str2: string = ''
  @Link num2: number = 1

  build() {
    Column() {
      Text('子组件Son2').fontSize(9).height('5%')

      Text('@Link str2: ' + this.str2).key("str2_tSon2").height('5%')
      Button(`change sonStr2`)
        .height('5%')
        .key("str_son2")
        .onClick((e: ClickEvent) => {
          this.str2 = 'Link Son2';
        })
      Text('@Link num2: ' + this.num2).key("num2_tSon2").height('5%')
      Button(`change sonNum2`)
        .height('5%')
        .key("num_son2")
        .onClick((e: ClickEvent) => {
          this.num2 += 1;
        })

    }
  }
}