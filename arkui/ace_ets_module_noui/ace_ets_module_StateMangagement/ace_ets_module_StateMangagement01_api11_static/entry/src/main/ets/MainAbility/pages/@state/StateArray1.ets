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
} from '@ohos.arkui.component';
import {
  State,
  Link,
  UIUtils
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';

// 自己声明的接口
interface Num{
  number:number
}

@Entry
@Component
struct MyComponent_AW {
  @State Array1: Date | Array<Length> | Array<Object>| Array<Int> | Array<Number> | Array<String> | Array<Resource>|Array<Num> = [1.0] as Array<Double>;
  aboutToAppear(){
    let uiContext = this.getUIContext();
    let StateArray1 = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("StateArray1",  StateArray1);
  }
  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.Array1)) + " number is " + JSON.stringify(UIUtils.getTarget(this.Array1)))
        .fontSize(9).key('StateArray1').height('5%')
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.Array1)) + " number is " + AppStorage.get<common.UIAbilityContext>('UIAbilityContext')?.resourceManager.getStringSync($r('app.string.number').id)??'')
        .fontSize(9).key('StateArray1New').height('5%')

      Text("设置变量Array<Number>类型[1]-->[10]").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array1 = [10.0] as Array<Number>;
        })
        .key('state5')
        .height('5%')

      Text("切换变量Date类型[1]-->new Date('2021-08-08')").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array1 = new Date('2021-08-08');
        })
        .key('state6')
        .height('5%')

      Text("切换变量Array<String>类型[1]-->['20']").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array1 = ['20'] as Array<String>;
        })
        .key('state7')
        .height('5%')

      Text("切换变量Array<Object>类型[1]-->[{number: 30}]").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array1 = [{number: 30.0}] as Array<Num>;
        })
        .key('state8')
        .height('5%')

      Text("切换变量Array<Resource>类型[1]-->Array<Resource>").height('5%')
      Button('change')
        .onClick((e: ClickEvent) => {
          this.Array1 = [$r('app.string.number')] as Array<Resource>;
        })
        .key('state9')
        .height('5%')

    }.width('100%')
  }
}
