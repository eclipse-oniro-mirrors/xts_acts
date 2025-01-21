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
PersistentStorage.persistProp('aPropA', 42);

@Entry
@Component
struct PersistentStoragePersistProp {
  @State text1: string = ''
  @State text2: string = ''
  @State num1: number = 0
  @State num2: number = 0
  @State num3: number = 0
  @StorageLink('aPropA') aPropA: number = 1
  @StorageLink('aPropB') aPropB: number = 4
  @StorageLink('aPropC') aPropC: number = 8

  build() {
    Row() {
      Column({space:15}) {
        Text().fontSize(50)
        Text('aPropA:'+`${this.aPropA} `+'aPropB:'+`${this.aPropB} `+'aPropC:'+`${this.aPropC} `).fontSize(25)
        // 应用退出时会保存当前结果。重新启动后，会显示上一次的保存结果
        Row({space:10}){
          Button('aPropA:'+`${this.aPropA}`).fontSize(15)
            .onClick(() => {
              this.aPropA += 1;
            })
          Button('aPropB:'+`${this.aPropB}`).fontSize(15)
            .onClick(() => {
              this.aPropB += 1;
            })
          Button('aPropC:'+`${this.aPropC}`).fontSize(15)
            .onClick(() => {
              this.aPropC += 1;
            })
        }

        Button(`PersistProp_B`).onClick(()=>{
          PersistentStorage.persistProp('aPropB', 10);
          let value: number = AppStorage.get('aPropB') as number
          console.info(String(value))
        }).key('button_PersistProp')

        Button(`DeleteProp_B`).onClick(()=>{
          PersistentStorage.deleteProp('aPropB');
          let keys: Array<string> = PersistentStorage.Keys()
        }).key('button_DeleteProp')

        Text(`Keys:`+this.text1).fontSize(15)
          .key('text_button_Keys')
        Button(`Keys`).onClick(()=>{
          let keys: Array<string> = PersistentStorage.Keys()
          this.text1= JSON.stringify(keys)

        }).key('button_Keys')

        Text('keys:'+'aPropA:'+this.num1+','+'highScore:'+this.num2+','+'wightScore:'+this.num3).fontSize(15)
          .key('button_PersistProp_default_keys')
        Button(`PersistProp_default`).onClick(()=>{
          PersistentStorage.persistProps([{ key: 'highScore', defaultValue: '0' }, { key: 'wightScore', defaultValue: '1' }]);
          let value1: number = AppStorage.get('aPropA') as number
          let value2: number = AppStorage.get('highScore') as number
          let value3: number = AppStorage.get('wightScore') as number
          this.num1 = value1
          this.num2 = value2
          this.num3 = value3
          console.info(String(value1))
          console.info(String(value2))
          console.info(String(value3))
        }).key('button_PersistProp_default')
      }
    }
  }
}