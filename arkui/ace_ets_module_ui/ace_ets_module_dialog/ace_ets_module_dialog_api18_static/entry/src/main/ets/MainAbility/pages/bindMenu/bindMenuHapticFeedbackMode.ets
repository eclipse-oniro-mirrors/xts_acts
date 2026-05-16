'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LevelOrder } from '@ohos.promptAction'
import { BusinessError } from '@ohos.base'
import { UIContext } from '@ohos.arkui.UIContext'
import {  PromptAction } from '@ohos.arkui.UIContext'
import   promptAction  from '@ohos.promptAction'
import {
  Entry,
  Component,ForEach,
  $r,
  Column,wrapBuilder,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,PromptActionDialogController,
  ClickEvent,HapticFeedbackMode,
  Week,ComponentV2,BorderStyle,ShadowStyle,
  FontWeight,RowOptions,DismissDialogAction,DismissReason,ShadowType,
  Axis,Image,$r,Alignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, Divider, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,AppStorage,Local
} from '@ohos.arkui.stateManagement';
let promptAction = new PromptAction()
@Entry
@Component
struct BindMenuExample {
  @State listData: number[] = new Array<number>(0, 0, 0)
  @State hap1: HapticFeedbackMode = HapticFeedbackMode.DISABLED
  @State txt1: string = ''
  @State hap2: HapticFeedbackMode = HapticFeedbackMode.ENABLED
  @State txt2: string = ''
  @State hap3: HapticFeedbackMode = HapticFeedbackMode.AUTO
  @State txt3: string = ''
  @State hap4: HapticFeedbackMode | undefined = undefined
  @State txt4: string = ''
  @State hap5: HapticFeedbackMode | undefined | null = null
  @State txt5: string = ''

   @Builder
  MenuBuilder() {
    console.log('dashjhiewabfjidbnvgf')
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ForEach(this.listData, (item: number, index: int) => {
        Column() {
          console.log('item: ' + item + ', index: ' + index)
          Row() {
            Image($r('app.media.app_icon')).width('%1').height('%1').margin({ right: 5 } as Margin)
            Text(`Menu${index + 1}`)
          }
          .id('menu')
          .width('100%')
          .height('10%')
          .justifyContent(FlexAlign.Start)
          .align(Alignment.Start)
          .onClick((e: ClickEvent) => {
            console.info(`Menu${index + 1} Clicked!`)
          })

          if (index != this.listData.length - 1) {
            Divider().height('%1').width('80%').color('#ccc')
          }
        }.height('20%').width('40%')
      })
    }.width('50%')
  }

  build() {
    Column() {
      Row() {
        Column() {
          Button('1')
            .id('button1')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap1,
              onDisappear: () => {
                // this.txt1 = JSON.stringify(this.hap1)
                this.txt1 = this.hap1!.toString()
              }
            })
          Text(this.txt1)
            .id('text1')
        }
        Column() {
          Button('2')
            .id('button2')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap2,
              onDisappear: () => {
                // this.txt2 = JSON.stringify(this.hap2)
                this.txt2 = this.hap2!.toString()
              }
            })
          Text(this.txt2)
            .id('text2')
        }
        Column() {
          Button('3')
            .id('button3')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap3,
              onDisappear: () => {
                // this.txt3 = JSON.stringify(this.hap3)
                this.txt3 = this.hap3!.toString()
              }
            })
          Text(this.txt3)
            .id('text3')
        }
      }.margin({top:5} as Margin)
      Row() {
        Column() {
          Button('4')
            .id('button4')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap4,
              onDisappear: () => {
                // this.txt4 = JSON.stringify(this.hap4)
                this.txt4 = this.hap4!.toString()
              }
            })
          Text(this.txt4)
            .id('text4')
        }

        Column() {
          Button('5')
            .id('button5')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              // hapticFeedbackMode: this.hap5,
              onDisappear: () => {
                // this.txt5 = JSON.stringify(this.hap5)
                this.txt5 = String(this.hap5)
              }
            })
          Text(this.txt5)
            .id('text5')
        }
      }.margin({top:5} as Margin)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f0f0f0')
  }
}