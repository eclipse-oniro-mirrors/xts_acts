/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { AppStorageV2Sample } from './AppStorageV2Sample'
import { AppStorageV2 } from '@ohos.arkui.StateManagement'
import router from '@ohos.router'

@Entry
@ComponentV2
struct AppStorageV20010 {
  @Local sample: AppStorageV2Sample = AppStorageV2.connect(AppStorageV2Sample, () => new AppStorageV2Sample())!
  @Local keys: Set<string> = new Set()
  @Local age: number = 0
  @Local widthNum: number = 0

  aboutToAppear(): void {
    this.keys.clear()
    for (let index = 0; index < AppStorageV2.keys().length; index++) {
      this.keys.add(AppStorageV2.keys()[index])
    }
    this.age = this.sample.age
    this.widthNum = this.sample.width
  }

  build() {
    Column() {
      Button('Goto Page2')
        .id('btnGotoPage2')
        .onClick(() => {
          router.pushUrl({ url: 'MainAbility/pages/appstoragev2/AppStorageV2Page2' })
        })
      Button('Page1 connect the key Sample')
        .id('btnPage1Connect')
        .onClick(() => {
          AppStorageV2.connect(AppStorageV2Sample, 'AppStorageV2Sample', () => new AppStorageV2Sample())!
          this.keys.clear()
          for (let index = 0; index < AppStorageV2.keys().length; index++) {
            this.keys.add(AppStorageV2.keys()[index])
          }
        })
      Button('Page1 remove the key Sample')
        .id('btnPage1Remove')
        .onClick(() => {
          AppStorageV2.remove(AppStorageV2Sample)

          this.keys.clear()
          for (let index = 0; index < AppStorageV2.keys().length; index++) {
            this.keys.add(AppStorageV2.keys()[index])
          }
        })

      Button('Clear Create keys')
        .id('btnPage1ClearKeys')
        .onClick(()=>{
          if (AppStorageV2.keys().includes('AppStorageV2Sample')) {
            AppStorageV2.remove('AppStorageV2Sample')
          }
        })

      Text(this.sample.age.toString())
        .id('tvPage1Age')
        .fontSize(9)
        .onClick(() => {
          AppStorageV2.connect(AppStorageV2Sample)!.age++
        })
      Text(this.sample.width.toString())
        .id('tvPage1Width')
        .fontSize(9)
        .onClick(() => {
          AppStorageV2.connect(AppStorageV2Sample)!.width++
        })
      Text(`keys: ${Array.from(this.keys.values())}`)
        .id('tvKeys')
        .fontSize(9)
    }
  }
}