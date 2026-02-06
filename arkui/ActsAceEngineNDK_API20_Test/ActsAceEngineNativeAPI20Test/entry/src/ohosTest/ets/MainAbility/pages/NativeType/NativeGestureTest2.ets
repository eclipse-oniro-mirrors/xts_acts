import nativeGestureNdk from 'libnativetype.so';
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct NativeGestureTest2 {
  @State message: string = '111'
  @State text: string = '';
  private nodeContent: Content = new NodeContent();

  aboutToAppear() {
    nativeGestureNdk.CreateGestureNode2(this.nodeContent)
  }

  build() {
    Column() {
      ContentSlot(this.nodeContent)

    }.size({ width: '100%', height: '100%' })
  }
}