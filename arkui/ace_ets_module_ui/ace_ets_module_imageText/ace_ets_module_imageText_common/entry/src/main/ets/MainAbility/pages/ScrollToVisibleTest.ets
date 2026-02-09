/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
struct ScrollToVisibleTest {
  @State valueText:string ='一日，我这个智能助手接到了一位员工的求助。他说自己遇到了一些麻烦，需要我的帮助。我听了他的问题，心中暗自想着：“机不可失，时不再来。”于是我立刻开始了解决他的问题。\n\n经过一番努力，我终于帮助他解决了问题。'
  TextInputController:TextInputController = new TextInputController()
  TextAreaController:TextAreaController = new TextAreaController()
  SearchController:SearchController = new SearchController()
  @State TextInputScrollToVisible:boolean = false
  @State TextAreaScrollToVisible:boolean = false
  @State SearchScrollToVisible:boolean = false

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('TextInputScrollToVisible',false)
    AppStorage.setOrCreate<boolean>('TextAreaScrollToVisible',false)
    AppStorage.setOrCreate<boolean>('SearchScrollToVisible',false)
  }

  build() {
   Column(){
     TextInput({text:this.valueText ,controller:this.TextInputController})
       .onContentScroll(()=>{
         this.TextInputScrollToVisible = true
         console.log('ScrollToVisibleTest:TextInputScrollToVisible'+this.TextInputScrollToVisible)
         AppStorage.setOrCreate<boolean>('TextInputScrollToVisible',true)
       }).height(40).width(200)
     TextArea({text:this.valueText ,controller:this.TextAreaController})
       .onContentScroll(()=>{
         this.TextAreaScrollToVisible = true
         console.log('ScrollToVisibleTest:TextAreaScrollToVisible'+this.TextAreaScrollToVisible)
         AppStorage.setOrCreate<boolean>('TextAreaScrollToVisible',true)
       }).height(35).width(200)
     Search({value:this.valueText ,controller:this.SearchController})
       .onContentScroll(()=>{
         this.SearchScrollToVisible = true
         console.log('ScrollToVisibleTest:SearchScrollToVisible'+this.SearchScrollToVisible)
         AppStorage.setOrCreate<boolean>('SearchScrollToVisible',true)
       }).height(40).width(200)
     Row(){
       Button('setScrollToVisible1').onClick(()=>{
         this.TextInputController.scrollToVisible({start:null,end:null})
         this.TextAreaController.scrollToVisible({start:null,end:null})
         this.SearchController.scrollToVisible({start:null,end:null})
       }).width('25%').id('setScrollToVisible1')
       Button('setScrollToVisible2').onClick(()=>{
         this.TextInputController.scrollToVisible({start:undefined,end:undefined})
         this.TextAreaController.scrollToVisible({start:undefined,end:undefined})
         this.SearchController.scrollToVisible({start:undefined,end:undefined})
       }).width('25%').id('setScrollToVisible2')
       Button('setScrollToVisible3').onClick(()=>{
         this.TextInputController.scrollToVisible({start:20,end:30})
         this.TextAreaController.scrollToVisible({start:20,end:30})
         this.SearchController.scrollToVisible({start:20,end:30})
       }).width('25%').id('setScrollToVisible3')
       Button('setScrollToVisible4').onClick(()=>{
         this.TextInputController.scrollToVisible({start:-10,end:-20})
         this.TextAreaController.scrollToVisible({start:-10,end:-20})
         this.SearchController.scrollToVisible({start:-10,end:-20})
       }).width('25%').id('setScrollToVisible4')
     }
     .height('10%')
     Button('setScrollToVisible5').onClick(()=>{
         this.TextInputController.scrollToVisible()
         this.TextAreaController.scrollToVisible()
         this.SearchController.scrollToVisible()
      }).id('setScrollToVisible5').height('10%')
   }
    .height('100%')
  }
}