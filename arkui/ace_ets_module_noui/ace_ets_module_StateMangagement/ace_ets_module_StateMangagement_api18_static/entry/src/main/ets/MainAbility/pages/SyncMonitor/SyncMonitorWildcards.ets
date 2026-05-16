'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, ComponentV2, Local, SyncMonitor, IMonitor, Column, Button, ObservedV2, Trace, Divider,
  BorderStyle, Color,Text } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
 
@ObservedV2
export class ClassA {
  @Trace public propA: number = 8;
  @Trace public propB: number = 99;
 
  constructor(a: number, b: number) {
    this.propA = a;
    this.propB = b;
  }
}
 
@ComponentV2
struct SyncMonitorComponentV2Wildcards {
  @Local cls: ClassA = new ClassA(100, 100);
  @Local public num: int = 0;
 
  @SyncMonitor(['cls.*'])
  onClsChanged(m: IMonitor) {
    this.num++
  }
 
  build() {
    Column() {
      Divider()
      Button(`#1 Change propA:${this.cls.propA}-${this.num}`)
        .id('componentV2Button_001')
        .height('5%')
        .onClick(() => {
          this.cls.propA += 1; // 触发onClsChanged
        })
      Button(`#2 Change propB:${this.cls.propB}-${this.num}`)
        .id('componentV2Button_002')
        .height('5%')
        .onClick(() => {
          this.cls.propB += 1; // 触发onClsChanged
        })
      Button(`#3 Assign class object:${this.cls.propB}-${this.num}`)
        .id('componentV2Button_003')
        .height('5%')
        .onClick(() => {
          this.cls = new ClassA(-200, -200); // 触发onClsChanged
        })
    }
    .border({ style: BorderStyle.Solid, width: 2, color: Color.Green })
  }
}
 
 
@ObservedV2
export class Person {
  @Trace public firstName: string;
  @Trace public lastName: string;
 
  constructor(first: string = 'no first', last: string = 'no last') {
    this.firstName = first;
    this.lastName = last;
  }
}
 
@ComponentV2
struct SyncMonitorObservedV2ArrWildcards {
  @Local arrayOfPerson: Person[] =
    [new Person('Adrian'), new Person('Andrew'), new Person('Aaliyah'), new Person('Amir'), new Person('Angel')];
  @Local public num: int = 0;
 
  @SyncMonitor(['arrayOfPerson.*'])
  arrayOfPersonMonitor(monitor: IMonitor) {
    this.num++
  }
 
  build() {
    Column() {
      Button(`#1 arrayOfPerson.push:${this.num}`)
        .id('arrButtonWildcards_001')
        .height('5%')
        .onClick(() => {
          // arrayOfPersonMonitor回调触发
          this.arrayOfPerson.push(new Person('Austin'));
        })
      Button(`#2 arrayOfPerson.splice(0,1,P):${this.num}`)
        .id('arrButtonWildcards_002')
        .height('5%')
        .onClick(() => {
          // arrayOfPersonMonitor回调触发
          this.arrayOfPerson.splice(0, 1, new Person('Addison'));
        })
      Button(`#3 arrayOfPerson.assign new [1]:${this.num}`)
        .id('arrButtonWildcards_003')
        .height('5%')
        .onClick(() => {
          if (this.arrayOfPerson.length > 1) {
            // arrayOfPersonMonitor回调触发
            this.arrayOfPerson[1] = new Person('Andy');
          }
        })
      Button(`#4 arrayOfPerson shift:${this.num}`)
        .id('arrButtonWildcards_004')
        .height('5%')
        .onClick(() => {
          if (this.arrayOfPerson.length > 2) {
            // arrayOfPersonMonitor回调触发
            this.arrayOfPerson.shift();
          }
        })
      Button(`#5 arrayOfPerson length change:${this.num}`)
        .id('arrButtonWildcards_005')
        .height('5%')
        .onClick(() => {
          // arrayOfPersonMonitor回调触发
          this.arrayOfPerson.length = this.arrayOfPerson.length - 1;
        })
      Button(`#6 arrayOfPerson = new Array:${this.num}`)
        .id('arrButtonWildcards_006')
        .height('5%')
        .onClick(() => {
          // arrayOfPersonMonitor回调触发
          this.arrayOfPerson = [new Person('Adrian'), new Person('Andrew')]
        })
      Button(`#7 arrayOfPerson [1] last name:${this.num}`)
        .id('arrButtonWildcards_007')
        .height('5%')
        .onClick(() => {
          if (this.arrayOfPerson.length > 1 && this.arrayOfPerson[1] instanceof Person) {
            // arrayOfPersonMonitor回调不触发
            this.arrayOfPerson[1].lastName += '~'
          }
        })
    }
  }
}
 
@ObservedV2
export class Info1 {
  @Trace public name: string = 'Tom';
  @Trace public age: int = 26;
}
 
@ObservedV2
export class Info {
  public info1: Info1 = new Info1()
  @Trace public num: int = 0;
 
  // name被@Trace装饰，能够监听变化
  @SyncMonitor(['info1.*'])
  onNameChange(monitor: IMonitor): void {
    this.num++
  }
 
}
 
 
@ComponentV2
struct SyncMonitorObservedV2Wildcards {
  info: Info = new Info();
 
  build() {
    Column() {
      Text(`${this.info.info1.name}:${this.info.num}`)
        .id('NameText')
        .height('5%')
      Button('change name')
        .id('observedV2Button_001')
        .onClick(() => {
          this.info.info1.name = 'Jack'; // 能够触发onNameChange方法
        })
 
      Text(`${this.info.info1.age}:${this.info.num}`)
        .id('ageText')
        .height('5%')
      Button('change age')
        .id('observedV2Button_002')
        .onClick(() => {
          this.info.info1.age = 30; // 能够触发onNameChange方法
        })
    }
  }
}
 
@Entry
@ComponentV2
struct SyncMonitorWildcards {
  build() {
    Column() {
      SyncMonitorComponentV2Wildcards();
      SyncMonitorObservedV2ArrWildcards();
      SyncMonitorObservedV2Wildcards();
    }
    .width('100%')
    .height('100%')
  }
}