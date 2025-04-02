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

let storage008: LocalStorage = new LocalStorage({"PropA8":1} as Record<string, number>)
storage008['PropA8'] = 47;


@Component
struct SubState8 {
  @State num1: number = 2;

  build() {
    Column() {
      Text('@State:'+ this.num1).id("SubState_text").margin(5)
        .id("SubState1")
        .onClick(() => {
          this.num1 += 1
        })
    }
  }
}

@Component
struct SubProp8 {
  @Prop num1: number;

  build() {
    Column() {
      Text('@Prop:'+ this.num1).id("SubProp_text").margin(5)
        .id("SubProp1")
        .onClick(() => {
          this.num1 += 1
        })
    }
  }
}

@Component
struct SubProvide8 {
  @Provide num1: number = 5;

  build() {
    Column() {
      Text('@Provide:'+ this.num1).id("SubProvide_text").margin(5)
        .id("SubProvide1")
        .onClick(() => {
          this.num1 += 1
        })
    }
  }
}

@Component
struct SubLink8 {
  @Link num1: number;

  build() {
    Column() {
      Text('@Link:'+ this.num1).id("SubLink_text").margin(5)
        .id("SubLink1")
        .onClick(() => {
          this.num1 += 1
        })
    }
  }
}


@Entry(storage008)
@Component
struct CombinationState8 {
  @LocalStorageProp('PropA') num: number = 1

  build() {
    Row() {
      Column({ space: 20 }) {
        Text('@LocalStorageProp支持初始化@State修饰的数据')
        SubState8({num1: this.num})

        Text('@LocalStorageProp支持初始化@Prop修饰的数据')
        SubProp8({num1: this.num})

        Text('@LocalStorageProp支持初始化@Provid修饰的数据')
        SubProvide8({num1: this.num})

        Text('@LocalStorageProp支持初始化@Link修饰的数据')
        SubLink8({num1: this.num})

      }
    }
  }
}