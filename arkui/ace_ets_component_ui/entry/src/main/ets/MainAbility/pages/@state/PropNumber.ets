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

interface PropNumNum { number: number | string }

class Num3 {
  public pages: number | string;
  constructor(pages: number | string) {
    this.pages = pages;
  }
}
@Component
struct Child_AO {
  @Prop count: number | Object | String | Date | Boolean;

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.count)) + " number is " + JSON.stringify(this.count))
        .fontSize(20).margin(10).key('PropNumber')

      Text("变量赋值number类型")
      Button('change')
        .onClick(() => {
          this.count = 10;
        })
        .key('state1')

      Text("切换变量赋值Object")
      Button('change')
        .onClick(() => {
          this.count = new Num3(20);
        })
        .key('state2')

      Text("切换变量赋值string")
      Button('change')
        .onClick(() => {
          this.count = { number: '30' } as PropNumNum;
        })
        .key('state3')

      Text("切换变量赋值Date")
      Button('change')
        .onClick(() => {
          this.count = new Date('2021-08-08');
        })
        .key('state4')

      Text("切换变量赋值Boolean")
      Button('change')
        .onClick(() => {
          this.count = true;
        })
        .key('state5')


    }.width('100%')
  }
}

@Entry
@Component
struct Library_AO {
  @State count: number | Object | String | Date | Boolean = 0;

  build() {
    Column({ space: 10 }) {
      Child_AO({count: this.count})


    }.width('100%').margin({top:5})
  }
}