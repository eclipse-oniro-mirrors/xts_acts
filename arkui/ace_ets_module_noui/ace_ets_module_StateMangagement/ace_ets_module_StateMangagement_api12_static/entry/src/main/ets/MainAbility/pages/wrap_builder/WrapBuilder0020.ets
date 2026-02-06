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
import { ChildWrapBuilder0020,Param } from './ChildWrapBuilder0020'
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
  Color,WrappedBuilder,wrapBuilder,CustomBuilderT,
  FlexAlign,ComponentV2,TabsController,Tabs,Builder,ResourceColor
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'



@Entry
@ComponentV2

struct WrapBuilder0020 {
  globalBuilder:  WrappedBuilder<CustomBuilderT<Param>> = wrapBuilder<CustomBuilderT<Param>>(ChildWrapBuilder0020)

  build() {
    Column() {
      this.globalBuilder.builder(new Param('HelloWorld', Color.Green))
    }
  }
}