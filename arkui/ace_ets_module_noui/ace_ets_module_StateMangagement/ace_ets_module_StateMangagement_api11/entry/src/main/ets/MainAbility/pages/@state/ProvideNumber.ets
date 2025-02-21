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

interface Num2info {
  number: string | number;
}

class Num2 {
  public pages: number | string;
  constructor(pages: number | string) {
    this.pages = pages;
  }
}

@Component
struct Child_AR {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Ancestors内的@Provide装饰的变量
  @Consume count: number | Object | String | Date | Boolean;

  build() {
    Column({ space: 10 }) {
    }
  }
}


@Entry
@Component
struct Ancestors_AR {
  // @Provide装饰的联合类型count由入口组件Ancestors提供其后代组件
  @Provide count: number | Object | String | Date | Boolean = 0;

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.count)) + " number is " + JSON.stringify(this.count))
        .fontSize(20).margin(10).key('ProvideNumber')
      Text("变量赋值number类型")
      Button('change')
        .onClick(() => {
          this.count = 10;
        })
        .key('state1')

      Text("切换变量赋值Object")
      Button('change')
        .onClick(() => {
          this.count = new Num2(20);
        })
        .key('state2')

      Text("切换变量赋值string")
      Button('change')
        .onClick(() => {
          this.count = { number: '30' } as Num2info;
        })
        .key('state3')

      Text("切换变量赋值Date")
      Button('change')
        .onClick(() => {
          this.count = new Date('2021-08-08');
        })
        .key('state4')

      Text("切换变量赋值boolean")
      Button('change')
        .onClick(() => {
          this.count = true;
        })
        .key('state5')

      Child_AR()
    }.width('100%').margin({top:5})
  }
}