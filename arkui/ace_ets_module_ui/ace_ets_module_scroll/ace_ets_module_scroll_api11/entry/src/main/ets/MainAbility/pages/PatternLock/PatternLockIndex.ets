/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
// import testsuite from '../../test/List.test'
@Entry
@Component
struct PatternLockExample {
  @State passwords: Number[] = []
  @State message: string = '绘制您的图案'
  @State numberMessage: string = '请牢记您的解锁图案，忘记后无法找回'
  @State change: Number = 9
  @State bgColor: Color = Color.Transparent
  private patternLockController: PatternLockController = new PatternLockController()
aboutToAppear(){
    // let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    // let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Text(this.message).textAlign(TextAlign.Center).margin(72).width(288).height(40)
        .maxLines(2)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .fontSize($r('sys.float.ohos_id_text_size_body1'))
        .fontWeight(FontWeight.Medium)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .backgroundColor(this.bgColor)

      PatternLock(this.patternLockController)
        .key('lock')
        .backgroundColor(this.bgColor)
        .autoReset(true)
        .onDotConnect((index: number) => {
        })
        .onPatternComplete((input: Array<number>) => {

          // 输入的密码长度小于5时，提示重新输入
          if (input === null || input === undefined || input.length < 5) {
            this.message = '密码长度需要大于5，请重新输入'
            this.patternLockController.setChallengeResult(PatternLockChallengeResult.WRONG)
            return
          }
          // 判断密码长度是否大于0
          if (this.passwords.length > 0) {
            // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
            if (this.passwords.toString() === input.toString()) {
              this.passwords = input
              this.message = '密码设置成功： ' + this.passwords.toString()
              this.patternLockController.setChallengeResult(PatternLockChallengeResult.CORRECT)
            } else {
              this.message = '密码错误，请重新输入'
              this.patternLockController.setChallengeResult(PatternLockChallengeResult.WRONG)
            }
          } else {
            // 提示第二次输入密码
            this.passwords = input
            this.message = "请再次输入密码"
          }
        })

      Text(this.numberMessage).textAlign(TextAlign.Center).margin(40).width(288).height(35)
        .maxLines(2)
        .fontColor($r('sys.color.ohos_id_color_handup'))
        .fontSize($r('sys.float.ohos_id_text_size_body2'))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .backgroundColor(this.bgColor)

      Row(){
        Button('Reset PatternLock').onClick(() => {
          // 重置密码锁
          this.patternLockController.reset()
          this.passwords = []
          this.message = '绘制您的图案'
          this.numberMessage = '请牢记您的解锁图案，忘记后无法找回'
          this.bgColor = Color.Transparent
        })
      }

      Row() {
        Button('更改背板颜色')
          .onClick(() => {
            this.bgColor = Color['Pink']
          }).width('40%')

        Button('文本超级长').onClick(() => {
          this.message = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
          this.numberMessage = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
        }).width('40%')
      }

    }.width('100%').height('100%')
  }
}