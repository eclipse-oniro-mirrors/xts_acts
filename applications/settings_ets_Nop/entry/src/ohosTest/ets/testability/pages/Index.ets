/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import settings from '@ohos.settings';
import { BusinessError } from '@ohos.base';


@Entry
@Component
struct Index {
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  async onPageShow() {
    const context: Context = getContext(this)
    settings.setValue(context, settings.display.SCREEN_BRIGHTNESS_STATUS, '100', (err, data) => {
      this.text1 = err.code + ''
    })
    try {
      await settings.setValue(context, settings.display.SCREEN_BRIGHTNESS_STATUS, '100')
    } catch (err) {
      this.text2 = err.code + ''
    }
    settings.setValue(context, settings.display.SCREEN_BRIGHTNESS_STATUS, '100', settings.domainName.USER_SECURITY)
      .catch((err: BusinessError) => {
        this.text3 = err.code + ''
      })

  }
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }
  @State message: string = 'Hello World'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .key('settingsId')
        Text(this.text1)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .key('settingsId1')
        Text(this.text2)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .key('settingsId2')
        Text(this.text3)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .key('settingsId3')
        Button() {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(()=>{
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}