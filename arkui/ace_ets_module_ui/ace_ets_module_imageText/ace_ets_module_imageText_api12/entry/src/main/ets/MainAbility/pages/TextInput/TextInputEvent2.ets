/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct TextInputEvent2 {
  @State insertValue: string = ''
  @State insertValue2: string = ''
  @State insertValue3: string = ''
  @State insertValue4: string = ''
  @State insertValue5: string = ''
  @State insertValue6: string = ''
  @State type: InputType = InputType.Normal
  @State textIndent: number = 0
  @State style: TextInputStyle = TextInputStyle.Default
  @State textOverFlow: TextOverflow = TextOverflow.None
  @State text: string = '0'





  build() {
    Column() {
      Text(this.insertValue).key('TextInputEvent2Text')
      Text(this.insertValue2).key('TextInputEvent2Text2')
      Text(this.insertValue3).key('TextInputEvent2Text3')
      Text(this.insertValue4).key('TextInputEvent2Text4')
      Text(this.insertValue5).key('TextInputEvent2Text5')
      Text(this.insertValue6).key('TextInputEvent2Text6')

      Row() {
        TextInput()
          .height(60)
          .width(100)
          .onWillInsert((info: InsertValue) => {
            this.insertValue += '0'
            return true;
          })
          .onDidInsert((info: InsertValue) => {
            this.insertValue += '1'
          })
          .onWillDelete((info: DeleteValue) => {
            this.insertValue += '2'
            return true;
          })
          .onDidDelete((info: DeleteValue) => {
            this.insertValue += '3'
            this.insertValue2 = info.deleteOffset + ''
          })
          .key('TextInput2Event')

        TextInput({ text: '0' })
          .height(60)
          .width(100)
          .onWillInsert((info: InsertValue) => {
            this.insertValue = ''
            return false;
          })
          .onDidInsert((info: InsertValue) => {
            this.insertValue = '1'
          })
          .onWillDelete((info: DeleteValue) => {
            this.insertValue2 = '0'
            return true;
          })
          .onDidDelete((info: DeleteValue) => {
            this.insertValue2 += '1'
          })
          .key('TextInput2Event2')
      }

      Row() {
        TextInput({ text: '0' })
          .height(60)
          .width(100)
          .onWillInsert((info: InsertValue) => {
            this.insertValue3 = '0'
            return true;
          })
          .onDidInsert((info: InsertValue) => {
            this.insertValue3 += '1'
          })
          .onWillDelete((info: DeleteValue) => {
            this.insertValue4 = '0'
            return false;
          })
          .onDidDelete((info: DeleteValue) => {
            this.insertValue4 = '1'
          })
          .key('TextInput2Event3')

        TextInput({ text: '0' })
          .height(60)
          .width(100)
          .onWillInsert((info: InsertValue) => {
            this.insertValue3 = '0'
            return false;
          })
          .onDidInsert((info: InsertValue) => {
            this.insertValue3 = '1'
          })
          .onWillDelete((info: DeleteValue) => {
            this.insertValue4 = '0'
            return false;
          })
          .onDidDelete((info: DeleteValue) => {
            this.insertValue4 = '1'
          })
          .key('TextInput2Event4')
      }

      Row() {
        TextInput({ text: this.text })
          .height(60)
          .width(100)
          .type(this.type)
          .textIndent(this.textIndent)
          .style(this.style)
          .textOverflow(this.textOverFlow)
          .onWillInsert((info: InsertValue) => {
            this.insertValue5 = 'onWillInsert'
            return false;
          })
          .key('TextInput2Event5')

        TextInput({ text: this.text })
          .height(60)
          .width(100)
          .inputFilter('[a-z]', (e) => {
            console.log(JSON.stringify(e))
          })
          .onWillInsert((info: InsertValue) => {
            this.insertValue5 = 'onWillInsert'
            return false;
          })
          .key('TextInput2Event6')
      }


      Row () {
        Button('change')
          .key('TextInput2EventBt')
          .onClick((event: ClickEvent) => {
            this.type = InputType.PhoneNumber
            this.textIndent = 10
            this.style = TextInputStyle.Inline
            this.textOverFlow = TextOverflow.Clip
          })
        Button('change')
          .key('TextInput2EventBt2')
          .onClick((event: ClickEvent) => {
            this.text = 'text'
          })
      }
    }
    .height('100%')
  }
}