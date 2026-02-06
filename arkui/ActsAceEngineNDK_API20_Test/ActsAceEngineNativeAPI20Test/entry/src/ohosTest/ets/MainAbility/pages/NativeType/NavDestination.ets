import native from 'libnativetype.so';
import { NodeContent, SymbolGlyphModifier } from '@kit.ArkUI';

@Component
struct MyPageOne {
  @Link nodeContent: NodeContent

  build() {
    NavDestination() {
      Column() {
        ContentSlot(this.nodeContent)
      }.backgroundColor('#ff00ff')
    }
    .title('子页面', { backgroundColor: Color.Yellow, barStyle: BarStyle.STACK })
    .toolbarConfiguration([
      {
        value: 'item1',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.phone_badge_star'))
      }
    ], { backgroundColor: Color.Orange, barStyle: BarStyle.STACK })
    .onShown(()=>{
      native.GetNavDestinationState()
    })
    .onHidden(()=>{
      native.GetNavDestinationState()
    })
    .onAppear(()=>{
      native.GetNavDestinationState()
    })
    .onDisAppear(()=>{
      native.GetNavDestinationState()
    })
    .onWillShow(()=>{
      native.GetNavDestinationState()
    })
    .onWillHide(()=>{
      native.GetNavDestinationState()
    })
    .onWillAppear(()=>{
      native.GetNavDestinationState()
    })
    .onWillDisappear(()=>{
      native.GetNavDestinationState()
    })
    .onBackPressed(()=>{
      native.GetNavDestinationState()
      return false
    })
    .focusable(false)
  }
}
@Entry
@Component
struct NativeType {
  private stack: NavPathStack = new NavPathStack();
  @State nodeContent: NodeContent = new NodeContent()

  aboutToAppear(): void {
    native.CreateNavDestinationNode(this.nodeContent);
  }
  @Builder
  MyPageMap(name: string) {
    if (name === 'myPageOne') {
      MyPageOne({
        nodeContent: $nodeContent
      });
    }
  }

  onBackPress(): boolean {
    return true
  }

  build() {
    Navigation(this.stack) {
      Column() {
        Button('前往页面').onClick(() => {
          this.stack.pushPath({ name: 'myPageOne' });
        })
          .id('goto')
        Button('Back').onClick((event: ClickEvent) => {
          this.stack.popToName('myPageOne')
        }).id('BackButton')
      }.height('40%').justifyContent(FlexAlign.SpaceAround)
    }.width('100%')
    .height('100%')
    .title({ main: 'C++用例测试', sub: 'NavDestinationState' })
    .navDestination(this.MyPageMap)
  }
}