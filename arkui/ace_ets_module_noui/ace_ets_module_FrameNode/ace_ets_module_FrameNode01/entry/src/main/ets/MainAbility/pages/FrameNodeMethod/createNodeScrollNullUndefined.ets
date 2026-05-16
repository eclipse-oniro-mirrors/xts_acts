/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

class MyProgressNode extends NodeController {
  public uiContext: UIContext | null = null;
  public rootNode: FrameNode | null = null;
  public controller: XComponentController = new XComponentController();
  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    let node = typeNode.createNode(uiContext, 'Progress');
    node.initialize({
      value: 15,
      total: 200,
      type: ProgressType.ScaleRing
    }).width(100)
      .height(100)

    try {
      typeNode.createNode(null, 'Scroll')
      console.info(`win6 Scroll`);
    } catch (err) {
      console.info(`win6 Scroll` + err.code);
      AppStorage.SetOrCreate('createNodeScrollNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Scroll')
      console.info(`win6 Scroll`);
    } catch (err) {
      console.info(`win6 Scroll` + err.code);
      AppStorage.SetOrCreate('createNodeScrollUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'List')
      console.info(`win6 List`);
    } catch (err) {
      console.info(`win6 List` + err.code);
      AppStorage.SetOrCreate('createNodeListNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'List')
      console.info(`win6 List`);
    } catch (err) {
      console.info(`win6 List` + err.code);
      AppStorage.SetOrCreate('createNodeListUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'ListItem')
      console.info(`win6 ListItem`);
    } catch (err) {
      console.info(`win6 ListItem` + err.code);
      AppStorage.SetOrCreate('createNodeListItemNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'ListItem')
      console.info(`win6 ListItem`);
    } catch (err) {
      console.info(`win6 ListItem` + err.code);
      AppStorage.SetOrCreate('createNodeListItemUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'ListItemGroup')
      console.info(`win6 ListItemGroup`);
    } catch (err) {
      console.info(`win6 ListItemGroup` + err.code);
      AppStorage.SetOrCreate('createNodeListItemGroupNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'ListItemGroup')
      console.info(`win6 ListItemGroup`);
    } catch (err) {
      console.info(`win6 ListItemGroup` + err.code);
      AppStorage.SetOrCreate('createNodeListItemGroupUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'WaterFlow')
      console.info(`win6 WaterFlow`);
    } catch (err) {
      console.info(`win6 WaterFlow` + err.code);
      AppStorage.SetOrCreate('createNodeWaterFlowNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'WaterFlow')
      console.info(`win6 WaterFlow`);
    } catch (err) {
      console.info(`win6 WaterFlow` + err.code);
      AppStorage.SetOrCreate('createNodeWaterFlowUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'FlowItem')
      console.info(`win6 FlowItem`);
    } catch (err) {
      console.info(`win6 FlowItem` + err.code);
      AppStorage.SetOrCreate('createNodeFlowItemNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'FlowItem')
      console.info(`win6 FlowItem`);
    } catch (err) {
      console.info(`win6 FlowItem` + err.code);
      AppStorage.SetOrCreate('createNodeFlowItemUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'Grid')
      console.info(`win6 Grid`);
    } catch (err) {
      console.info(`win6 Grid` + err.code);
      AppStorage.SetOrCreate('createNodeGridNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Grid')
      console.info(`win6 Grid`);
    } catch (err) {
      console.info(`win6 Grid` + err.code);
      AppStorage.SetOrCreate('createNodeGridUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'GridItem')
      console.info(`win6 GridItem`);
    } catch (err) {
      console.info(`win6 GridItem` + err.code);
      AppStorage.SetOrCreate('createNodeGridItemNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'GridItem')
      console.info(`win6 GridItem`);
    } catch (err) {
      console.info(`win6 GridItem` + err.code);
      AppStorage.SetOrCreate('createNodeGridItemUndefined', err.code);
    }

    this!.rootNode!.appendChild(node);
    return this.rootNode;
  }
}

@Entry
@Component
struct createNodeScrollNullUndefined {
  build() {
    Column({ space: 10 }) {
      NodeContainer(new MyProgressNode()).margin(5)
    }.width('100%').height('100%')
  }
}