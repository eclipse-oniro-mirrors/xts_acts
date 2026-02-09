/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@Entry
@Component
struct MapExample {
  @State lenDemo: Length = 10;
  @State rescourDemo: ResourceColor = Color.Red;
  @State rescourStrDemo: ResourceStr =  $r('app.string.string_1');
  @State nullDemo: null | string  = null;
  @State undefinedDemo: undefined | number  = undefined;

  @State currentStatus: Status = Status.Active;
  @State user: object = [1,2];
  @State person: Person = new Person('Bob', 30);
  @State name: string = 'ww';

  @State age: number = 18;
  @State flag: boolean = true;
  @State point: Point = { x: 0, y: 0 };
  @State list: number[] = [1, 2, 3];
  @State users: object[] = [[1, 2], [3, 4]];

  @State set: Set<number> = new Set([1, 2]);
  @State map: Map<string, number> = new Map([['a', 1]]);
  @State currentDate: Date = new Date();

  @Consume lenDemo2: Length = 10;
  @Consume rescourDemo2: ResourceColor = Color.Red;
  @Consume rescourStrDemo2: ResourceStr =  $r('app.string.string_1');
  @Consume nullDemo2: null | string  = null;
  @Consume undefinedDemo2: undefined | number  = undefined;

  @Consume currentStatus2: Status = Status.Active;
  @Consume user2: object = [1,2];
  @Consume person2: Person = new Person('Bob', 30);
  @Consume name2: string = 'ww';
  @Consume age2: number = 18;
  @Consume flag2: boolean = true;
  @Consume point2: Point = { x: 0, y: 0 };
  @Consume list2: number[] = [1, 2, 3];
  @Consume users2: object[] = [[1, 2], [3, 4]];

  @Consume set2: Set<number> = new Set([1, 2]);
  @Consume map2: Map<string, number> = new Map([['a', 1]]);
  @Consume currentDate2: Date = new Date();
  build() {
    Column() {
      Row() {
        Text(this.lenDemo.toString())
          .height('5%')
          .id('length01')
        Text(this.rescourDemo.toString())
          .height('5%')
          .id('resourceColor01')
        Text(this.rescourStrDemo)
          .height('5%')
          .id('rescourStr01')
        Text(this.nullDemo ? `nullDemo: ${this.nullDemo}` : 'null')
          .height('5%')
          .id('null01')
        Text(this.undefinedDemo ? `undefinedDemo: ${this.undefinedDemo}` : 'undefined')
          .height('5%')
          .id('undefined01')
      }
      Row() {
        Text(this.lenDemo2.toString())
          .height('5%')
          .id('length02')
        Text(this.rescourDemo2.toString())
          .height('5%')
          .id('resourceColor02')
        Text(this.rescourStrDemo2)
          .height('5%')
          .id('rescourStr02')
        Text(this.nullDemo2 ? `nullDemo: ${this.nullDemo2}` : 'null')
          .height('5%')
          .id('null02')
        Text(this.undefinedDemo2 ? `undefinedDemo: ${this.undefinedDemo2}` : 'undefined')
          .height('5%')
          .id('undefined02')
      }
      Row() {
        Text(this.currentStatus.toString())
          .height('5%')
          .id('enum01')
        Text(this.user[0].toString())
          .height('5%')
          .id('object01')
        Text(this.person.name)
          .height('5%')
          .id('class01')
        Text(this.name)
          .height('5%')
          .id('string01')
        Text(this.age.toString())
          .height('5%')
          .id('number01')
        Text(this.flag ? 'true': 'flase')
          .height('5%')
          .id('boolean01')
        Text(this.point.x.toString())
          .height('5%')
          .id('interface01')
        Text(this.list[0].toString())
          .height('5%')
          .id('numberArray01')
        Text(this.users[0][0].toString())
          .height('5%')
          .id('objectArray01')
      }
      Row() {
        Text(this.currentStatus2.toString())
          .height('5%')
          .id('enum02')
        Text(this.user2[0].toString())
          .height('5%')
          .id('object02')
        Text(this.person2.name)
          .height('5%')
          .id('class02')
        Text(this.name2)
          .height('5%')
          .id('string02')
        Text(this.age2.toString())
          .height('5%')
          .id('number02')
        Text(this.flag2 ? 'true': 'flase')
          .height('5%')
          .id('boolean02')
        Text(this.point2.x.toString())
          .height('5%')
          .id('interface02')
        Text(this.list2[0].toString())
          .height('5%')
          .id('numberArray02')
        Text(this.users2[0][0].toString())
          .height('5%')
          .id('objectArray02')
      }
      Row() {
        Text(Array.from(this.set)[0].toString())
          .height('5%')
          .id('set01')
        Text(this.map.get('a')?.toString())
          .height('5%')
          .id('map01')
        Text(Array.from(this.set2)[0].toString())
          .height('5%')
          .id('set02')
        Text(this.map2.get('a')?.toString())
          .height('5%')
          .id('map02')
      }
    }
    .width('100%')
    .padding(10)

  }
}
interface Point {
  x: number;
  y: number;
}
enum Status { Active, Inactive }
@Observed
class Person {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}