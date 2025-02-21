/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct onSubmitTest {
  @State searchText :string = ''
  @State searchEventText :string = ''
  @State enterKeyType:EnterKeyType = 0
  @State textAreaEventText:string = ''
  @State isCallKeepEditableState :boolean = false
  @State textAreaIsEditing :boolean = false
  @State searchIsEditing :boolean = false

  @Builder

  build() {
    Column() {
      Column(){
        Text(this.enterKeyType+'')
          .width('100%')
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .margin(10)
          .id('enterKeyType')
        Text(this.textAreaEventText)
          .width('100%')
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .margin(10)
          .id('TextAreaevent')
        Text(this.textAreaIsEditing+'')
          .width('100%')
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .margin(10)
          .id('TextAreaIsEdit')
        TextArea()
          .width('100%')
          .height(50)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Red)
          .enterKeyType(EnterKeyType.Done)
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
          .id('TextArea')
      }.margin(10)
      Column(){
        Text(this.searchText)
          .width('100%')
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .margin(10)
          .id('searchText')
        Text(this.searchEventText)
          .width('100%')
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .margin(10)
          .id('event')
        Text(this.searchIsEditing+'')
          .width('100%')
          .padding(5)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Blue)
          .margin(10)
          .id('searchIsEditing')
        Search()
          .width('100%')
          .height(50)
          .border({ width: 1 })
          .borderWidth(1)
          .borderColor(Color.Red)
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
      }.margin(10)
      Button('isCallKeepEditableState:'+this.isCallKeepEditableState).onClick(()=>{
        this.isCallKeepEditableState = !this.isCallKeepEditableState
      }).id('changeIsCallKeepEditableState')
    }.height('100%')
  }
}