import nativeScrollNDK from 'libnativetype.so';
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct Scrollable{
  @State message: string = '111'
  @State text: string = '';
  private nodeContent:Content = new NodeContent();
  aboutToAppear() {
    nativeScrollNDK.CreateGestureNode1(this.nodeContent)
  }
  build() {
    Column() {
      ContentSlot(this.nodeContent)
    }.size({ width: '100%', height: '100%' })
  }
}