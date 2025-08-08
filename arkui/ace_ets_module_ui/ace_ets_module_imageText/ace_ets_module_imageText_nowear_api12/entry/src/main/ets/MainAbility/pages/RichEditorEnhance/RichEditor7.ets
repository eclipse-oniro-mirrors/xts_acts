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
struct RichEditor7 {
  controller: RichEditorController = new RichEditorController()
  controller1: RichEditorController   = new RichEditorController()
  controller2: RichEditorController   = new RichEditorController()
  @State enterTypeALl: EnterKeyType[] = [ EnterKeyType.Done, EnterKeyType.Go,  EnterKeyType.Search, EnterKeyType.Send, EnterKeyType.Next, EnterKeyType.PREVIOUS, EnterKeyType.NEW_LINE]
  @State enterTypeAllStr: string[] = ['Done', 'Go', 'Search', 'Send', 'Next', 'PREVIOUS', 'NEW_LINE']
  @State enterType: number = 0
  @State enterKey: string = this.enterTypeALl[this.enterType].toString()
  @State IsShowCustomKeyboard: boolean = false
  @State IsCallKeepEditableState: boolean = false
  @State start: number = -1
  @State end: number = -1
  @State content: string = ''
  @State selectCaret: number = 0
  @State counter: string = ''
  @State isSetEnterKeyType: boolean = false
  @State isEditing1: boolean = false
  @State controllerIsEditing1: boolean = false
  @State isEditing2: boolean = false
  @State controllerIsEditing2: boolean = false

  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Grid() {
        ForEach(['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'], (item:string) => {
          GridItem() {
            Button(item + '')
              .hitTestBehavior(HitTestMode.Block)
              .width('10%').onClick(() => {
              let CaretOffset = this.controller.getCaretOffset()
              this.controller.addTextSpan(item + '',
                {
                  offset: CaretOffset
                })
              this.controller.setCaretOffset(CaretOffset + 1)

            })
          }
        })
      }.maxCount(3).columnsGap('1%').rowsGap('1%').padding('1%')
      .borderWidth(1)

      Button('x').onClick(() => {
        this.controller.stopEditing()
      }).id('StopEditing').margin({bottom:30})
    }.backgroundColor(Color.White)
  }

  build() {
    Column() {
      Row(){
        Text('OnEditingChange1:'+this.isEditing1).id('OnEditingChange1').fontSize(10).textAlign(TextAlign.Center)
      }.width('100%')
      Row(){
        Text('IsEditing1:'+this.controllerIsEditing1).id('IsEditing1').fontSize(10).textAlign(TextAlign.Center)
      }.width('100%')
      Column(){
        Text('测试1：').fontWeight(FontWeight.Bold).width('100%').fontSize(10).textAlign(TextAlign.Center)
        Text('      stopEditing').fontWeight(FontWeight.Bold).width('100%').fontSize(10).textAlign(TextAlign.Center)

        RichEditor({ controller: this.controller})
          .width('100%')
          .height('10%')
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Red)
          .customKeyboard(this.CustomKeyboardBuilder())
          .onSelect((value)=>{
            this.start = value.selection[0]
            this.end = value.selection[1]
            this.selectCaret = this.end
          })
          .onEditingChange((isEditing: boolean) => {
            this.isEditing1 = isEditing
            this.controllerIsEditing1 = this.controller.isEditing()
            console.log('Juan Current Editing Status:' + isEditing)
            console.log('Juan this.controller.isEditable():' + this.controller.isEditing())
          })
          .id('RichEditor01')
      }

      Column(){
        Text('测试3：').fontWeight(FontWeight.Bold).width('100%').fontSize(10).textAlign(TextAlign.Center)
        Text('      调用enterKeyType，onSubmit').fontWeight(FontWeight.Bold).width('100%').fontSize(10).textAlign(TextAlign.Center)
        Row(){
          Text('OnEditingChange2:'+this.isEditing2).id('OnEditingChange2').fontSize(10).textAlign(TextAlign.Center)
        }.width('100%')
        Row(){
          Text('IsEditing2:'+this.controllerIsEditing2).id('IsEditing2').fontSize(10).textAlign(TextAlign.Center)
        }.width('100%')

        Row() {
          Button('回车键类型: ' + this.enterTypeAllStr[this.enterType]).id('EnterType')
            .onClick(() => {
              this.enterType++
              if (this.enterType > (this.enterTypeALl.length - 1)) {
                this.enterType = 0
              }
            }).height('5%')

          Button('stopEditing')
            .onClick(() => {
              this.controller2.stopEditing()
            }).key('stopEditing').height('5%')
        }

        Button('isCallKeepEditableState: ' + this.IsCallKeepEditableState)
          .onClick(()=>{
            this.IsCallKeepEditableState = !this.IsCallKeepEditableState
          }).key('isCallKeepEditableState').key('isCallKeepEditableState')
          .id('IsCallKeepEditableState').height('5%')

        Text('onSubmit参数 enterKey：' + this.enterKey)
          .width('100%')
          .fontSize(10)
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('EnterKey')

        RichEditor({ controller: this.controller2 })
          .width('100%')
          .height('10%')
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Red)
          .enterKeyType(this.enterTypeALl[this.enterType])
          .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
            this.enterKey = enterKey.toString();

            if(this.IsCallKeepEditableState) {
              event.keepEditableState();
            }

            console.log('trigger richeditor onsubmit: ' + enterKey);

          })
          .onEditingChange((isEditing: boolean) => {
            this.isEditing2 = isEditing
            this.controllerIsEditing2 = this.controller2.isEditing()
            console.log('Juan Current Editing Status:' + isEditing)
            console.log('Juan this.controller.isEditable():' + this.controller.isEditing())
          })
          .id('RichEditor02')
      }.margin(10)
    }.height('100%')
  }
}