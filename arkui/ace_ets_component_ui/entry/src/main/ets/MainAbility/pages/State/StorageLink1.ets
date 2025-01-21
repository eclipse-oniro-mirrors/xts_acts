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
AppStorage.clear()

enum ABC{A= 1,B=2,C=3}
class Model{
  value:string

  constructor(value:string) {
    this.value = value
  }
}
interface ObjectLink1 {
  name: string
  age?: number
}

AppStorage.setOrCreate('Prop1', 47);
AppStorage.setOrCreate('Prop2', 'aaa');
AppStorage.setOrCreate('Prop3', false);
AppStorage.setOrCreate('Prop4', ABC.A);
AppStorage.setOrCreate('Prop5', {value:'Title:Hello World'});
AppStorage.setOrCreate('Prop6',  { name: 'zs',age:12,sex:'男'});
AppStorage.setOrCreate('Prop7', ['zs','ls']);
AppStorage.setOrCreate('Prop8', [1,2]);
AppStorage.setOrCreate('Prop9', [true,false]);
AppStorage.setOrCreate('Prop10', [{value:'hello world'},{value:'hello music'}]);
AppStorage.setOrCreate('Prop11', [{name:'zs'},{name:'ls'}]);
AppStorage.setOrCreate('Prop12', [ABC.A,ABC.B]);

@Entry
@Component
struct StorageLink1 {
  @StorageLink('Prop1') son1: number = 1;
  @StorageLink('Prop2') son2: string = 'aaa';
  @StorageLink('Prop3') son3: Boolean = false;
  @StorageLink('Prop4') son4: ABC = ABC.A;
  @StorageLink('Prop5') son5: Model = new Model('Title:Hello World')
  @StorageLink('Prop6') son6: Object = { name: 'zs',age:12  } as ObjectLink1
  @StorageLink('Prop7') son7: Array<string> = ['zs','ls']
  @StorageLink('Prop8') son8: Array<number> = [1,2]
  @StorageLink('Prop9') son9: Array<boolean> = [true,false]
  @StorageLink('Prop10') son10: Array<Model> = [new Model('hello world'), new Model('hello music')]
  @StorageLink('Prop11') son11: Array<Object> = [{name:'zs'},{name:'ls'}] as ObjectLink1[]
  @StorageLink('Prop12') son12: Array<ABC> = [ABC.A,ABC.B]

  @State num: number|undefined = 0
  @State string: string|undefined = 'aaa'
  @State boolean: boolean|undefined = false
  @State enu: ABC|undefined = ABC.B
  @State class: Model|undefined = new Model('Title:Hello World')
  @State obj: Object|undefined = { name: 'zs',age:12 } as ObjectLink1
  @State strArray: Array<string>|undefined = ['zs','ls']
  @State numArray: Array<number>|undefined = [1,2]
  @State boolArray: Array<boolean>|undefined = [true,false]
  @State classArray: Array<Model>|undefined = [new Model('hello world'), new Model('hello music')]
  @State objArray: Array<Object>|undefined = [{name:'zs'},{name:'ls'}] as ObjectLink1[]
  @State menuArray: Array<ABC>|undefined = [ABC.A,ABC.B]


  build() {
    Column({ space: 5 }) {
      Button(`num: ${this.num}`).margin(3).width("100%")
        .key("button_son1")
        .onClick(() => {
          // AppStorage.set('PropA', this.num)
          this.son1 = 11111
          this.num = AppStorage.get<number>('Prop1');
        })

      Button(`string: ${this.string}`).margin(3).width("100%")
        .key("button_son2")
        .onClick(() => {
          this.son2 = 'sss'
          this.string = AppStorage.get<string>('Prop2');
        })

      Button(`boolean: ${this.boolean}`).margin(3).width("100%")
        .key("button_son3")
        .onClick(() => {
          this.son3 = true
          this.boolean = AppStorage.get<boolean>('Prop3');
        })

      Button(`enu: ${this.enu}`).margin(3).width("100%")
        .key("button_son4")
        .onClick(() => {
          this.son4 = ABC.C
          this.enu = AppStorage.get<ABC>('Prop4');
        })

      Button(`class: ${this.class?.value}`).margin(3).width("100%")
        .key("button_son5")
        .onClick(() => {
          this.son5 = new Model('Title:Hello C')
          this.class = AppStorage.get<Model>('Prop5');
        })

      Button(`obj: ${JSON.stringify(this.obj)}`).margin(3).width("100%")
        .key("button_son6")
        .onClick(() => {
          this.son6 ={name:'ls',age:13} as ObjectLink1
          this.obj = AppStorage.get<Object>('Prop6')
        })

      Button(`strArray: ${this.strArray}`).margin(3).width("100%")
        .key("button_son7")
        .onClick(() => {
          this.son7 = ['ls','zs']
          this.strArray = AppStorage.get<Array<string>>('Prop7')
        })

      Button(`numArray: ${this.numArray}`).margin(3).width("100%")
        .key("button_son8")
        .onClick(() => {
          this.son8 = [2,3]
          this.numArray = AppStorage.get<Array<number>>('Prop8')
        })

      Button(`boolArray: ${this.boolArray}`).margin(3).width("100%")
        .key("button_son9")
        .onClick(() => {
          this.son9 = [false,true]
          this.boolArray = AppStorage.get<Array<boolean>>('Prop9')
        })

      Button(`classArray: ${JSON.stringify(this.classArray)}`).margin(3).width("100%")
        .key("button_son10")
        .onClick(() => {
          this.son10 = [new Model('hello world'), new Model('hello C')]
          this.classArray = AppStorage.get<Array<Model>>('Prop10')
        })

      Button(`objArray: ${JSON.stringify(this.objArray)}`).margin(3).width("100%")
        .key("button_son11")
        .onClick(() => {
          this.son11 = [{name:'ls'},{name:'zs'}] as ObjectLink1[]
          this.objArray = AppStorage.get<Array<Object>>('Prop11')
        })

      Button(`menuArray: ${this.menuArray}`).margin(3).width("100%")
        .key("button_son12")
        .onClick(() => {
          this.son12 = [ABC.B,ABC.C]
          this.menuArray = AppStorage.get<Array<ABC>>('Prop12')
        })

    }
  }
}