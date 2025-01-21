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
let storage111 = new LocalStorage()


@Entry(storage111)
@Component
struct LocalStoagePropFour {
  @LocalStorageProp('PropA') storProp1: number = 1
  @State vae: string|undefined = storage111.get('PropA') + ""

  build(){
    Column({space:15}){

      Text(`localstorage:${this.vae},storProp1:${this.storProp1}`)
        .key('text_getValue3')

      Button(`点击动态更改本地初始值`).onClick(()=>{
        this.storProp1 += 10
        this.vae = storage111.get('PropA') + ""
      }).key('button_changeInitialValue')

      Button(`点击更改localstorage值`).onClick(()=>{
        storage111.set('PropA', 666)
        this.vae = storage111.get('PropA') + ""
      }).key('button_changeLocalStorageValue')

      ChildComp({storProp1:this.storProp1,storProp2:$storProp1,storProp3:this.storProp1,num:this.storProp1})

    }
  }
}

@Component
struct ChildComp {
  @State storProp1 : number = 0
  @Link storProp2 : number
  @Prop storProp3 : number = 0
  @Provide num : number = 0
  build() {
    Column(){
      Text(`State:${this.storProp1},Link:${this.storProp2},Prop:${this.storProp3},Provide:${this.num}`)
        .key('text_state')
    }
  }
}