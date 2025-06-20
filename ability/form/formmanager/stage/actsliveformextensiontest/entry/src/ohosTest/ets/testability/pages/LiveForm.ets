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
    this.setBackgroundImage($r('app.media.background'));
  }

  aboutToDisappear(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'LiveForm aboutToDisappear');
  }

  private runAnimation(): void {
    animateTo({
      duration: 3500,
      curve: Curve.Ease
    }, () => {
      this.columnScale = END_SCALE;
      this.columnTranslate = END_TRANSLATE;
      this.columnBackgroundColor = Color.Red;
    })
  }

  private setBackgroundImage(res: Resource): void {
    try {
      this.context?.setBackgroundImage(res)
        .then(() => {
          hilog.info(0x0000, TAG, `setBackgroundImage succeed`);
        })
        .catch((err: BusinessError) => {
          hilog.error(0x0000, TAG, `setBackgroundImage failed, code is ${err?.code}, message is ${err?.message}`);
        });
    } catch (err) {
      hilog.error(0x0000, TAG, `setBackgroundImage failed, code is ${err?.code}, message is ${err?.message}`);
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
          this.runAnimation();
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