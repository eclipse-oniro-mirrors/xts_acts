/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router'
import hilog from '@ohos.hilog'

AppStorage.setOrCreate('Appear', 0)
AppStorage.setOrCreate('Built', 0)
AppStorage.setOrCreate('Disappear', 0)
AppStorage.setOrCreate('Recycle', 0)
AppStorage.setOrCreate('Reuse', 0)

@Entry
@Component
struct LifeCycle0510ChildV1 {
  @State isFlag: boolean = true

  build() {
    Column() {
      if (this.isFlag) {
        Child()
      }
      Button('Clear')
        .id('btnChildV1Clear')
        .height('5%')
        .onClick(() => {
          let isClear = AppStorage.clear()
          hilog.info(0x0000, 'IsClear', JSON.stringify(isClear));
        })
      Button('isVisible')
        .id('btnChildV1IsVisible')
        .height('5%')
        .onClick(() => {
          this.isFlag = !this.isFlag
        })
    }
  }
}

@Component
struct Child {
  @StorageLink('Appear') appearNum: number = -1
  @StorageLink('Built') builtNum: number = -1
  @StorageLink('Disappear') disappearNum: number = -1
  @StorageLink('Recycle') recycleNum: number = -1
  @StorageLink('Reuse') reuseNum: number = -1

  build() {
    Column() {
      Row() {
        Text((this.appearNum + this.builtNum + this.disappearNum + this.recycleNum +
        this.reuseNum).toString())
          .height('5%')
          .id('tvV1Num')
      }

      Button('GoTOV1')
        .id('btnChildV1Go')
        .height('5%')
        .onClick(() => {
          router.pushUrl({ url: 'MainAbility/pages/lifecycle/LifeCycle0510ChildV11' })
        })
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}