// xxx.ets
@Entry
@Component
struct TouchExample {
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Scroll() {
      Column() {
        Text(this.text).id('touch2')
        Button('Touch').height(230).width(500).key('touch1')
          .onTouch((event?: TouchEvent) => {
            if (event) {
              console.log('GetChangedPointerId ' + event.changedTouches[0].id);
              this.text = String(Math.round(event.changedTouches[0].id))
            }
          })
      }
    }.width('100%').padding(30)
  }
}