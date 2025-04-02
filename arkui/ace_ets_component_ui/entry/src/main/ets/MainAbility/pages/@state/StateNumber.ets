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

class Num1 {
  public pages:number;
  constructor(pages: number) {
    this.pages = pages;
  }
}

@Entry
@Component
struct MyComponent_AL {
  @State  count: number | Object | String | Date | Boolean = 0;

  build() {
    Column({ space: 20 }) {
      Text("count type of " + JSON.stringify(Common.getType(this.count)) + " number is " + JSON.stringify(this.count))
        .fontSize(20).margin(30).key('StateNumber')


      Text("变量赋值number类型")
      Button('change')
        .onClick(() => {
          this.count = 10;
        })
        .key('state1')

      Text("切换变量赋值Object")
      Button('change')
        .onClick(() => {
          this.count = new Num1(20);
        })
        .key('state2')

      Text("切换变量赋值string")
      Button('change')
        .onClick(() => {
          this.count = '30';
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

    }.width('100%').margin({top:10})
  }
}