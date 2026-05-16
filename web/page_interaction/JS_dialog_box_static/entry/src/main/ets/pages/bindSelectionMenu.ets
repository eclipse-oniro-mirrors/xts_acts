/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import {Entry, Component, WebDarkMode, Column, Row, Button, ClickEvent, Web, Menu, MenuType, Image,OnClientAuthenticationEvent, OnSearchResultReceiveEvent,AudioSessionType,OnRefreshAccessedHistoryEvent,WebContextMenuResult, Resource, Builder, ImageFit, MenuItem, Color, WebElementType, WebResponseType, OnContextMenuShowEvent } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Callback } from '@ohos.base'

interface PreviewBuilderParam {
  previewImage: Resource | string | undefined;
  width: number;
  height: number;
}

export class StringFields {
  str: string = '';
}

function px2vp(px: number): number {
  return px / 2;
}

@Builder function PreviewBuilderGlobal($$: PreviewBuilderParam) {
  Column() {
      Image($$.previewImage as Resource | string)
        .objectFit(ImageFit.Fill)
        .autoResize(true)
  }.width($$.width).height($$.height)
}

@Entry
@Component
struct WebComponent {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controller1: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  private result: WebContextMenuResult | undefined = undefined;
  @State previewImage: Resource | string | undefined = undefined;
  @State previewWidth: number = 0;
  @State previewHeight: number = 0;
  @State previewWidthResult: int = -1;
  @State previewHeightResult: int = -1;
  @State resultY: int = -1;
  @State elementType: WebElementType = WebElementType.IMAGE;
  @State str: string = '';
  @State userAgentPC:StringFields = new StringFields ();
  @State webResponseType: WebResponseType = WebResponseType.LONG_PRESS;
  @State audioSessionTypeArr:AudioSessionType[] = [AudioSessionType.AMBIENT]
  @State onRefreshAccessedHistoryUrl: string = "";
  @State onRefreshAccessedHistoryTag: boolean = false;
  @State onSearchResultReceiveNum: number = -1;
  @State onClientAuthenticationRequestPort: number = -1;
  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem()
        .onClick((e: ClickEvent) => {
          this.result?.copy();
          this.result?.closeContextMenu();
        })

