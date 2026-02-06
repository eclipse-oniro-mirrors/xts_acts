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
import wifiManager from '@ohos.wifiManager';

let abilityContext = getContext(this) as context.UIAbilityContext;


function uintToIP(uint32 : number) {
    return [
        (uint32 >>> 24) & 0xFF,
        (uint32 >>> 16) & 0xFF,
        (uint32 >>> 8) & 0xFF,
        uint32 & 0xFF
    ].join('.');
}

function isLegalIP(ipStr : string) {
    let parts = ipStr.split('.')
    if (parts.length != 4) {
      return false
    }
    for (let part of parts) {
      let num = parseInt(part)
      if (num < 0 || num > 255) {
        return false
      }
    }
    return true
}

/*
* @tc.number: G-HARDWARE-0207
* @tc.name: DHCPClientAndServer
* @tc.desc: 【G-HARDWARE-0207】必须支持 DHCPv4 Client/Server。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct DHCPClientAndServer {
  @State name: string = 'DHCPClientAndServer';
  @State stepTips: string = '预期结果：连接WLAN后读取到的DHCP IP信息合法';
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

            Row() {
              Text(`测试步骤:` + '\n' + '\n' + `1.若设备不支持WLAN，直接点击测试失败按钮` + '\n' + '\n' +
                `2.若支持WLAN，进入设置应用WLAN配置界面` + '\n' + '\n' + '3.连接任意WLAN，本机IP获取方式设置为DHCP（若无此选项则默认为DHCP）' + '\n' + '\n' +
                '4.返回validator，点击完成设置按钮' + '\n' + '\n' + '5.查看输出IP校验结果，若显示\'合法IP\'则测试通过，否则测试失败' + '\n' + '\n')
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
                    let ipInfo = wifiManager.getIpInfo()
                    let dhcpIp = ipInfo.serverIp
                    if(dhcpIp > 0) {
                      let ipStr = uintToIP(dhcpIp)
                      let isIPLegal = isLegalIP(ipStr)
                      this.result = uintToIP(dhcpIp) + '  '
                      if (isIPLegal) {
                        this.result += '合法IP'
                      } else {
                        this.result += '非法IP'
                      }
                      this.testResult = true
                    }
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `DHCP IP地址：` + this.result)
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
