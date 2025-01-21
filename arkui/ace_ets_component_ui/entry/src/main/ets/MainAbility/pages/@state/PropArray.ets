/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Common from '../../utils/Common'

@Component
struct Child_AD {
  @Prop Array: Array<Number> | Array<boolean> | Boolean | Array<Resource>


  build() {
    Column() {
      Text("count type of " + JSON.stringify(Common.getType(this.Array)) + " number is " + JSON.stringify(this.Array))
        .fontSize(20).margin(30).key('PropArray')

      Text("count type of " + JSON.stringify(Common.getType(this.Array)) + " number is " + getContext().resourceManager.getStringSync($r('app.string.number').id))
        .fontSize(20).margin(30).key('PropArrayNew')
      Text("设置变量Array<Number>类型[1]-->[10]")
      Button('change')
        .onClick(() => {
          this.Array = [10];
        })
        .key('state1')

      Text("切换变量Array<boolean>类型[1]-->[true]")
      Button('change')
        .onClick(() => {
          this.Array = [true];
        })
        .key('state2')

      Text("切换变量boolean类型[1]-->true")
      Button('change')
        .onClick(() => {
          this.Array = true;
        })
        .key('state3')

      Text("切换变量Array<Resource>类型[1]-->Array<Resource>")
      Button('change')
        .onClick(() => {
          this.Array = [$r('app.string.number')];
        })
        .key('state4')

    }.width('100%')
  }
}

@Entry
@Component
struct Library_AD {
  @State Array: Array<Number> | Array<boolean> | Boolean | Array<Resource> = [1];


  build() {
    Column({ space: 20 }) {
      Child_AD({Array: this.Array})


    }.width('100%').margin({top:10})
  }
}