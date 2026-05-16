import { DownloadDescription, DownloadFileButton, DownloadIconStyle, DownloadLayoutDirection } from '@ohos.arkui.advanced.DownloadFileButton'

@Entry
@Component
struct FileButtonReceive {
  build() {
    Column() {
      DownloadFileButton({
        contentOptions: {
          icon: DownloadIconStyle.FULL_FILLED,
          text: DownloadDescription.RECEIVE
        },
        styleOptions: {
          iconSize: '16vp',
          layoutDirection: DownloadLayoutDirection.HORIZONTAL,
          fontSize: '16vp',
          fontStyle: FontStyle.Normal,
          fontWeight: FontWeight.Medium,
          fontColor: '#ffffffff',
          iconColor: '#ffffffff',
          textIconSpace: '4vp'
        }
      })
        .backgroundColor('#007dff')
        .borderStyle(BorderStyle.Dotted)
        .borderWidth(0)
        .borderColor('')
        .borderRadius('24vp')
        .position({ x: 0, y: 0 })
        .markAnchor({ x: 0, y: 0 })
        .offset({ x: 0, y: 0 })
        .constraintSize({})
        .padding({
          top: '12vp',
          bottom: '12vp',
          left: '24vp',
          right: '24vp'
        })
        .onClick(() => {
        })
    }
    .width('100%')
    .height('100%')
  }


}