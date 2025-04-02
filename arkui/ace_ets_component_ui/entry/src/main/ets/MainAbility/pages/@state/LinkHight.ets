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
struct Child_CJ {
  @Link hight: ResourceStr | Length;

  build() {
    Column({ space: 20 }) {

      Text("设置变量number类型50-->100")
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = 100
        })
        .key('LinkHeight1')

      Text("设置变量string类型50-->'200'")
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = '200'
        })
        .key('LinkHeight2')

      Text("设置变量Resource类型50-->Resource")
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = $r('app.string.number')
        })
        .key('LinkHeight3')

    }.width('100%').margin({top:10})
  }
}

@Entry
@Component
struct Index_CJ {
  @State hight: ResourceStr | Length = 50;

  build() {
    Column() {
      Text("count type of " + JSON.stringify(Common.getType(this.hight)) + " number is " + JSON.stringify(this.hight))
        .fontSize(20).margin(30).key('LinkHight')
      Child_CJ({hight: this.hight})

    }
  }
}