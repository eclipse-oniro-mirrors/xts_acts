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
@ObservedV2
export class ObservedObject {
  @Trace name: string;
  @Trace age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}
@Entry
@ComponentV2
struct Page7 {
  @Provider('1') varObject: ObservedObject = new ObservedObject('Jack', 24)
  @Provider('2') varOnceObject: ObservedObject = new ObservedObject('Tom', 25);
  @Monitor('varObject.name', 'varObject.age')
  onNameChanged(monitor: IMonitor) {
    monitor.dirty.forEach((path: string)=>{
      console.log(`Provider path: ${path} change to ${monitor.value(path)?.now}`)
    })
  }

  @Monitor('varOnceObject.name', 'varOnceObject.age')
  onNameChanged2(monitor: IMonitor) {
    monitor.dirty.forEach((path: string)=>{
      console.log(`Provider path: ${path} change to ${monitor.value(path)?.now}`)
    })
  }
  build() {
    Row() {
      Column() {
        Button(`Parent change varObject property`).onClick(()=>{this.varObject.name+='0'}).id('button1')
        Button(`Parent change varOnceObject property`).onClick(()=>{this.varOnceObject.name+='0'}).id('button2')
        Button(`Parent change varOnceObject whole`).onClick(()=>{this.varOnceObject=new ObservedObject('Lucy',18)}).id('button3')

        Text(`varObject name: ${this.varObject.name} age: ${this.varObject.age}`).id('text1')
        Text(`varOnceObject name: ${this.varOnceObject.name} age: ${this.varOnceObject.age}`).id('text2')


        ParamOnceChild()


      }
      .width('100%')
    }
    .height('100%')
  }
}
@ComponentV2
struct ParamOnceChild {

  @Consumer('1') varObject: ObservedObject = new ObservedObject('', 0)
  @Consumer('2') varOnceObject: ObservedObject = new ObservedObject('', 1);

  @Monitor('varObject.name', 'varObject.age')
  onNameChanged(monitor: IMonitor) {
    monitor.dirty.forEach((path: string)=>{
      console.log(`Consumer path: ${path} change to ${monitor.value(path)?.now}`)
    })
  }

  @Monitor('varOnceObject.name', 'varOnceObject.age')
  onNameChanged2(monitor: IMonitor) {
    monitor.dirty.forEach((path: string)=>{
      console.log(`Consumer path: ${path} change to ${monitor.value(path)?.now}`)
    })
  }
  build() {
    Column() {
      Text('Param Child')
      Text(`varObject name: ${this.varObject.name} age: ${this.varObject.age}`).id('text3')
      Text(`varOnceObject name: ${this.varOnceObject.name} age: ${this.varOnceObject.age}`).id('text4')
      // 更改属性能刷新用的是@Trace对属性的观测能力，而不是@Param
      Button(`Child change varObject Property`).onClick(()=>{this.varObject.name+='1'}).id('button4')
      Button(`Child change varOnceObject Property`).onClick(()=>{this.varOnceObject.name+='1'}).id('button5')
    }
    .borderWidth(2)
    .borderColor(Color.Red)
  }
}