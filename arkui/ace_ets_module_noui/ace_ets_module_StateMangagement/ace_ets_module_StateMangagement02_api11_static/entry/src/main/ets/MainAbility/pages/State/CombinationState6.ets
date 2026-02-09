'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Consume
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Observed
class ClassA006 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}


@Component
struct PropObjectLinkFather {
  @ObjectLink class_A: ClassA006 = new ClassA006(1);

  build() {
    Column() {
      Text('@ObjectLink支持被@ObjectLink修饰的数据初始化').height('5%')
      PropObjectLink6({class_A: this.class_A})
    }
  }
}

@Component
struct ObjectLinkConsume {
  @Consume class_C: ClassA006 = new ClassA006(1);

  build() {
    Column() {
      // @ObjectLink支持被@Consume修饰的数据初始化
      PropObjectLink6({class_A: this.class_C})
    }
  }
}

@Component
struct LinkObjectLink {
  @Link class_A: ClassA006 = new ClassA006(1);

  build() {
    Column() {
      // @ObjectLink支持被@Link修饰的数据初始化
      PropObjectLink6({class_A: this.class_A})
    }
  }
}

@Component
struct PropObjectLink6 {
  @ObjectLink class_A: ClassA006 = new ClassA006(1);

  build() {
    Column() {
      Text('PropObjectLink:' + this.class_A.value).width("100%")
        .key("PropObjectLink" + this.class_A.value)
        .onClick((e: ClickEvent) => {
          this.class_A.value += 1
        })
        .height('5%')
    }
  }
}

@Entry
@Component
struct CombinationState6 {
  @State class_A: ClassA006 = new ClassA006(1)
  @State class_B: ClassA006 = new ClassA006(2)
  @Provide class_C: ClassA006 = new ClassA006(3)
  @State class_E: ClassA006 = new ClassA006(5)
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('CombinationState6', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        Text('@ObjectLink支持被@State修饰的数据初始化').height('5%')
        PropObjectLink6({class_A: this.class_A})

        Text('@ObjectLink支持被@Link修饰的数据初始化').height('5%')
        LinkObjectLink({class_A: this.class_B})

        Text('@ObjectLink支持被@Provide修饰的数据初始化').height('5%')
        PropObjectLink6({class_A: this.class_C})

        Text('@ObjectLink支持被@Consume修饰的数据初始化').height('5%')
        ObjectLinkConsume()

        Text('@ObjectLink支持被@ObjectLink修饰的数据初始化').height('5%')
        PropObjectLinkFather({class_A: this.class_E})
      }
    }
  }
}