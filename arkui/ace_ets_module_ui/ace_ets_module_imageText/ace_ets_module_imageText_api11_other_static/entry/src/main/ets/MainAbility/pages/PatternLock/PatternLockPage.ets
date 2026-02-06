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

import { MessageManager, Callback, Message } from '../../common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ButtonType,
  PatternLockController,
  PatternLock
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PatternLockPage {
  @State passwords: int[] = new Array<int>()
  @State message: string = 'please input password!'
  @State sideLength: string = '200'
  @State circleRadius: string = '9'
  @State regularColor: string = '#FF000000'
  @State selectedColor: string = '#228B22'
  @State activeColor: string = '#B0C4DE'
  @State pathColor: string = '#90EE90'
  @State pathStrokeWidth: number = 18
  @State autoReset: boolean = true
  private patternLockController: PatternLockController = new PatternLockController()
  messageManager:MessageManager<number | int[] | String | PatternLockController | boolean> = new MessageManager<number | int[] | String | PatternLockController | boolean>()

  onPageShow() {
    console.info('PatternLockPage onPageShow')
    AppStorage.setOrCreate<MessageManager<number | int[] | String | PatternLockController| boolean>>("messageManager", this.messageManager);
    let callback: Callback<number | int[] | String | PatternLockController | boolean> = (message: Message<number | int[] | String | PatternLockController | boolean>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'passwords') {
        this.passwords = message.value as int[]
      }
      if (message.name == 'message') {
        this.message = message.value as String
      }
      if (message.name == 'controller') {
        this.patternLockController = message.value as PatternLockController
      }
      if (message.name == 'sideLength') {
        this.sideLength = message.value as String
      }
      if (message.name == 'circleRadius') {
        this.circleRadius = message.value as String
      }
      if (message.name == 'regularColor') {
        this.regularColor = message.value as String
      }
      if (message.name == 'selectedColor') {
        this.selectedColor = message.value as String
      }
      if (message.name == 'activeColor') {
        this.activeColor = message.value as String
      }
      if (message.name == 'pathColor') {
        this.pathColor = message.value as String
      }
      if (message.name == 'pathStrokeWidth') {
        this.pathStrokeWidth = parseFloat(message.value.toString())
      }
      if (message.name == 'autoReset') {
        this.autoReset = message.value as Boolean
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Text(this.message).textAlign(TextAlign.Center).fontSize(10).key('text').height('5%')
      PatternLock(this.patternLockController)
        .sideLength(this.sideLength)
        .circleRadius(this.circleRadius)
        .regularColor(this.regularColor)
        .selectedColor(this.selectedColor)
        .activeColor(this.activeColor)
        .pathColor(this.pathColor)
        .pathStrokeWidth(this.pathStrokeWidth)
        .autoReset(this.autoReset)
        .key('lock')
        .onPatternComplete((input: Array<int>) => {
          // 输入的密码长度小于5时,提示重新输入
          if (input === null || input === undefined || input.length < 5) {
            this.message = 'The password length needs to be greater than 5, please enter again.'
            return
          }
          // 判断密码长度是否大于0
          if (this.passwords.length > 0) {
            // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
            if (this.passwords.toString() === input.toString()) {
              this.passwords = input
              this.message = 'Set password successfully: ' + this.passwords.toString()
            } else {
              this.message = 'Inconsistent passwords, please enter again.'
            }
          } else {
            // 提示第二次输入密码
            this.passwords = input
            this.message = "Please enter again."
          }
        })
        .height('25%')
      Button('Reset PatternLock').key('reSet').onClick(() => {
        // 重置密码锁
        this.patternLockController.reset()
        this.passwords = []
        this.message = 'Please input password'
      }).height('5%')

      Text(this.passwords.toString()).fontSize(15).key('password1').height('5%')
      PatternLock(this.patternLockController)
        .key('default').height('25%')

      PatternLock(this.patternLockController)
        .key('PatternLock')
        .circleRadius(6)
        .regularColor($r('sys.color.ohos_id_color_foreground'))
        .selectedColor($r('sys.color.ohos_id_color_foreground'))
        .activeColor($r('sys.color.ohos_id_color_foreground'))
        .pathColor($r('sys.color.ohos_id_color_fourth'))
        .pathStrokeWidth(12)
        .autoReset(true)
        .height('25%')
    }.width('100%').height('100%')
  }
}