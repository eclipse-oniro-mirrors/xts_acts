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
@Observed
class ClassA006 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}


@Component
struct PropObjectLinkFather {
  @ObjectLink class_A: ClassA006;

  build() {
    Column() {
      Text('@ObjectLink支持被@ObjectLink修饰的数据初始化')
      PropObjectLink6({class_A: this.class_A})
    }
  }
}

@Component
struct ObjectLinkConsume {
  @Consume class_C: ClassA006;

  build() {
    Column() {
      // @ObjectLink支持被@Consume修饰的数据初始化
      PropObjectLink6({class_A: this.class_C})
    }.margin(5)
  }
}

@Component
struct LinkObjectLink {
  @Link class_A: ClassA006;

  build() {
    Column() {
      // @ObjectLink支持被@Link修饰的数据初始化
      PropObjectLink6({class_A: this.class_A})
    }.margin(5)
  }
}

@Component
struct PropObjectLink6 {
  @ObjectLink class_A: ClassA006;

  build() {
    Column() {
      Text('PropObjectLink:' + this.class_A.value).width("100%").margin(5)
        .key("PropObjectLink" + this.class_A.value)
        .onClick(() => {
          this.class_A.value += 1
        })
    }
  }
}

@Entry
@Component
struct CombinationState6 {
  @State class_A: ClassA006 = new ClassA006(1)
  @State class_B: ClassA006 = new ClassA006(2)
  @Provide class_C: ClassA006 = new ClassA006(3)
  @State class_E: ClassA006 = new ClassA006(5)

  build() {
    Row() {
      Column({ space: 20 }) {
        Text('@ObjectLink支持被@State修饰的数据初始化')
        PropObjectLink6({class_A: this.class_A})

        Text('@ObjectLink支持被@Link修饰的数据初始化')
        LinkObjectLink({class_A: $class_B})

        Text('@ObjectLink支持被@Provide修饰的数据初始化')
        PropObjectLink6({class_A: this.class_C})

        Text('@ObjectLink支持被@Consume修饰的数据初始化')
        ObjectLinkConsume()

        Text('@ObjectLink支持被@ObjectLink修饰的数据初始化')
        PropObjectLinkFather({class_A: this.class_E})
      }
    }
  }
}