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
import { NodeController, BuilderNode, FrameNode, UIContext } from '@kit.ArkUI';

class Params {
  public text: string = ''
  constructor(text: string) {
    this.text = text;
  }
}

let globalBuilderNode: BuilderNode<[Params]> | null = null;

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin({bottom: 15})
    Test()
  }
}

class TextNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(context);
    if (globalBuilderNode === null) {
      globalBuilderNode = new BuilderNode(context);
      globalBuilderNode.build(wrapBuilder<[Params]>(buildText), new Params('builder node text'))

    }
    this.rootNode.appendChild(globalBuilderNode.getFrameNode());
    return this.rootNode;
  }
}

let localStorage1: LocalStorage = new LocalStorage();
localStorage1.setOrCreate('PropA', 'PropA');

@Entry(localStorage1)
@Component
struct BuilderNodeTest2 {
  private controller: TextNodeController = new TextNodeController();
  @LocalStorageLink('PropA') propA: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.propA).id('partA_text')
        Button('ccc').id('btn_ccc')
          .onClick(()=>{
            this.propA = 'sss'
          }).width(80)
        NodeContainer(this.controller)
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}

@Component
struct Test {
  @LocalStorageLink('PropA') propA: string = 'NO Localstorage';

  build() {
    Column() {
      Row(){
        Text('Test Provider: ')
        Text(this.propA).id('component_text')
      }
    }
  }
}