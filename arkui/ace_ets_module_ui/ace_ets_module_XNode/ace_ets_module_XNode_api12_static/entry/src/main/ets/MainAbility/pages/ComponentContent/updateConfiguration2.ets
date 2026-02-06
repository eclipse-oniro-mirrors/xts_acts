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
import {
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign, wrapBuilder,CustomBuilderT,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row,  $r,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, FrameNode, ComponentContent, typeNode } from '@ohos.arkui.node';
import EnvironmentCallback from '@ohos.app.ability.EnvironmentCallback';
import { Configuration } from '@ohos.app.ability.Configuration';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';


@Builder
function buildText() {
  Column() {
    Text('hello')
      .width(50)
      .height(50)
      .fontColor($r(`app.color.text_color`))
  }.backgroundColor($r(`app.color.start_window_background`))
}

const componentContentMap: Array<ComponentContent<Object>> = new Array<ComponentContent<Object>>();

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    return this.rootNode;
  }

  createNode(context: UIContext) {
    this.rootNode = new FrameNode(context);
    let component = new ComponentContent<Object>(context, wrapBuilder<CustomBuilderT<Object>>(buildText),{} );
    componentContentMap.push(component);
    this.rootNode!.addComponentContent(component);
  }

  deleteNode() {
    let node = componentContentMap.pop();
    this.rootNode?.dispose();
    node?.dispose();
  }
}

interface ComponentContentWithUpdateConfiguration { updateConfiguration?: () => void }
function updateColorMode() {
  componentContentMap.forEach((value, index) => {
    (value as ComponentContentWithUpdateConfiguration).updateConfiguration?.();
  })
}

@Entry
@Component
struct FrameNodeTypeTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State mText: string = 'init'

  aboutToAppear(): void {
    // let environmentCallback: EnvironmentCallback = {
    //   onMemoryLevel: (level: AbilityConstant.MemoryLevel): void => {
    //     console.log('onMemoryLevel');
    //   },
    //   onConfigurationUpdated: (config: Configuration): void => {
    //     console.log('onConfigurationUpdated ' + JSON.stringify(config));
    //     updateColorMode();
    //   }
    // }
    // // 注册监听回调
    // this.getUIContext().getHostContext()?.getApplicationContext().on('environment', environmentCallback);
    // this.myNodeController.createNode(this.getUIContext());
  }

  aboutToDisappear(): void {
    //移除map中的引用，并将自定义节点释放
    this.myNodeController.deleteNode();
  }

  build() {
    Column({ space: 12 } as ColumnOptions) {
      Text(this.mText)
        .id('updateConfiguration2')
        .margin(20)
      NodeContainer(this.myNodeController);
      Button('Trigger')
        .id('btn2')
        .onClick((e:ClickEvent) => {
          this.mText = 'updateConfiguration'
        })
    }
  }
}