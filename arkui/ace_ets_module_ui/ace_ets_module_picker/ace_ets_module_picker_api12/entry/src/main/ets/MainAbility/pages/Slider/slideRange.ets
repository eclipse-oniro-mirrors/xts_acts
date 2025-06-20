
@Entry
@Component
struct SliderExample {
  @State message: string = "Hello"

  build() {
    Row() {
      Column({ space: 8 }) {
        Text('同时设置from=20,to=80').fontSize(20).fontColor(0xCCCCCC).width('90%').margin(15)

        Row() {
          Slider({
            step: 10,
            style: SliderStyle.OutSet
          })
            .id("slideRangeValue")
            .showSteps(true)
            .slideRange({from:20, to:80})
        }
        .width('80%')
      }.width('100%')
    }

  }
}