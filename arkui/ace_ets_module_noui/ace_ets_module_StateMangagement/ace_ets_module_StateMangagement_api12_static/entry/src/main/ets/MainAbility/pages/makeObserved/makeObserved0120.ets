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
  Row,CommonAttribute,TextAttribute,
  List,AttributeModifier,ButtonAttribute,BorderStyle,
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
import { CommonModifier } from '@ohos.arkui.modifier'

class MyModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  public setGroup1(): void {
    this.borderStyle(BorderStyle.Dotted)
    this.borderWidth(8)
  }

  public setGroup2(): void {
    this.borderStyle(BorderStyle.Dashed)
    this.borderWidth(8)
  }
}

@ComponentV2
struct MyImagel {
  @Param @Require modifier: CommonModifier
  index: number = 0;

  build() {
    Text('1111').attributeModifier(this.modifier as MyModifier).id('imageTest')
  }
}

@Entry
@ComponentV2
struct makeObserved0130 {
  @Local myModifier: CommonModifier = UIUtils.makeObserved(new MyModifier().height('3%'))
  index: number = 0;
  build() {
    Column() {
      Button('change')
        .onClick(() => {
          console.log('Modifier', 'onClick')
          this.index++;
          if (this.index % 2 === 1) {
            (this.myModifier as MyModifier).setGroup1()
            console.log('Modifier', 'setGroup1')
          } else {
            (this.myModifier as MyModifier).setGroup2()
            console.log('Modifier', 'setGroup2')
          }
        }).id('buttonTest')
      MyImagel({ modifier: this.myModifier })
    }
    .width('100%')
  }
}