'use static';
/**
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
import CommonFunc from '../../../MainAbility/common/Common';
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
  FlexWrap,$r
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

interface PropNumNum { number: number | string }

class Num3 {
  public pages: number | string;
  constructor(pages: number | string) {
    this.pages = pages;
  }
}
@Component
struct Child_AO {
  @PropRef  count: number | Object | String | Date | Boolean = '';

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.count)) + " number is " + JSON.stringify(UIUtils.getTarget(this.count)))
        .fontSize(9).key('PropNumber').height('5%')

      Text("变量赋值number类型").height('5%')
      Button('change')
        .onClick(():void => {
          this.count = 10;
        })
        .key('state1')
        .height('5%')

      Text("切换变量赋值Object").height('5%')
      Button('change')
        .onClick(():void => {
          this.count = new Num3(20);
        })
        .key('state2')
        .height('5%')

      Text("切换变量赋值string").height('5%')
      Button('change')
        .onClick(():void => {
          this.count = { number: '30' } as PropNumNum;
        })
        .key('state3')
        .height('5%')

      Text("切换变量赋值Date").height('5%')
      Button('change')
        .onClick(():void => {
          this.count = new Date('2021-08-08');
        })
        .key('state4')
        .height('5%')

      Text("切换变量赋值Boolean").height('5%')
      Button('change')
        .onClick(():void => {
          this.count = true;
        })
        .key('state5')
        .height('5%')


    }.width('100%')
  }
}

@Entry
@Component
struct Library_AO {
  @State count: number | Object | String | Date | Boolean = 0;

  build() {
    Column() {
      Child_AO({count: this.count})
    }.width('100%')
  }
}