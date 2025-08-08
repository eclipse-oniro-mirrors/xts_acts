@Entry
@Component
struct Index1 {
  @State message: string = 'Hello World Index1';

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .id('HelloWorld1')
        .fontWeight(FontWeight.Bold)
    }
    .height('100%')
    .width('100%')
  }
}