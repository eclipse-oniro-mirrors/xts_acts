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
import CommonFunc from '../../../MainAbility/common/Common';

@Component
struct Child_CC {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Ancestors内的@Provide装饰的变量
  @Consume color: undefined | null | ResourceColor;


  build() {
    Column() {
      Text("设置变量color类型pink-->Orange").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = Color.Orange;
        })
        .key('state1')
        .height('5%')

      Text("设置变量number类型Orange-->008000").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = 0x0000ff;
        })
        .key('state2')
        .height('5%')

      Text("设置变量undefined类型pink-->undefined").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = undefined
        })
        .key('state3')
        .height('5%')

      Text("设置变量string类型pink-->'008000'").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = '#FFA52A2A'
        })
        .key('state4')
        .height('5%')

      Text("设置变量string类型pink-->null").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = null
        })
        .key('state5')
        .height('5%')

      Text("设置变量Resource类型pink-->Resource").height('5%')
      Button('change')
        .backgroundColor(this.color)
        .onClick(() => {
          this.color = $r('app.string.color')
        })
        .key('state6')
        .height('5%')
    }
  }
}


@Entry
@Component
struct Ancestors_CC {
  // @Provide装饰的联合类型count由入口组件Ancestors提供其后代组件
  @Provide color: undefined | null | ResourceColor = Color.Pink;
  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.color)) + " number is " + JSON.stringify(this.color))
        .fontSize(9).key('ConsumeColor').height('5%')

      Child_CC()

    }.width('100%')
  }
}