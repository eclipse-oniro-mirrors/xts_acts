import nativegesturendk from 'libnativegesturendk.so'
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct NativeGestureTest1 {
  @State message: string = '111'
  @State text: string = '';
  private node:Content = new NodeContent();
  aboutToAppear() {
    nativegesturendk.CreateGestureNode1(this.node)
  }

  build() {
    Column() {
      ContentSlot(this.node)

    }.size({ width: '100%', height: '100%' })
  }
}