/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

export function testInvalidateAttributes(params:FrameNode):boolean {
  params.invalidateAttributes();
  return true;
}

class MyNodeAdapterController extends NodeController {
  private imageUrl:string = '';
  public result1:boolean = false;
  public result2:boolean = false;
  constructor(imageUrl:string) {
    super();
    this.imageUrl = imageUrl;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    let rootNode = new FrameNode(uiContext);
    let imageNode = typeNode.createNode(uiContext, 'Image');
    let columnNode = typeNode.createNode(uiContext,'Column');
    columnNode.commonAttribute.width(300);
    columnNode.commonAttribute.height(300);
    columnNode.commonAttribute.background(Color.Orange);
    this.result1 = testInvalidateAttributes(columnNode);
    imageNode.initialize($r(this.imageUrl));
    imageNode.attribute.syncLoad(true).width(100).height(100);
    this.result2 = testInvalidateAttributes(imageNode)
    rootNode.appendChild(columnNode);
    rootNode.appendChild(imageNode);
    return rootNode;
  }
}

@Entry
@Component
struct ListNodeTest {
  @State flag: boolean = true;
  adapterController: MyNodeAdapterController = new MyNodeAdapterController('app.media.startIcon');
  @State testMessage:string = 'false';

  build() {
    Column() {
      if (this.flag) {
        NodeContainer(this.adapterController)
          .width('50%').height('30%')
          .borderWidth(1).borderColor(Color.Black)
      } else {
        NodeContainer(this.adapterController)
          .width('50%').height('30%')
          .borderWidth(1).borderColor(Color.Black)
      }
      Button('change').id('change_id')
        .height('5%')
        .onClick(() => {
          this.flag = !this.flag;
          this.testMessage = this.adapterController.result2 + '';
        })
      Text(this.testMessage).id('testMessage_id').height('5%')
    }.borderWidth(1)
    .width('100%')
  }
}