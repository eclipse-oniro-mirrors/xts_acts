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
  Text,
  Row,
  Scroll,
  ButtonType,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FontWeight,
  Profiler,
  setAppBgColor,
  FlexWrap,
  Length,
  $r,
  Resource,
  ResourceColor,
  Color,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';

@Component
struct Child_AAs {
  @Link color: undefined | ResourceColor;

  build() {
    Column() {

      Text("设置变量color类型pink-->Orange").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick((e: ClickEvent) => {
          this.color = Color.Orange;
        })
        .key('LinkColor001')
        .height('5%')

      Text("设置变量number类型Orange-->008000").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick((e: ClickEvent) => {
          this.color = 0x0000ff;
        })
        .key('LinkColor002')
        .height('5%')

      Text("设置变量undefined类型pink-->undefined").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick((e: ClickEvent) => {
          this.color = undefined;
        })
        .key('LinkColor003')
        .height('5%')

      Text("设置变量string类型pink-->'008000'").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick((e: ClickEvent) => {
          this.color = '#FFA52A2A';
        })
        .key('LinkColor004')
        .height('5%')

      Text("设置变量string类型pink-->null").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick((e: ClickEvent) => {
          this.color = undefined;
        })
        .key('LinkColor005')
        .height('5%')

      Text("设置变量Resource类型pink-->Resource").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick((e: ClickEvent) => {
          this.color = $r('app.string.color');
        })
        .key('LinkColor006')
        .height('5%')

    }.width('100%')
  }
}

@Entry
@Component
struct Index_AAs{
  @State color: undefined | ResourceColor= '008000';

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.color)) + " number is " + JSON.stringify(this.color))
        .fontSize(9).key('LinkColor').height('5%')
      Child_AAs({color: this.color})

    }
  }
}