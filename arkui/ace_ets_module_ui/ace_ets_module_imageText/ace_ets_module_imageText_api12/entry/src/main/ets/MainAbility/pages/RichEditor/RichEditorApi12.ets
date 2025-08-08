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
struct RichEditorApi12 {
  controller: RichEditorController = new RichEditorController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller2 };
  @State text: string = '';

  textstyle_value1:TextStyle = new TextStyle({fontStyle:1,fontWeight:200,fontColor:Color.Pink})
  mutableStr:MutableStyledString = new MutableStyledString('属性字符串',[
    {start:0,length:7,styledKey:StyledStringKey.FONT,styledValue:this.textstyle_value1}
  ])

  build() {
    Column() {

      RichEditor({controller:this.controller}).onReady(() => {
        this.controller.addTextSpan('aaaaaaaaaa')
      })
      RichEditor(this.options)
      Button('span转属性字符串').onClick((event: ClickEvent) => {
        let change = this.controller.toStyledString({start:0,end:3})
        this.controller2.setStyledString(change)
      }).id('RichEditorApi12_btn1')
      Button('get').onClick((event: ClickEvent) => {
        this.text = JSON.stringify(this.controller2.getLayoutManager().getLineCount())
      }).id('RichEditorApi12_btn2')

      Text(this.text).id('RichEditorApi12_text1')

    }
  }
}