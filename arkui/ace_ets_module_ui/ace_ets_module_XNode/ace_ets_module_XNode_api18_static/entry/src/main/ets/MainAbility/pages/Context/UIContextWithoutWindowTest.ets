'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { FrameNode, NodeController, BuilderNode } from '@ohos.arkui.node';
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Row,
  Margin,
  TextAlign,
  Button,
  ClickEvent,
  Stack,
  Visibility,
  FontWeight,
  Builder,
  WrappedBuilder,
  NodeContainer,
  CustomBuilder
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Component
struct TestComponent {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }
}

@Builder
function buildComponent() {
  TestComponent()
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;
  public childrenCount: number = 0;
  private uiContext: UIContext | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode<[]>(uiContext, { selfIdealSize: { width: 100, height: 50 } });
    this.builderNode?.build(new WrappedBuilder<CustomBuilder>(buildComponent));

    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.size = { width: 100, height: 100 };
      rootRenderNode!.backgroundColor = 0xff00ff00.toInt();
      const renderNode = this.builderNode?.getFrameNode()?.getRenderNode()
      if (renderNode !== null) {
        rootRenderNode!.appendChild(renderNode!);
      }
    }
    return this.rootNode;
  }

  createUIContextWithoutWindow(): string {
    let resultStr: string = '';
    let uiContext: UIContext | undefined = AppStorage.get<UIContext>('uiContext');
    let context: common.UIAbilityContext = this.uiContext?.getHostContext() as common.UIAbilityContext;
    try {
      uiContext = UIContext.createUIContextWithoutWindow(context);
      console.log('sally----- content1', JSON.stringify(uiContext)) //{"instanceId_":900000}
      resultStr = JSON.stringify(uiContext);
    } catch (e: Error) {
      resultStr = e.code + '';
    }
    return resultStr
  }

  createUIContextWithoutWindow401(): string {
    let errorStr: string = '';
    try {
      // UIContext.createUIContextWithoutWindow(null);
    } catch (e) {
      errorStr = (e as BusinessError).code + '';
    }
    return errorStr
  }

  destroyUIContextWithoutWindow(): string {
    let resultStr: string = '';
    console.log('click 07')
    UIContext.destroyUIContextWithoutWindow();
    console.log('click 08')
    resultStr = 'UIContext destroyed'
    return resultStr;
  }
}

@Entry
@Component
struct UIContextWithoutWindowTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State createStr: string = '5';
  @State errorStr: string = '1';
  @State destroyStr: string = '9';

  build() {
    Column() {
      NodeContainer(this.myNodeController).height('30%')
      Text(`${this.createStr}`).height('5%').id('create_str_id')
      Text(`${this.errorStr}`).height('5%').id('check_str_id')
      Text(`${this.destroyStr}`).height('5%').id('destroy_str_id')
      Button('create UIContext').height('5%')
        .id('create_context_id')
        .onClick((e: ClickEvent) => {
          console.log('click 01')
          this.createStr = this.myNodeController.createUIContextWithoutWindow();
          console.log('click 02')
        })
      Button('checkError').height('5%')
        .id('check_error_id')
        .onClick((e: ClickEvent) => {
          console.log('click 03')
          this.errorStr = this.myNodeController.createUIContextWithoutWindow401();
          console.log('click 04')
        })
      Button('destroy UIContext').height('5%')
        .id('destroy_context_id')
        .onClick((e: ClickEvent) => {
          console.log('click 05')
          this.destroyStr = this.myNodeController.destroyUIContextWithoutWindow();
          console.log('click 06')
        })
    }
    .height('100%')
  }
}