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
import { waitForExist } from '../../test/WaitTest.test';
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
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153680,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(153680)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
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
            await waitForExist(() => this.isReceive, this.emitKey, 0);
            this.isReceive = -1;
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
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('object1.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
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
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('embed1.html'));
                  await waitForExist(() => this.isComplete, 'loadUrl' + this.emitKey, 0);
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
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('embed1.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
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
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('object5.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
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
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('object2.html'));
                  await waitForExist(() => this.isComplete, 'loadUrl' + this.emitKey, 0);
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
                  this.isComplete = -1;
                  console.info('emitWebViewObjectEmbedPdf isEmbed before-->'+this.isEmbed)
                  this.controller.loadUrl($rawfile('object4.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                  console.info('emitWebViewObjectEmbedPdf isEmbed after-->'+this.isEmbed)
                  if(this.isEmbed){
                    console.info('emitWebViewObjectEmbedPdf isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('fail', 153820);
                  }else{
                    console.info('emitWebViewObjectEmbedPdf isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('success', 153820);
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
                  this.isComplete = -1;
                  console.info('emitWebViewObjectEmbedAbc isEmbed before-->'+this.isEmbed)
                  this.controller.loadUrl($rawfile('object3.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                  console.info('emitWebViewObjectEmbedAbc isEmbed after-->'+this.isEmbed)
                  if(this.isEmbed){
                    console.info('emitWebViewObjectEmbedAbc isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('fail', 153690);
                  }else{
                    console.info('emitWebViewObjectEmbedAbc isEmbed if-->'+this.isEmbed)
                    Utils.emitEvent('success', 153690);
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
            .onPageEnd((event) => {
              console.log('web pageEnd==>' + event.url);
              this.isComplete = 0;
            })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .enableNativeEmbedMode(true)
            .registerNativeEmbedRule(this.objectType, this.objectValue)
            .onNativeEmbedLifecycleChange((event) => {
              console.info(this.emitKey + ' current objectType' + this.objectType);
              console.info(this.emitKey + ' current objectValue' + this.objectValue);
              console.info(this.emitKey + ' NativeEmbed surfaceId' + event.surfaceId);
              console.info(this.emitKey + ' NativeEmbed tag' + event.info?.tag);
              console.info('key==>' + this.emitKey)
              this.isEmbed = true
              console.info(this.emitKey + ' onNativeEmbedLifecycleChange==>' + this.isEmbed)
              console.info('key==>' + this.emitKey + ' ' + event.status)
              console.info('key==>' + this.emitKey + ' ' + NativeEmbedStatus.CREATE)
              // 当加载页面中有Embed标签会触发Create
              if (event.status == NativeEmbedStatus.CREATE) {
                this.isChange = true;
                console.info('NativeEmbed create' + JSON.stringify(event.info));
                if (this.emitKey == 'emitWebViewObjectEmbedId') {
                  if (event.info?.id) {
                    Utils.emitEvent('success', 153700);
                  }else{
                    Utils.emitEvent('fail', 153700);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedType') {
                  if (event.info?.type) {
                    Utils.emitEvent('success', 153710);
                  }else{
                    Utils.emitEvent('fail', 153710);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedSrc') {
                  console.log('key==>' + this.emitKey + ' ' + event.info?.src)
                  if (event.info?.src) {
                    Utils.emitEvent('success', 153720);
                  }else{
                    Utils.emitEvent('fail', 153720);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedWidth') {
                  if (event.info?.width) {
                    Utils.emitEvent('success', 153730);
                  }else{
                    Utils.emitEvent('fail', 153730);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedHeight') {
                  if (event.info?.height) {
                    Utils.emitEvent('success', 153740);
                  }else{
                    Utils.emitEvent('fail', 153740);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedTagEmbed') {
                  let tag = event.info?.tag
                  if (tag && tag ==='EMBED') {
                    Utils.emitEvent('success', 153750);
                  }else{
                    Utils.emitEvent('fail', 153750);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedTagObject') {
                  let tag = event.info?.tag
                  if (tag && tag ==='OBJECT') {
                    Utils.emitEvent('success', 153760);
                  }else{
                    Utils.emitEvent('fail', 153760);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedPosition') {
                  let position = event.info?.position
                  if (position) {
                    Utils.emitEvent('success', 153770);
                  }else{
                    Utils.emitEvent('fail', 153770);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedUrl') {
                  let url = event.info?.url
                  if (url) {
                    Utils.emitEvent('success', 153780);
                  }else{
                    Utils.emitEvent('fail', 153780);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedParams') {
                  let params = event.info?.params
                  if (params) {
                    Utils.emitEvent('success', 153790);
                  }else{
                    Utils.emitEvent('fail', 153790);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedHasParams') {
                  let params = JSON.stringify(event.info?.params)
                  if (params && params ==='{"type":"video"}') {
                    Utils.emitEvent('success', 153800);
                  }else{
                    Utils.emitEvent('fail', 153800);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedTest') {
                  let tag = event.info?.tag
                  let type = event.info?.type
                  console.info('emitWebViewObjectEmbedTest tag='+ tag + ' ' + this.objectType)
                  console.info('emitWebViewObjectEmbedTest type='+ type + ' ' + this.objectValue)
                  if(tag?.toLowerCase() === this.objectType && type === this.objectValue){
                    Utils.emitEvent('success', 153810);
                  }else{
                    Utils.emitEvent('fail', 153810);
                  }
                }
                if (this.emitKey == 'emitWebViewObjectEmbedPdf') {
                  console.info('emitWebViewObjectEmbedPdf isEmbed if-->'+this.isEmbed)
                  Utils.emitEvent('fail', 153820);
                }
                if (this.emitKey == 'emitWebViewObjectEmbedAbc') {
                  console.info('emitWebViewObjectEmbedAbc isEmbed if-->'+this.isEmbed)
                  Utils.emitEvent('fail', 153690);
                }
              }else if (event.status == NativeEmbedStatus.UPDATE) {
                console.info(this.emitKey + ' NativeEmbed update' + JSON.stringify(event.info));
              } else {
                console.info(this.emitKey + ' NativeEmbed destroy' + JSON.stringify(event.info));
              }
            })
            .onNativeEmbedGestureEvent((event) => {
              this.number += 1

            })
        } else {
          Web({ src: '', controller: this.controller })
            .onPageEnd((event) => {
              console.log('web pageEnd==>' + event.url);
              this.isComplete = 0;
            })
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
