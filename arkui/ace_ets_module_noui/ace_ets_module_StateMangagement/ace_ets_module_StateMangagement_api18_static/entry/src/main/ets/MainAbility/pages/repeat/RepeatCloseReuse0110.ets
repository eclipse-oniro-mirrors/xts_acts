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
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
  AppStorage,
  Local,
  Param
} from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct RepeatCloseReuse0110 {
  @Local dataArr: Array<string> = []
  private scroller: Scroller = new Scroller()

  aboutToAppear(): void {
    for (let index = 0; index < 50; index++) {
      this.dataArr.push('item_' + index)
    }
  }

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('Swipe to Bottom')
        .id('btnRepeatCloseReuse0110')
        .height('5%')
        .onClick(() :void => {
          this.scroller.scrollToIndex(this.dataArr.length - 1); // Slide to the specified index
        })
      List({ scroller: this.scroller }) {
        Repeat<string>(this.dataArr)
          .each((ri) => {
            ListItem() {
              ChildRepeatCloseReuse0110({ item: ri.item })
                //.reuse({ reuseId: () => '' })
            }
          })
          .virtualScroll({ reusable: false })
          .templateId(() => 'default')
      }
      .layoutWeight(1)
    }
  }
}

@ReusableV2
@ComponentV2
struct ChildRepeatCloseReuse0110 {
  @Param item: string = ''

  build() {
    Column() {
      Text(this.item)
        .height('5%')
    }
  }
}