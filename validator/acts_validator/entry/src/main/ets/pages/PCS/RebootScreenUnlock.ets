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
import { preferences } from '@kit.ArkData';
import screenLock from '@ohos.screenLock';
import power from '@ohos.power';
import userAuth from '@ohos.userIAM.userAuth'

let abilityContext = getContext(this) as context.UIAbilityContext;

/*
* @tc.number: C-STD-SECURITY-0409
* @tc.name: RebootScreenUnlock
* @tc.desc: 【C-STD-SECURITY-0409】如果设备设置了锁屏口令，设备重启后，用户首次解锁屏幕，系统仅允许使用锁屏口令认证。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct RebootScreenUnlock {
  @State name: string = 'RebootScreenUnlock';
  @State stepTips: string = '预期结果：重启后首次解锁只可以使用口令认证，不可以使用其他认证方式，如人脸、指纹等';
  @State testResult: boolean = false;
  @State startEnable: boolean = true;
  @State result: string = 'UNDEFINED';
  scroller: Scroller = new Scroller();
  @State hasReboot: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.testResult = false;
    this.startEnable = false;
    this.result = 'UNDEFINED';
    let options: preferences.Options = { name: 'validatorRebootScreenUnlockStore' };
    let dataPreferences = preferences.getPreferencesSync(abilityContext.getApplicationContext(), options);
    console.info('dataPreferences.getSync = ' + dataPreferences.getSync('hasReboot', 'false').toString())
    if(dataPreferences.getSync('hasReboot', 'false').toString() == 'true') {
      this.hasReboot = true
    }
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
              Text(`测试步骤:` + '\n' + '\n' + `1.进入设置应用，生物识别和密码页面，设置设备支持的各种认证方式，如锁屏密码、人脸认证、指纹认证等，若设备不支持多种认证方式，直接点击测试失败按钮` + '\n' + '\n' + 
                `2.返回validator，点击\'设置锁屏认证完成\'按钮` + '\n' + '\n' +
                `3.点击\'重启设备\'按钮，重启后，解锁屏幕：若可以使用除口令外的其他认证方式，则测试失败；否则测试通过。进入validator，点击\'重启设备完成\'按钮，根据条件判断测试是否通过` + '\n' + '\n')
                .width('90%')
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`设置锁屏认证完成`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .onClick(async () => {
                    this.startEnable = true
                  })
                Blank('10%')
                Button(`重启设备`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .enabled(this.startEnable)
                  .opacity(this.startEnable ? 1 : 0.4)
                  .onClick(async () => {
                    console.info(`reboot device start`);
                    try {
                      let options: preferences.Options = { name: 'validatorRebootScreenUnlockStore' };
                      let dataPreferences = 
                              preferences.getPreferencesSync(abilityContext.getApplicationContext(), options);
                      dataPreferences.putSync('hasReboot', 'true');
                      dataPreferences.flush((err: BusinessError) => {
                        if (err) {
                          console.error(`Failed to flush.`);
                        } else {
                          console.info(`Succeeded to flush.`);
                        }
                      })
                    } catch (err) {
                      console.error('putSync failed, err: ' + err);
                    }
                    try {
                      power.reboot('reboot_screen_unlock_test');
                      console.info(`reboot Succeeded`);
                    } catch (err) {
                      console.error('reboot failed, err: ' + err);
                    }
                    console.info(`reboot device end`);
                  })
                Blank('10%')
                Button(`重启设备完成`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .enabled(this.hasReboot)
                  .opacity(this.hasReboot ? 1 : 0.4)
                  .onClick(async () => {
                    this.testResult = true
                    this.result = 'TRUE'
                    let options: preferences.Options = { name: 'validatorRebootScreenUnlockStore' };
                    await preferences.deletePreferences(abilityContext.getApplicationContext(), options)
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
    .height('80%')
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
