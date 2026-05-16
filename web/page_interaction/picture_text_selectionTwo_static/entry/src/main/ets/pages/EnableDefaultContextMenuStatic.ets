/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  UIContext,
  $rawfile
} from '@ohos.arkui.component'
import Utils from '../../src/test/Utils.test';
import {BusinessError,Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { Context } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { Hypium } from '../../../hypium/index';
import { image } from '@kit.ImageKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { http } from '@kit.NetworkKit';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
const EVENT_ID_SET_SUITE_KEY = 177009;
const driver = Driver.create();
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct BindMenuTest {
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State blockNetwork: boolean = false
  @State enableDefaultMenu: boolean  = true
  @State enableContextMenuShow: boolean  = false
  @State linkUrl: string = '';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State showMenu: boolean = false;
  no_error: string = "no error happened"
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 177009,
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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web test").key('webEnableDefaultContextMenu').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case "EnableDefaultContextMenuStatic01": {
              this.enableDefaultMenu = true;
              setTimeout(() => {
                this.controller.loadUrl("resource://rawfile/LocalImage.html");
              },1000)
              this.controller.refresh();
              Utils.msSleep(1000);
              let buttonOne = driver.findComponent(ON.text('复制'));
              setTimeout(() => {
                if (buttonOne !== null) {
                  Utils.emitEvent(true, 20260325)
                }
              },2000)
              break;
            }

            case "EnableDefaultContextMenuStatic02": {
              // 设为 false则禁用默认菜单
              this.enableDefaultMenu = false;
              setTimeout(() => {
                this.controller.loadUrl("resource://rawfile/LocalImage.html");
              },1000)
              this.controller.refresh();
              Utils.msSleep(1000);
              let buttonOne = driver.findComponent(ON.text('复制'));
              setTimeout(() => {
                if (buttonOne == null) {
                  Utils.emitEvent(true, 20260326)
                }
              },2000)
              break;
            }

            case "EnableDefaultContextMenuStatic03": {
              // 设为 truee则可以用默认菜单
              this.enableDefaultMenu = true;
              setTimeout(() => {
                this.controller.loadUrl("resource://rawfile/canvas.html");
              },1000)
              this.controller.refresh();
              Utils.msSleep(1000);
              let buttonOne = driver.findComponent(ON.text('复制'));
              setTimeout(() => {
                if (buttonOne !== null) {
                  Utils.emitEvent(true, 20260327)
                }
              },2000)
              break;
            }


            case "EnableDefaultContextMenuStatic04": {
              // 设为 false则禁用默认菜单
              this.enableDefaultMenu = false;
              setTimeout(() => {
                this.controller.loadUrl("resource://rawfile/canvas.html");
              },1000)
              this.controller.refresh();
              Utils.msSleep(1000);
              let buttonOne = driver.findComponent(ON.text('复制'));
              setTimeout(() => {
                if (buttonOne == null) {
                  Utils.emitEvent(true, 20260328)
                }
              },2000)
              break;
            }
          }
        })
      }
      Web({ src: $rawfile("LocalImage.html"), controller: this.controller }).key('enableDefaultContextMenuButton')
        .enableDefaultContextMenu(this.enableDefaultMenu)
        .onContextMenuShow((event) => {
          console.log('pyyytt');
          return this.enableContextMenuShow
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
        })
    }
    .width('100%')
    .height('100%')
  }
}