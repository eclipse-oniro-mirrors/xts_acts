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
import prompt from '@system.prompt'
@Entry
@Component
struct menuPolicySHOWExample {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller }
  @State start: number = 0
  @State end: number = 0
  @State menuPolicySHOWValue: string = 'menuPolicy SHOW'
  @State style_iii: RichEditorLayoutStyle = {}
  
  build() {
    Column(){
      Scroll(){
        Column({space: 1}){
          Row() {
            Button('+text').id("menuPolicySHOWText").onClick((event: ClickEvent) => {
              let CareOffset = this.controller.getCaretOffset()
              this.controller.addTextSpan("richEditor添加文本", {
                style: this.controller.getTypingStyle(),
                offset: CareOffset
              })
            })
            
            Button('+image').onClick((event: ClickEvent) => {
              let CareOffset = this.controller.getCaretOffset()
              this.controller.addImageSpan($r('app.media.icon'), {
                offset: CareOffset,
                imageStyle: { size: [80, 80], verticalAlign: ImageSpanAlignment.BOTTOM, layoutStyle: this.style_iii},
                gesture: { onLongPress: (event) => {
                  prompt.showToast({ message: "change", duration: 1000 })
                } }
              })
            })
          }
          
          RichEditor(this.options).id("menuPolicySHOW").width(300).height(300).padding(30).align(Alignment.TopStart).direction(Direction.Ltr)
            .margin(10).border({width:2}).backgroundColor(Color.White).placeholder("这是RichEditor")
            .onSelect((value)=>{
              this.start = value.selection[0]
              this.end = value.selection[1]
            })
            .gesture(
              LongPressGesture({duration: 400})
                .onAction((event) => {
                  this.menuPolicySHOWValue = "menuPolicy SHOW success"
                  this.controller.setSelection(-1, -1, {menuPolicy: 2})
                })
            )

          Text(this.menuPolicySHOWValue).margin(30).id("menuPolicySHOWValue")
        }
      }
    }
  }
}