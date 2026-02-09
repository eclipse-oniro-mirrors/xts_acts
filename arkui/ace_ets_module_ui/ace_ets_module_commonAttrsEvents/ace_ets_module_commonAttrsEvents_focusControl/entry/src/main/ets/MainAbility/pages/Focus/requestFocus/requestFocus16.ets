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

@CustomDialog
struct CustomDialogExample{
  controllerTwo?:CustomDialogController
  cancel:() => void = () => {

  }
  confirm:() => void = () => {

  }
  @State text1:string = ''

  build() {
    Column(){
      Text('' + this.text1).id('requestFocus16_text1')
      Button('Focus-textInput1').onClick(() => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus16_textInput1')
        }catch (error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus16_btn2')
    }.width(200).height(50)
  }
}


@Entry
@Component
struct requestFocus16 {

  onCancel(){}
  onAccept(){}
  dialogController:CustomDialogController|null = new CustomDialogController({
    builder:CustomDialogExample({
      cancel:this.onCancel,
      confirm:this.onAccept
    }),
    autoCancel:true,
    alignment:DialogAlignment.Center,
    offset:{dx:0,dy:0},
    customStyle:false
  })

  @State text2:string = 'TextInput'

  build() {
    Column({ space:20 }){

      TextInput({text:this.text2})
        .id('requestFocus16_textInput1')
        .onFocus(() => {
          this.text2 = 'TextInput_1'
        })
        .onBlur(() => {
          this.text2 = 'TextInput'
        })

      Button('openDialog').onClick(() => {
        this.dialogController?.open()
      }).id('requestFocus16_btn1')

    }.width('100%').margin({ top:20 })
  }
}

