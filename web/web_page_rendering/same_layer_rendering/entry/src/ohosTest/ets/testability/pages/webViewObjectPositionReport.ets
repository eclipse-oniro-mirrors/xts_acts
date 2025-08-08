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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import display from '@ohos.display';

declare class Params {
  text : string
  text1 : string
  width : number
  height : number
}

declare class mapItem {
  surfaceId : string
  embedId : string
  width : number
  height : number
}

class MyNodeController extends NodeController {
  private rootNode : BuilderNode<[Params]> | undefined;
  private embedId_ : string = '';
  private surfaceId_ : string = '';
  private renderType_: NodeRenderType = NodeRenderType.RENDER_TYPE_DISPLAY;
  private width_ : number = 0;
  private height_ : number = 0;
  private isNode = true;

  setRenderOption(surfaceId: string, renderType: NodeRenderType, embedId: string, width: number, height: number) {
    this.surfaceId_ = surfaceId;
    this.renderType_ = renderType;
    this.embedId_ = embedId
    this.width_ = width;
    this.height_ = height;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new BuilderNode(uiContext, { surfaceId: this.surfaceId_, type: this.renderType_});
    if (this.isNode && this.rootNode) {
      this.rootNode.build(new WrappedBuilder(MyComponent.ButtonBuilder), { text: 'button1',
        text1: 'button2', width : this.width_, height : this.height_ })
      return this.rootNode.getFrameNode();
    } else {
      return null;
    }
  }
  getEmbedId() : string {
    return this.embedId_;
  }
  destroy() {
    this.isNode = false
  }
  add() {
    this.isNode = true
  }
  postEvent(event:TouchEvent | undefined) : boolean {
    return this.rootNode?.postTouchEvent(event) as boolean
  }
}


@Component
struct MyComponent {
  @Prop params: Params
  @State bkColor: Color = Color.Red
  @State index: Boolean = false;
  @Builder static ButtonBuilder(params: Params) {
    MyComponent({ params: params })
      .backgroundColor(Color.Green)
  }
  build() {
    Column({ space: 3 }) {
      Button(this.params.text)
        .height(100 + 'px')
        .width(400 + 'px')
        .border({ width: 2, color: Color.Red })
        .backgroundColor(this.bkColor)
        .onClick(() => {
          this.index =! this.index
          if (this.index) {
            this.bkColor = Color.Blue
          }
          else {
            this.bkColor = Color.Red
          }
        })
    }
    .width(this.params.width)
    .height(this.params.height)
  }
}

@Entry
@Component
struct webViewObjectPositionReport {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  private embedMap : Map<string, mapItem> = new Map();
  private nodeController: MyNodeController = new MyNodeController();
  @State nodeContainerWidth : number = 0;
  @State nodeContainerHeight : number = 0;
  @State isChange: boolean = false;
  @State oldPosition: string = '';
  @State newPosition: string = '';
  @State oldWindowOrientation: number = 0;

  aboutToAppear () {
    this.oldWindowOrientation = display.getDefaultDisplaySync().orientation;
    console.log('oldWindowOrientation===>' + this.oldWindowOrientation);
    let context = getContext(this) as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(window.Orientation.PORTRAIT);
    })
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    let context = getContext(this) as common.UIAbilityContext;
    if (this.oldWindowOrientation === 0) {
      window.getLastWindow(context).then((lastWindow) => {
        lastWindow.setPreferredOrientation(window.Orientation.PORTRAIT);
      })
    } else if (this.oldWindowOrientation === 1) {
      window.getLastWindow(context).then((lastWindow) => {
        lastWindow.setPreferredOrientation(window.Orientation.LANDSCAPE);
      })
    }
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewObjectPositionReportButton')
          .onClick(async () => {
            console.info("key==>" + this.emitKey)
            await Utils.sleep(2000);
            switch (this.emitKey) {
              case 'emitWebViewObjectPositionReport': {
                try {
                  if ( Utils.isPC(this.controller) ) {
                    Utils.emitEvent('success', 8018);
                    return
                  }
                  this.controller.runJavaScript('positionMove()')
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
            }
          })
      }
      Stack() {
        NodeContainer(this.nodeController)
          .width(this.nodeContainerWidth)
          .height(this.nodeContainerHeight)
          .backgroundColor(Color.Yellow)
          Web({ src: $rawfile('objectMove.html'), controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .enableNativeEmbedMode(true)
            .registerNativeEmbedRule('object', 'application/view')
            .onNativeEmbedLifecycleChange((embed) => {
              console.log('NativeEmbed surfaceId' + embed.surfaceId);
              console.log('NativeEmbed embed.info.tag' + embed.info?.tag);
              if (embed.status == NativeEmbedStatus.CREATE) {
                console.log('NativeEmbed create' + JSON.stringify(embed.info));
                this.embedMap.set(embed.info?.id as string, {surfaceId : embed.surfaceId as string,
                  embedId : embed.embedId as string, width : embed.info?.width as number, height : embed.info?.height as number})
                this.oldPosition = JSON.stringify(embed.info?.position);
                if (this.embedMap.size === 1) {
                  this.nodeController.setRenderOption(this.embedMap?.get('cameraTest')?.surfaceId as string, NodeRenderType.RENDER_TYPE_TEXTURE,
                    this.embedMap?.get('cameraTest')?.embedId as string, px2vp(this.embedMap?.get("cameraTest")?.width),
                    px2vp(this.embedMap?.get('cameraTest')?.height))
                  this.nodeController.rebuild()
                  console.log('surfaceId = ' + this.embedMap?.get('cameraTest')?.surfaceId);
                  this.nodeContainerWidth = px2vp(this.embedMap?.get('cameraTest')?.width);
                  this.nodeContainerHeight = px2vp(this.embedMap?.get('cameraTest')?.height);

                }
              }else if (embed.status == NativeEmbedStatus.UPDATE) {
                console.log('NativeEmbed update' + JSON.stringify(embed.info));
                this.newPosition = JSON.stringify(embed.info?.position);
                if (this.oldPosition != this.newPosition) {
                  Utils.emitEvent('success', 8018);
                } else {
                  Utils.emitEvent('error', 8018);
                }
              } else {
                console.log('NativeEmbed destroy' + JSON.stringify(embed.info));
              }
        })


      }
    }
  }
}
