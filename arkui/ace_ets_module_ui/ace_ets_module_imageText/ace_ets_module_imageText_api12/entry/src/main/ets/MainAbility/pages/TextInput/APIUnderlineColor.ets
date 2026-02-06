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
struct APIUnderlineColor {
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  @State passwordState: boolean = false
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({placeholder:'提示文本内容'}).key('APIUnderlineColorTextInput')
        .showUnderline(true)
        .underlineColor({normal:Color.Orange,typing:'#FF66DD00',error:Color.Red,disable:Color.Gray});


      Text(this.text).key('APIUnderlineColorText')
      Button('get').key('APIUnderlineColorButton')
        .onClick(() => {
          let strJson = getInspectorByKey('APIUnderlineColorTextInput');
          if(JSON.parse(strJson).$attrs.underlineColor) {
            let obj: Record<string, ESObject> = JSON.parse(strJson)
            let underlineColor: Record<string, ESObject> = JSON.parse(obj.$attrs.underlineColor)
            this.text = underlineColor.typing + ''
          } else {
            this.text = 'unknow'
          }
        })
    }.width('100%')
  }
}