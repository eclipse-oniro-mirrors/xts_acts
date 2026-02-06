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
  Resource,
  $r,
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  UIUtils
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct MyComponent_AE {
  @State Array: Array<Number> | Array<boolean> | Boolean | Array<Resource> = [1.0];

  aboutToAppear(){
    let uiContext = this.getUIContext();
    let StateArray = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("StateArray",  StateArray);
  }
  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.Array)) + " number is " + JSON.stringify(UIUtils.getTarget(this.Array)))
        .fontSize(9).key('StateArray').height('5%')
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.Array)) + " number is " + AppStorage.get<common.UIAbilityContext>('UIAbilityContext')?.resourceManager.getStringSync($r('app.string.number').id))
        .fontSize(9).key('StateArrayNew').height('5%')
      Text("设置变量Array<Number>类型[1]-->[10]").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array = [10.0];
        })
        .key('state1')
        .height('5%')

      Text("切换变量Array<boolean>类型[1]-->[true]").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array = [true];
        })
        .key('state2')
        .height('5%')

      Text("切换变量boolean类型[1]-->true").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array = true;
        })
        .key('state3')
        .height('5%')

      Text("切换变量Array<Resource>类型[1]-->Array<Resource>").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array = [$r('app.string.number')];
        })
        .key('state4')
        .height('5%')


    }.width('100%')
  }
}