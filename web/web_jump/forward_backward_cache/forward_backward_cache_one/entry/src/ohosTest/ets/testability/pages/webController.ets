/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { JsProxyObject } from '../../test/Interfaces';
import business_error, { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';
import { Constants } from '../../test/Constants.test'

@Entry
@Component
struct webController {
  controller: WebController = new WebController()
  @State str: string = 'emitUserAgent'
  @State loadedResource: string = ''
  @State progress: string = ''
  @State newUrl: string = ''
  @State pageBegin: string = ''
  @State pageEnd: string = ''
  @State console: string = ''
  @State confirm: string = ''
  @State alert: string = ''
  @State errorReceive: string = ''
  @State httpErrorReceive: number = 0
  @State titleReceive: string = ''
  @State isDownloadStart: boolean = false
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State initialScale: number = 100
  @State enterPageEnd: boolean = false
  @State newScale: number = 0
  @State scaleChange: boolean = false
  @State geoShow: boolean = false
  @State mixedMode: MixedMode = MixedMode.All
  @State cacheMode: CacheMode = CacheMode.Default
  @State cacheError: boolean = false
  @State mixedSwitch: boolean = false
  @State mixedAllSwitch: boolean = false
  @State webVisibility: Visibility = Visibility.Visible
  @State isProgressFinish: boolean = false
  @State isHttpErrorReceive: boolean = false
  @State isLargeThan: boolean = false
  @State registerJavaScriptProxyFlag: boolean = false
  @State zoomAccess: boolean = false
  @State requestFocus: boolean = false
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 134500,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(134500)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.titleReceive = '';
        this.isReceive = 0;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info('ets toString:' + String(res));
    },
    toString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 31008);
      }
      return 'web222'
    },
  }

  build() {
    Column() {
      Row() {
        Button('WebController click').key('WebControllerButton').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;

          console.info('loadUrl==>' + this.str)
          this.isComplete = -1;
          this.controller.loadUrl({ url: 'resource://rawfile/webPart1index.html' });
          await waitForExist(() => this.isComplete, this.str, 0);
          this.controller.clearHistory();
          await waitForExist(() => '' + this.controller.accessBackward(), this.str, 'false');

          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testAccessStep001': {
              try {
                let isCan = this.controller.accessStep(1)
                Utils.emitEvent(isCan, 134510)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134510)
              }
              break;
            }
            case 'testAccessStep002': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessStep(1), 134520)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessStep003': {
              try {
                Utils.emitEvent(this.controller.accessStep(-1), 134530)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessStep004': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessStep(-1), 134540)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessStep005': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessStep(1), 134550)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessStep006': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessStep(1), 134560)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessStep007': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.clearHistory()

                await waitForExist(() => '' + this.controller.accessStep(-1), this.str, 'false');
                Utils.emitEvent(this.controller.accessStep(-1), 134570)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessStep008': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessStep(-1), 134580)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessBackward001': {
              try {
                let isCan = this.controller.accessBackward()
                Utils.emitEvent(isCan, 134590)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134590)
              }
              break;
            }
            case 'testAccessBackward002': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/second.html' });
                await waitForExist(() => this.isComplete, this.str, 0);

                let isCan = this.controller.accessBackward()
                Utils.emitEvent(isCan, 134600)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134600)
              }
              break;
            }
            case 'testAccessBackward003': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/second.html' });
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.clearHistory()
                await waitForExist(() => '' + this.controller.accessBackward(), this.str, 'false');
                Utils.emitEvent(this.controller.accessBackward(), 134610)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessBackward004': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessBackward(), 134620)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessForward001': {
              try {
                let isCan = this.controller.accessForward()
                Utils.emitEvent(isCan, 134630)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134630)
              }
              break;
            }
            case 'testAccessForward002': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: Constants.EXAMPLE_URL })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                let isCan = this.controller.accessForward()
                Utils.emitEvent(isCan, 134640)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134640)
              }
              break;
            }
            case 'testAccessForward003': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/second.html' })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.clearHistory()
                await waitForExist(() => '' + this.controller.accessForward(), this.str, 'false');
                Utils.emitEvent(this.controller.accessForward(), 134650)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testAccessForward004': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                Utils.emitEvent(this.controller.accessForward(), 134660)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testBackward001': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: Constants.EXAMPLE_URL })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward();
                await waitForExist(() => this.isComplete, this.str, 0);
                this.controller.runJavaScript({
                  script: 'getTitle()', callback: (res) => {
                    Utils.emitEvent(res, 134670)
                  },
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134670)
              }
              break;
            }
            case 'testBackward002': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: $rawfile('index.html') });
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>' +
                    'function getTitle(){return document.title}' +
                    '</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.runJavaScript({
                  script: 'getTitle()', callback: (res) => {
                    Utils.emitEvent(res, 134680)
                  },
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testBackward003': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.clearHistory()
                await waitForExist(() => '' + this.controller.accessBackward(), this.str, 'false');

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0, 100);
                this.isComplete = 0;

                this.controller.runJavaScript({
                  script: 'getTitle()', callback: (res) => {
                    Utils.emitEvent(res, 134690)
                  },
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testForward001': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/webMessageExt.html' });
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.forward()
                await waitForExist(() => this.isComplete, this.str, 0);

                if (this.newUrl == 'resource://rawfile/webMessageExt.html') {
                  Utils.emitEvent(true, 134700)
                  return;
                }
                Utils.emitEvent(false, 134700)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 134700)
              }
              break;
            }
            case 'testForward002': {
              try {
                this.isComplete = -1;
                this.controller.loadData({
                  data: '<html>' +
                    '<head>' +
                    '<title>LoadData</title>' +
                    '</head>' +
                    '<body bgcolor="white">Source:<pre>source</pre</body>' +
                    '<script>function getTitle(){return document.title}</script>' +
                    '</html>',
                  mimeType: 'text/html',
                  encoding: 'UTF-8',
                })
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.forward()
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.runJavaScript({
                  script: 'getTitle()', callback: (res) => {
                    Utils.emitEvent(res, 134710)
                  },
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testForward003': {
              try {
                this.isComplete = -1;
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await waitForExist(() => this.isComplete, this.str, 0);

                this.isComplete = -1;
                this.controller.backward()
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.clearHistory()
                await waitForExist(() => '' + this.controller.accessForward(), this.str, 'false');

                this.isComplete = -1;
                this.controller.forward()
                await waitForExist(() => this.isComplete, this.str, 0, 100);
                this.isComplete = 0;

                this.controller.runJavaScript({
                  script: 'getTitle()', callback: (res) => {
                    Utils.emitEvent(res, 134720)
                  },
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      TextInput({ placeholder: 'inputs your words' })
        .key('textInput')
        .type(InputType.Normal)
        .placeholderColor(Color.Blue)
        .placeholderFont({
          size: 20,
          weight: FontWeight.Normal,
          family: 'sans-serif',
          style: FontStyle.Normal,
        })
        .enterKeyType(EnterKeyType.Next)
        .caretColor(Color.Green)
        .height(60)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily('cursive')
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Red)
        .maxLength(20)
        .border({
          width: 1,
          color: 0x317AF7,
          radius: 10,
          style: BorderStyle.Solid,
        })
        .onClick(() => {
          console.info('TextInput click')
        })

      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .visibility(this.webVisibility)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .cacheMode(this.cacheMode)
        .initialScale(this.initialScale)
        .mixedMode(this.mixedMode)
        .userAgent('Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36')
        .javaScriptProxy({
          object: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller,
        })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageBegin((event) => {
          if (event) {
            this.pageBegin = event.url
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.titleReceive = event.title
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.pageEnd = event.url
            console.log('onPageEnd==>', event.url)
            this.isComplete = 0;
          }
        })
        .onRefreshAccessedHistory((event) => {
          if (event) {
            console.info('onRefreshAccessedHistory==>')
            this.newUrl = event.url
          }

        })
        .zoomAccess(this.zoomAccess)
        .onBlur(() => {
          console.info('onBlur==>')
          this.controller.requestFocus()
        })
        .onFocus(() => {
          this.requestFocus = true
        })
    }
  }
}
