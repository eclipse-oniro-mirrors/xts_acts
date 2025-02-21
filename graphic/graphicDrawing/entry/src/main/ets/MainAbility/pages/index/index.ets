/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../../../test/List.test'
import { NodeController, FrameNode, RenderNode, DrawContext } from "@ohos.arkui.node"
import image from '@ohos.multimedia.image';
import taskpool from '@ohos.taskpool';
import buffer from '@ohos.buffer';
import { UIContext } from '@ohos.arkui.UIContext';
import drawing from "@ohos.graphics.drawing"

async function CreatePixelMapAsync() {
  const color: ArrayBuffer = new ArrayBuffer(40000); //96为需要创建的像素buffer大小，取值为：height * width *4
  let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 100, width: 100 } }
  const pixel = await image.createPixelMap(color, opts);
  return pixel;
}

class MyRenderNode extends RenderNode {
  pixelMap: image.PixelMap | null = null;

  async draw(context: DrawContext) {
    console.log('enter draw canvas is: ' + JSON.stringify(context))
  }
}

const newNode = new MyRenderNode();
newNode.frame = { x: 0, y: 0, width: 150, height: 150 };
newNode.pivot = { x: 0.2, y: 0.8 };
newNode.scale = { x: 1, y: 1 };


class MyNodeController extends NodeController {
  async aboutToAppear() {
        console.log('MyNodeController aboutToAppear begin')
        let task = new taskpool.Task(CreatePixelMapAsync);
        console.log('MyNodeController aboutToAppear task is '+JSON.stringify(task))
        await taskpool.execute(task).then((pixel: Object) => {
          newNode.pixelMap = pixel as image.PixelMap
          console.info("newNode.pixelMap is: "+JSON.stringify(pixel))
        }).catch(err=>{
          console.info("newNode.pixelMap error is: "+JSON.stringify(err))
        })
        console.log('MyNodeController aboutToAppear end')
  }

  private rootNode: FrameNode | null = null

  makeNode(uiContext: UIContext):
    FrameNode {
    console.log("makeNode begin")
    this.rootNode = new FrameNode(uiContext);
    const renderNode = this.rootNode.getRenderNode();
    renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
    renderNode.pivot = { x: 50, y: 50 };
    renderNode.appendChild(newNode);
    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  async aboutToAppear() {
    console.info("start run testcase!!!!")
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text('Hello World')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('next page')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .onClick(() => {

        })
      }
      .width('100%')
      .height('20%')

      Column() {
        NodeContainer(new MyNodeController()).width('100%').backgroundColor('#ffccff')
        Button('UpdateDrawNode').onClick(() => {
          console.log('Drawing node update')
          newNode.invalidate();
        })
      }
      .width('100%')
      .height('80%')

    }.width('100%')
    .height('100%')
  }
}