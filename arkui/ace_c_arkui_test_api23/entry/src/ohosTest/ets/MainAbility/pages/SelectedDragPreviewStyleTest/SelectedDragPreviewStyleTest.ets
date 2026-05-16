import nativeNode from "libnativeNode.so";
import { UIContext } from '@ohos.arkui.UIContext';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct SelectedDragPreviewStyleTest {
  PAGE_TAG: string = 'SelectedDragPreviewStyleTest';
  @Builder
  DraggingBuilder() {
    Column() {
      Text("hello")
    }
  }

  @State value: number = 40
  @State _pixelMap: image.PixelMap|undefined = undefined;

  build() {
    Column() {
      Text('start Drag')
        .fontSize(18)
        .width('100%')
        .height(40)
        .margin(10)
        .backgroundColor('#008888')
      XComponent({
        id: 'dragStart',
        type: "node",
        libraryname: 'nativeNode'
      })
        .onAppear(() => {
          nativeNode.createNativeNode("dragStart", this.getUIContext());
        })
        .height('100%')
        .width('100%')
        .backgroundColor('#FFFAFA')
    }.height('100%').width('100%')
  }
}