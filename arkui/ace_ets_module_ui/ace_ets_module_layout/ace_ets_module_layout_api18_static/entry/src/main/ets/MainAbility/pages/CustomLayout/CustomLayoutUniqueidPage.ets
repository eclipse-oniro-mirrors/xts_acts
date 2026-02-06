'use static';
/*
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
import { FrameNode, NodeController } from '@ohos.arkui.node';
import {
  Entry,
  NodeContainer,
  Text,
  Column,
  Component,
  ColumnOptions,
  Color,
  $r,
  ImageLoadResult,
  Builder,
  BuilderParam,
  SizeResult,
  GeometryInfo,
  Layoutable,
  ConstraintSizeOptions,
  GeometryInfo,
  Measurable,
  ConstraintSizeOptions,
  ForEach,
  CustomLayout
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomLayoutUniqueidPage {
  build() {
    Column() {
      CustomLayout1()
    }
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext)
    return this.rootNode
  }
}

@CustomLayout
@Component
struct CustomLayout1 {
  @Builder
  childrenBuilder() {
    ForEach([0, 1], (item: Int, index: int) => {
      NodeContainer(new MyNodeController())
        .id('CustomLayoutUniqueid_NodeContainer_' + index)
    })
  };

  @BuilderParam builder: () => void = this.childrenBuilder;
  result: SizeResult = {
    width: 0,
    height: 0
  } as SizeResult;

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    let prev: number = 0;
    children.forEach((child, index) => {
      AppStorage.setOrCreate<Int>('CustomLayoutUniqueid_onPlaceChildren_UniqueId_' + index, child.uniqueId!)
      let pos: number = prev + 10;
      prev = pos + child.measureResult.width
      child.layout({ x: pos, y: 0 })
    })
  }

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>, constraint: ConstraintSizeOptions) {
    let size = 100;
    children.forEach((child, index) => {
      AppStorage.setOrCreate<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_' + index, child.uniqueId!)
      const uiContext = this.getUIContext()
      const nodeContainerFrameNode = uiContext.getFrameNodeById('CustomLayoutUniqueid_NodeContainer_' + index)
      AppStorage.setOrCreate<Int>('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_' + index, child.uniqueId!)
      if (uiContext) {
        let node: FrameNode | null =
          uiContext.getFrameNodeByUniqueId(child.uniqueId! as Int)
        if (node) {
          console.info("hpc_ 333333")
          node.getChild(0)!.commonAttribute.id('CustomLayoutUniqueid_Child_' + index)
          node.getChild(0)!.commonAttribute.width(100)
          node.getChild(0)!.commonAttribute.height(100)
          node.getChild(0)!.commonAttribute.backgroundColor(Color.Pink)
        }
      }
      child.measure({
        minHeight: size,
        minWidth: size,
        maxWidth: size,
        maxHeight: size
      })
    })
    this.result.width = 300;
    this.result.height = 100;
    return this.result;
  }

  build() {
    this.builder()
  }
}