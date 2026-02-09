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
class StorageA{
  @Track a:number;
  b:number;
  constructor(a:number,b:number) {
    this.a=a
    this.b=b
  }
}
AppStorage.setOrCreate('PropA',new StorageA(1,2))
let PropA1:StorageA | undefined=AppStorage.get('PropA')
let link1 :SubscribedAbstractProperty<StorageA>=AppStorage.link('PropA')
let prop1 :SubscribedAbstractProperty<StorageA>=AppStorage.prop('PropA')
link1.set(new StorageA(10,20))
prop1.set(new StorageA(100,200))
@Entry
@Component
struct storageTrack {
  @StorageProp('PropA') storageProp2:StorageA=new StorageA(0,0)
  @StorageLink('PropA') storageLink2:StorageA=new StorageA(0,0)
  build() {
    Column() {
      Button("Reset").height('5%')
        .key("storageTrack_reset")
        .onClick(() => {
          this.storageProp2=new StorageA(10,20)
          this.storageLink2=new StorageA(10,20)
        })
      Button('storageProp:'+`${this.storageProp2.a}`)
        .height('5%')
        .key('Track_storageProp')
        .onClick(()=>{
          this.storageProp2.a +=1
        })
      Button('storageLink:'+`${this.storageLink2.a}`)
        .height('5%')
        .key('Track_storageLink')
        .onClick(()=>{
          this.storageLink2.a +=2
        })
    }
    .height('100%')
    .width('100%')
  }
}

