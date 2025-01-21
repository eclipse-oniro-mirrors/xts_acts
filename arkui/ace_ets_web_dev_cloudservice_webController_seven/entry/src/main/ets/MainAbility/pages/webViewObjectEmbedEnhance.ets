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
import uiTest from '@ohos.UiTest'
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';

declare class Params {
  public text : string
  public text1 : string
  public width : number
  public height : number
}

declare class MapItem {
  public surfaceId : string
  public embedId : string
  public width : number
  public height : number
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
      this.rootNode.build(new WrappedBuilder(MyComponent.buttonBuilder), { text: 'button1',
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
  @Builder static buttonBuilder(params: Params) {
    MyComponent({ params: params })
      .backgroundColor(Color.Green)
  }

  build() {
    Column({ space: 3 }) {
      Button(this.params.text)
        .id('btnEnhance')
        .height(100 + 'px')
        .width(400 + 'px')
        .border({ width: 2, color: Color.Red })
        .backgroundColor(this.bkColor)
        .onClick(() => {
          this.index =! this.index
          if (this.index) {
            this.bkColor = Color.Blue
          } else {
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
struct webViewObjectEmbedEnhance {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  private embedMap : Map<string, MapItem> = new Map();
  private nodeController: MyNodeController = new MyNodeController();
  @State nodeContainerWidth : number = 0;
  @State nodeContainerHeight : number = 0;
  @State isPrivacy: boolean = true;
  @State isChange: boolean = false;
  @State eventTypes: string[] = []
  @State eventType: string = ''
  @State number: number = 0
  @State objectType: string = 'object'
  @State objectValue: string = 'application/view'
  @State isEmbed: boolean = true


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
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
          .key('webViewObjectEmbedEnhanceButton')
          .onClick(async () => {
            console.info('emitKey-->'+ this.emitKey)
            await Utils.sleep(2000);
            if (Utils.isPC (this.controller) ) {
              Utils.emitEvent('success', 1001);
              Utils.emitEvent('success', 1002);
              Utils.emitEvent('success', 1003);
              Utils.emitEvent('success', 1004);
              Utils.emitEvent('success', 1005);
              Utils.emitEvent('success', 1006);
              Utils.emitEvent('success', 1007);
              Utils.emitEvent('success', 1008);
              Utils.emitEvent('success', 1009);
              Utils.emitEvent('success', 1010);
              Utils.emitEvent('success', 1011);
              Utils.emitEvent('success', 1012);
              Utils.emitEvent('success', 1014);
              return
            }
            switch (this.emitKey) {
              case 'emitWebViewObjectEmbedId':
              case 'emitWebViewObjectEmbedType':
              case 'emitWebViewObjectEmbedWidth':
              case 'emitWebViewObjectEmbedHeight':
              case 'emitWebViewObjectEmbedPosition':
              case 'emitWebViewObjectEmbedUrl':
              case 'emitWebViewObjectEmbedParams':
              case 'emitWebViewObjectEmbedTagObject': {
                try {
                  this.isChange = false;
                  this.isPrivacy = true;
                  this.objectType = 'object';
                  this.objectValue = 'application/view';
                  await Utils.sleep(1000);
                  this.controller.loadUrl($rawfile('object1.html'));
                  await Utils.sleep(2000);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewObjectEmbedSrc': {
                try {
                  this.isChange = false;
                  this.isPrivacy = true;
                  this.objectType = 'embed';
                  this.objectValue = 'application/view';
                  await Utils.sleep(1000);
                  this.controller.loadUrl($rawfile('embed.html'));
                  await Utils.sleep(2000);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewObjectEmbedTagEmbed': {
                try {
                  this.isChange = false;
                  this.isPrivacy = true;
                  this.objectType = 'embed';
                  this.objectValue = 'application/view';
                  await Utils.sleep(1000);
                  this.controller.loadUrl($rawfile('embed.html'));
                  await Utils.sleep(2000);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewObjectEmbedHasParams': {
                try {
                  this.isPrivacy = true;
                  this.objectType = 'object';
                  this.objectValue = 'application/view';
                  await Utils.sleep(1000);
                  this.controller.loadUrl($rawfile('object5.html'));
                  await Utils.sleep(2000);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewObjectEmbedTest': {
                try {
                  this.isPrivacy = true;
                  this.objectType = 'object';
                  this.objectValue = 'application/test';
                  await Utils.sleep(1000);
                  this.controller.loadUrl($rawfile('object2.html'));
                  await Utils.sleep(2000);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewObjectEmbedPdf': {
                try {
                  this.isPrivacy = true;
                  this.objectType = 'object'
                  this.objectValue = 'application/pdf'
                  this.isEmbed = false;
                  await Utils.sleep(1000);
                  console.info('emitWebViewObjectEmbedPdf isEmbed before-->'+this.isEmbed)
                  this.controller.loadUrl($rawfile('object4.html'));
                  await Utils.sleep(5000);
                  console.info('emitWebViewObjectEmbedPdf isEmbed after-->'+this.isEmbed)
                  if(this.isEmbed){
                    console.info('emitWebViewObjectEmbedPdf isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('fail', 1013);
                  }else{
                    console.info('emitWebViewObjectEmbedPdf isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('success', 1013);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewObjectEmbedAbc': {
                try {
                  this.isPrivacy = true;
                  this.objectType = 'abc';
                  this.objectValue = 'test';
                  this.isEmbed = false;
                  await Utils.sleep(1000);
                  console.info('emitWebViewObjectEmbedAbc isEmbed before-->'+this.isEmbed)
                  this.controller.loadUrl($rawfile('object3.html'));
                  await Utils.sleep(5000);
                  console.info('emitWebViewObjectEmbedAbc isEmbed after-->'+this.isEmbed)
                  if(this.isEmbed){
                    console.info('emitWebViewObjectEmbedAbc isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('fail', 1014);
                  }else{
                    console.info('emitWebViewObjectEmbedAbc isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('success', 1014);
                  }
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
        // 开启同层渲染 isPrivacy
        if (this.isPrivacy)   {
          Web({ src: '', controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .enableNativeEmbedMode(true)
            .registerNativeEmbedRule(this.objectType, this.objectValue)
            .onNativeEmbedLifecycleChange((event) => {
              console.info('current objectType' + this.objectType);
              console.info('current objectValue' + this.objectValue);
              console.info('NativeEmbed surfaceId' + event.surfaceId);
              console.info('NativeEmbed tag' + event.info?.tag);
              console.info('key==>' + this.emitKey)
              this.isEmbed = true
              console.info('onNativeEmbedLifecycleChange==>' + this.isEmbed)
              // 当加载页面中有Embed标签会触发Create
              if (event.status == NativeEmbedStatus.CREATE) {
                this.isChange = true;
                console.info('NativeEmbed create' + JSON.stringify(event.info));
                if (this.emitKey == 'emitWebViewObjectEmbedId') {
                  if (event.info?.id) {
                    Utils.emitEvent('success', 1001);
                  }else{
                    Utils.emitEvent('fail', 1001);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedType') {
                  if (event.info?.type) {
                    Utils.emitEvent('success', 1002);
                  }else{
                    Utils.emitEvent('fail', 1002);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedSrc') {
                  if (event.info?.src) {
                    Utils.emitEvent('success', 1003);
                  }else{
                    Utils.emitEvent('fail', 1003);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedWidth') {
                  if (event.info?.width) {
                    Utils.emitEvent('success', 1004);
                  }else{
                    Utils.emitEvent('fail', 1004);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedHeight') {
                  if (event.info?.height) {
                    Utils.emitEvent('success', 1005);
                  }else{
                    Utils.emitEvent('fail', 1005);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedTagEmbed') {
                  let tag = event.info?.tag
                  if (tag && tag ==='EMBED') {
                    Utils.emitEvent('success', 1006);
                  }else{
                    Utils.emitEvent('fail', 1006);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedTagObject') {
                  let tag = event.info?.tag
                  if (tag && tag ==='OBJECT') {
                    Utils.emitEvent('success', 1007);
                  }else{
                    Utils.emitEvent('fail', 1007);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedPosition') {
                  let position = event.info?.position
                  if (position) {
                    Utils.emitEvent('success', 1008);
                  }else{
                    Utils.emitEvent('fail', 1008);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedUrl') {
                  let url = event.info?.url
                  if (url) {
                    Utils.emitEvent('success', 1009);
                  }else{
                    Utils.emitEvent('fail', 1009);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedParams') {
                  let params = event.info?.params
                  if (params) {
                    Utils.emitEvent('success', 1010);
                  }else{
                    Utils.emitEvent('fail', 1010);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedHasParams') {
                  let params = JSON.stringify(event.info?.params)
                  if (params && params ==='{"type":"video"}') {
                    Utils.emitEvent('success', 1011);
                  }else{
                    Utils.emitEvent('fail', 1011);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedTest') {
                  let tag = event.info?.tag
                  let type = event.info?.type
                  console.info('emitWebViewObjectEmbedTest tag='+ tag)
                  console.info('emitWebViewObjectEmbedTest type='+ type)
                  if(tag?.toLowerCase() === this.objectType && type === this.objectValue){
                    Utils.emitEvent('success', 1012);
                  }else{
                    Utils.emitEvent('fail', 1012);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedPdf') {
                  console.info('emitWebViewObjectEmbedPdf isEmbed if-->'+this.isEmbed)
                  Utils.emitEvent('fail', 1013);
                }
                if (this.emitKey == 'emitWebViewObjectEmbedAbc') {
                  console.info('emitWebViewObjectEmbedAbc isEmbed if-->'+this.isEmbed)
                  Utils.emitEvent('fail', 1014);
                }
              }else if (event.status == NativeEmbedStatus.UPDATE) {
                console.info('NativeEmbed update' + JSON.stringify(event.info));
              } else {
                console.info('NativeEmbed destroy' + JSON.stringify(event.info));
              }
            })
            .onNativeEmbedGestureEvent((event) => {
              this.number += 1

            })
        } else {
          Web({ src: '', controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .enableNativeEmbedMode(false)
            .registerNativeEmbedRule('object', 'application/view')
            .onNativeEmbedLifecycleChange((event) => {
              console.info('NativeEmbed surfaceId' + event.surfaceId);
              console.info('NativeEmbed event.tag' + event.info?.tag);
              if (event.status == NativeEmbedStatus.CREATE) {

              }else if (event.status == NativeEmbedStatus.UPDATE) {
                console.info('NativeEmbed update' + JSON.stringify(event.info));
              } else {
                console.info('NativeEmbed destroy' + JSON.stringify(event.info));
              }
            })


        }

      }
    }
  }
}
