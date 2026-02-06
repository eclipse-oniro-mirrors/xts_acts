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

@Entry
@Component
struct MyComponent_AZ {
  @State  hight: ResourceStr | Length = 10;

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.hight)) + " number is " + JSON.stringify(this.hight))
        .fontSize(9).key('StateHight').height('5%')
      Text("设置变量number类型10-->100").height('5%')
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = 7
        })
        .key('StateHeight1')

      Text("设置变量string类型10-->'200'").height('5%')
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = '8'
        })
        .key('StateHeight2')

      Text("设置变量Resource类型10-->Resource").height('5%')
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = $r('app.string.number_9')
        })
        .key('StateHeight3')

    }.width('100%')
  }
}