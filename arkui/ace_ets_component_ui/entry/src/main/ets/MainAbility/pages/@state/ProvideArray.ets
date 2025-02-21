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
struct Child_AI {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Ancestors内的@Provide装饰的变量
  @Consume Array: Array<Number> | Array<boolean> | Boolean | Array<Resource>;

  build() {
    Column({ space: 20 }) {




    }
  }
}



@Entry
@Component
struct Ancestors_AI {
  // @Provide装饰的联合类型count由入口组件Ancestors提供其后代组件
  @Provide Array: Array<Number> | Array<boolean> | Boolean | Array<Resource> = [1];


  build() {
    Column() {
      Text("count type of " + JSON.stringify(Common.getType(this.Array)) + " number is " + JSON.stringify(this.Array))
        .fontSize(20).margin(30).key('ProvideArray')

      Text("count type of " + JSON.stringify(Common.getType(this.Array)) + " number is " + getContext().resourceManager.getStringSync($r('app.string.number').id))
        .fontSize(20).margin(30).key('ProvideArrayNew')
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

      Child_AI()
    }.width('100%').margin({top:10})
  }
}