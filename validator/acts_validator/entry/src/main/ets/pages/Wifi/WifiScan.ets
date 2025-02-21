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

import router from '@ohos.router';
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import WifiDataSource from './model/BasicDataSource'
import wifi from '@ohos.wifiManager'
import { WifiModel, WifiType } from './model/WifiModel'
import Logger from '../model/Logger';
import { PswDialog } from './Component/PswDialog'
import prompt from '@ohos.promptAction'
import { WifiView } from './Component/WifiView';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import data from '@ohos.telephony.data';

let innerEvent: emitter.InnerEvent = {
  eventId: 9
};
let self: null | WifiScan = null;
const TAG = '[Screenshot]';

const isCore = canIUse('SystemCapability.Communication.WiFi.Core');
const isSTA = canIUse('SystemCapability.Communication.WiFi.STA');
const isAPCore = canIUse('SystemCapability.Communication.WiFi.AP.Core');
const isWiFiP2P = canIUse('SystemCapability.Communication.WiFi.P2P');

@Entry
@Component
struct WifiScan {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'WifiScan';
  @State StepTips: string = '操作步骤：\n1、请打开Wlan' + '\n2、自己创建一个热点' + '\n3、查看应用是否扫描到自己创建的热点名称'
    + '\n4、选择连接热点，输入账号密码进行连接' + '\n预期结果：列表能扫描到自己的热点，能成功连接则通过';
  @State Vue: boolean = false;
  @State btnState: boolean = false;
  @State startTime: number = 0;
  @State isLinked: boolean = false;
  @State isSwitchOn: boolean = false;
  @StorageLink('wifiList') @Watch('wifiListRefresh') wifiList: Array<wifi.WifiScanInfo> = [];
  @State wifiDataResource: WifiDataSource = new WifiDataSource(this.wifiList);
  @State scanInfo: wifi.WifiScanInfo | null = null;
  @State flag: boolean = false;
  private wifiModel: WifiModel = new WifiModel();
  private linkedInfo: wifi.WifiLinkedInfo | null = null;
  private pswDialogController: CustomDialogController = new CustomDialogController({
    builder: PswDialog({ scanInfo: $scanInfo, action: this.onAccept }),
    autoCancel: true
  });
  scroller: Scroller = new Scroller();

  // 扫描wifi
  async scan() {
    // 获取有关Wi-Fi连接的信息,存入linkedInfo
    await this.getLinkedInfo()
    // 不停地扫描wifi
    let result: Array<WifiType> = await this.wifiModel.getScanInfos()
    if (this.isSwitchOn) {
      AppStorage.SetOrCreate('wifiList', result)
      setTimeout(async () => {
        await this.scan()
      }, 3000)
    }
  }

  // 获取有关Wi-Fi连接的信息,存入linkedInfo
  async getLinkedInfo() {
    try {
      let wifiLinkedInfo = await wifi.getLinkedInfo()
      if (wifiLinkedInfo === null || wifiLinkedInfo.bssid === '') {
        this.isLinked = false
        this.linkedInfo = null
        return
      }
      Logger.info(TAG, `getLinkedInfo:isLinked ${this.isLinked}`)
      this.isLinked = true
      this.linkedInfo = wifiLinkedInfo
    } catch (err) {
      Logger.info(`getLinkedInfo failed err is ${JSON.stringify(err)}`)
    }
  }

  // 监听wifi的变化
  addListener() {
    // 连接状态改变时，修改连接信息
    wifi.on('wifiConnectionChange', async state => {
      Logger.info(TAG, `wifiConnectionChange: ${state}`)
      await this.getLinkedInfo()
    })
    // wifi状态改变时，先清空wifi列表，然后判断是否是开启状态，如果是就扫描
    wifi.on('wifiStateChange', state => {
      Logger.info(TAG, `wifiStateLisener state: ${state}`)
      AppStorage.SetOrCreate('wifiList', [])
      if (state === 1) { // 1: wifi is enable, 0:wifi is disable
        this.scan()
      }
    })
  }

