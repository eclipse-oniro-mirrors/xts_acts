/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
struct RichEditorTextChange004 {
  @State text: string = 'Select'
  @State index: number = 2
  @State space: number = 8
  @State arrowPosition: ArrowPosition = ArrowPosition.END

  controller: RichEditorController = new RichEditorController();
  @State onEditingChangeCallBack: boolean = false;
  @State isEditingFlag: boolean = false;



  build() {

    Column() {

      Text('onEditingChangeCallBack:' + this.onEditingChangeCallBack).id('onEditingChangeCallBack')
      Text('isEditingFlag:' + this.isEditingFlag).id('isEditingFlag')
      Button('up customKeyboard').onClick(() => {
        console.log('RichEditorController up customKeyboard');
      }).id('up_customKeyboard')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {

        })
        .onEditingChange((isEditing: boolean) => {
          this.onEditingChangeCallBack = true;
          this.isEditingFlag = isEditing;
          console.log('RichEditorController Editing Status:' + isEditing);
        })
        .id('rich_struct')

      Select([{ value: 'aaa', icon: $r('app.media.icon') },
        { value: 'bbb', icon: $r('app.media.icon') },
        { value: 'ccc', icon: $r('app.media.icon') },
        { value: 'ddd', icon: $r('app.media.icon') }])
        .selected(this.index)
        .value(this.text)
        .font({ size: 16, weight: 500 })
        .fontColor('#182431')
        .selectedOptionFont({ size: 16, weight: 400 })
        .optionFont({ size: 16, weight: 400 })
        .space(this.space)
        .arrowPosition(this.arrowPosition)
        .menuAlign(MenuAlignType.START, {dx:0, dy:0})
        .optionWidth(200)
        .optionHeight(300)
        .onSelect((index:number, text?: string | undefined)=>{
          console.info('Select:' + index)
          this.index = index;
          if(text){
            this.text = text;
          }
        }).id('select')

    }
  }
}