      MenuItem()
        .onClick((e: ClickEvent) => {
          this.result?.selectAll();
          this.result?.closeContextMenu();
        })
    }
  }

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web test").key('webcomponentSelectionMenu').onClick( (e: ClickEvent) => {
          console.info("key==>" +this.stringObj.str)
          switch (this.stringObj.str) {
            case "bindSelectionMenuType01": {
              this.userAgentPC.str = this.controller.getUserAgent();
              if ((this.userAgentPC.str).includes("PC")) {
                Utils.emitEvent(true, 8301)
                break;
              }
              break;
            }

            case "bindSelectionMenuType02": {
                Utils.emitEvent(MenuType.PREVIEW_MENU, 8302)
                break;
            }

            case "testGetPreviewWidth001": {
              console.log("get getPreviewWidth = ", this.previewWidthResult);
              if (this.previewWidthResult >= 0) {
                Utils.emitEvent(true, 11000);
              } else {
                Utils.emitEvent(false, 11000);
              }
              break;
            }

            case "testGetPreviewHeight001": {
              console.log("get GetPreviewHeight = ", this.previewHeightResult);
              if (this.previewHeightResult >= 0) {
                Utils.emitEvent(true, 12000);
              } else {
                Utils.emitEvent(false, 12000);
              }
              break;
            }

            case "testY001": {
              console.log("get testY001 = ", this.resultY);
              if (this.resultY >= 0) {
                Utils.emitEvent(true, 13000);
              } else {
                Utils.emitEvent(false, 13000);
              }
              break;
            }

            case "webResponseTypeStatic01": {
              this.webResponseType = WebResponseType.RIGHT_CLICK
              this.controller.refresh()
              setTimeout(() => {
                Utils.emitEvent(WebResponseType.RIGHT_CLICK, 83023233)
              }, 2000)
              break;
            }

            case "audioSessionTypeStatic01": {
              this.controller.refresh()
              setTimeout(() => {
                if(this.audioSessionTypeArr[0] == AudioSessionType.AMBIENT){
                  Utils.emitEvent(this.audioSessionTypeArr[0], 83023234)
                }
              }, 2000)
              break;
            }

            case "onRefreshAccessedHistoryStatic01": {
              this.controller.refresh()
              setTimeout(() => {
                if(this.onRefreshAccessedHistoryUrl!=""){
                  console.log("onRefreshAccessedHistoryUrl is :",this.onRefreshAccessedHistoryUrl)
                  Utils.emitEvent(true, 83023235)
                }
              }, 2000)
              break;
            }

            case "onSearchResultReceiveStatic01": {
              this.controller.loadUrl("www.baidu.com")
              this.controller.searchAllAsync('百度');
              setTimeout(() => {
                this.controller.searchAllAsync('百度');
                if(this.onSearchResultReceiveNum != -1){
                  Utils.emitEvent(true, 83023236)
                }
              }, 2000)
              break;
            }

            case "onClientAuthenticationRequestStatic01": {
              this.controller.clearClientAuthenticationCache();
              this.controller.loadUrl("https://client.badssl.com")
              setTimeout(() => {
                console.log("onClientAuthenticationRequestPort:",this.onClientAuthenticationRequestPort)
                if(this.onClientAuthenticationRequestPort != -1){
                  Utils.emitEvent(true, 83023237)
                }
              }, 2000)
              break;
            }

            case "webElementTypeStatic01": {
              this.elementType = WebElementType.LINK
              this.controller.refresh()
              setTimeout(() => {
                Utils.emitEvent(WebElementType.LINK, 83023231)
              }, 2000)
              break;
            }

            case "webElementTypeStatic02": {
              this.elementType = WebElementType.TEXT
              this.controller.refresh()
              setTimeout(() => {
                Utils.emitEvent(WebElementType.TEXT, 83023232)
              }, 2000)
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebAttributeTest' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: "resource://rawfile/bindSelectionMenu.html", controller: this.controller }).key('bindSelectionMenuType')
        .height(150).width(150).border({ width: 2, color: Color.Red })
        .darkMode(WebDarkMode.OFF)
        .onRefreshAccessedHistory((event:OnRefreshAccessedHistoryEvent): void => {
          if (event) {
            console.log('onRefreshAccessedHistory event success');
            this.onRefreshAccessedHistoryUrl = event.url
            this.onRefreshAccessedHistoryTag = event.isRefreshed
          }
        })
        .onSearchResultReceive((event:OnSearchResultReceiveEvent): void => {
          if (event) {
            console.log('onSearchResultReceive event success');
            this.onSearchResultReceiveNum = event.numberOfMatches
          }
        })
        .onClientAuthenticationRequest((event:OnClientAuthenticationEvent): void => {
          if (event) {
            console.log('OnClientAuthenticationEvent event success');
            this.onClientAuthenticationRequestPort = event.port
          }
        })
        .bindSelectionMenu(this.elementType, this.MenuBuilder, this.webResponseType,
          {
            onAppear: () => {
              console.log('test TEXT RIGHT_CLICK onAppear');
            },
            onDisappear: () => {
              console.log('test TEXT RIGHT_CLICK closeContextMenu');
              this.result?.closeContextMenu();
            },
            onMenuShow: () => {
              console.log('test TEXT RIGHT_CLICK onMenuShow');
            },
            onMenuHide: () => {
              console.log('test TEXT RIGHT_CLICK onMenuHide');
            },
            preview:() => PreviewBuilderGlobal({
              previewImage: this.previewImage,
              width: this.previewWidth,
              height: this.previewHeight
            }),
            menuType: MenuType.PREVIEW_MENU
          })
        .onContextMenuShow((event : OnContextMenuShowEvent): boolean => {
          if (event) {
            this.result = event.result;
            if (event?.param.getLinkUrl()) {
              return false;
            }
            const rawW = event.param.getPreviewWidth?.() ?? 0;
            const rawH = event.param.getPreviewHeight?.() ?? 0;
            this.previewWidthResult = event.param.getPreviewWidth();
            this.previewHeightResult = event.param.getPreviewHeight();
            this.resultY = event.param.y();
            this.previewWidth  = px2vp(rawW);
            this.previewHeight = px2vp(rawH);
            Utils.emitEvent(this.previewWidth > 0 && this.previewHeight > 0, 8301)
            if (event.param.getSourceUrl().indexOf("resource://rawfile/") == 0) {
              this.previewImage = event.param.getSourceUrl?.() ?? '';
            } else {
              this.previewImage = event?.param.getSourceUrl();
            }
            return true;
          }
          return false;
        }).margin(80)
    }
  }
}