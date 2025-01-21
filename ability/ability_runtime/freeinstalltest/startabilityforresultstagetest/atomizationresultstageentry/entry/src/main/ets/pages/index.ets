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

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('同应用不需要检查targetbundlelist名单')
          .fontSize(20)
      }.type(ButtonType.Capsule)
      .margin({top: 20})
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        routePage('pages/sameAppModel')
      })

      Button() {
        Text('StartAbilityForResult')
          .fontSize(20)
      }.type(ButtonType.Capsule)
      .margin({top: 20})
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
    await globalThis.abilityContext.terminateSelfWithResult(
      {
        resultCode: 1,
        want:
        {
          bundleName: "com.example.qianyiyingyong.hmservice",
          abilityName: "MainAbility",
        },
      }
    );
    await globalThis.abilityContext.terminateSelf();
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult END');
  }
}

async function routePage(page) {
  let options = {
    uri: page
  }
  try {
    await router.push(options)
  } catch (err) {
    console.error(`fail callback, code: ${err.code}, msg: ${err.msg}`)
  }
}

