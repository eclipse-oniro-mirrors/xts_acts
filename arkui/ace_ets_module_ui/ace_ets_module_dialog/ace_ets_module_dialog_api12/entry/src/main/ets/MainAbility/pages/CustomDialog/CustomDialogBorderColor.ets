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

@CustomDialog
struct CustomDialogExample11 {
  controller?: CustomDialogController;
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  build() {
    Column() {
      Button('点我关闭弹窗')
        .id('close')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close();
          }
        })
    }
  }
}
@Entry
@Component
struct CustomDialogBorderColor {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample11({
      cancel: ()=> { this.onCancel(); },
      confirm: ()=> { this.onAccept(); }
    }),
    cancel: this.existApp,
    autoCancel: true,
    onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
      console.info('reason=' + JSON.stringify(dismissDialogAction.reason))
      console.log('dialog onWillDismiss')
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss();
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss();
      }
    },
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    customStyle: false,
    cornerRadius: 20,
    width: 200,
    height: 100,
    borderWidth: 1,
    borderStyle: BorderStyle.Dashed,//使用borderStyle属性，需要和borderWidth属性一起使用
    borderColor: Color.Blue,//使用borderColor属性，需要和borderWidth属性一起使用
    backgroundColor: Color.White,
    shadow: ({ radius: 20, color: Color.Grey, offsetX: 50, offsetY: 0}),
  })

  aboutToDisappear() {
    this.dialogController = null;
  }

  onCancel() {
    console.info('Callback when the first button is clicked');
  }

  onAccept() {
    console.info('Callback when the second button is clicked');
  }

  existApp() {
    console.info('Click the callback in the blank area');
  }

  build() {
    Column({space: 5}) {
      Button('click')
        .id('color')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open();
          }
        }).backgroundColor(0x317aff)
        .margin({top: '2%'})
      Button('click1')
        .id('color1')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample11({
              cancel: ()=> { this.onCancel(); },
              confirm: ()=> { this.onAccept(); }
            }),
            cancel: this.existApp,
            autoCancel: true,
            onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
              console.info('reason=' + JSON.stringify(dismissDialogAction.reason))
              console.log('dialog onWillDismiss')
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss();
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss();
              }
            },
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -20 },
            customStyle: false,
            cornerRadius: 20,
            width: 200,
            height: 100,
            borderWidth: 2,
            borderStyle: BorderStyle.Solid,//使用borderStyle属性，需要和borderWidth属性一起使用
            borderColor: '#FF6582F8',//使用borderColor属性，需要和borderWidth属性一起使用
            backgroundColor: Color.White,
            shadow: ({ radius: 20, color: Color.Grey, offsetX: 50, offsetY: 0}),
          })
          if (this.dialogController != null) {
            this.dialogController.open();
          }
        })

    }.width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}