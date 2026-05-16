import { CustomContentDialogV2, AdvancedDialogV2Button, UIContext } from '@kit.ArkUI';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';

@Entry
@ComponentV2
struct Index {
  contentAreaPadding: LocalizedPadding = {
    start: LengthMetrics.vp(1),
    end: LengthMetrics.vp(1),
  }
  @Builder
  dialogBuilder(): void {
    CustomContentDialogV2({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentBuilder: () => {
        this.buildContent();
      },
      contentAreaPadding: this.contentAreaPadding,
      buttons: [
        new AdvancedDialogV2Button({
          background: ColorMetrics.rgba(500, 300, 255, 255),
          fontColor:  ColorMetrics.rgba(0, 0, 500, 500),
          role: ButtonRole.NORMAL,
          defaultFocus: false,
          enabled: true,
          content: '按钮1',
          buttonStyle: ButtonStyleMode.TEXTUAL,
          action: () => {
            console.info('Callback when the button is clicked');
          },
        }),
        new AdvancedDialogV2Button({
          content: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR,
        })
      ],
    })
  }

  build() {
    Column() {
      Button('打开customContentDialogV2弹窗')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.getPromptAction().openCustomDialog({
            builder: () => {
              this.dialogBuilder();
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  buildContent(): void {
    Column() {
      Text('内容区')
    }
  }
}