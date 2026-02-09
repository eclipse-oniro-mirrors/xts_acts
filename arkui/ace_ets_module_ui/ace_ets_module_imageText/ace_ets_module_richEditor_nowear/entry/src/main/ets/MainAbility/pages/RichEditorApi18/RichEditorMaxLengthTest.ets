/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct RichEditorMaxLengthTest {
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  controller1: RichEditorController = new RichEditorController()
  @State maxLengthIndex:number =0
  @State maxLengthList:(number|undefined)[]=[-1,5,undefined,7.2]
  build() {
    Column() {
      Row(){
        Button('setMaxLength1').onClick(()=>{
          this.maxLengthIndex =1
        }).id('setMaxLength1')
        Button('setMaxLength2').onClick(()=>{
          this.maxLengthIndex =2
        }).id('setMaxLength2')
        Button('setMaxLength3').onClick(()=>{
          this.maxLengthIndex =3
        }).id('setMaxLength3')
      }
      Row() {
        Button('获取富文本内容')
          .id('getRichTextContent')
          .onClick(() => {
            this.controller1.getSpans({
              start: 0,
            }).forEach(item => {
              if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
              } else {
                if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                }else {
                  AppStorage.setOrCreate('RichEditorMaxLength',(item as RichEditorTextSpanResult).value)
                  console.log(''+(item as RichEditorTextSpanResult).value)
                }
              }
            })
          })
      }
      RichEditor({ controller: this.controller1 })
        .width('95%')
        .margin(10)
        .height(60)
        .maxLength(this.maxLengthList[this.maxLengthIndex])
        .backgroundColor('rgb(240,250,255)')
        .id('MaxLengthRichText')
    }
  }
}