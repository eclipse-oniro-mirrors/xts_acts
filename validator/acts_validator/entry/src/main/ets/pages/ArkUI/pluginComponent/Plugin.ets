@Entry
@Component
struct Plugin {
  @State imageName :string = "this is a name"
  build() {
    Row() {
      Text(this.imageName)
      Image($r('app.media.app_icon'))
        .width(100)
        .height(100)
    }
    .height('100%')
  }
}
