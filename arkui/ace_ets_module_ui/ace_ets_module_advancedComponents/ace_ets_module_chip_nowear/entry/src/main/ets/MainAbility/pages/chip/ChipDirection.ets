import { Chip, ChipSize } from '@ohos.arkui.advanced.Chip';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct ChipDirection {
  @State currentDirection?: Direction = Direction.Auto

  build() {
    Column() {
      Row() {
        Button('Auto').id('Auto').onClick(() => {
          this.currentDirection = Direction.Auto
        }).backgroundColor(this.currentDirection == Direction.Auto ? Color.Red : Color.Blue)
        Button('Rtl').id('Rtl').onClick(() => {
          this.currentDirection = Direction.Rtl
        }).backgroundColor(this.currentDirection == Direction.Rtl ? Color.Red : Color.Blue)
        Button('Ltr').id('Ltr').onClick(() => {
          this.currentDirection = Direction.Ltr
        }).backgroundColor(this.currentDirection == Direction.Ltr ? Color.Red : Color.Blue)
      }

      Chip({
        direction: this.currentDirection,
        label: {
          text: '操作块',
          fontSize: 12,
          fontColor: Color.Blue,
          localizedLabelMargin: {
            start: LengthMetrics.vp(5),
            end: LengthMetrics.vp(10)
          }
        },
        suffixIcon: {
          src: $r('sys.media.ohos_ic_public_close'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
        },
        size: ChipSize.NORMAL,
        allowClose: false,
        enabled: true,
        backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        borderRadius: $r('sys.float.ohos_id_corner_radius_button')
      })


    }
    .width('100%')
    .height('100%')
  }
}