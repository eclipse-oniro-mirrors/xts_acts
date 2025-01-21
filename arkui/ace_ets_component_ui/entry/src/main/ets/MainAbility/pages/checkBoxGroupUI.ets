/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../utils/MessageManager';

@Entry
@Component
struct CheckboxExample {
   @State  selectAll:boolean = true;
   @State  selectedColor:string = "#007DFF";
   @State  message:string = "testclick";
   @State  message2:string = "testclick2";
   messageManager:MessageManager = new MessageManager()
   onPageShow() {
    console.info('Checkbox onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'selectAll') {
          this.selectAll = message.value
      }
      if (message.name == 'selectedColor') {
          this.selectedColor = message.value
      }
      
    }
    this.messageManager.registerCallback(callback)

  }


  build() {
    Scroll() {
      Column() {
        // 全选按钮

        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          CheckboxGroup({ group: 'checkboxGroup' })
            .selectedColor(this.selectedColor)
            .selectAll(this.selectAll)
            .onChange((itemName: CheckboxGroupResult) => {
              console.info("checkbox group content" + JSON.stringify(itemName))
              console.info("checkbox group content" + JSON.stringify(itemName.status))
              console.info("checkbox group content" + JSON.stringify(itemName.name))
              this.message = JSON.stringify(itemName.name);
              this.message2 = JSON.stringify(itemName.status);
            }).key("allck")
          Text('Select All').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
        }
        // 选项1
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .selectedColor('#007DEF')
            .select(false)
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is' + value)
            }).key('cb1')
          Text('Checkbox1').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
        }.margin({ left: 36 })

        // 选项2
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .selectedColor('#007DFF')
            .onChange((value: boolean) => {
              console.info('Checkbox2 change is' + value)
            }).key('cb2')
          Text('Checkbox2').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
        }.margin({ left: 36 })

        // 选项3
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
            .selectedColor('#007DFF')
            .onChange((value: boolean) => {
              console.info('Checkbox3 change is' + value)
            })
          Text('Checkbox3').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
        }.margin({ left: 36 })

        Text(this.message).fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500).margin({left:20,top:20}).key('text1')
        Text(this.message2).fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500).margin({left:20,top:20}).key('text2')

      }
    }
  }
}