  async aboutToAppear() {
    if (isCore && isSTA && isAPCore && isWiFiP2P) {
      self = this
      await FirstDialog.ChooseDialog(this.StepTips, this.name);
      // 如果wifi是开的，就记录下状态，然后扫描wifi，并获取连接信息
      if (wifi.isWifiActive()) {
        Logger.info(TAG, 'wifi is active')
        this.isSwitchOn = true
        wifi.scan()
        this.scan()
        this.getLinkedInfo()
      }
      // 启动监听
      this.addListener()
    } else {
      setTimeout(() => {
        promptAction.showToast({
          message: '该设备没有wifi相关模块',
          duration: 2000
        })
        router.back({
          url: 'pages/Wifi/Wifi_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
      }, 2000)
    }
  }

  async onPageShow() {

    // 收到eventId为1的事件后执行回调函数
    emitter.on(innerEvent, (res) => {
      if(res.data !== undefined) {
        this.Vue = res.data.flag
        console.info('emitter.on =9= ' + this.Vue);
      }
    });
  }

  async onPageHide() {
    emitter.off(9);
    Logger.info("enter onPageHide");
  }

  async aboutToDisappear() {
    emitter.off(9);
    wifi.off('wifiConnectionChange')
    wifi.off('wifiStateChange')
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    }
    else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/Wifi/Wifi_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/Wifi/Wifi_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  build() {
    Column() {
      Column() {
        Row() {
          Button() {
            Image($r('app.media.ic_public_back'))
              .width('20vp')
              .height('18vp')
              .margin({ left: '20vp' })
          }
          .backgroundColor(Color.Black)
          .size({ width: '40vp', height: '30vp' })
          .onClick(() => {
            router.back({
              url: 'pages/Wifi/Wifi_index',
              params: { result: 'None', }
            })
          })

          Text(this.name)
            .fontColor(Color.White)
            .fontSize('18fp')
            .margin({ left: '-20vp' })
          Text('hello')
            .fontColor(Color.White)
            .visibility(Visibility.Hidden)
        }
        .backgroundColor(Color.Black)
        .height('10%')
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Column() {
          Row() {
            Text('Wlan')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .height(40)

            Blank()

            Toggle({ type: ToggleType.Switch, isOn: this.isSwitchOn })
              .id('switch')
              .onChange((isOn: boolean) => {
                Logger.info(`LSQ: wifi swtich is: ${isOn}`)
                try {
                  // 如果是打开状态，记录状态，打开网络，开始扫描
                  if (isOn) {
                    AppStorage.SetOrCreate('wifiList', [])
                    this.isSwitchOn = true
                    wifi.enableWifi()
                    return
                  } else {
                    // 记录状态，断开网络禁用网络
                    this.isSwitchOn = false
                    this.isLinked = false
                    wifi.disconnect()
                    wifi.disableWifi()
                  }
                } catch (error) {
                  Logger.error(TAG, `failed,code:${JSON.stringify(error.code)},message:${JSON.stringify(error.message)}`)
                }
              })
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          if (this.isLinked && this.isSwitchOn) {
            Column() {
              Text('已连接')
                .fontSize(22)
                .width('100%')
              Row() {
                Text(this.linkedInfo ? this.linkedInfo.ssid : '')
                  .fontSize(20)
                  .fontColor(Color.Black)
                  .layoutWeight(1)
                Text('已连接')
                  .fontSize(18)
                  .fontColor(Color.Black)
              }
              .width('100%')
              .padding(10)
              .margin({ left: 16, right: 16 })
              .border({ radius: 15, color: Color.Gray, width: 1 })
              .backgroundColor(Color.White)
            }
            .width('100%')
            .padding({ left: 16, right: 16 })
          }
          if (this.isSwitchOn) {
            List() {
              ListItem() {
                Row() {
                  Text('可用WLAN')
                    .fontSize(22)
                    .layoutWeight(1)
                }
                .id('validWlan')
                .width('100%')
              }

              LazyForEach(this.wifiDataResource, (item: wifi.WifiScanInfo, index) => {
                ListItem() {
                  WifiView({ wifi: item })
                }
                .id(`Wifi${index}`)
                .onClick(() => {
                  Logger.info(TAG, 'wifi click')
                  this.scanInfo = item
                  Logger.info(TAG, `onClick,scanInfo:${JSON.stringify(this.scanInfo)}`)
                  if (this.linkedInfo !== null && item.ssid === this.linkedInfo.ssid) {
                    prompt.showToast({ message: 'this wifi is connected' })
                    return
                  }
                  if (item.securityType === 0 || item.securityType === 1) {
                    this.wifiModel.connectNetwork(item, '')
                    Logger.info(TAG, `onClick,item.securityType:${JSON.stringify(item.securityType)}`)
                    return
                  }
                  this.pswDialogController.open()
                })
              }, (item: wifi.WifiScanInfo) => JSON.stringify(item))
            }
            .width('100%')
            .height('100%')
            .padding({ left: 16, right: 16 })
            .layoutWeight(1)
            .divider({ strokeWidth: 1, color: Color.Gray, startMargin: 10, endMargin: 10 })
            .margin({ top: 10 })
          }
        }
        .width('100%')
        .height('80%')

        Row() {
          this.PassBtn($r('app.string.btn_fullscreen'), true);
          Button() {
            Image($r('app.media.ic_public_help'))
              .width('20vp')
              .height('20vp')
          }
          .width('30%')
          .height('30vp')
          .backgroundColor(Color.Grey)
          .onClick(() => {
            AlertDialog.show(
              {
                title: '操作提示',
                message: this.StepTips,
                confirm: {
                  value: 'OK',
                  action: () => {
                  }
                }
              }
            )
          })

          this.FailBtn($r('app.string.btn_fullscreen'), true);
        }
        .height('10%')
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor(Color.Black)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Notification/Setting',
      params: {
        'Vue': this.Vue
      }
    })
  }

  onAccept(scanInfo: wifi.WifiScanInfo, psw: string) {
    Logger.info(TAG, ' connectonAccept wifi enter')
    Logger.info(TAG, 'onAccept connect wifi scanInfo ===' + JSON.stringify(scanInfo))
    Logger.info(TAG, 'onAccept connect wifi psw ===' + JSON.stringify(psw))
    try {
      if(self !== null) {
        self.wifiModel.connectNetwork(scanInfo, psw)
      }
    } catch (err) {
      Logger.info(TAG, 'onAccept connect wifi err' + err.message)
    }
  }

  wifiListRefresh() {
    this.wifiDataResource.resetDataArray(this.wifiList)
    this.wifiDataResource.notifyDataReload()
  }
}