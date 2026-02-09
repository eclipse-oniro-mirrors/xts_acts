import { FrameNode, NodeController, NodeAdapter, typeNode } from '@kit.ArkUI';

@Entry
@Component
struct  isTransferredIndex {
  build() {
    Column(undefined) {
      Button('ui context trans test')
        .id('btn_isTransferred')
        .backgroundColor('#FFFFFF0BFF')
        .onClick(() => {
          // 打印frameNodeStatic.isTransferred()为true。
          let node = new FrameNode(this.getUIContext());
          if (node != null) {

            AppStorage.SetOrCreate('isTransferredFalse', node.isTransferred());
            console.log('frameNodeStatic isTransferred value is ' + node.isTransferred());
          }
        })
    }
  }
}