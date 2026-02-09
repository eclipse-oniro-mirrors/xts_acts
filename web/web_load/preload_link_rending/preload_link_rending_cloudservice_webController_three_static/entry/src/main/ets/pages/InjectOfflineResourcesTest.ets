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

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
class StringFields {
  public str: string = '';
}

interface ResourceConfig {
  urlList: string[],
  type: web_webview.OfflineResourceType,
  responseHeaders: web_webview.WebHeader[],
  localPath: string
}

@Entry
@Component
struct injectOfflineResourcesTest {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ''
  resourceConfigs: ResourceConfig[] = [
    {
      localPath: 'icon.png',
      urlList: [
        '',
        '',
        '',
      ],
      type: web_webview.OfflineResourceType.IMAGE,
      responseHeaders: [
        { headerKey: 'Cache-Control', headerValue: 'max-age=1000' },
        { headerKey: 'Content-Type', headerValue: 'image/png' },
      ]
    },
    {
      localPath: 'test.js',
      urlList: [
        '',
      ],
      type: web_webview.OfflineResourceType.CLASSIC_JS,
      responseHeaders: [
        { headerKey: 'Cross-Origin', headerValue: 'anonymous' }
      ]
    },
    {
      localPath: 'test.css',
      urlList: [
        '',
      ],
      type: web_webview.OfflineResourceType.CSS,
      responseHeaders: [
        { headerKey: 'Content-Type', headerValue: 'css' },
      ]
    },
    {
      localPath: 'test.js',
      urlList: [
        '',
      ],
      type: web_webview.OfflineResourceType.MODULE_JS,
      responseHeaders: [
        { headerKey: 'Cross-Origin', headerValue: 'anonymous' }
      ]
    },
  ] as ResourceConfig[];

  readRawFile(url: string): Uint8Array {
    try {
      let context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
      if (context) {
        return context.resourceManager.getRawFileContentSync(url);
      }
    } catch (err: BusinessError) {
      return new Uint8Array(0);
    }
    return new Uint8Array(0);
  }

  getData(): web_webview.OfflineResourceMap[] {
    const resourceMapArr: web_webview.OfflineResourceMap[] = [] as web_webview.OfflineResourceMap[];
    for (let config of this.resourceConfigs) {
      let buf: Uint8Array = new Uint8Array(0);
      if (config.localPath) {
        buf = this.readRawFile(config.localPath);
      }
      resourceMapArr.push({
        urlList: config.urlList,
        resource: buf,
        responseHeaders: config.responseHeaders,
        type: config.type,
      } as web_webview.OfflineResourceMap)
    }
    return resourceMapArr;
  }

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('injectOfflineResourcesTest click').key('injectOfflineResourcesTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testInjectOfflineResources001': {
              let msg = 'testInjectOfflineResources001'
              try {
                let resources: web_webview.OfflineResourceMap[] = this.getData();
                this.controller.injectOfflineResources(resources);
                setTimeout(() => {
                  Utils.emitEvent(true, 20001)
                }, 2000)
              } catch (err: BusinessError) {
                console.error(msg + ' error: ' + err.code + ' message ' + err.message);
                Utils.emitEvent(err.code, 20001)
              }
              break;
            }
            case 'testInjectOfflineResources002': {
              let msg = 'testInjectOfflineResources002'
              try {
                this.controller.injectOfflineResources([] as web_webview.OfflineResourceMap[]);
              } catch (err: BusinessError) {
                console.error(msg + ' error: ' + err.code + ' message ' + err.message);
                Utils.emitEvent(err.code, 20002)
              }
              break;
            }
            case 'testOfflineResourceType001': {
              let msg = 'testOfflineResourceType001'
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.MODULE_JS) + ' ' +
              number(web_webview.OfflineResourceType.MODULE_JS), 20003)
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.CLASSIC_JS) + ' ' +
              number(web_webview.OfflineResourceType.CLASSIC_JS), 20004)
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.CSS) + ' ' +
              number(web_webview.OfflineResourceType.CSS), 20005)
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.IMAGE) + ' ' +
              number(web_webview.OfflineResourceType.IMAGE), 20006)
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}
