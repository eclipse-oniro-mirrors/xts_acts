
@Entry
@Component
struct EnableModeChangeAnimation {
  @State navigationMode: NavigationMode = NavigationMode.Auto;
  @State hideNavBar: boolean = false;
  @State enableModeAnimationValue: boolean | undefined | null = false;
  build() {
    Navigation() {
      Scroll() {
        Column({ space: '5vp' }) {
          Button('enableModeChangeAnimation：true')
            .margin(10)
            .onClick(() => {
              this.enableModeAnimationValue = true;
            })
            .id('enableTrueId')

          Button('enableModeChangeAnimation：false')
            .margin(10)
            .onClick(() => {
              this.enableModeAnimationValue = false;
            })
            .id('enableFalseId')

          Button('NavigationMode：Split')
            .margin(10)
            .onClick(() => {
              this.navigationMode = NavigationMode.Split;
            })
            .id('splitId')

          Button('NavigationMode：Stack')
            .margin(10)
            .onClick(() => {
              this.navigationMode = NavigationMode.Stack;
            })
            .id('stackId')
        }
      }
    }
    .title('Navigation')
    .mode(this.navigationMode)
    .hideNavBar(this.hideNavBar)
    .id('navigationId')
    .enableModeChangeAnimation(this.enableModeAnimationValue)
  }
}