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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,AttributeModifier,ButtonAttribute,
  ListItem,GridLayoutOptions,Grid,GridItem,BarState,TextAlign,
  Color,Scroller,Divider,Flex,ChildrenMainSize,ListScroller,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,IMonitor,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'

@Observed
class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  public isDark: boolean = false

  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Black)
    } else {
      instance.backgroundColor(Color.Red)
    }
  }
}

@Entry
@ComponentV2
struct makeObserved0110 {
  modifier: MyButtonModifier = UIUtils.makeObserved(new MyButtonModifier())

  build() {
    Row() {
      Column() {
        Button('Button')
          .attributeModifier(this.modifier)
          .onClick(():void => {
            this.modifier.isDark = !this.modifier.isDark
            console.log("====================================== onClick");
          })
          .id('buttonTest')
      }
    }
  }
}