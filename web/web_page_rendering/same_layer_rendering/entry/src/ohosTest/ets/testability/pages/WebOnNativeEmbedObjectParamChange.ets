import webview from '@ohos.web.webview';
import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, BuilderNode, NodeRenderType, FrameNode } from '@ohos.arkui.node';
import prompt from '@ohos.promptAction';
import { waitForExist} from '../../test/WaitTest.test';
import { BusinessError } from '@ohos.base';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
const EVENT_ID_SET_EIMIT_KEY = 104000;

@Observed
declare class Params{
  elementId: string
  textOne: string
  textTwo: string
  width: number
  height: number
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
  private isNode = true;
  private isDestroy_ : boolean = false;
  private type_ : string = "";

  setRenderOption(params : nodeControllerParams) {
    this.surfaceId_ = params.surfaceId
    this.renderType_ = params.renderType;
    this.embedId_ = params.embedId;
    this.width_ = params.width;
    this.height_ = params.height;
    this.type_ = params.type;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.isDestroy_) { // rootNode为null
      return null;
    }
    if (!this.rootNode) {// rootNode 为undefined时
      this.rootNode = new BuilderNode(uiContext, { surfaceId: this.surfaceId_, type: this.renderType_ });
      if(this.type_ == 'test/view') {
        this.rootNode.build(wrapBuilder(TextInputBuilder), {  textOne: "myTextInput", width: this.width_, height: this.height_  })
        return this.rootNode.getFrameNode();
      }else{
        return null;
      }
    }
    // 返回FrameNode节点。
    return this.rootNode.getFrameNode();
  }

  getEmbedId() : string {
    return this.embedId_;
  }

  updateNode(arg: Object): void {
    this.rootNode?.update(arg);
  }
  destroy() {
    this.isNode = false
  }
  add() {
    this.isNode = true
  }

  setDestroy(isDestroy : boolean) : void {
    this.isDestroy_ = isDestroy;
    if (this.isDestroy_) {
      this.rootNode = null;
    }
  }
  postEvent(event:TouchEvent | undefined) : boolean {
    return this.rootNode?.postTouchEvent(event) as boolean
  }
}


@Component
struct TextInputComponent {
  @Prop params: Params
  @State bkColor: Color = Color.White

  build() {
    Column() {
      TextInput({text: '', placeholder: 'please input your word...'})
        .placeholderColor(Color.Gray)
        .id(this.params?.elementId)
        .placeholderFont({size: 13, weight: 400})
        .caretColor(Color.Gray)
        .width(this.params?.width)
        .height(this.params?.height)
        .fontSize(14)
        .fontColor(Color.Black)
    }
    //自定义组件中的最外层容器组件宽高应该为同层标签的宽高
    .width(this.params.width || '100%')
    .height(this.params.height || '100%')
  }
}

// @Builder中为动态组件的具体组件内容。
@Builder
function TextInputBuilder(params:Params) {
  TextInputComponent({params: params})
    .backgroundColor(Color.White)
}

