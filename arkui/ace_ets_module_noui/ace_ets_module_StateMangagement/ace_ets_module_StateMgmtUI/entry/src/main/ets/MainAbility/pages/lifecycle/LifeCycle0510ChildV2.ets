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
import { AppStorageV2 } from '@ohos.arkui.StateManagement'
import router from '@ohos.router'

@ObservedV2
export class LifeClass {
  @Trace public appear: number = 0
  @Trace public built: number = 0
  @Trace public disappear: number = 0
  @Trace public recycle: number = 0
  @Trace public reuse: number = 0
  @Trace public init: number = 0
}

AppStorageV2.connect(LifeClass, () => new LifeClass())

@Entry
@ComponentV2
struct Index {
  @Local isFlag: boolean = true

  build() {
    Column() {
      if (this.isFlag) {
        Child()
      }
      Button('Clear')
        .id('btnChildV2Clear')
        .height('5%')
        .onClick(() => {
          AppStorageV2.remove(LifeClass)
        })
    }
  }
}

@ComponentV2
struct Child {
  build() {
    Column() {
      Row() {
        Text((AppStorageV2.connect(LifeClass)!!.appear + AppStorageV2.connect(LifeClass)!!.built +
        AppStorageV2.connect(LifeClass)!!.disappear + AppStorageV2.connect(LifeClass)!!.recycle +
        AppStorageV2.connect(LifeClass)!!.reuse + AppStorageV2.connect(LifeClass)!!.init).toString())
          .height('5%')
          .id('tvV2Num')
      }

      Button('GoTOV2')
        .id('btnChildV2Go')
        .height('5%')
        .onClick(() => {
          router.pushUrl({ url: 'MainAbility/pages/lifecycle/LifeCycle0510ChildV21' })
        })
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}