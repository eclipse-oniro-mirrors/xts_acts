
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';

@CustomDialog
struct CustomDialogExampleTwo {
  controllerTwo?: CustomDialogController
  build() {
    Column() {
      Text('1')
        .fontSize(30)
        .height(20)
      Button('点我')
        .onClick(() => {
          if (this.controllerTwo != undefined) {
            this.controllerTwo.close()
          }
        })
        .margin(20).width(50)
    }.width(50)
    .height(100)
  }
}


@Entry
@Component
struct FocuscontrolTest4 {

 PAGE_TAG: string = 'FocuscontrolTest4x';
 
  dialogControllerTwo: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleTwo(),
    alignment: DialogAlignment.Top,
    onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
      console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
      console.log("dialog onWillDismiss")
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss()
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss()
      }
    },
    offset: { dx: 0, dy: -25 } })
  controller?: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在所有controller的后面
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

 @Builder
  MyMenu() {
    Menu() {
      MenuItem({  content: "菜单选项" })
      MenuItem({  content: "菜单选项2" })
    }
  }
  
  build() {
    Column() {
       Button('test').onClick(()=>{
          focusControl.requestFocus("FocuscontrolTest4x")
      }).key("transferKey4")

     // Button('menu').key('menu4').bindContextMenu(this.MyMenu,ResponseType.LongPress);
      Button('dialog').key('menu4').onClick(()=>{
           
          this.dialogControllerTwo?.open();
      });
      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.FocusControlTest_004(this.PAGE_TAG);
      })
    }
  }
}  