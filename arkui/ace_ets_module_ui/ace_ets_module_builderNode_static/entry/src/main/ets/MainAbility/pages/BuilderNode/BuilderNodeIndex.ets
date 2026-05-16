'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Text, Button, WrappedBuilder, CustomBuilder, wrapBuilder } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { BuilderNode, NodeRenderType } from 'arkui.BuilderNode';
import { FrameNode } from 'arkui.FrameNode';
import { CompetitionStrategy } from '@ohos.arkui.component';

@Builder
function myNodeBuilder() {
  Column() {
    Text('Hello BuilderNode').fontSize(16).key('builderChild').id('builderChild')
    Text('BuilderNode Content').fontSize(14)
  }.width('100%').height(80).backgroundColor('#DDEEFF')
}

@Entry
@Component
struct BuilderNodeIndex {
  @State builderNodeStatus: string = 'pending';
  @State frameNodeStatus: string = 'pending';
  @State postTouchStatus: string = 'pending';
  @State postInputStatus: string = 'pending';
  @State disposeStatus: string = 'pending';
  @State isDisposedStatus: string = 'pending';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] BuilderNodeIndex aboutToAppear error ' + error);
    }
  }

  onPageShow() {
    try {
      let uiCtx: UIContext = this.getUIContext();
      let builderNode = new BuilderNode(uiCtx);
      let wrappedBuilder: WrappedBuilder<CustomBuilder> = wrapBuilder(myNodeBuilder);
      builderNode.build(wrappedBuilder);
      this.builderNodeStatus = 'created';
      AppStorage.setOrCreate<string>('builderNodeCreated', 'true');

      let frameNode: FrameNode | null = builderNode.getFrameNode();
      this.frameNodeStatus = frameNode != null ? 'hasFrame' : 'nullFrame';
      AppStorage.setOrCreate<string>('builderNodeFrameNode', this.frameNodeStatus);

      try {
        let postResult = builderNode.postTouchEvent(undefined!);
        this.postTouchStatus = 'called:' + String(postResult);
      } catch (postErr) {
        this.postTouchStatus = 'called_with_error';
      }
      AppStorage.setOrCreate<string>('postTouchEventResult', this.postTouchStatus);

      try {
        let postInputResult = builderNode.postInputEvent(undefined!);
        this.postInputStatus = 'called:' + String(postInputResult);
      } catch (postInputErr) {
        this.postInputStatus = 'called_with_error';
      }
      AppStorage.setOrCreate<string>('postInputEventResult', this.postInputStatus);

      try {
        builderNode.dispose();
        this.disposeStatus = 'disposed';
      } catch (disposeErr) {
        this.disposeStatus = 'dispose_error';
      }
      AppStorage.setOrCreate<string>('builderNodeDisposed', this.disposeStatus);

      try {
        let disposed = builderNode.isDisposed();
        this.isDisposedStatus = String(disposed);
      } catch (isDispErr) {
        this.isDisposedStatus = 'isDisposed_error';
      }
      AppStorage.setOrCreate<string>('builderNodeIsDisposed', this.isDisposedStatus);

      AppStorage.setOrCreate<string>('nodeRenderTypeDisplay', String(NodeRenderType.RENDER_TYPE_DISPLAY));
      AppStorage.setOrCreate<string>('nodeRenderTypeTexture', String(NodeRenderType.RENDER_TYPE_TEXTURE));
      AppStorage.setOrCreate<string>('competitionStrategyDefault', String(CompetitionStrategy.DEFAULT));
      AppStorage.setOrCreate<string>('competitionStrategyCompetition', String(CompetitionStrategy.COMPETITION));
    } catch (error) {
      console.error('[ARKUI_NEW] BuilderNodeIndex onPageShow error: ' + error);
      this.builderNodeStatus = 'error';
    }
  }

  build() {
    Column() {
      Text('BuilderNode Test Page')
        .key('builderNodeRoot').id('builderNodeRoot').fontSize(20).fontWeight(500)

      Text('BuilderNode: ' + this.builderNodeStatus)
        .fontSize(14).key('bnStatusCreated').id('bnStatusCreated')

      Text('FrameNode: ' + this.frameNodeStatus)
        .fontSize(14).key('bnStatusFrame').id('bnStatusFrame')

      Text('postTouchEvent: ' + this.postTouchStatus)
        .fontSize(14).key('bnStatusPostTouch').id('bnStatusPostTouch')

      Text('postInputEvent: ' + this.postInputStatus)
        .fontSize(14).key('bnStatusPostInput').id('bnStatusPostInput')

      Text('dispose: ' + this.disposeStatus)
        .fontSize(14).key('bnStatusDispose').id('bnStatusDispose')

      Text('isDisposed: ' + this.isDisposedStatus)
        .fontSize(14).key('bnStatusIsDisposed').id('bnStatusIsDisposed')

      Text('RenderType DISPLAY=' + String(NodeRenderType.RENDER_TYPE_DISPLAY))
        .fontSize(12).key('bnRenderDisplay').id('bnRenderDisplay')

      Text('RenderType TEXTURE=' + String(NodeRenderType.RENDER_TYPE_TEXTURE))
        .fontSize(12).key('bnRenderTexture').id('bnRenderTexture')

      Text('CompetitionStrategy DEFAULT=' + String(CompetitionStrategy.DEFAULT) +
        ' COMPETITION=' + String(CompetitionStrategy.COMPETITION))
        .fontSize(12).key('bnCompetition').id('bnCompetition')

      Button('BuilderNode APIs')
        .key('builderNodeBtn').id('builderNodeBtn')
        .fontSize(14).width('80%').margin({ top: 10 })
    }.width('100%').height('100%').padding(8)
  }
}
