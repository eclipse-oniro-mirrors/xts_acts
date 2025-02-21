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
//父组件传递对象给子组件的@Param变量，修改父组件的属性值
class RawObject {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}
@ObservedV2
class ObservedObject {
  @Trace name: string;
  constructor(name: string) {
    this.name = name;
  }
}
@Entry
@ComponentV2
struct paramObject {
  @Local rawObject: RawObject = new RawObject('rawObject');
  @Local observedObject: ObservedObject = new ObservedObject('observedObject');
  build() {
    Column({space:10}) {
      Button('change name').id('object_change')
        .onClick(() => {
          this.rawObject.name = 'new rawObject name';
          // ObservedObject的name属性被@Trace装饰
          this.observedObject.name = 'new observedObject name';
        })
      paramObjectChild({
        rawObject: this.rawObject,
        observedObject: this.observedObject
      })
    }
  }
}
@ComponentV2
struct paramObjectChild {
  @Require @Param rawObject: RawObject;
  @Require @Param observedObject: ObservedObject;
  build() {
    Column() {
      Text(`${this.rawObject.name}`).id('object_1')
      Text(`${this.observedObject.name}`).id('object_2')
    }
  }

}