@Entry
@Component
struct WebIndex {
  browserTabController: WebviewController = new webview.WebviewController()
  @State nodeControllerMap: Map<string, MyNodeController> = new Map();
  @State num : number = 0
  @State componentIdArr: Array<string> = []
  @State widthMap: Map<string, number> = new Map();
  @State heightMap: Map<string, number> = new Map();
  @State positionMap: Map<string, Edges> = new Map();olean = true
  @State edges: Edges = {};
  options:EmbedOptions = {
    supportCssDisplayChange: true}
  params: Array<NativeEmbedParamItem> = [];
  @State isReceive: number = -1;
  @State str:string = 'emitOnNativeEmbedObjectParamChange001';
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130701,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(130701);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column({ space: 5 }) {
      Row() {
        Button("web click").id('WebOnNativeEmbedObjectParamChangeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnNativeEmbedObjectParamChange001": {
              try {
                console.log('start__emitOnNativeEmbedObjectParamChange001')
                this.browserTabController.runJavaScript('addParam()')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "emitOnNativeEmbedObjectParamChange002": {
              try {
                console.log('start__emitOnNativeEmbedObjectParamChange002')
                this.browserTabController.runJavaScript('modifyLastParamName()')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }

            case "emitOnNativeEmbedObjectParamChange003": {
              try {
                console.log('start__emitOnNativeEmbedObjectParamChange003')
                this.browserTabController.runJavaScript('removeParam()')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }


          }
        })
      }

      Stack(){
        ForEach(this.componentIdArr, (componentId: string) => {
          NodeContainer(this.nodeControllerMap.get(componentId))
            .position(this.positionMap.get(componentId))
            .width(this.widthMap.get(componentId))
            .height(this.heightMap.get(componentId))
        }, (embedId: string) => embedId)
        Web({ src: $rawfile("BasicOperation.html"), controller: this.browserTabController })
          .javaScriptAccess(true)
          .enableNativeEmbedMode(true)
          .registerNativeEmbedRule("object", "test")
          .nativeEmbedOptions(this.options)
          .onPageEnd((event) => {
            console.log('web pageEnd==>' + event.url);
            this.isPageEnd = 0;
          })
          .onNativeEmbedLifecycleChange((embed) => {
            console.log("NativeEmbed surfaceId" + embed.surfaceId);
            const componentId = embed.info?.id?.toString() as string
            if (embed.status == NativeEmbedStatus.CREATE) {
              console.log("NativeEmbed create" + JSON.stringify(embed.info));
              // 创建节点控制器、设置参数并rebuild
              let nodeController = new MyNodeController()
              nodeController.setRenderOption({surfaceId : embed.surfaceId as string,
                type : embed.info?.type as string,
                renderType : NodeRenderType.RENDER_TYPE_TEXTURE,
                embedId : embed.embedId as string,
                width : px2vp(embed.info?.width),
                height : px2vp(embed.info?.height)})
              this.edges =
                { left: `${embed.info?.position?.x as number}px`, top: `${embed.info?.position?.y as number}px` }
              //console.log("NativeEmbed surfaceId" + embed.surfaceId + "position:" `${embed.info?.position?.y as number}px`);
              nodeController.setDestroy(false);
              // 根据web传入的embed的id属性作为key，将nodeController存入Map
              this.nodeControllerMap.set(componentId, nodeController)
              this.widthMap.set(componentId, px2vp(embed.info?.width));
              this.heightMap.set(componentId, px2vp(embed.info?.height));
              this.positionMap.set(componentId,  this.edges);
              // 将web传入的embed的id属性存入@State状态数组变量中，用于动态创建nodeContainer节点容器,需要将push动作放在set之后
              this.componentIdArr.push(componentId)
            } else if (embed.status == NativeEmbedStatus.UPDATE) {
              console.log("NativeEmbed create" + JSON.stringify(embed));
              let nodeController = this.nodeControllerMap.get(componentId);
              this.edges =
                { left: `${embed.info?.position?.x as number}px`, top: `${embed.info?.position?.y as number}px` }
              this.widthMap.set(componentId, px2vp(embed.info?.width));
              this.heightMap.set(componentId, px2vp(embed.info?.height));
              this.positionMap.set(componentId,  this.edges);
              nodeController?.updateNode({textOne: 'update', width: px2vp(embed.info?.width), height: px2vp(embed.info?.height)} as ESObject)
            } else {
              console.log("NativeEmbed destroy" + JSON.stringify(embed));
              let nodeController = this.nodeControllerMap.get(componentId);
              nodeController?.setDestroy(true)
              this.nodeControllerMap.clear();
              this.componentIdArr.length = 0;
            }
          })
          .onNativeEmbedGestureEvent((touch) => {
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
                  touch.result.setGestureEventResult(ret);
                }
              }
            })
          })
          .onNativeEmbedObjectParamChange((paramsData) => {
              console.log("dxlog onNativeEmbedObjectParamChange embedId: " + paramsData.embedId);
              console.log("dxlog onNativeEmbedObjectParamChange objectAttributeId: " + paramsData.objectAttributeId);
              if (paramsData.paramItems) {
                this.params = paramsData.paramItems
                for (let i = 0; i < this.params.length; i++) {
                  console.log("dxlog onNativeEmbedObjectParamChange: " +
                    "id: " + this.params[i].id +
                    ", status: " + this.params[i].status +
                    ", name: " + this.params[i].name +
                    ", value: " + this.params[i].value);
                  if(this.params[i].status == NativeEmbedParamStatus.ADD) {
                    Utils.emitEvent(NativeEmbedParamStatus.ADD, 20250923)
                  } else if(this.params[i].status == NativeEmbedParamStatus.UPDATE) {
                    Utils.emitEvent(NativeEmbedParamStatus.UPDATE, 20250924)
                  } else if(this.params[i].status == NativeEmbedParamStatus.DELETE) {
                    Utils.emitEvent(NativeEmbedParamStatus.DELETE, 20250925)
                  }
                }
              }
            })
            .height("100%")
            .border({ width: 2, color: Color.Red })
            }.height("100%")
            }
          }
      }
