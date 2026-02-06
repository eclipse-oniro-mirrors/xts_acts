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
import {
  ComponentAppear,
  ComponentBuilt,
  ComponentDisappear,
  ComponentInit,
  ComponentRecycle,
  ComponentReuse
} from '@ohos.arkui.StateManagement'

let initNum: number = 0

@Entry
@Component
struct LifeCycle0510ChildV11 {
  @State isFlag: boolean = true
  @StorageLink('Built') builtNum: number = 0
  @StorageLink('Appear') appearNum: number = 0
  @StorageLink('Disappear') disappearNum: number = 0

  @ComponentAppear
  componentAppear() {
    this.appearNum += 1
  }

  @ComponentDisappear
  componentDisappear() {
    this.disappearNum += 1
  }

  @ComponentInit
  componentInit() {
    initNum += 1
  }

  @ComponentBuilt
  componentBuilt() {
    this.builtNum += 1
  }

  build() {
    Column() {
      if (this.isFlag) {
        ReusableChild()
          .reuseId('Child')
      }
      Text(initNum.toString())
        .height('5%')
        .id('tvV11Init')
      Button('Click')
        .height('5%')
        .id('btnChildV11IsVisible')
        .onClick(() => {
          this.isFlag = !this.isFlag
        })
    }
  }
}

@Reusable
@Component
struct ReusableChild {
  @StorageLink('Recycle') recycleNum: number = 0
  @StorageLink('Reuse') reuseNum: number = 0

  @ComponentRecycle
  componentRecycle() {
    this.recycleNum += 1
  }

  @ComponentReuse
  componentReuse() {
    this.reuseNum += 1
  }

  build() {
    Text('ReusableChild')
      .height('5%')
  }
}