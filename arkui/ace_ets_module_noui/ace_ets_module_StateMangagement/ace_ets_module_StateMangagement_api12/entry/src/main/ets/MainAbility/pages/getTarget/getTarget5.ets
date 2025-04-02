/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
class Phone {
  @Track msg: string

  constructor(msg: string) {
    this.msg = msg
  }
}

@Component
struct ChildA {
  @Prop classB: Phone = new Phone('msg')

  build() {
    Column({space: 10}) {
      // 调用裸对象接口，默认值Tom，预期值不变
      Text(UIUtils.getTarget(this.classB).msg).id('useGetTarget5_1')
      // 未调用裸对象接口，默认值Tom，预期值Bob
      Text(this.classB.msg).id('useGetTarget5_2')
      Button('change')
        .onClick(()=>{
          this.classB.msg = 'Bob'
        }).id('button')
    }
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}

@Entry
@Component
struct GetTarget11 {
  @State classB: Phone = new Phone('Tom')

  build() {
    Column() {
      ChildA({classB: this.classB})
    }
  }
}