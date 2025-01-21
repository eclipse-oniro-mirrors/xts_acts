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
import { FrameNode, NodeController, BuilderNode } from "@ohos.arkui.node"

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    let frameNode = new FrameNode(uiContext);
    let childList = new Array<FrameNode>();
    let y = 100;
    for (let i = 0; i < 5; i++) {
      let childNode = new FrameNode(uiContext);
      if (i!= 4) {
        childNode.commonAttribute.position({x:i*10,y:y}).backgroundColor(Color.Blue).size({width:50,height:50}).key(`sally${i}`)
      } else {
        childNode.commonAttribute.position({x:i*10,y:y}).backgroundColor(Color.Green).size({width:100,height:110}).key('sallychild1')
        childNode.setMeasuredSize({width:235,height:235})
      }
      y = y+20
      childList.push(childNode)
      frameNode.appendChild(childNode)
    }
    this.rootNode.appendChild(frameNode)
    this.rootNode.commonAttribute.size({width:'100%',height:'100%'}).backgroundColor(Color.Gray)

    return this.rootNode;
  }
}


@Entry
@Component
struct GetAttachedFramenodeByID {
  @State message: string = "Hello World"
  @State myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController)
        .width('100%')
        .height(400)

      Text(this.message)
        .id("GetAttachedFramenodeByIDText")
        .fontSize(50)
        .fontWeight(700)

      Button('点击测试getAttachedFrameNode')
        .id("GetAttachedFramenodeByIDButton")
        .onClick(() => {
          let frame = this.getUIContext().getAttachedFrameNodeById('sallychild1')
          if (frame != null && JSON.stringify(frame.getUserConfigSize().width) == '{"unit":1,"value":100}'
            && JSON.stringify(frame.getUserConfigSize().height) == '{"unit":1,"value":110}' && frame.getParent()!.getChildrenCount() == 5) {
            this.message = 'Hello Sally'
            console.log(`sally----- getAttachedFrameNodeById('sallychild1') is ` + frame.getNodeType())
            console.log(`sally----- getAttachedFrameNodeById('sallychild1') getUserConfigSize is ` + JSON.stringify(frame.getUserConfigSize()))
            console.log(`sally----- getAttachedFrameNodeById('sallychild1') getMeasuredSize is ` + JSON.stringify(frame.getMeasuredSize()))
          } else {
            console.log(`sally----- getAttachedFrameNodeById('sallychild1') is ` + frame)
          }
        })

      Button('点击测试getAttachedFrameNode2')
        .id("GetAttachedFramenodeByIDButton2")
        .onClick(() => {
          let frame = this.getUIContext().getAttachedFrameNodeById('sallychild2')
          if (frame === null) {
            this.message = 'Hello Null'
            console.log(`sally----- getAttachedFrameNodeById('sallychild2') is ` + frame)
          } else {
            console.log(`sally----- getAttachedFrameNodeById('sallychild2') is ` + frame)
          }
        })
    }
  }
}