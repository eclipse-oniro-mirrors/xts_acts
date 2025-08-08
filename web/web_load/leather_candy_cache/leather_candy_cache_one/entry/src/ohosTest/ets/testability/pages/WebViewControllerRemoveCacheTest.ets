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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerRemoveCacheTestButton")
          .key('WebViewControllerRemoveCacheTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testRemoveCache001": {
                try {
                  this.buttonStart = true;
                  console.log('buttonStart==>'+this.buttonStart);
                  this.removeRom = true
                  this.controller.loadUrl('https://openharmony.cn/')
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
                break;
              }
              case "testRemoveCache002": {
                try {
                  this.removeRom = false
                  this.controller.loadUrl('https://openharmony.cn/')
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
        .onPageEnd((event) => {
          if (event) {
            if (this.buttonStart) {
              console.log('onPageEnd buttonStart==>'+this.buttonStart);
              setTimeout(async () => {
                let filesBeforeRemove = Utils.listFile(this.cachePath)
                let memorySizeBeforeRemove = await appManager.getAppMemorySize()
                console.info('memorySizeBeforeRemove:' + memorySizeBeforeRemove)
                this.controller.removeCache(this.removeRom)
                await Utils.sleep(2000)
                let filesAfterRemove = Utils.listFile(this.cachePath)
                let memorySizeAfterRemove = await appManager.getAppMemorySize()
                console.info('memorySizeAfterRemove:' + memorySizeAfterRemove)
                if (this.removeRom) {
                  Utils.emitEvent(filesAfterRemove.length < filesBeforeRemove.length, 77200)
                } else {
                  Utils.emitEvent(filesAfterRemove.length == filesBeforeRemove.length, 77202)
                }
              }, 100)
            }
            

          }
        })
    }
  }
}
