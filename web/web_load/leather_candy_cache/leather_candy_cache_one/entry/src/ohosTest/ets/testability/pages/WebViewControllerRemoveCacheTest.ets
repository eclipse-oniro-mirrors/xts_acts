/*
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
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import appManager from '@ohos.app.ability.appManager';
import { waitForAssert, waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebViewControllerRemoveCacheTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true

  @State databaseAccess: boolean = true
  @State removeRom: boolean = true
  @State cachePath: string = Utils.getSandboxCacheDir() + 'web/Cache/Cache_Data/'
  @State buttonStart: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148411,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(148411)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerRemoveCacheTestButton")
          .key('WebViewControllerRemoveCacheTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testRemoveCache001": {
                try {
                  this.buttonStart = true;
                  console.log('buttonStart==>'+this.buttonStart);
                  this.removeRom = true
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://www.openharmony.cn/')
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
                break;
              }
              case "testRemoveCache002": {
                try {
                  this.buttonStart = true;
                  this.removeRom = false
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://www.openharmony.cn/')
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
                break;
              }
            }
          })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd(async (event) => {
          this.isPageEnd = 0;
          if (event) {
            if (this.buttonStart) {
              console.log('onPageEnd buttonStart==>' + this.buttonStart);
              let filesBeforeRemove = Utils.listFile(this.cachePath)
              let memorySizeBeforeRemove = await appManager.getAppMemorySize()
              console.info('memorySizeBeforeRemove:' + memorySizeBeforeRemove)
              this.controller.removeCache(this.removeRom)
              if (this.removeRom) {
                let check = (v1: number, v2: number = -1): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  v2 = newFilesAfterRemove.length
                  return v1 > v2;
                }
                let str: string = ''
                await waitForAssert(() => str, () => check(filesBeforeRemove.length), true, 148450, this.str);
                console.info('test-->', 'filesBeforeRemove1:' + filesBeforeRemove.length)
                console.info('test-->', 'filesAfterRemove1:' + Utils.listFile(this.cachePath).length)
              } else {
                let filesAfterRemove = Utils.listFile(this.cachePath)
                let memorySizeAfterRemove = await appManager.getAppMemorySize()
                console.info('memorySizeAfterRemove:' + memorySizeAfterRemove)
                console.info('test-->', 'filesBeforeRemove2:' + filesBeforeRemove.length)
                console.info('test-->', 'filesAfterRemove2:' + filesAfterRemove.length)
                Utils.emitEvent(filesAfterRemove.length == filesBeforeRemove.length, 148460)
              }
            }
          }
        })
    }
  }
}
