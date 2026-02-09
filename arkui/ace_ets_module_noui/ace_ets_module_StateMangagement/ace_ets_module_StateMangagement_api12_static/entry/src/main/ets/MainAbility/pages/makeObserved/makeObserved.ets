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
// import { UIUtils } from '@ohos.arkui.StateManagement'
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
  FlexAlign,
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,LocalStorage,UIUtils
} from '@ohos.arkui.stateManagement'

class Test {
  name: string = 'zhangsan'

  constructor(name: string) {
    this.name = name;
  }
}

@Entry
@Component
struct testdemo {
  message: Test = UIUtils.makeObserved(new Test('dddd'));

  build() {
    Column() {
      Text(this.message.name).id('makeObservedText')
      Button(`change Obj: ${this.message.name}`).id('makeObservedButton')
        .onClick(():void => {
          this.message.name = 'peter';
        })
    }
  }
}