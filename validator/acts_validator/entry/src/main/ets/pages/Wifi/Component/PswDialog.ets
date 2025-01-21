/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import wifi from '@ohos.wifiManager'
import Logger from '../../model/Logger'

let TAG: string = 'PswDialog'

@CustomDialog
export struct PswDialog {
  @Link scanInfo: wifi.WifiScanInfo;
  private psw: string = '';
  private controller: CustomDialogController;
  private action?: (scanInfo:wifi.WifiScanInfo, psw: string) => void;

  build() {
    Column() {
      Text(this.scanInfo.ssid)
        .fontSize(20)
        .width('95%')

      TextInput({ placeholder: 'input password' })
        .id('input')
        .type(InputType.Password)
        .placeholderColor(Color.Gray)
        .fontSize(19)
        .margin({ top: 15 })
        .width('95%')
        .height(36)
        .onChange((value: string) => {
          this.psw = value
          Logger.info(TAG, 'TextInput  onChange =' + this.psw)
        })

      Row() {
        Button() {
          Text('确定')
            .fontColor(Color.Blue)
            .fontSize(17)
        }
        .id('sure')
        .layoutWeight(7)
        .backgroundColor(Color.White)
        .margin(5)
        .onClick(() => {
          this.controller.close()
          if(this.action !== undefined) {
            this.action(this.scanInfo, this.psw)
          }
        })

        // 分割线
        Text()
          .width(1)
          .height(35)
          .backgroundColor(Color.Black)

        Button() {
          Text('取消')
            .fontColor(Color.Red)
            .fontSize(17)
        }
        .layoutWeight(7)
        .backgroundColor(Color.White)
        .margin(5)
        .onClick(() => {
          this.controller.close()
        })
      }
      .width('100%')
      .margin({ top: '3%' })
    }
    .padding(15)
  }
}