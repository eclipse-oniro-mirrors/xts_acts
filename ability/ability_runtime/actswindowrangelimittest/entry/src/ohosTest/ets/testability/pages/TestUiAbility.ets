
@Entry
@Component
struct Bundle {
  @State message: string = 'TestUiAbility';

  build() {
    Column() {
      Row() {
        Text(this.message)
      }
    }
    .height('100%')
    .width('100%')
  }
}