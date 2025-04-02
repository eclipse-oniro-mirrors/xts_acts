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

let storage007: LocalStorage = new LocalStorage({"PropA7":47} as Record<string, number>)
storage007['PropA7'] = 47;


@Component
struct SubState7 {
  @State num1: number = 2;

  build() {
    Column() {
      Text('@State:'+ this.num1).id("SubState_text1").margin(5)
    }
  }
}

@Component
struct SubState72 {
  @State num1: number = 2;

  build() {
    Column() {
      Text('@State:'+ this.num1).id("SubState_text2").margin(5)
    }
  }
}

@Component
struct SubLink7 {
  @Link num1: number;

  build() {
    Column() {
      Text('@Link:'+ this.num1).id("SubLink_text1").margin(5)
    }
  }
}

@Component
struct SubLink72 {
  @Link num1: number;

  build() {
    Column() {
      Text('@Link:'+ this.num1).id("SubLink_text2").margin(5)
    }
  }
}

@Component
struct SubProp7 {
  @Prop num1: number = 4;

  build() {
    Column() {
      Text('@Prop:'+ this.num1).id("SubProp_text1").margin(5)
    }
  }
}

@Component
struct SubProp72 {
  @Prop num1: number = 4;

  build() {
    Column() {
      Text('@Prop:'+ this.num1).id("SubProp_text2").margin(5)
    }
  }
}

@Component
struct SubProvide7 {
  @Provide num1: number = 5;

  build() {
    Column() {
      Text('@Provide:'+ this.num1).id("SubProvide_text1").margin(5)
    }
  }
}

@Component
struct SubProvide72 {
  @Provide num1: number = 5;

  build() {
    Column() {
      Text('@Provide:'+ this.num1).id("SubProvide_text2").margin(5)
    }
  }
}

@Entry
@Component
struct CombinationState7_2 {
  @StorageLink('PropA7') num: number = 1
  @StorageProp('PropB7') numB: number = 2


  build() {
    Row() {
      Column({ space: 20 }) {
        Text('@StorageLink和@StorageProp支持初始化如下装饰器修饰的数据')
        Text('支持初始化@State修饰的数据')
        SubState7({num1: this.num})
        SubState72({num1: this.numB})

        Text('支持初始化@Link修饰的数据')
        SubLink7({num1: this.num})
        SubLink72({num1: this.numB})

        Text('支持初始化@Prop修饰的数据')
        SubProp7({num1: this.num})
        SubProp72({num1: this.numB})

        Text('支持初始化@Provide修饰的数据')
        SubProvide7({num1: this.num})
        SubProvide72({num1: this.numB})

      }
    }
  }
}