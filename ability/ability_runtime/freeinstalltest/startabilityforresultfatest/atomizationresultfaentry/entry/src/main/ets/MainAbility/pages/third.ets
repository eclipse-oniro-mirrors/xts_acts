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

import router from '@system.router';
import featureAbility from '@ohos.ability.featureAbility';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import RemoteDeviceModel from '../model/getRemoteDeviceModel';
import bundleManager from '@ohos.bundle';
import freeInstall from '@ohos.bundle.freeInstall';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import ability from '@ohos.ability.ability';
import common from '@ohos.app.ability.common';

const BUNDLE_NAME = 'com.example.qianyiyingyong.hmservice';
const ABILITY_NAME = 'com.example.qianyiyingyong.MainAbility';
const ABILITY_NAME1 = 'com.example.hm2.MainAbility';
const ABILITY_NAME2 = 'com.example.hm3.MainAbility';

let remoteDeviceId = '';
let remoteDeviceModel: RemoteDeviceModel;

@Entry
@Component
struct Third {
  private content: string = "Third Page"
  private contextText: string= '';
  private localDeviceId: string= '';
  private tipsMsg = '请输入对端的deviceId';
  private isOn = false;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold);
      Button() {
        Text('back to index')
          .fontSize(20)
          .fontWeight(FontWeight.Bold);
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        router.back();
      });
      Row() {
        Text('关闭是startAbility，打开是startAbilityForResult：')
          .fontSize(20)
          .fontWeight(FontWeight.Bold);

        Toggle({ type: ToggleType.Switch, isOn: this.isOn })
          .width($r('app.float.wh_value_50'))
          .height($r('app.float.wh_value_40'))
          .onChange((isOn) => {
            console.info('startAbility fAStartAbilityPromise isOn：' + isOn);
            this.isOn = isOn;
            console.info('startAbility fAStartAbilityPromise this.isOn：' + this.isOn);
          });
      }
      .margin({ right: $r('app.float.wh_value_15') })
      .align(Alignment.End);
      TextInput({ placeholder: '请输入deviceId', text: this.contextText })
        .placeholderColor(Color.Blue)
        .placeholderFont({
          size: $r('app.float.wh_value_20'),
          weight: 2,
          family: "sans-serif",
          style: FontStyle.Normal
        })
        .caretColor(Color.Blue)
        .height($r('app.float.wh_value_70'))
        .backgroundColor(Color.White)
        .type(InputType.Normal)
        .width('100%')
        .fontStyle(FontStyle.Italic)
        .margin({ left: $r('app.float.wh_value_15'), right: $r('app.float.wh_value_15') })
        .onChange((value: string) => {
          this.contextText = value;
        });

      Text('fAStartAbilityPromiseSameBundleName001 本设备，本应用不同AbilityName')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(Color.Grey)
        .onClick(() => {
          let str: ability.StartAbilityParameter = {
            'want': {
              'bundleName': BUNDLE_NAME,
              'abilityName': ABILITY_NAME1,
              'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
          };
          if (this.isOn) {
            this.fAStartAbilityForResultPromise('fAStartAbilityPromiseSameBundleName001', str);
          } else {
            this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleName001', str);
          }
        });

      Text('fAStartAbilityPromiseSameBundleName005 entry覆盖安装')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(Color.Grey)
        .onClick(() => {
          let str: ability.StartAbilityParameter = {
            'want': {
              'bundleName': BUNDLE_NAME,
              'abilityName': ABILITY_NAME,
              'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
          };
          this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleName005', str);
        });

      Text('fAStartAbilityPromiseSameBundleName006 在免安装更新的时候需先设置updateModuleUpgradeFlag')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(Color.Grey)
        .onClick(() => {
          this.updateModuleUpgradeFlag('fAStartAbilityPromiseSameBundleName006','entry');
        });

      Text('fAStartAbilityPromiseSameBundleNameKSB002 跨设备,同应用不同AbilityName')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(Color.Grey)
        .onClick(() => {
          if ('' === remoteDeviceId && '' === this.contextText) {
            this.tips(this.tipsMsg);
            return;
          }
          let str: ability.StartAbilityParameter = {
            'want': {
              'deviceId': '' === this.contextText ? remoteDeviceId : this.contextText,
              'bundleName': BUNDLE_NAME,
              'abilityName': ABILITY_NAME1,
              'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
          };
          if (this.isOn) {
            this.fAStartAbilityForResultPromise('fAStartAbilityPromiseSameBundleNameKSB002', str);
          } else {
            this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleNameKSB002', str);
          }
        });

      Text('fAStartAbilityPromiseSameBundleNameKSB003 跨设备，同应用，对端FA的visable为false无法拉起')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(Color.Grey)
        .onClick(() => {
          if ('' === remoteDeviceId && '' === this.contextText) {
            this.tips(this.tipsMsg);
            return;
          }
          let str: ability.StartAbilityParameter = {
            'want': {
              'deviceId': '' === this.contextText ? remoteDeviceId : this.contextText,
              'bundleName': BUNDLE_NAME,
              'abilityName': ABILITY_NAME2,
              'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
          };
          if (this.isOn) {
            this.fAStartAbilityForResultPromise('fAStartAbilityPromiseSameBundleNameKSB003', str);
          } else {
            this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleNameKSB003', str);
          }
        });

      Text('fAStartAbilityPromiseSameBundleName004 跨设备，同应用不同AbilityName,无跨设备权限（拉起应用或被拉起应用）')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(Color.Grey)
        .onClick(() => {
          let str: ability.StartAbilityParameter = {
            'want': {
              'bundleName': BUNDLE_NAME,
              'abilityName': ABILITY_NAME1,
              'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
          };
          if (this.isOn) {
            this.fAStartAbilityForResultPromise('fAStartAbilityPromiseSameBundleName004', str);
          } else {
            this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleName004', str);
          }
        });
    }
    .width('100%')
    .height('100%')
  }

  async updateModuleUpgradeFlag(tag:string, type1:string) {
    console.info(tag + ' startAbility fAStartAbilityPromise START' + JSON.stringify(type1));
    await freeInstall.setHapModuleUpgradeFlag("com.example.qianyiyingyong.hmservice", type1, 1);
    console.info(tag + ' startAbility fAStartAbilityPromise END');
  }

  async fAStartAbilityPromise(tag:string, str:ability.StartAbilityParameter) {
    console.info(tag + ' startAbility fAStartAbilityPromise START' + JSON.stringify(str));
    let code:BusinessError|null = null;
    await featureAbility.startAbility(str)
      .then((data) => {
        console.info(tag + ' startAbility Operation successful. Promise Data: ' + JSON.stringify(data))
      }).catch((error:BusinessError) => {
        console.info(tag + ' startAbility Operation failed. Promise Cause: ' + JSON.stringify(error));
        code = error;
      })
    console.info(tag + ' startAbility Operation code Promise: ' + JSON.stringify(code));
    if (!code) {
      this.tips('成功');
    } else {
      this.tips('错误码：' + JSON.stringify(code));
    }
    console.info(tag + ' startAbility fAStartAbilityPromise END');
  }

  async fAStartAbilityCallBack(tag:string, str:ability.StartAbilityParameter) {
    let code:BusinessError|null = null;
    console.info(tag + 'startAbility fAStartAbilityCallBack START' + JSON.stringify(str));
    featureAbility.startAbility(str, (err, data) => {
      if (err) {
        console.error(tag + ' Operation failed. CallBack Cause:' + JSON.stringify(err));
        code = err;
      }
      if (!code) {
        this.tips('成功');
      } else {
        this.tips('错误码：' + JSON.stringify(code));
      }
      console.info('Operation successful. CallBack Data: ' + JSON.stringify(data))
    });
    console.info(tag + 'startAbility fAStartAbilityCallBack END');
  }

  async fAStartAbilityForResultPromise(tag:string, str:ability.StartAbilityParameter) {
    console.info(tag + ' fAStartAbilityForResultPromise START' + JSON.stringify(str));
    let newData:BusinessError|null = null;
    await featureAbility.startAbilityForResult(str)
      .then((data) => {
        this.tips('成功');
        console.info(tag + ' fAStartAbilityForResultPromise Operation successful. Promise Data: ' + JSON.stringify(data))
      }).catch((error:BusinessError) => {
        console.info(tag + ' fAStartAbilityForResultPromise Operation failed. Promise Cause: ' + JSON.stringify(error));
        newData = error;
        this.tips('失败');
      })
    console.info(tag + ' fAStartAbilityForResultPromise Operation newData Promise: ' + JSON.stringify(newData));
    console.info(tag + ' fAStartAbilityForResultPromise fAStartAbilityPromise END');
  }

  async fAStartAbilityForResultCallBack(tag:string, str:ability.StartAbilityParameter) {
    console.info(tag + 'fAStartAbilityForResultCallBack START' + JSON.stringify(str));
    featureAbility.startAbilityForResult(str, (err, data) => {
      console.info(tag + 'fAStartAbilityForResultCallBack Operation CallBack Data: ' + JSON.stringify(data))
      if (err) {
        this.tips('失败');
        console.info(tag + 'fAStartAbilityForResultCallBack Operation CallBack err:' + JSON.stringify(err));
        return;
      }
      this.tips('成功');
    });
    console.info(tag + 'fAStartAbilityForResultCallBack END');
  }

  tips(msg:string) {
    Prompt.showToast({
      message: msg,
      duration: 2000,
      bottom: '150px'
    });
  }

  onBackPress() {
    console.log('[startAbility] get device onBackPress in');
    this.contextText = '';
    console.log('[startAbility] get device onBackPress out');
  }

  aboutToAppear(): void {
    console.info('[startAbility] aboutToAppear in');
    remoteDeviceModel = new RemoteDeviceModel;
    if (remoteDeviceModel) {
      remoteDeviceModel.registerDeviceListCallback();
    }
    console.info('[startAbility] aboutToAppear end');
  }

  onPageShow(): void{
    console.info('[startAbility] onPageShow in');
    let numDevices = remoteDeviceModel.deviceList.length;
    if (numDevices === 0) {
      this.tips('onStartRemoteAbility no device found')
      return;
    }
    remoteDeviceId = remoteDeviceModel.deviceList[0].deviceId;
    console.info('[startAbility] onPageShow deviceId is ' + remoteDeviceId);
  }

  aboutToDisappear() {
    console.info('[startAbility] aboutToDisappear in');
    remoteDeviceModel.unregisterDeviceListCallback();
    console.info('[startAbility] aboutToDisappear out');
  }
}