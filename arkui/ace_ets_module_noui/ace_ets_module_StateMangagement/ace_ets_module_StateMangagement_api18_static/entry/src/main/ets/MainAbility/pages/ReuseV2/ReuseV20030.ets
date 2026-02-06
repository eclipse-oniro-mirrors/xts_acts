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
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,List,
  FontWeight,RowOptions,ComponentV2,Scroller,ReusableV2,Repeat,ListItem,
  Axis,AlertDialogParamWithButtons,DialogAlignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,RepeatItem,SelectOption
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,AppStorage, ObservedV2, Local, Trace, Monitor,
} from '@ohos.arkui.stateManagement';

@ReusableV2
@ComponentV2
struct ChildReuseV20030 {
  @Local msg: string = 'ArkUI'

  aboutToReuse(): void {
    this.msg = 'aboutToReuse'
  }

  aboutToRecycle(): void {
    this.msg = 'aboutToRecycle'
  }

  build() {
    Column() {
      Text(this.msg)
        .id('tvChildReuseV20030')
        .width('50%')
        .height('10%')
    }
  }
}

@Entry
@ComponentV2
struct ReuseV20030 {
  @Local flag: boolean = true

  build() {
    Column() {
      Button('Change')
        .id('btnReuseV20030Change')
        .width('50%')
        .height('10%')
        .onClick((e:ClickEvent) => {
          this.flag = !this.flag
        })
      if (this.flag) {
        ChildReuseV20030()
          //.reuse({ reuseId: () => 'childR' })
      }
    }
  }
}