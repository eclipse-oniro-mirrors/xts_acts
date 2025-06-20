/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { UIContext } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public node: FrameNode | null = null;

  public imageNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute.width('100%').height('100%')

    let image = typeNode.createNode(uiContext, 'Image');
    image.initialize($r('app.media.apple')).width('100%').height('100%').autoResize(true)
    this.imageNode = image;

    this.node.appendChild(image);
    return this.node;
  }
}

@Entry
@Component
struct SnapshotExample {
  private myNodeController: MyNodeController = new MyNodeController();

  @State pixmap: image.PixelMap | undefined = undefined

  @State text: string = 'text'
  @State snapshotScale: number = 1
  @State snapshotWait: boolean = false

  build() {
    Column() {
      Text(this.text).id('resultText')
      Row() {
        Image(this.pixmap).width(200).height(200).border({ color: Color.Black, width: 2 }).margin(5)
        NodeContainer(this.myNodeController).width(200).height(200).margin(5)
      }

      Button('Scale: ' + this.snapshotScale)
        .id('snapshotScale')
        .margin(10)
        .onClick(() => {
          this.snapshotScale+= 0.5
        })

      Button('snapshotWait: ' + this.snapshotWait)
        .id('snapshotWait')
        .margin(10)
        .onClick(() => {
          this.snapshotWait = !this.snapshotWait
        })

      Button('UniqueId get snapshot')
        .id('UniqueId_getSnapshot')
        .onClick(() => {
          try {
            this.getUIContext()
              .getComponentSnapshot()
              .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                {scale: this.snapshotScale, waitUntilRenderFinished: this.snapshotWait})
              .then((pixmap: image.PixelMap) => {
                this.pixmap = pixmap
                this.text = 'UniqueId_getSnapshot_success'
              })
              .catch((err: Error) => {
                console.log('error: ' + err)
              })
          } catch (error) {
            console.error('UniqueId get snapshot Error: ' + JSON.stringify(error))
          }
        }).margin(10)

      Button('UniqueId getSync snapshot')
        .id('UniqueId_getSyncSnapshot')
        .onClick(() => {
          try {
            this.pixmap = this.getUIContext()
              .getComponentSnapshot()
              .getSyncWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                {scale: this.snapshotScale, waitUntilRenderFinished: this.snapshotWait})
            this.text = 'UniqueId_getSyncSnapshot_success'
          } catch (error) {
            console.error('UniqueId getSync snapshot Error: ' + JSON.stringify(error))
          }
        }).margin(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}