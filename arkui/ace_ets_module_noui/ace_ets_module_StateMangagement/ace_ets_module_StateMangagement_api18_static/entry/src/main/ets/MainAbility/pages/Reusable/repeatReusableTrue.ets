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
@ObservedV2
class RepeatreutrueClazz {
  @Trace public message: string ;

  constructor(message: string) {
    this.message = message;
  }
}

@Entry
@ComponentV2
struct Repeatreutrue  {
  @Local simpleList: Array<RepeatreutrueClazz> = [];
  private exchange: Array<int> = new Array<int>();
  private counter: number = 0;
  @Local selectOptions: SelectOption[] = [];
  @Local selectIdx: number = 0;
  private scroller: Scroller = new Scroller()

  //@Monitor('simpleList')
  reloadSelectOptions(): void {
    this.selectOptions = [];
    for (let i = 0; i < this.simpleList.length; ++i) {
      this.selectOptions.push({ value: i.toString() });
    }
    if (this.selectIdx >= this.simpleList.length) {
      this.selectIdx = this.simpleList.length - 1;
    }
  }

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(new RepeatreutrueClazz(`item_${i}`));
    }
    this.reloadSelectOptions();
  }

  handleExchange(idx: number): void { // 点击交换子组件
    this.exchange.push(idx.toInt());
    if (this.exchange.length === 2) {
      let _a = this.exchange[0];
      let _b = this.exchange[1];
      let temp: RepeatreutrueClazz = this.simpleList[_a];
      this.simpleList[_a] = this.simpleList[_b];
      this.simpleList[_b] = temp;
      this.exchange = [];
    }
  }

  build() {
    Column() {
      Text('virtualScroll each()&template() 1t')
        .height('5%')
        .fontColor(Color.Gray)
      Text('Select an index and press the button to update data.')
        .height('5%')
        .fontColor(Color.Gray)
      Button('Click to last')
        .id('reusabletrue')
        .height('5%')
        .onClick((e:ClickEvent) => {
          this.scroller.scrollToIndex(this.simpleList.length - 1); // Slide to the specified index
        })
      List({ scroller: this.scroller}) {
        Repeat<RepeatreutrueClazz>(this.simpleList)
          .each((obj: RepeatItem<RepeatreutrueClazz>) => {
            ListItem() {
              Text(`[each] index${obj.index}: ${obj.item.message}`)
                .height('5%')
                .onClick((e:ClickEvent) => {
                  this.handleExchange(obj.index);
                })
            }
          })
          .key((item: RepeatreutrueClazz, index: int) => {
            return item.message;
          })
          .virtualScroll({reusable: true })
          .templateId(() => 'a')
          .template('a', (ri) => {
            Text(`[a] index${ri.index}: ${ri.item.message}`)
              .height('5%')
              .onClick((e:ClickEvent) => {
                this.handleExchange(ri.index);
              })
          }, { cachedCount: 3 })
      }
      .cachedCount(2)
      .border({ width: 1 })
      .width('95%')
      .height('40%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}