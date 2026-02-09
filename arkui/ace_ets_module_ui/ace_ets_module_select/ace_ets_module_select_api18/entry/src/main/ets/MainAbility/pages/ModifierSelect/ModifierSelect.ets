import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { display, mediaquery, SymbolGlyphModifier } from '@kit.ArkUI';
export class MyMenuAvoidanceModifier implements AttributeModifier<SelectAttribute> {
  public avoidanceModeArr: (AvoidanceMode | undefined)[] =
    [undefined,  AvoidanceMode.COVER_TARGET, AvoidanceMode.AVOID_AROUND_TARGET];
  public modeIndex: number = 0;

  constructor() {
  }

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.avoidance(this.avoidanceModeArr[this.modeIndex]);
  }
}

@Entry
@Component
export default struct ModifierPage {
  @State private text: string = 'TTTTT';
  @State private index: number = 2;
  @State private space: number = 8;
  @State private arrowPosition: ArrowPosition = ArrowPosition.END;
  @State private positionX: number = 0;
  @State private positionY: number = 72;
  @State private myModifier: MyMenuAvoidanceModifier = new MyMenuAvoidanceModifier();
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
              let tmp: number = ++this.myModifier.modeIndex;
              this.myModifier.modeIndex = tmp % this.myModifier.avoidanceModeArr.length;
            })
        }
        .height(56)

        // Select 组件
        Select(this.selectOptions)
          .key('ModifierSelect01')
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
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .gesture(PanGesture().onActionStart((event: GestureEvent) => {

          })
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
            }))
          .attributeModifier(this.myModifier)
      }
      .width('100%')
      .height('100%')
    }
    .title('ModifierPage')

  }
}
