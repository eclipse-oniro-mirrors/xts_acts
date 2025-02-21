/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CheckBoxGroup {

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CheckBoxGroup start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear CheckBoxGroup end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("checkBox-Group")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("groupText")

      Row() {
        CheckboxGroup({group : 'checkboxGroup'})
          .selectedColor(0xed6f21)
          .key('CheckboxGroup')
          .onChange((itemName:CheckboxGroupResult) => {
            console.info("TextPicker::dialogResult is" + JSON.stringify(itemName))
          })
        Text('select all').fontSize(20)
        Checkbox({name: 'checkbox1',  group: 'checkboxGroup'})
          .key('Checkbox1')
          .select(true)
          .selectedColor(0xed6f21)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is'+ value)
          })
        Checkbox({name: 'checkbox2',  group: 'checkboxGroup'})
          .key('Checkbox2')
          .select(false)
          .selectedColor(0x39a2db)
          .onChange((value: boolean) => {
            console.info('Checkbox2 change is'+ value)
          })
      }
    }.width("100%").height("100%")
  }
}

