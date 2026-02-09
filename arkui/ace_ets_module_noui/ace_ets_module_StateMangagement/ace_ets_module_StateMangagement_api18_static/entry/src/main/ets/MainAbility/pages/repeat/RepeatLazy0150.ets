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
  FontWeight,RowOptions,ComponentV2,Scroller,Repeat,ListItem,
  Axis,AlertDialogParamWithButtons,DialogAlignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,AppStorage,Local
} from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct RepeatLazy0150 {
  @Local dataArr: Array<string> = []
  private scroller: Scroller = new Scroller()

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('Swipe to Bottom')
        .id('btnRepeatLazy0150')
        .height('5%')
        .onClick(() :void => {
          this.scroller.scrollToIndex(0); // Slide to the specified index
        })
      List({ scroller: this.scroller, initialIndex: 80 }) {
        Repeat<string>(this.dataArr)
          .each((ri) => {
            ListItem() {
              Text('item_' + ri.item)
                .height('5%')
            }
          })
          .virtualScroll({
            onTotalCount: ()=> {return 100},
            onLazyLoading: (index: int) => {
              this.dataArr.push(index.toString())
            }
          })

      }
      .layoutWeight(1)
      .cachedCount(1)
    }
  }
}