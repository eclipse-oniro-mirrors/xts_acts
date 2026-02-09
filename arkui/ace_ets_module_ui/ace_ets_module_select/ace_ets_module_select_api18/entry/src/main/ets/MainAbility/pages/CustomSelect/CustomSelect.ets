import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { display, LengthMetrics, mediaquery, SymbolGlyphModifier } from '@kit.ArkUI';

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  private modifierText: string = '';

  constructor(text: string) {
    this.modifierText = text;
  }

  applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
    return wrapBuilder(menuItemBuilder)
  }
}

@Builder
function menuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    if (configuration.symbolIcon) {
      SymbolGlyph()
        .attributeModifier(configuration.symbolIcon)
        .fontSize(24)
    } else if (configuration.icon) {
      Image(configuration.icon)
        .size({ width: 24, height: 24 })
    }
    Text(configuration.value)
      .fontSize($r('sys.float.Body_M'))
      .margin({
        start: LengthMetrics.resource($r('sys.float.padding_level4'))
      })
  }
  .alignItems(VerticalAlign.Center)
  .justifyContent(FlexAlign.Start)
  .padding({
    top: $r('sys.float.padding_level2'),
    bottom: $r('sys.float.padding_level2')
  })
  .width(224)
  .backgroundColor('#09726f64')
  .onClick(() => {
    configuration.triggerSelect(configuration.index, configuration.value.valueOf().toString())
  })
}

@Entry
@Component
export default struct CustomSelectionPage {
  @State text: string = 'ddddd';
  @State index: number = 2;
  @State space: number = 8;
  @State arrowPosition: ArrowPosition = ArrowPosition.END;
  @State positionX: number = 0;
  @State positionY: number = 72;
  @State private selectOptions: SelectOption[] = [
    {
      value: 'aaa',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    },
    {
      value: 'bbb',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    },
    {
      value: 'ccc',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    },
    {
      value: 'bbb',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'bbb',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ccc',
    },
    {
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Green]),
      value: 'ddd',
    }
  ];
  private displayWidth: number = 0;
  private displayHeight: number = 0;
  private listener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync('(orientation: landscape)') // 监听横屏事件
  private avoidanceModeArr: (AvoidanceMode | undefined)[] =
    [ undefined, AvoidanceMode.COVER_TARGET, AvoidanceMode.AVOID_AROUND_TARGET];
  @State private modeIndex: number = 0;

  aboutToAppear(): void {
    try {
      this.updateDisplay();
      this.listener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
        this.updateDisplay();
      })
    } catch (e) {
      console.error('')
    }
  }

  private updateDisplay(): void {
    let mainWindow: window.Window = AppStorage.get('mainWindow') as window.Window;
    let windowProp: window.WindowProperties = mainWindow.getWindowProperties();
    this.displayWidth = px2vp(windowProp.windowRect.width);
    this.displayHeight = px2vp(windowProp.windowRect.height);
  }

  private getVoidModeText(mode?: AvoidanceMode): string {
    let result: string = '';
    if (mode === undefined) {
      result = 'undefined';
    } else if (mode === AvoidanceMode.COVER_TARGET) {
      result = 'COVER_TARGET';
    } else if (mode === AvoidanceMode.AVOID_AROUND_TARGET) {
      result = 'AVOID_AROUND_TARGET';
    }
    return result;
  }

  build() {
    NavDestination() {
      Column() {
        // 横屏竖屏切换按钮
        Row({ space: 16 }) {
          Button('横屏')
            .layoutWeight(1)
            .onClick(() => {
              let ctx = getContext(this) as common.UIAbilityContext;
              window.getLastWindow(ctx).then((data) => {
                data.setPreferredOrientation(window.Orientation.LANDSCAPE);
              });
            })

          Button('竖屏')
            .layoutWeight(1)
            .onClick(() => {
              let ctx = getContext(this) as common.UIAbilityContext;
              window.getLastWindow(ctx).then((data) => {
                data.setPreferredOrientation(window.Orientation.PORTRAIT);
              });
            })
            .onClick(() => {
              this.modeIndex = (++this.modeIndex) % this.avoidanceModeArr.length;
            })
        }
        .height(56)

        // Select 组件
        Select(this.selectOptions)
          .key('select01')
          .selected(this.index)
          .position({
            x: this.positionX,
            y: this.positionY
          })
          .backgroundColor(Color.Red)
          .width(200)
          .height(100)
          .value(this.text)
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
          .menuItemContentModifier(new MyMenuItemContentModifier('ddd'))
          .avoidance(this.avoidanceModeArr[this.modeIndex])
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .gesture(PanGesture()
            .onActionEnd((event: GestureEvent) => {
              let curX: number = this.positionX;
              let curY: number = this.positionY;
              curX += event.offsetX;
              curY += event.offsetY;
              if (curX < 0) {
                curX = 0;
              }

              if (curX > (this.displayWidth - 200)) {
                curX = this.displayWidth - 200;
              }

              if (curY < 0) {
                curY = 0;
              }

              if (curY > (this.displayHeight - 222)) {
                curY = this.displayHeight - 222;
              }
              animateTo({
                duration: 200,
                curve: Curve.EaseInOut
              }, () => {
                this.positionX = curX;
                this.positionY = curY;
              })
            })
          )

      }
      .width('100%')
      .height('100%')
    }
    .title('CustomSelectionPage')

  }
}
