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
let storage224: LocalStorage = new LocalStorage({"PropA":1,"PropB":2} as Record<string, number>)


@Entry(storage224)
@Component
struct LocalStoageLinkOne {
  @LocalStorageLink('PropA') storLink1: number = 1
  @LocalStorageLink('PropB') storLink2: number = 10
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  
  @State vae?: number = storage224.get('PropB')
  build(){
    Column({space:15}){
      Button(`Has ${this.text1}`).onClick(()=>{
        this.text1 = `Has1:${storage224.has('PropA')},Has2:${storage224.has('PropP')}`
      }).key('button_has')
      
      Button(`Set ${this.text2}`).onClick(()=>{
        this.text2 = `Set1:${storage224.set('PropA',2)},Set2:${storage224.set('PropP',2)}`
      }).key('button_set')
      
      Button(`setOrCreate ${this.text3}`).onClick(()=>{
        this.text3 = `setOrCreate1:${storage224.setOrCreate('PropA',50)},setOrCreate2:${storage224.setOrCreate('PropP',50)}`
      }).key('button_setOrCreate')
      
      
      Text(`localstorage:${this.vae},storLink2:${this.storLink2}`)
      .key('text_getValue1')
      
      Button(`点击动态更改本地初始值`).onClick(()=>{
        this.storLink2 += 10
        this.vae = storage224.get('PropB')
      }).key('button_changeInitialValue')
      
      Button(`点击更改localstorage值`).onClick(()=>{
        storage224.set('PropB', 666)
        this.vae = storage224.get('PropB')
      }).key('button_changeLocalStorageValue')
      
      
      
    }
  }
}
