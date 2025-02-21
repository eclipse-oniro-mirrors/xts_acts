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
class StorageB{
  @Track a:number;
  b:number;
  constructor(a:number,b:number) {
    this.a=a
    this.b=b
  }
}
let para1 :Record<string,StorageB>={'PropA':new StorageB(1,2)}
let storage:LocalStorage=new LocalStorage(para1)
let storage1 =LocalStorage.getShared()
let PropB1:StorageB | undefined=storage.get('PropA')
let link2 :SubscribedAbstractProperty<StorageB>=storage.link('PropA')
let prop2 :SubscribedAbstractProperty<StorageB>=storage.prop('PropA')
link2.set(new StorageB(10,20))
prop2.set(new StorageB(100,200))
@Entry(storage)
@Component
struct localTrack {
  @LocalStorageProp('PropA') storageProp2:StorageB=new StorageB(0,0)
  @LocalStorageLink('PropA') storageLink2:StorageB=new StorageB(0,0)
  build() {
    Column() {
      Button("Reset")
        .key("localTrack_reset")
        .onClick(() => {
          this.storageProp2=new StorageB(10,20)
          this.storageLink2=new StorageB(10,20)
        })
      Button('LocalStorageProp:'+`${this.storageProp2.a}`)
        .key('Track_LocalStorageProp')
        .onClick(()=>{
          this.storageProp2.a +=1
        })
      Button('LocalStorageLink:'+`${this.storageLink2.a}`)
        .key('Track_LocalStorageLink')
        .onClick(()=>{
          this.storageLink2.a +=2
        })
    }
    .width('100%')
    .height('100%')
  }
}