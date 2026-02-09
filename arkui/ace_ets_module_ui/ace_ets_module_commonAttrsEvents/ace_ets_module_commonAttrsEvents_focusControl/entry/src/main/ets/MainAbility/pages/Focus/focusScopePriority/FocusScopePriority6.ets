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
struct FocusScopePriority6 {
  @State text1:string = 'text1'


  build() {
    Scroll(){
      Column({space:5}){

        Text('焦点组1，设置FocusPriority.PREVIOUS')
        Column({space:5}){
          Button('Button1')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup1')

          Button('FocusPriority.PREVIOUS')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup1', FocusPriority.PREVIOUS)
        }
        .focusScopeId('FocusScopePriority6_focusGroup1',true)
        .borderWidth(1)


        Button('Button3')
          .focusOnTouch(true)
          .backgroundColor(Color.Orange)

        Button('clearFocus')
          .id('FocusScopePriority6_clearFocus')
          .onClick(()=>{
            this.getUIContext().getFocusController().clearFocus()
          })

        Text('非焦点组2，设置FocusPriority.PRIOR')
        Column({space:5}){
          Button('Button5')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup2')

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup2', FocusPriority.PRIOR)
        }
        .focusScopeId('FocusScopePriority6_focusGroup2',false)
        .borderWidth(1)


        Text('焦点组3，设置FocusPriority.PRIOR')
        Column({space:5}){
          Button('Button6')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup3')

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup3', FocusPriority.PRIOR)

        }
        .focusScopeId('FocusScopePriority6_focusGroup3',true)
        .borderWidth(1)


        Text('非焦点组4，设置FocusPriority.PREVIOUS')
        Column({space:5}){
          Button('Button7')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup4')

          Button('FocusPriority.PREVIOUS')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup4', FocusPriority.PREVIOUS)
        }
        .focusScopeId('FocusScopePriority6_focusGroup4',false)
        .borderWidth(1)


        Text('焦点组5，设置不同优先级1')
        Column({space:5}){
          Button('FocusPriority.AUTO')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup5',FocusPriority.AUTO)

          Button('FocusPriority.PREVIOUS')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup5', FocusPriority.PREVIOUS)

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup5',FocusPriority.PRIOR)
        }
        .focusScopeId('FocusScopePriority6_focusGroup5',true)
        .borderWidth(1)



        Text('焦点组6，设置不同优先级2')
        Column({space:5}){
          Button('FocusPriority.AUTO')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup6',FocusPriority.AUTO)
            .id('FocusScopePriority6_btn1_6')

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup6',FocusPriority.PRIOR)
            .id('FocusScopePriority6_btn2_6')

        }
        .focusScopeId('FocusScopePriority6_focusGroup6',true)
        .borderWidth(1)



        Text('焦点组7，设置不同优先级3')
        Column({space:5}){
          Button('不设置')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup7',FocusPriority.PRIOR)

          Button('FocusPriority.PREVIOUS')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup7', FocusPriority.PREVIOUS)
            .id('FocusScopePriority6_btn3_7')
        }
        .focusScopeId('FocusScopePriority6_focusGroup7',true)
        .borderWidth(1)



        Text('非焦点组8，设置不同优先级1')
        Column({space:5}){
          Button('FocusPriority.AUTO')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup8',FocusPriority.AUTO)

          Button('FocusPriority.PREVIOUS')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup8', FocusPriority.PREVIOUS)

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup8',FocusPriority.PRIOR)
        }
        .focusScopeId('FocusScopePriority6_focusGroup8',false)
        .borderWidth(1)


        Text('非焦点组9，设置不同优先级2')
        Column({space:5}){
          Button('不设置')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup9',FocusPriority.PRIOR)

          Button('FocusPriority.PREVIOUS')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup9', FocusPriority.PREVIOUS)
        }
        .focusScopeId('FocusScopePriority6_focusGroup9',false)
        .borderWidth(1)



        Text('非焦点组12，设置同一优先级')
        Column({space:5}){

          Button('不设置')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup12',FocusPriority.PRIOR)

          Button('FocusPriority.PRIOR')
            .focusOnTouch(true)
            .backgroundColor(Color.Orange)
            .focusScopePriority('FocusScopePriority6_focusGroup12', FocusPriority.PRIOR)

        }
        .focusScopeId('FocusScopePriority6_focusGroup12',false)
        .borderWidth(1)

      }
    }
    .id('FocusScopePriority6_scroll')
    .width('100%')
    .height('100%')
    .padding({top:50, bottom:50})
  }
}