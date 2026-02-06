/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { BusinessError } from '@kit.BasicServicesKit';
import LiveFormExtensionContext from 'application/LiveFormExtensionContext';

const TAG = 'LiveFormExtAbility';
const END_SCALE: number = 0.3;
const END_TRANSLATE: number = 50;
let storage = LocalStorage.getShared();

@Entry(storage)
@Component
struct LiveForm {
  private context: LiveFormExtensionContext | undefined = storage?.get<LiveFormExtensionContext>('context');
  private flag: boolean = true;
  @State columnScale: number = 1.0;
  @State columnTranslate: number = 0.0;
  @State columnBackgroundColor: Color = Color.Blue;

  aboutToAppear(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'LiveForm aboutToAppear');
  }

  aboutToDisappear(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'LiveForm aboutToDisappear');
  }

  private startAbilityByLiveForm(): void {
    try {
      this.context?.startAbilityByLiveForm({
        bundleName: 'com.acts.liveformextensiontest',
        abilityName: 'TestAbility'
    })
      .then(() => {
        hilog.info(0x0000, TAG, `startAbilityByLiveForm succeed`);
      })
      .catch((err: BusinessError) => {
        hilog.error(0x0000, TAG,
          `startAbilityByLiveForm failed, code is ${err?.code}, message is ${err?.message}`);
      });
    } catch (e) {
      hilog.error(0x0000, TAG, `startAbilityByLiveForm failed: ${e}`);
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column()
        .width(158)
        .height(158)
        .backgroundColor(Color.Green)
        .scale({
          x: this.columnScale,
          y: this.columnScale
        })
        .translate({
          y: this.columnTranslate
        })
        .onAppear(() => {
          this.startAbilityByLiveForm();
        })
    }
    .border({
      color: Color.Green,
      width: 5
    })
    .width('100%')
    .height('100%')
  }
}