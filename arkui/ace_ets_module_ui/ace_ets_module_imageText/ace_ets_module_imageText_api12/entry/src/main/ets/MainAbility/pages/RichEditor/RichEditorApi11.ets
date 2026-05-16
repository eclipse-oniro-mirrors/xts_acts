/*
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
struct RichEditorApi11 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text: string = '';

  textstyle_value1:TextStyle = new TextStyle({fontStyle:1,fontWeight:200,fontColor:Color.Pink})
  mutableStr:MutableStyledString = new MutableStyledString('属性字符串',[
    {start:0,length:7,styledKey:StyledStringKey.FONT,styledValue:this.textstyle_value1}
  ])
  
  build() {
    Column() {
      
      RichEditor({controller:this.controller})
      Button('属性字符串转span').onClick((event: ClickEvent) => {
        let change = this.controller.fromStyledString(this.mutableStr)
        change.forEach(item => {
          this.text = JSON.stringify(item.spanPosition.spanRange)
        })
      }).id('RichEditorApi11_btn1')

      Text(this.text).id('RichEditorApi11_text1')

    }
  }
}