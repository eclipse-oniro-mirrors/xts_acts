import { PromptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  promptAction: PromptAction = this.getUIContext().getPromptAction()
  private customDialogComponentId: number = 0
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1
  @Builder
  customDialogComponent() {
    Column({ space: 5 }) {
      Text('可展示在主窗口外的弹窗')
      TextInput()
        .id('TextInput')
      Button('点我关闭弹窗')
        .onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        .id('close')
        .backgroundColor(Color.Red)

      TextInput()
      TextInput()
      Text('可展示在主窗口外的弹窗')
      TextInput()

      Button('点我关闭弹窗')
        .onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })

      TextInput()
      Text('可展示在主窗口外的弹窗')
      TextInput()
      Button('点我关闭弹窗')
        .onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })

      TextInput()
      Text('可展示在主窗口外的弹窗')
      TextInput()
    }
  }

  build() {

    Column() {
      Text(this.mText1)
        .id('text1')
      Button('DEFAULT')
        .id('btn1')
        .onClick(() => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info("reason" + JSON.stringify(dismissDialogAction.reason))
              console.log("dialog onWillDismiss")
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            }
          }).then((dialogId: number) => {
            this.customDialogComponentId = dialogId
          })
          this.mText1 = this.keyboardAvoidMode1 + ''
          setTimeout(() => {
            this.promptAction.closeCustomDialog(this.customDialogComponentId)
          }, 1500)
        })

      Text(this.mText2)
        .id('text2')
      Button('NONE')
        .id('btn2')
        .onClick(() => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            keyboardAvoidMode: KeyboardAvoidMode.NONE,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info("reason" + JSON.stringify(dismissDialogAction.reason))
              console.log("dialog onWillDismiss")
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            }
          }).then((dialogId: number) => {
            this.customDialogComponentId = dialogId
          })
          this.mText2 = this.keyboardAvoidMode2 + ''
          setTimeout(() => {
            this.promptAction.closeCustomDialog(this.customDialogComponentId)
          }, 1500)
        })
    }
    .width('100%')
    .height('100%')
  }
}