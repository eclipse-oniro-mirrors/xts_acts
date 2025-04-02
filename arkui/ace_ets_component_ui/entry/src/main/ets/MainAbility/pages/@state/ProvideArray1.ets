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
struct Child_AU {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Ancestors内的@Provide装饰的变量
  @Consume Array1: Date | Array<Length> | Array<Object>
  build() {
    Column({ space: 20 }) {


    }
  }
}



@Entry
@Component
struct Ancestors_AU {
  // @Provide装饰的联合类型count由入口组件Ancestors提供其后代组件
  @Provide Array1: Date | Array<Length> | Array<Object> = [1];

  build() {
    Column() {
      Text("count type of " + JSON.stringify(Common.getType(this.Array1)) + " number is " + JSON.stringify(this.Array1))
        .fontSize(20).margin(30).key('ProvideArray1')

      Text("count type of " + JSON.stringify(Common.getType(this.Array1)) + " number is " + getContext().resourceManager.getStringSync($r('app.string.number').id))
        .fontSize(20).margin(30).key('ProvideArray1New')


      Text("设置变量Array<Length>类型[1]-->[10]")
      Button('change')
        .onClick(() => {
          this.Array1 = [10];
        })
        .key('state5')

      Text("切换变量Date类型[1]-->new Date('2021-08-08')")
      Button('change')
        .onClick(() => {
          this.Array1 = new Date('2021-08-08');
        })
        .key('state6')

      Text("切换变量Array<String>类型[1]-->['20']")
      Button('change')
        .onClick(() => {
          this.Array1 = ['20'];
        })
        .key('state7')

      Text("切换变量Array<Object>类型[1]-->[{number: 30}]")
      Button('change')
        .onClick(() => {
          this.Array1 = [{number: 30}];
        })
        .key('state8')

      Text("切换变量Array<Resource>类型[1]-->Array<Resource>")
      Button('change')
        .onClick(() => {
          this.Array1 = [$r('app.string.number')];
        })
        .key('state9')

      Child_AU()
    }.width('100%').margin({top:10})
  }
}