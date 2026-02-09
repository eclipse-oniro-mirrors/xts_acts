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
struct requestFocus22 {

  @Provide('pageInfos') pageInfos:NavPathStack = new NavPathStack();

  @Builder PageMap(name:string){
    if (name == 'pageOne'){
      pageOne()
    }else if(name == 'pageTwo'){
      pageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos){
      Column(){

        Button('pushTwo').onClick(() => {
          this.pageInfos.pushPath({name: 'pageTwo' })
        }).id('requestFocus22_btn1')
      }
    }
    .mode(NavigationMode.Split)
    .title('main')
    .navDestination(this.PageMap)
  }
}

@Component
export struct pageOne {
  @Consume('pageInfos') pageInfos:NavPathStack;
  @State text2:string = 'TextInput'

  build() {
    NavDestination(){
      Column(){
        TextInput({text:this.text2})
          .id('requestFocus22_textInput1')
          .onFocus(() => {
            this.text2 = 'TextInput_1'
          })
          .onBlur(() => {
            this.text2 = 'TextInput'
          })


      }.width('100%').height('100%')
    }.title('pageOne')
  }
}

@Component
export struct pageTwo {
  @Consume('pageInfos') pageInfos:NavPathStack;
  @State text1:string = ''

  build() {
    NavDestination(){
      Column(){
        Text('' + this.text1).id('requestFocus22_text1')

        Button('Focus-textInput1').onClick(() => {
          try{
            this.getUIContext().getFocusController().requestFocus('requestFocus22_textInput1')
          }catch (error){
            this.text1 = '' + error.code
          }
        }).id('requestFocus22_btn2')

      }.width('100%').height('100%')
    }.title('pageTwo')
  }
}

