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
class MapClassA {
  public a: MyMap<number, string>;
  constructor(a: MyMap<number, string>) {
    this.a = a;
  }
}


@Observed
export class MyMap<K, V> extends Map<K, V> {

  public name: string;

  constructor(name?: string, args?: [K, V][]) {
    super(args);
    this.name = name ? name: "My Map";
  }

  getName() {
    return this.name;
  }
}

@Entry
@Component
struct ObjectLinkMapNested {
  @State message: MapClassA = new MapClassA(new MyMap("myMap", [[0, "a"], [1, "b"], [3, "c"]]));

  build() {
    Row() {
      Column() {
        Button('init map').id("ObtLinkMap_init")
          .onClick(() =>{
            this.message.a = new MyMap("myMap", [[0, "a"], [1, "b"], [3, "c"]])
          })

        ObjectLinkMapNestedChild({myMap: this.message.a})
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ObjectLinkMapNestedChild {
  @ObjectLink myMap: MyMap<number, string>

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.myMap.entries()), (item: [number, string]) => {
          Text(`${item[0]} ${item[1]}`).fontSize(20).id("ObtLinkMap_value_" + item[1])
          Divider()
        })
        Button('set new one').id("ObtLinkMap_set")
          .onClick(() =>{
            this.myMap.set(4, "d")
        }).margin(10)

        Button('clear').id("ObtLinkMap_clear")
          .onClick(() =>{
            this.myMap.clear()
            if (Array.from(this.myMap.entries())){
               this.myMap.set(0, "K")
            }
        }).margin(10)

        Button('replace the first one').id("ObtLinkMap_replace")
          .onClick(() =>{
            this.myMap.set(0, "aa")
        }).margin(10)

        Button('delete the first one').id("ObtLinkMap_delete")
          .onClick(() =>{
            this.myMap.delete(0)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}