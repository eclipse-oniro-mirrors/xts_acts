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
import featureAbility from '@ohos.ability.featureAbility'

async function routePage(uri:string) {
  try {
    await router.push({
      uri: uri
    })
  } catch (err) {
    console.error(`fail callback, code: ${err.code}, msg: ${err.msg}`)
  }
}

@Entry
@Component
struct Index {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('next page1')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        routePage('pages/second')
      })

      Button() {
        Text('同应用不需要检查targetbundlelist名单')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        routePage('pages/third')
      })

      Button() {
        Text('StartAbilityForResult')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
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

  async terminateSelfWithResult() {
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult START');
    await featureAbility.terminateSelfWithResult(
      {
        resultCode: 1,
        want:
        {
          bundleName: "com.example.qianyiyingyong.hmservice",
          abilityName: "com.example.qianyiyingyong.MainAbility",
        },
      }
    );
    await featureAbility.terminateSelf();
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult END');
  }

  async aboutToAppear() {
    let permissions = ["ohos.permission.DISTRIBUTED_DATASYNC"];
    featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
      console.info("start requestPermissionsFromUser!!!!")
    })
  }
}