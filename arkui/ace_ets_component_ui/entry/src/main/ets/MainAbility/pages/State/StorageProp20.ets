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
Environment.envProp('Prop20', 10);
@Entry
@Component
struct StorageProp20 {
  @StorageProp('Prop20') storProp1: number = 1
  @StorageProp('PropB') storProp2: number = 4
  @StorageProp('PropC') storProp3: string = 'gg'
  @State num: number = 0
  @State vae: string = ''

  build(){
    Column({space:15}){
      CompStorageProp20({storProp1:this.storProp1,storProp2:$storProp1,storProp3:this.storProp1,num:this.storProp1})

    }
  }
}

@Component
struct CompStorageProp20 {
  @State storProp1 : number = 0
  @Link storProp2 : number
  @Prop storProp3 : number
  @Provide num : number = 0
  build() {
    Column(){
      Text(`State:${this.storProp1}`)
        .key('text_state')
      Text(`Link:${this.storProp2}`)
        .key('text_Link')
      Text(`Prop:${this.storProp3}`)
        .key('text_Prop')
      Text(`Provide:${this.num}`)
        .key('text_Provide')
    }
  }
}