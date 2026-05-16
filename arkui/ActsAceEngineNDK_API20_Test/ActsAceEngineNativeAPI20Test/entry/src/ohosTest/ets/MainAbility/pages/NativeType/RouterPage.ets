import { router } from '@kit.ArkUI'
import { NodeContent, SymbolGlyphModifier } from '@kit.ArkUI';
import native from 'libnativetype.so';
@Entry
@Component
struct RouterPage {
  @State code:number=1
  @State nodeContent:NodeContent=new NodeContent()
  aboutToAppear(): void {
    native.CreateRouterPageNode(this.nodeContent);
    AppStorage.setOrCreate('Node',this.nodeContent)
  }
  build() {
    Column(){
      Text('第一页')
      Button('跳转到第二页')
        .onClick(()=>{
          router.pushUrl(
            {
              url:'MainAbility/pages/NativeType/RouterPage2',
            }
          )
        })
        .id('goPageTwo')
    }
    .backgroundColor('#ff00f00f')
    .width('100%')
    .height(100)
  }
}

