/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { CustomContainer } from '../common/PCSCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import screenLock from '@ohos.screenLock';
import userAuth from '@ohos.userIAM.userAuth'

/*
* @tc.number: C-STD-SECURITY-0403
* @tc.name: SecureScreenLock
* @tc.desc: 【C-STD-SECURITY-0403】用户开通安全锁屏功能时，系统应提示用户设置一个口令作为主认证方式用于安全解锁；
*             要求设置的口令应满足一定复杂度要求，至少为 6 位数字；用户删除用户口令，系统应同时关闭安全锁屏功能。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct SecureScreenLock {
  @State name: string = 'SecureScreenLock';
  @State stepTips: string = '预期结果：安全锁屏开启，解锁屏幕需输入密码；关闭锁屏密码，解锁屏幕无需输入密码';
  @State testResult: boolean = false;
  @State startEnable: boolean = false;
  @State result: string = 'UNDEFINED';
  @State hasLocked: boolean = false;
  scroller: Scroller = new Scroller();
  unlockWithPassword: boolean = false
  unlockWithoutPassword: boolean = false
  @State hasReboot: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.testResult = false;
    this.startEnable = false;
    this.result = 'UNDEFINED';
  }

  @Builder
  specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Scroll(this.scroller) {
          Column() {
            Row() {
              Text('\n' + '\n' + `根据以下操作步骤完成测试` + '\n' + '\n')
                .fontColor(Color.White)
                .fontSize('24fp')
            }

            Row() {
              Text(`测试步骤:` + '\n' + '\n' + `1.进入设置应用，生物识别和密码页面，设置锁屏密码，锁屏密码自定义` + '\n' + '\n' +
                `2.返回validator，点击\'设置锁屏密码完成\'按钮` + '\n' + '\n' + 
                `3.点击\'锁屏\'按钮，屏幕锁定后，解锁屏幕：若需输入密码，且输入自定义锁屏密码后可解锁，则继续；否则测试失败` + '\n' + '\n' +
                `4.进入设置应用，生物识别和密码页面，关闭/删除锁屏密码` + '\n' + '\n' +
                `5.返回validator，点击\'删除锁屏密码完成\'按钮` + '\n' + '\n' +
                `6.点击\'锁屏\'按钮，屏幕锁定后，解锁屏幕：若无需输入密码，则测试通过；否则测试失败` + '\n' + '\n')
                .width('90%')
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`设置锁屏密码完成`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .onClick(async () => {
                    this.hasLocked = true
                    if (this.hasLocked) {
                      this.startEnable = true
                    }
                  })
                Blank('10%')
                Button(`删除锁屏密码完成`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .onClick(async () => {
                    this.hasLocked = false
                    if (!this.hasLocked) {
                      this.startEnable = true
                    }
                  })
                Blank('10%')
                Button(`锁屏`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .enabled(this.startEnable)
                  .opacity(this.startEnable ? 1 : 0.4)
                  .onClick(async () => {
                    this.startEnable = false
                    try {
                      let lockRes = await screenLock.lock()
                      if(!lockRes) {
                        this.result = 'FLASE'
                        this.testResult = false
                      }
                      if(this.hasLocked) {
                        this.unlockWithPassword = true
                      } else {
                        this.unlockWithoutPassword = true
                      }
                      if(this.unlockWithPassword && this.unlockWithoutPassword) {
                        this.result = '操作执行完毕，若符合预期结果测试通过'
                        this.testResult = true
                      }
                    } catch (err) {
                      console.error('lock failed, err: ' + err);
                      this.result = 'FLASE'
                      this.testResult = false
                    }
                  })
              }
            }
          }
          .width('100%')
        }
        .scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)
      }
    }
    .width('100%')
    .height('65%')
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        url: 'pages/PCS/PCS_index',
        stepTips: this.stepTips,
        content: this.specificNoParam,
        name: $name,
        testResult: $testResult,
        startEnable: $startEnable,
        result: $result,
        hasReboot: $hasReboot,
      }).margin({ bottom: '20vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/PCS/PCS_index',
    })
  }
}
