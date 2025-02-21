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

@Observed
class ClassAA {
  public a: number;

  constructor(a: number) {
    this.a = a;
  }
}
@Observed
class ClassBB {
  public b: number;

  constructor(b: number) {
    this.b = b;
  }
}

@Entry
@Component
struct ObjectLinkNumber {
  @State count: ClassAA | ClassBB | undefined | null = undefined;

  build() {
    Column() {
      ChildObjectLinkNumber({ count: this.count })

      Button('change count to ClassAA')
        .onClick(() => {
          // 赋值为ClassA111111的实例
          this.count = new ClassAA(100)
        }).key('state1')

      Button('change count to ClassBB')
        .onClick(() => {
          // 赋值为ClassA111111的实例
          this.count = new ClassBB(100)
        }).key('state2')

      Button('change count to undefined')
        .onClick(() => {
          // 赋值为undefined
          this.count = undefined
        }).key('state3')

      Button('change count to null')
        .onClick(() => {
          // 赋值为undefined
          this.count = null
        }).key('state4')

    }.width('100%')
  }
}

@Component
struct ChildObjectLinkNumber {
  @ObjectLink count: ClassAA | ClassBB | undefined | null

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.count)) + " number is " + JSON.stringify(this.count))
        .fontSize(20).margin(10).key('objectLinkNumber')

    }.width('100%')
  }
}