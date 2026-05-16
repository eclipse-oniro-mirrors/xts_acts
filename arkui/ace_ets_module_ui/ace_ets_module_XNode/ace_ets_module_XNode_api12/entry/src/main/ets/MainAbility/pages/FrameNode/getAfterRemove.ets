/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { RenderNode, FrameNode, NodeController, DrawContext } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  public getPreviousAfterRemove1 = '0';
  public getNextAfterRemove1 = '0';
  public getParentAfterRemove1 = '0';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const renderNode = this.rootNode.getRenderNode();
    if (renderNode === null) {
      return this.rootNode;
    }
    let x = 10
    for (let i = 0; i < 4; i++) {
      let childNode = new FrameNode(uiContext);
      childNode.commonAttribute.position({x:x,y:x}).width(10).height(10).backgroundColor(Color.Green)
      this.rootNode.appendChild(childNode);
      x = x + 20
    }
    return this.rootNode;
  }

  removeChild(idx:number){
    let child = this.rootNode?.getChild(idx)
    if (child){
      this.rootNode?.removeChild(child)
      console.log(`sally-----removechild(${idx})`)
      let getPreviousAfterRemove = child.getPreviousSibling()
      console.log(`sally-----getPreviousAfterRemove(${idx}) is ${getPreviousAfterRemove}`)
      let getNextAfterRemove = child.getNextSibling()
      console.log(`sally-----getNextAfterRemove(${idx}) is ${getNextAfterRemove}`)
      let getParentAfterRemove = child.getParent()
      console.log(`sally-----getParentAfterRemove(${idx}) is ${getParentAfterRemove}`)

      this.getPreviousAfterRemove1 = getPreviousAfterRemove + '';
      this.getNextAfterRemove1 = getNextAfterRemove + '';
      this.getParentAfterRemove1 = getParentAfterRemove + '';
    }
  }

  getPreviousSibling(idx:number){
    let child = this.rootNode?.getChild(idx)
    if (child){
      let previousSibling = child.getPreviousSibling()
      console.log(`sally-----getPreviousSibling(${idx}) is ${previousSibling}}`)
    }
  }

  getNextSibling(idx:number){
    let child = this.rootNode?.getChild(idx)
    if (child){
      let nextSibling = child.getNextSibling()
      console.log(`sally-----getNextSibling(${idx}) is ${nextSibling}}`)
    }
  }
}

@Entry
@Component
struct GetAfterRemove {
  private baseNode: MyNodeController = new MyNodeController()
  @State idx : number = 0
  @State getPreviousAfterRemove : string = '0'
  @State getNextAfterRemove : string = '0'
  @State getParentAfterRemove : string = '0'

  build() {
    Column() {
      Column() {
        NodeContainer(this.baseNode)
          .width('100%')
          .height('30%')
          .backgroundColor(Color.Gray)
        Row(){
          Text('currentIndex is '+this.idx)
          Button('idx++')
            .onClick(() => {
              this.idx++
            })
          Button('idx--')
            .onClick(() => {
              this.idx--
            })
        }.height('30%')

        Button('removeChild').height('5%')
          .id('removeChildButton')
          .onClick(() => {
            this.baseNode.removeChild(this.idx)
            this.getPreviousAfterRemove = this.baseNode.getPreviousAfterRemove1
            this.getNextAfterRemove = this.baseNode.getNextAfterRemove1
            this.getParentAfterRemove = this.baseNode.getParentAfterRemove1
          })

        Text(this.getPreviousAfterRemove).height('5%')
          .id('getPreviousAfterRemoveText')
        Text(this.getNextAfterRemove).height('5%')
          .id('getNextAfterRemoveText')
        Text(this.getParentAfterRemove).height('5%')
          .id('getParentAfterRemoveText')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}