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
  ComponentReuse,
  AppStorageV2
} from '@ohos.arkui.StateManagement';
import { LifeClass } from './LifeCycle0510ChildV2';

@Entry
@ComponentV2
struct LifeCycle0510ChildV21 {
  @Local isFlag: boolean = true

  @ComponentAppear
  componentAppear() {
    AppStorageV2.connect(LifeClass)!!.appear += 1
  }

  @ComponentDisappear
  componentDisappear() {
    AppStorageV2.connect(LifeClass)!!.disappear += 1
  }

  @ComponentInit
  componentInit() {
    AppStorageV2.connect(LifeClass)!!.init += 1
  }

  @ComponentBuilt
  componentBuilt() {
    AppStorageV2.connect(LifeClass)!!.built += 1
  }

  build() {
    Column() {
      if (this.isFlag) {
        ReusableV2Child()
          .reuse({ reuseId: () => 'Child' })
      }
      Button('isVisible')
        .id('btnChildV22IsVisible')
        .height('5%')
        .onClick(() => {
          this.isFlag = !this.isFlag
        })
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Child {
  @ComponentRecycle
  componentRecycle() {
    AppStorageV2.connect(LifeClass)!!.recycle += 1
  }

  @ComponentReuse
  componentReuse() {
    AppStorageV2.connect(LifeClass)!!.reuse += 1
  }

  build() {
    Text('ReusableV2Child')
      .height('5%')
  }
}