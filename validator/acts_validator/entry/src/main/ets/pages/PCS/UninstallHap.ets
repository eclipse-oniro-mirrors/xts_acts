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
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import bundleManager from '@ohos.bundle.bundleManager';
import installer from '@ohos.bundle.installer';

let abilityContext = getContext(this) as context.UIAbilityContext;

/*
* @tc.number: G-SOFTWARE-0502
* @tc.name: UninstallHap
* @tc.desc: 【G-SOFTWARE-0502】应为用户提供卸载已安装应用的入口。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct UninstallHap {
  @State name: string = 'UninstallHap';
  @State stepTips: string = '预期结果：成功卸载应用';
  @State testResult: boolean = false;
  @State startEnable: boolean = true;
  @State result: string = "FLASE";
  scroller: Scroller = new Scroller();
  @State hasReboot: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.testResult = false;
    this.startEnable = true;
    this.result = "FLASE";
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
              Text(`测试步骤:` + '\n' + '\n' + `1.点击开始键进入系统桌面` + '\n' + '\n' + 
              '2.卸载UninstallTest应用' + '\n' + '\n' + '3.返回validator应用' + '\n' + '\n' +
              '4.点击结束按钮，观察卸载结果是否为TRUE' + '\n' + '\n')
                .width('90%')
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`开始`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .margin('10vp')
                  .enabled(this.startEnable)
                  .opacity(this.startEnable ? 1 : 0.4)
                  .onClick(async () => {
                    this.startEnable = !this.startEnable;
                    let str: Want = {
                      bundleName: "com.ohos.launcher",
                      abilityName: "com.ohos.launcher.MainAbility",
                    }
                    abilityContext.startAbility(str).then((data) => {

                    }).catch((error: BusinessError) => {
                      
                    })
                  })
              }

              Column() {
                Button(`结束`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(!this.startEnable)
                  .opacity(!this.startEnable ? 1 : 0.4)
                  .onClick(() => {
                    this.startEnable = !this.startEnable;
                    let bundleInfo: bundleManager.BundleInfo | null = null
                    try {
                      bundleInfo = bundleManager.getBundleInfoSync('com.pcs.software.signedhap', 0)
                    } catch (error) {

                    }
                    if(bundleInfo == undefined) {
                      this.testResult = true
                      this.result = "TRUE"
                    }
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `卸载结果：` + this.result)
                .fontColor(Color.White)
                .fontSize('24fp')
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