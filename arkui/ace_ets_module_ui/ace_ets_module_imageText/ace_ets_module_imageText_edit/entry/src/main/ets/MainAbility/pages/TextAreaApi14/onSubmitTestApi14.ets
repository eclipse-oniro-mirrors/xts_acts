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
struct onSubmitTestPage {
  @State searchText :string = ''
  @State searchEventText :string = ''
  @State enterKeyType:EnterKeyType = 0
  @State textAreaEventText:string = ''
  @State isCallKeepEditableState :boolean = false
  @State textAreaIsEditing :boolean = false
  @State searchIsEditing :boolean = false
  textAreaController:TextAreaController = new TextAreaController()
  searchController:SearchController = new SearchController()

  @Builder
  
  build() {
    Column() {
      Column(){
        Text(this.searchText)
          .height('10%')
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('searchText')
        Text(this.searchEventText)
          .height('10%')
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('event')
        Text(this.searchIsEditing+'')
          .height('10%')
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('searchIsEditing')
        Search({controller:this.searchController})
          .height('10%')
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Red)
          .enterKeyType(EnterKeyType.Send)
          .onSubmit((searchContent: string, event: SubmitEvent) => {
            this.searchText = searchContent
            this.searchEventText = event.text
            console.log('trigger search onsubmit: '+searchContent );
            console.log('trigger event onsubmit: '+event.text );
            if(this.isCallKeepEditableState) {
              event.keepEditableState();
            }
          })
          .onEditChange((isEditing: boolean) => {
            this.searchIsEditing = isEditing
          })
          .id('Search')
      }
      Row(){
          Button('isCallKeepEditableState:'+this.isCallKeepEditableState).onClick(()=>{
            this.isCallKeepEditableState = !this.isCallKeepEditableState
          }).id('changeIsCallKeepEditableState')
          Button('stopEditBtn').onClick(()=>{
            this.textAreaController.stopEditing()
            this.searchController.stopEditing()
          }).id('stopEditBtn')
        }.height('5%')
      Column(){
        Text(this.enterKeyType+'')
          .height('10%')
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('enterKeyType')
        Text(this.textAreaEventText)
          .height('10%')
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('TextAreaevent')
        Text(this.textAreaIsEditing+'')
          .height('10%')
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .id('TextAreaIsEdit')
        TextArea({controller:this.textAreaController})
          .width('100%')
          .height('10%')
          .fontSize(10)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Red)
          .enterKeyType(EnterKeyType.Go)
          .onSubmit((enterKeyType: EnterKeyType, event: SubmitEvent) => {
            this.enterKeyType = enterKeyType
            this.textAreaEventText = event.text
            if(this.isCallKeepEditableState) {
              event.keepEditableState();
            }
            console.log('trigger textArea onsubmit: '+enterKeyType );
            console.log('trigger event onsubmit: '+event.text );

          })
          .onEditChange((isEditing: boolean) => {
            this.textAreaIsEditing = isEditing
          })
          .id('TextArea_onSubmit')
      }
    }.height('100%')
  }
}