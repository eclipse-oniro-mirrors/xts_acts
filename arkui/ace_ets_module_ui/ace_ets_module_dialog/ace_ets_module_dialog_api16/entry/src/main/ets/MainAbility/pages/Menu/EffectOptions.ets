@Entry
@Component
struct backgroundEffectOptions_colorTest {
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
  effectOptions:(BackgroundEffectOptions) = {
    radius:60,
    saturation:40,
    brightness:1,
    color:Color.Orange,
  }
  blurStyle: ( BlurStyle | undefined ) = BlurStyle.Thin
  build() {
    Column({space:60}) {
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
            backgroundEffect:this.effectOptions
          }
        )
        .id('EffectOptions_btn1')
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
            backgroundEffect: undefined
          }
        )
        .id('EffectOptions_btn2')
      
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
            backgroundEffect: null
          }
        )
        .id('EffectOptions_btn3')
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}