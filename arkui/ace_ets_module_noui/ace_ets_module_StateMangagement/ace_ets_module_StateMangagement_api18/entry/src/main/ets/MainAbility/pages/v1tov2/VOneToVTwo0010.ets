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
import { UIUtils } from '@ohos.arkui.StateManagement'

@Observed
class VOneToVTwoClass0010 {
  private _count: number

  public set count(value: number) {
    this._count = value
  }

  public get count(): number {
    return this._count
  }

  private _name: string

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  constructor(count: number, name: string) {
    this._count = count
    this._name = name
  }
}

@Entry
@Component
struct VOneToVTwoV10010 {
  @State info: VOneToVTwoClass0010 = new VOneToVTwoClass0010(10, 'Hello')

  build() {
    Column() {
      Text(this.info.name)
        .id('tvParent0010')
        .height('5%')
      ChildVOneToVTwoV10010({ info: UIUtils.enableV2Compatibility(this.info) })
      Button('ParentClick')
        .id('btnParent0010')
        .height('5%')
        .onClick(() => {
          this.info.name = 'ParentArkUI'
        })
    }
  }
}

@ComponentV2
struct ChildVOneToVTwoV10010 {
  @Param @Require info: VOneToVTwoClass0010

  build() {
    Column() {
      Text(this.info.name)
        .id('tvChild0010')
        .height('5%')
      Button('ChildClick')
        .id('btnChild0010')
        .height('5%')
        .onClick(() => {
          this.info.name = 'ChildArkUI'
        })
    }
  }
}