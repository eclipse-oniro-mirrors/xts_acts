/**
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
import webview from '@ohos.web.webview';
import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, BuilderNode, NodeRenderType, FrameNode } from '@ohos.arkui.node';
import { BusinessError } from '@ohos.base';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';
import { Driver, MouseButton } from '@ohos.UiTest';

@Observed
declare class Params {
  textOne: string
  textTwo : string
  width : number
  height : number
}

declare class nodeControllerParams {
  surfaceId: string
  type : string
  renderType : NodeRenderType
  embedId : string
  width : number
  height : number
}

class MyNodeController extends NodeController {
  private rootNode: BuilderNode<[Params]> | undefined | null;
  private embedId_ : string = "";
  private surfaceId_: string = "";
  private renderType_: NodeRenderType = NodeRenderType.RENDER_TYPE_DISPLAY;
  private width_ : number = 0;
  private height_ : number = 0;
  private type_ : string = "";
  private isDestroy_ : boolean = false;

  setRenderOption(params : nodeControllerParams) {
    this.surfaceId_ = params.surfaceId
    this.renderType_ = params.renderType;
    this.embedId_ = params.embedId;
    this.width_ = params.width;
    this.height_ = params.height;
    this.type_ = params.type
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new BuilderNode(uiContext, { surfaceId: this.surfaceId_, type: this.renderType_ });
    if (this.type_ === 'native/web') {
      this.rootNode.build(wrapBuilder(WebBuilder), { textOne: "myButton1", textTwo: "myButton2", width : this.width_, height : this.height_ })
    }
    return this.rootNode.getFrameNode();
  }

  setBuilderNode(rootNode: BuilderNode<Params[]> | null): void {
    this.rootNode = rootNode;
  }

  getBuilderNode(): BuilderNode<[Params]> | undefined | null {
    return this.rootNode;
  }

  updateNode(arg: Object): void {
    this.rootNode?.update(arg);
  }

  getEmbedId() : string {
    return this.embedId_;
  }

  postEvent(event:TouchEvent | undefined) : boolean {
    return this.rootNode?.postTouchEvent(event) as boolean
  }

  setDestroy(isDestroy : boolean) : void {
    this.isDestroy_ = isDestroy;
    if (this.isDestroy_) {
      this.rootNode= null;
    }
  }
  postInputEvent(event: MouseEvent | TouchEvent | undefined): boolean {
    return this.rootNode?.postInputEvent(event) as boolean
  }
}

@Component
struct WebComponent {
  @Prop params: Params
  browserTabController: WebviewController = new webview.WebviewController()
  @State bkColor: Color = Color.Red
  @State index: Boolean = false

  build() {
    Column() {
      Web({ src: 'https://map.baidu.com/', controller: this.browserTabController })
        .domStorageAccess(true)//开启数据库存储权限
        .databaseAccess(true)//图片加载相关权限
        .imageAccess(true)
        .onlineImageAccess(true)//支持缩放
        .zoomAccess(true)//支持JS代码运行
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .cacheMode(CacheMode.Default)
        .pinchSmooth(true)
        .fileAccess(true)
        .width(280)
        .height(400)
        .onMouse((event)=> {
          console.log ("zhouke, event:" + JSON.stringify(event))
        })
        .onTouchIntercept((event : TouchEvent) => {
          return HitTestMode.Transparent
        })
    }
    .width(this.params.width)
    .height(this.params.height)
  }
}

@Builder
function WebBuilder(params: Params) {
  WebComponent({ params: params })
    .backgroundColor(Color.Green)
}

@Entry
@Component
struct WebIndex {
  browserTabController: WebviewController = new webview.WebviewController()
  private nodeControllerMap: Map<string, MyNodeController> = new Map();
  @State componentIdArr: Array<string> = []
  @State isGetPermission:boolean = false;
  @State num : number = 0
  @State eventType: string = '触碰类型'
  @State eventType2: string = '触碰次数'
  @State eventType3: string = '返回类型'
  @State edges: Edges = {};
  @State positionMap: Map<string, Edges> = new Map();
  @State posMap: Map<string, Position | undefined> = new Map();
  @State widthMap: Map<string, number> = new Map();
  @State heightMap: Map<string, number> = new Map();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = 'emitOnNativeEmbedMouseEvent001'
  @State isComplete: number = -1;
  aboutToAppear() {
    // 配置Web开启调试模式
    webview.WebviewController.setWebDebuggingAccess(true);
  }
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153530,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(153530)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebOnNativeEmbedMouseEvent").id('WebOnNativeEmbedMouseButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(() => this.isComplete, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnNativeEmbedMouseEvent001": {
              let value: string;
              try {
                let webRect = Utils.getComponentRect('onNativeEmbedMouseEventButton');
                await Utils.sleep(2000);
                let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                let driver: Driver = Driver.create();
                await driver.mouseClick({x:downX, y:downY}, MouseButton.MOUSE_BUTTON_LEFT);
                await Utils.sleep(2000);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }
      Column({ space: 5 }) {
        Text(this.eventType)
        Text(this.eventType2)
        Text(this.eventType3)
        Stack({ alignContent: Alignment.TopStart }){
          ForEach(this.componentIdArr, (componentId: string) => {
            NodeContainer(this.nodeControllerMap.get(componentId))
              .position(this.positionMap.get(componentId))
              .width(this.widthMap.get(componentId))
              .height(this.heightMap.get(componentId))
              .position(this.edges)
          }, (embedId: string) => embedId)
          Web({ src: $rawfile("test_web.html"), controller: this.browserTabController })
            .onPageEnd((event) => {
              console.log('web pageEnd==>' + event.url);
              this.isComplete = 0;
            })
            .enableNativeEmbedMode(true)
            .key('onNativeEmbedMouseEventButton')
            .onNativeEmbedLifecycleChange((embed) => {
              console.log("NativeEmbed surfaceId" + embed.surfaceId);
              // 获取web侧embed元素的id
              const componentId = embed.info?.id?.toString() as string
              if(embed.status == NativeEmbedStatus.CREATE) {
                console.log("onNativeEmbedLifecycleChange NativeEmbed create" + JSON.stringify(embed.info));
                // 创建节点控制器、设置参数并rebuild
                let nodeController = new MyNodeController()
                // 1. embed.info.width和embed.info.height单位是px格式，需要转换成ets侧的默认单位vp
                nodeController.setRenderOption({surfaceId : embed.surfaceId as string,
                  type : embed.info?.type as string,
                  renderType : NodeRenderType.RENDER_TYPE_TEXTURE,
                  embedId : embed.embedId as string,
                  width : px2vp(embed.info?.width),
                  height : px2vp(embed.info?.height)})
                this.edges = {left: `${embed.info?.position?.x as number}px`, top: `${embed.info?.position?.y as number}px`}
                nodeController.setDestroy(false);
                //根据web传入的embed的id属性作为key，将nodeController存入Map
                this.nodeControllerMap.set(componentId, nodeController);
                this.widthMap.set(componentId, px2vp(embed.info?.width));
                this.heightMap.set(componentId, px2vp(embed.info?.height));
                this.positionMap.set(componentId, this.edges);
                // 将web传入的embed的id属性存入@State状态数组变量中，用于动态创建nodeContainer节点容器,需要将push动作放在set之后
                this.componentIdArr.push(componentId)
              } else if(embed.status == NativeEmbedStatus.UPDATE) {
                let nodeController = this.nodeControllerMap.get(componentId);
                console.log("onNativeEmbedLifecycleChange NativeEmbed update" + JSON.stringify(embed));
                this.edges = {left: `${embed.info?.position?.x as number}px`, top: `${embed.info?.position?.y as number}px`}
                this.positionMap.set(componentId, this.edges);
                this.widthMap.set(componentId, px2vp(embed.info?.width));
                this.heightMap.set(componentId, px2vp(embed.info?.height));
                nodeController?.updateNode({textOne: 'update', width: px2vp(embed.info?.width), height: px2vp(embed.info?.height)} as ESObject)
              } else {
                console.log("onNativeEmbedLifecycleChange NativeEmbed destroy" + JSON.stringify(embed));
                let nodeController = this.nodeControllerMap.get(componentId);
                nodeController?.setDestroy(true)
                // this.nodeControllerMap.clear();
                this.positionMap.delete(componentId);
                this.widthMap.delete(componentId);
                this.heightMap.delete(componentId);
                this.componentIdArr.filter((value: string) => value != componentId)
              }
            })
            .onNativeEmbedGestureEvent((touch) => {
              this.num+=1
              this.eventType2='onNativeEmbedGestureEvent---' + this.num
              console.log("NativeEmbed onNativeEmbedGestureEvent" + JSON.stringify(touch.touchEvent));
              this.componentIdArr.forEach((componentId: string) => {
                let nodeController = this.nodeControllerMap.get(componentId);
                if (nodeController?.getEmbedId() === touch.embedId) {
                  let ret = nodeController?.postEvent(touch.touchEvent)
                  if (ret) {
                    console.log("onNativeEmbedGestureEvent success " + componentId);
                  } else {
                    console.log("onNativeEmbedGestureEvent fail " + componentId);
                  }
                  if (touch.result) {
                    touch.result.setGestureEventResult(ret,true);
                    this.eventType3 = 'setGestureEventResult--'+ret
                    console.log("NativeEmbed setGestureEventResult " + ret);
                  } else {
                    console.log("NativeEmbed setGestureEventResult event.result null");
                  }
                  if (touch && touch.touchEvent) {
                    if (touch.touchEvent.type == TouchType.Down) {
                      this.eventType = 'Down'
                    }
                    if (touch.touchEvent.type == TouchType.Up) {
                      this.eventType = 'Up'
                    }
                    if (touch.touchEvent.type == TouchType.Move) {
                      this.eventType = 'Move'
                    }
                    if (touch.touchEvent.type == TouchType.Cancel) {
                      this.eventType = 'Cancel'
                    }
                  }
                }
              })
            })
            .onNativeEmbedMouseEvent((mouse) => {
              Utils.emitEvent(true, 153540);
              console.log("NativeEmbed onNativeEmbedMouseEvent" + JSON.stringify(mouse.mouseEvent));
              this.componentIdArr.forEach((componentId: string) => {
                let nodeController = this.nodeControllerMap.get(componentId)
                console.log('pppppp7777' + mouse.embedId)
                if (nodeController?.getEmbedId() === mouse.embedId) {
                  let ret = nodeController?.postInputEvent(mouse.mouseEvent)
                  if (ret) {
                    console.log("setMouseEventResult success " + componentId)
                  } else {
                    console.log("setMouseEventResult fail " + componentId)
                  }
                  if (mouse.result) {
                    mouse.result.setMouseEventResult(ret,true);
                    console.log("NativeEmbed setMouseEventResult " + ret);
                    console.log("NativeEmbed setMouseEventResult6666 " + mouse.result.setMouseEventResult(ret));
                  } else {
                    console.log("NativeEmbed setMouseEventResult event.result null");
                  }
                }
              })
            })
            .height("100%")
            .width('100%')
        }
        .width('100%')
        .height('50%')
        .clip(true)
      }
    }
  }
}