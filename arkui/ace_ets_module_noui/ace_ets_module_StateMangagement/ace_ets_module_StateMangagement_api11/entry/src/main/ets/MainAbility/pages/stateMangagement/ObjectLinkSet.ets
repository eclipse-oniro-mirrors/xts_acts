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
class SetClassA {
  public a: MySet<number>;

  constructor(a: MySet<number>) {
    this.a = a;
  }
}


@Observed
export class MySet<T> extends Set<T> {
  public name: string;

  constructor(name?: string, args?: T[]) {
    super(args);
    this.name = name ? name : "My Set";
  }

  getName() {
    return this.name;
  }
}

@Entry
@Component
struct ObjectLinkSetNested {
  @State message: SetClassA = new SetClassA(new MySet("Set", [1, 2, 3]));

  build() {
    Row() {
      Column() {
        Button('init set').id("ObtLinkSet_init")
          .onClick(() => {
            this.message.a = new MySet("Set", [1, 2, 3])
          })

        ObjectLinkSetNestedChild({ mySet: this.message.a })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ObjectLinkSetNestedChild {
  @ObjectLink mySet: MySet<number>
  @State st: string = ''

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.mySet.entries()), (item: [number, string]) => {
          Text(`${item}`)
            .fontSize(20)
            .id(`ObtLinkSet_value_${item[0]}`)
          Divider()
        })
        Button('set new one').id("ObtLinkSet_set")
          .onClick(() => {
            this.mySet.add(5)
          })
          .margin(10)

        Button('clear').id("ObtLinkSet_clear")
          .onClick(() => {
            this.mySet.clear()
            if (Array.from(this.mySet.entries())) {
              this.mySet.add(0)
            }
          })
          .margin(10)

        Button('delete the first one')
          .id("ObtLinkSet_delete")
          .onClick(() => {
            this.mySet.delete(0)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}