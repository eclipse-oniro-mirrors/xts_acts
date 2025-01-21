/*
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
import wantConstant from '@ohos.ability.wantConstant'
import bundleManager from '@ohos.bundle';
import Prompt from '@system.prompt';

const BUNDLE_NAME = 'com.example.qianyiyingyong.hmservice';
const ABILITY_NAME1 = 'hnm2MainAbility';

@Entry
@Component
struct Index {

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button() {
        Text('fAStartAbilityPromiseSameBundleName1 本设备，feature覆盖安装')
          .fontSize($r('app.float.font_28'))
          .width('100%')
          .fontColor(Color.White)
          .align(Alignment.Center)
          .margin({ left: $r('app.float.wh_value_15'), right: $r('app.float.wh_value_15') })
      }
      .backgroundColor('#0D9FFB')
      .height($r('app.float.wh_value_60'))
      .margin({
        left: $r('app.float.wh_value_15'),
        right: $r('app.float.wh_value_15'),
        top: $r('app.float.wh_value_15')
      })
      .onClick(() => {
        var str = {
          'bundleName': BUNDLE_NAME,
          'abilityName': ABILITY_NAME1,
          'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND
        };
        this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleName1', str);
      })

      Button() {
        Text('fAStartAbilityPromiseSameBundleName006 在免安装更新的时候需先设置updateModuleUpgradeFlag')
          .fontSize($r('app.float.font_28'))
          .width('100%')
          .fontColor(Color.White)
          .align(Alignment.Center)
          .margin({ left: $r('app.float.wh_value_15'), right: $r('app.float.wh_value_15') })
      }
      .backgroundColor('#0D9FFB')
      .margin({left: $r('app.float.wh_value_15'),
        right: $r('app.float.wh_value_15'),
        top: $r('app.float.wh_value_15')
      })
      .onClick(() => {
        var str = {
          'bundleName': BUNDLE_NAME,
          'abilityName': ABILITY_NAME1,
          'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND
        };
        this.updateModuleUpgradeFlag('fAStartAbilityPromiseSameBundleName006','feature');
      })

      Button() {
        Text('StartAbilityForResult')
          .fontSize(25)
          .fontColor(Color.White)
          .margin({ left: $r('app.float.wh_value_30'), right: $r('app.float.wh_value_30') })
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        this.terminateSelfWithResult();
      })
    }
    .width('100%')
    .height('100%')
  }

  async updateModuleUpgradeFlag(tag, type1) {
    console.info(tag + ' startAbility fAStartAbilityPromise START' + JSON.stringify(type1));
//    await bundleManager.updateModuleUpgradeFlag("com.example.qianyiyingyong.hmservice", type1, true);
    console.info(tag + ' startAbility fAStartAbilityPromise END');
  }

  async terminateSelfWithResult() {
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult START');
    await globalThis.abilityContext.terminateSelfWithResult(
      {
        resultCode: 1,
        want:
        {
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME1,
        },
      }
    );
    await globalThis.abilityContext.terminateSelf();
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult END');
  }

  async fAStartAbilityPromise(tag, str) {
    console.info(tag + ' startAbility fAStartAbilityPromise START' + JSON.stringify(str));
    let code;
    await globalThis.abilityContext.startAbility(str)
      .then((data) => {
        console.info(tag + ' startAbility Operation successful. Promise Data: ' + JSON.stringify(data))
        code = data;
      }).catch((error) => {
        console.info(tag + ' startAbility Operation failed. Promise Cause: ' + JSON.stringify(error));
        code = error;
      })
    console.info(tag + ' startAbility Operation code Promise: ' + JSON.stringify(code));
    if (code === 0) {
      this.tips('成功');
    } else {
      this.tips('错误码：' + code.code);
    }
    console.info(tag + ' startAbility fAStartAbilityPromise END');
  }

  tips(msg) {
    Prompt.showToast({
      message: msg,
      duration: 2000,
      bottom: '150px'
    });
  }
}