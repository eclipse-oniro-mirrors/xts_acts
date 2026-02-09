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
  ListItem,ResourceStr,Length
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  Consume,
  Provide
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ProvideConsume0360 {
  @Provide num: ResourceStr | Length = 5.0

  build() {
    Column() {
      Button('@Provide')
        .id('btnProvideConsume0360Change')
        .height(this.num)
        .onClick(():void=>{
          this.num = 8.0
        })
    }
  }
}