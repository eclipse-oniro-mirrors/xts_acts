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
class VTwoToVOneClass0070 {
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
@ComponentV2
struct VTwoToVOne0070 {
  @Local stateInfo: VTwoToVOneClass0070 =
    UIUtils.enableV2Compatibility(UIUtils.makeV1Observed(new VTwoToVOneClass0070(10, 'HelloParent')))
  @Local propInfo: VTwoToVOneClass0070 =
    UIUtils.enableV2Compatibility(UIUtils.makeV1Observed(new VTwoToVOneClass0070(10, 'HelloParent')))
  @Local provideInfo: VTwoToVOneClass0070 =
    UIUtils.enableV2Compatibility(UIUtils.makeV1Observed(new VTwoToVOneClass0070(10, 'HelloParent')))
  @Local objectInfo: VTwoToVOneClass0070 =
    UIUtils.enableV2Compatibility(UIUtils.makeV1Observed(new VTwoToVOneClass0070(10, 'HelloParent')))

  build() {
    Column() {
      Text(this.stateInfo.name)
        .id('tvParentState0070')
        .height('5%')
      Text(this.propInfo.name)
        .id('tvParentProp0070')
        .height('5%')
      Text(this.provideInfo.name)
        .id('tvParentProvide0070')
        .height('5%')
      Text(this.objectInfo.name)
        .id('tvParentOL0070')
        .height('5%')
      Button('Click')
        .id('btnParent0070')
        .height('5%')
        .onClick(() => {
          this.stateInfo.name = 'ParentArkUI'
          this.propInfo.name = 'ParentArkUI'
          this.provideInfo.name = 'ParentArkUI'
          this.objectInfo.name = 'ParentArkUI'
        })
      ChildVTwoToVOne0070({
        stateInfo: this.stateInfo,
        propInfo: this.propInfo,
        provideInfo: this.provideInfo,
        objectInfo: this.objectInfo
      })
    }
  }
}

@Component
struct ChildVTwoToVOne0070 {
  @State stateInfo: VTwoToVOneClass0070 = new VTwoToVOneClass0070(10, 'HelloChild')
  @Prop @Require propInfo: VTwoToVOneClass0070
  @Provide provideInfo: VTwoToVOneClass0070 = new VTwoToVOneClass0070(10, 'HelloChild')
  @ObjectLink objectInfo: VTwoToVOneClass0070

  build() {
    Column() {
      Text(this.stateInfo.name)
        .id('tvChildState0070')
        .height('5%')
      Text(this.propInfo.name)
        .id('tvChildProp0070')
        .height('5%')
      Text(this.provideInfo.name)
        .id('tvChildProvide0070')
        .height('5%')
      Text(this.objectInfo.name)
        .id('tvChildOL0070')
        .height('5%')
      Button('Click')
        .id('btnChild0070')
        .height('5%')
        .onClick(() => {
          this.stateInfo.name = 'ChildArkUI'
          this.propInfo.name = 'ChildArkUI'
          this.provideInfo.name = 'ChildArkUI'
          this.objectInfo.name = 'ChildArkUI'
        })
    }
  }
}