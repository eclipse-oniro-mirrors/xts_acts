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
enum He2{Q = 1, W, E}
class Model2 {
  value: number
  constructor(value: number) {
    this.value = value
  }
}

interface ValuePropTwoType {
  value: number
}


let storage220 = new LocalStorage()

@Entry(storage220)
@Component
struct LocalStoagePropTwo {
  @LocalStorageProp('Prop1') storProp1: Model2 = new Model2(6)
  @LocalStorageProp('Prop2') storProp2: number = 1;
  @LocalStorageProp('Prop3') storProp3: boolean = true
  @LocalStorageProp('Prop4') storProp4: string = 'abc'
  @LocalStorageProp('Prop5') storProp5: He2 = He2.Q
  @LocalStorageProp('Prop6') storProp6: object = { value : 66 } as ValuePropTwoType
  
  @LocalStorageProp('Prop7') storProp7: Array<Model2> = [new Model2(66), new Model2(67)]
  @LocalStorageProp('Prop8') storProp8: Array<number> = [1, 2]
  @LocalStorageProp('Prop9') storProp9: Array<boolean> = [true, false]
  @LocalStorageProp('Prop10') storProp10: Array<string> = ['abc','efd']
  @LocalStorageProp('Prop11') storProp11: Array<He2> = [He2.Q, He2.W]
  @LocalStorageProp('Prop12') storProp12: Array<object> = [{value:66} as ValuePropTwoType, {value:67} as ValuePropTwoType]
  build() {
    Column({ space: 15 }) {
      Text(`Prop1:${JSON.stringify(storage220.get('Prop1'))}, Prop2:${storage220.get('Prop2')}, Prop3:${storage220.get('Prop3')}, Prop4:${storage220.get('Prop4')}, Prop5:${storage220.get('Prop5')}, Prop6:${JSON.stringify(storage220.get('Prop6'))}, Prop7:${JSON.stringify(storage220.get('Prop7'))}, Prop8:${JSON.stringify(storage220.get('Prop8'))}, Prop9:${JSON.stringify(storage220.get('Prop9'))}, Prop10:${JSON.stringify(storage220.get('Prop10'))}, Prop11:${JSON.stringify(storage220.get('Prop11'))}, Prop12:${JSON.stringify(storage220.get('Prop12'))}`)
      .key('text_getValue4')
    }
  }
}