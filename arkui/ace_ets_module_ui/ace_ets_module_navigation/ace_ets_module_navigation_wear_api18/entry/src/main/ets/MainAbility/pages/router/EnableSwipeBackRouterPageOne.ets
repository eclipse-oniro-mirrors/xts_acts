@Entry
@Component
struct EnableSwipeBackRouterPageOne {
  @State isEnable: boolean = true;

  build() {
    Column({ space: '5vp' }) {
      Button(`enable swipe back: ${this.isEnable}`).onClick(() => {
        this.isEnable = !this.isEnable;
        this.getUIContext().enableSwipeBack(this.isEnable);
      })
        .height('10%')
        .id('enableId')
        .margin({top: '10%'})
    }
    .width('100%')
    .height('100%')
    .id('columnId')
  }
}