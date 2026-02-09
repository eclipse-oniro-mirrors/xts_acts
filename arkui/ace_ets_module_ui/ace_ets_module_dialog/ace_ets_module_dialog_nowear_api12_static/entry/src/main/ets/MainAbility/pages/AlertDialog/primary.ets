'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
   ClickEvent, Margin, ColumnOptions, AlertDialogParamWithOptions, DialogAlignment} from '@ohos.arkui.component' //AlertDialog,
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct primaryTest {
  uiContext: UIContext = this.getUIContext()
  aboutToDisappear() {
    this.getUIContext().getFocusController().activate(false)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Button('primary1')
        .id('primary1')
        .height('8%')
        .onClick((e:ClickEvent) => {
          setTimeout(()=>{
            this.getUIContext().getFocusController().activate(true)
          },100)
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              autoCancel: true,
              showInSubWindow: true,
              alignment: DialogAlignment.Center,
              offset: { dx: 0, dy: -20 },
              gridCount: 3,
              buttons:[
                {
                  value:'按钮1',
                  action:()=>{
                    console.log('button1')
                  },
                  primary:true,
                },
                {
                  value:'按钮2',
                  action:()=>{
                    console.log('button1')
                  }
                },
              ]
            } as AlertDialogParamWithOptions
          )
        })

      Button('primary2')
        .id('primary2')
        .height('8%')
        .onClick((e:ClickEvent) => {
           setTimeout(()=>{
            this.getUIContext().getFocusController().activate(true)
          },100)
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              autoCancel: true,
              showInSubWindow: true,
              alignment: DialogAlignment.Center,
              offset: { dx: 0, dy: -20 },
              gridCount: 3,
              buttons:[
                {
                  value:'按钮1',
                  action:()=>{
                    console.log('button1')
                  },
                  primary:false,
                },
                {
                  value:'按钮2',
                  action:()=>{
                    console.log('button1')
                  }
                },
              ]
            } as AlertDialogParamWithOptions
          )
        })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}