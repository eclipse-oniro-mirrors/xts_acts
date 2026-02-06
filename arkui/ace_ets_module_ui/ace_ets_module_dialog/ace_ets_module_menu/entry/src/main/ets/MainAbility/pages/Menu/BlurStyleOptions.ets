@Entry
@Component
struct backgroundBlurStyleOptions_scaleTest {
  @State listData: number[] = [0, 0, 0]
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  private iconStr: ResourceStr = $r('sys.media.ohos_save_button_filled')

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
    }
  }
  blurStyleOptions:(BackgroundBlurStyleOptions | undefined | null ) = {
    policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
    adaptiveColor: AdaptiveColor.DEFAULT,
    scale: 0.1,
    colorMode: ThemeColorMode.SYSTEM,
    blurOptions: {
      grayscale: [2,2]
    }
  }
  blurStyle: ( BlurStyle | undefined ) = BlurStyle.Thin
  @Builder MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Test menu item 1')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Text('Test menu item 2')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
    }.width(100)
  }
  build() {
    Row() {
      Button('bindMenu1').fontColor(Color.Black)
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          },
          {
            value: 'Menu2',
            action: () => {
              console.info('handle Menu2 select')
            }
          },
        ],
          {
            backgroundBlurStyle:BlurStyle.Thin,
            backgroundBlurStyleOptions: this.blurStyleOptions
          }
        )
        .id('MenuStyleOptions_btn1')
    
      Button('bindMenu2').fontColor(Color.Black)
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          },
          {
            value: 'Menu2',
            action: () => {
              console.info('handle Menu2 select')
            }
          },
        ],
          {
            backgroundBlurStyleOptions: undefined
          }
        )
        .id('MenuStyleOptions_btn2')
     
      Button('bindMenu3').fontColor(Color.Black)
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          },
          {
            value: 'Menu2',
            action: () => {
              console.info('handle Menu2 select')
            }
          },
        ],
          {
            backgroundBlurStyleOptions: null
          }
        )
        .id('MenuStyleOptions_btn3')
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}