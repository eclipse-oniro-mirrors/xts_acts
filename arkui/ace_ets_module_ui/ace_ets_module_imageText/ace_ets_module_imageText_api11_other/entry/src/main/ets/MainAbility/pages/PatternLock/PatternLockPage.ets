/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct PatternLockPage {
  @State passwords: Number[] = []
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
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('PatternLockPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'passwords') {
        this.passwords = message.value
      }
      if (message.name == 'message') {
        this.message = message.value
      }
      if (message.name == 'controller') {
        this.patternLockController = message.value
      }
      if (message.name == 'sideLength') {
        this.sideLength = message.value
      }
      if (message.name == 'circleRadius') {
        this.circleRadius = message.value
      }
      if (message.name == 'regularColor') {
        this.regularColor = message.value
      }
      if (message.name == 'selectedColor') {
        this.selectedColor = message.value
      }
      if (message.name == 'activeColor') {
        this.activeColor = message.value
      }
      if (message.name == 'pathColor') {
        this.pathColor = message.value
      }
      if (message.name == 'pathStrokeWidth') {
        this.pathStrokeWidth = message.value
      }
      if (message.name == 'autoReset') {
        this.autoReset = message.value
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
        .onPatternComplete((input: Array<number>) => {
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