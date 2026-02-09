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

interface LinkModelLinkData {
  value: string
}
class LinkModel implements LinkModelLinkData {
  value: string = ''
  
  constructor(value: string) {
    this.value = value
  }
}

enum KFCLD{A=1,B,C}
@Entry
@Component
struct parData_Link {
  @State numA: number = 0
  @State text: string = 'hello'
  @State flag: boolean = true
  @State enum: KFCLD = KFCLD.A
  @State class: LinkModel = { value: 'Hello World' } as LinkModelLinkData
  @State strArray: Array<string> = ['First','Second','Third']
  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      
      sonData_Link({message: $text, numB: $numA, boolean: $flag, enu: $enum, class: $class, strArray: $strArray})
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct sonData_Link{
  @Link numB: number
  @Link message: string
  @Link boolean: boolean
  @Link enu: KFCLD
  @Link class: LinkModel
  @Link strArray : Array<string>
  
  
  build(){
    Column(){
      Text('string: ' + this.message).key("link_str")
        .fontSize(9)
        .height('5%')
      Button('Click to change str')
        .height('5%')
        .key(("strBtn_link"))
        .onClick(() => {
          this.message = "harmony";
        })
      
      Text('number: ' + this.numB.toString()).key(("link_num"))
        .height('5%')
        .fontSize(9)
      Button('Click to change num')
        .height('5%')
        .key(("numBtn_link"))
        .onClick(()=>{
          this.numB++;
        })
      
      Text('boolean: ' + this.boolean.toString()).key(("link_bon"))
        .height('5%')
        .fontSize(9)
      Button('Click to change bool')
        .height('5%')
        .key(("bonBtn_link"))
        .onClick(() => {
          this.boolean = false;
        })
      
      Text('enum: ' + this.enu.toString()).key(("link_enum"))
        .height('5%')
        .fontSize(9)
      Button('Click to change enum')
        .height('5%')
        .key(("enumBtn_link"))
      .onClick(()=>{
        this.enu = KFCLD.B
      })
      
      Text('class: ' + this.class.value).key(("link_cla"))
        .height('5%')
        .fontSize(9)
      Button('Click to change class')
        .height('5%')
        .key(("claBtn_link"))
        .onClick(()=>{
          this.class.value = 'Hi ArkUI'
        })
      
      Text('array: ' + this.strArray).key(("link_strArr"))
        .height('5%')
        .fontSize(9)
      Button('Click to change strArray')
        .height('5%')
        .key(("sArrBtn_link"))
        .onClick(()=>{
          this.strArray = ['A','B','C']
        })
    }
  }
}