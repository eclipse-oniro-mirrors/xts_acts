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
import systemparameter from '@ohos.systemParameterEnhance';

/*
* @tc.number: STD-TOOLS-0200
* @tc.name: DeveloperMode
* @tc.desc: 【STD-TOOLS-0200】必须支持进入 OpenHarmony 调试模式。
*           【G-TOOLS-0201】必须支持 OpenHarmony 调试配置。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct DeveloperMode {
  @State name: string = 'DeveloperMode';
  @State stepTips: string = '预期结果：页面中调试/开发者模式状态为TRUE';
  @State testResult: boolean = false;
  @State startEnable: boolean = true;
  @State result: string = "UNDEFINED";
  scroller: Scroller = new Scroller();
  @State hasReboot: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.testResult = false;
    this.startEnable = true;
    this.result = "UNDEFINED";
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

            Button(`获取设备调试/开发者模式状态`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('50%')
              .margin('10vp')
              .onClick(async () => {
                if(systemparameter.getSync('const.security.developermode.state') == 'true') {
                  this.result = "TRUE"
                  this.testResult = true
                } else {
                  this.result = "FLASE"
                }
              })

            Row() {
              Text(`测试步骤:` + '\n' + '\n' + `1.点击按钮获取设备调试/开发者模式状态，若为TRUE则测试通过` + '\n' + '\n' +
                `2.若为FALSE，进入设置应用，调试/开发者模式配置页面，打开调试/开发者模式并重启` + '\n' + '\n' + '3.重启后再次进入validator此页面' + '\n' + '\n' +
                '4.点击完成设置按钮' + '\n' + '\n' +
                '5.观察页面中调试/开发者模式状态为TRUE' + '\n' + '\n')
                .width('90%')
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`完成设置`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .enabled(this.startEnable)
                  .opacity(this.startEnable ? 1 : 0.4)
                  .onClick(async () => {
                    if(systemparameter.getSync('const.security.developermode.state') == 'true') {
                      this.result = "TRUE"
                      this.testResult = true
                    } else {
                      this.result = "FLASE"
                    }
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `调试/开发者模式状态：` + this.result)
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
