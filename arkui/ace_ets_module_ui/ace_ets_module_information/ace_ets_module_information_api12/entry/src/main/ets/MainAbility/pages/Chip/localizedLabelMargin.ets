import { Chip, ChipSize, LocalizedLabelMarginOptions } from '@ohos.arkui.advanced.Chip';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct ChipPage {
  @State message: string = 'Hello World';
  @State mLocalizedLabelMargin: LocalizedLabelMarginOptions = { start: LengthMetrics.vp(20), end: LengthMetrics.vp(30) }
  @State mBtn: string = 'start_init'
  @State mBtn2: string = 'end_init'

  build() {
    Column() {
      Button(this.mBtn)
        .id('LocalizedLabelMargin_start')
        .onClick(() => {
          this.mBtn = 'start:' + JSON.stringify(this.mLocalizedLabelMargin.start)
        })
      Button(this.mBtn2)
        .id('LocalizedLabelMargin_end')
        .onClick(() => {
          this.mBtn2 = 'end:' + JSON.stringify(this.mLocalizedLabelMargin.end)
        })
        .margin(20)
      Chip({
        direction: Direction.Auto,
        prefixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
        },
        label: {
          text: "操作块",
          fontSize: 12,
          fontColor: Color.Blue,
          fontFamily: "HarmonyOS Sans",
          localizedLabelMargin: this.mLocalizedLabelMargin,
        },
        suffixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
        },
        size: ChipSize.NORMAL,
        allowClose: false,
        enabled: true,
        backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        borderRadius: $r('sys.float.ohos_id_corner_radius_button')
      })
    }.justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}