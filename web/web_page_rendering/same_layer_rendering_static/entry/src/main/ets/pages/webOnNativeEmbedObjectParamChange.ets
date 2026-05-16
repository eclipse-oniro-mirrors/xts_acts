import { NodeController, BuilderNode, NodeRenderType, FrameNode } from '@ohos.arkui.node';
import { Color,NativeEmbedDataInfo,  Entry, Component, Column, Row, Button, ClickEvent, Web, $rawfile, NativeEmbedTouchInfo, NativeEmbedDataInfo, NativeEmbedParamStatus, EmbedOptions, NativeEmbedParamItem, NativeEmbedParamDataInfo} from '@ohos.arkui.component'
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State} from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {NativeEmbedVisibilityInfo,NativeEmbedStatus} from '@ohos.arkui.component';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'


@Entry
@Component
struct WebIndex {
  browserTabController: webView.WebviewController = new webView.WebviewController(undefined)
  options:EmbedOptions = {
    supportCssDisplayChange: true}
  params: Array<NativeEmbedParamItem> |undefined = [];
  @State isReceive: number = -1;
  @State str:string = 'emitOnNativeEmbedObjectParamChange001';
  @State isPageEnd: number = -1;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , RecordData>)?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").id('WebOnNativeEmbedObjectParamChangeButton').onClick((e: ClickEvent) => {
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

            case 'emitSwitchNextPage5': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webDefaultTextEncodingFormat' })
              break;
            }
          }
        })
      }

        Web({ src: $rawfile("BasicOperation.html"), controller: this.browserTabController })
          .javaScriptAccess(true)
          .enableNativeEmbedMode(true)
          .registerNativeEmbedRule("object", "test")
          .nativeEmbedOptions(this.options)
          .onPageEnd((event) => {
            console.log('web pageEnd==>' + event.url);
            this.isPageEnd = 0;
          })
          .onNativeEmbedObjectParamChange((event) => {
            console.info("embed id: " + event.embedId);
              Utils.emitEvent(event.embedId??"", 16571658)
              console.info("objectAttribute id: " + event.objectAttributeId);
              Utils.emitEvent(event.objectAttributeId??"", 16571659)
              let paramItems = event.paramItems;
              if (paramItems) {
                console.info("param info: " + JSON.stringify(paramItems[0]));
                Utils.emitEvent(paramItems[0].id??"", 16571660)
                Utils.emitEvent(paramItems[0].name??"", 16571661)
                Utils.emitEvent(paramItems[0].value??"", 16571662)
                const status = paramItems[0].status as NativeEmbedParamStatus;
                Utils.emitEvent(0, 16571663)
            }
          })
        }
            }
          }

