import { promptAction, router } from '@kit.ArkUI'
import native from 'libnativetype.so';
import { NodeContent, SymbolGlyphModifier } from '@kit.ArkUI';
@Entry
@Component
struct RouterPage {
  @State nodeContent:NodeContent=new NodeContent()
  @StorageLink('Node') node:NodeContent=this.nodeContent
  aboutToAppear(): void {
    native.GetRouterPageNodeState()
    native.GetRouterStatAboutToAppear()
    promptAction.showToast({
      message:''+native.GetRouterPageNodeStateResult(0)
    })
  }
  aboutToDisappear(): void {
    native.GetRouterStateAboutToDisApper()
    message:''+native.GetRouterPageNodeState()
    promptAction.showToast({
      message:''+native.GetRouterPageNodeStateResult(1)
    })
  }
  onPageShow(): void {
    native.GetRouterStateOnShow()
    message:''+native.GetRouterPageNodeState()
    promptAction.showToast({
      message:''+native.GetRouterPageNodeStateResult(2)
    })
  }
  onPageHide(): void {
    native.GetRouterStateOnHide()
    message:''+native.GetRouterPageNodeState()
    promptAction.showToast({
      message:''+native.GetRouterPageNodeStateResult(3)
    })
  }
  onBackPress(): boolean | void {
    native.GetRouterStateOnBackPressed()
    message:''+native.GetRouterPageNodeState()
    promptAction.showToast({
      message:''+native.GetRouterPageNodeStateResult(4)
    })
  }
  build() {
    Column(){
      Text('第二页')
      Column() {
        ContentSlot(this.node)
      }.backgroundColor('#ff277599')
      Button('返回第一页')
        .onClick(()=>{
          router.back()
        })
        .id('goPageOne')
    }
    .backgroundColor('#ffcf9753')
    .width('100%')
    .height(100)
  }
}