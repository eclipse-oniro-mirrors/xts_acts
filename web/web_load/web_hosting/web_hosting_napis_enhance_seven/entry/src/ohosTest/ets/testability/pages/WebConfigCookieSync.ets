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

import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE } from '../../test/Config.test';
import testNapi from 'libentry.so'

@Entry
@Component
struct WebConfigCookieSync {

  controller: web_webview.WebviewController = new web_webview.WebviewController('ArkWeb');
  @State emitKey: string = ''
  @State isReceive: number = 0


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(147501)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  aboutToAppear() {
    console.info('start run testcase!!!')
    web_webview.WebviewController.initializeWebEngine();
  }


  build() {
    Column() {
      Row() {
          Button('WebConfigCookieSyncTest').key('ConfigCookieSync')
            .onClick(async () => {
              console.info('1key==>' + this.emitKey)
              await waitForExist(()=>this.isReceive, 'WebConfigCookieSyncTest', 1, 1000)
              console.info('2key==>' + this.emitKey)
              this.isReceive = 0
              switch (this.emitKey) {
                case 'emitConfigCookieSync001': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test=abc\nd123', false, false)
                  console.log('emitConfigCookieSync001 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync001 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'test=abc') {
                    Utils.emitEvent(true,147550)
                  } else {
                    Utils.emitEvent(false,147550)
                  }
                  break
                }
                case 'emitConfigCookieSync002': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test=abc\td123', false, false)
                  console.log('emitConfigCookieSync002 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync002 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 17100104 &&  resultValue === '') {
                    Utils.emitEvent(true,147560)
                  } else {
                    Utils.emitEvent(false,147560)
                  }
                  break
                }
                case 'emitConfigCookieSync003': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test=abc\rd123', false, false)
                  console.log('emitConfigCookieSync003 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync003 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'test=abc') {
                    Utils.emitEvent(true,147570)
                  } else {
                    Utils.emitEvent(false,147570)
                  }
                  break
                }
                case 'emitConfigCookieSync004': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test2=abc\0d123', false, false)
                  console.log('emitConfigCookieSync004 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync004 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'test2=abc') {
                    Utils.emitEvent(true,147580)
                  } else {
                    Utils.emitEvent(false,147580)
                  }
                  break
                }
                case 'emitConfigCookieSync005': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=ZhangSan\nc123; Secure; HttpOnly', false, true)
                  console.log('emitConfigCookieSync005 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync005 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'name=ZhangSan') {
                    Utils.emitEvent(true,147590)
                  } else {
                    Utils.emitEvent(false,147590)
                  }
                  break
                }
                case 'emitConfigCookieSync006': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=ZhangSan\tc123; Secure; HttpOnly;', false, true)
                  console.log('emitConfigCookieSync006 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync006 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 17100104 &&  resultValue === '') {
                    Utils.emitEvent(true,147600)
                  } else {
                    Utils.emitEvent(false,147600)
                  }
                  break
                }
                case 'emitConfigCookieSync007': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'address=Nanjing\rd123; Secure; HttpOnly;', false, true)
                  console.log('emitConfigCookieSync007 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync007 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'address=Nanjing') {
                    Utils.emitEvent(true,147610)
                  } else {
                    Utils.emitEvent(false,147610)
                  }
                  break
                }
                case 'emitConfigCookieSync008': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'age=11\0abc123; Secure; HttpOnly;', false, true)
                  console.log('emitConfigCookieSync008 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync008 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'age=11') {
                    Utils.emitEvent(true,147620)
                  } else {
                    Utils.emitEvent(false,147620)
                  }
                  break
                }
                case 'emitConfigCookieSync009': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\nYu', false, false)
                  console.log('emitConfigCookieSync009 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync009 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync009 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147630)
                  } else {
                    Utils.emitEvent(false,147630)
                  }
                  break
                }
                case 'emitConfigCookieSync010': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\rYu', false, false)
                  console.log('emitConfigCookieSync010 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync010 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync010 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147640)
                  } else {
                    Utils.emitEvent(false,147640)
                  }
                  break
                }
                case 'emitConfigCookieSync011': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\0Yu', false, false)
                  console.log('emitConfigCookieSync011 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync011 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync011 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147650)
                  } else {
                    Utils.emitEvent(false,147650)
                  }
                  break
                }
                case 'emitConfigCookieSync012': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\nYu', true, false)
                  console.log('emitConfigCookieSync012 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync012 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync012 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147660)
                  } else {
                    Utils.emitEvent(false,147660)
                  }
                  break
                }
                case 'emitConfigCookieSync013': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\rYu', true, false)
                  console.log('emitConfigCookieSync013 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync013 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync013 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147670)
                  } else {
                    Utils.emitEvent(false,147670)
                  }
                  break
                }
                case 'emitConfigCookieSync014': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\0Yu', true, false)
                  console.log('emitConfigCookieSync014 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync014 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync014 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147680)
                  } else {
                    Utils.emitEvent(false,147680)
                  }
                  break
                }
                case 'emitConfigCookieSync015': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\nYu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync015 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync015 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync015 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147690)
                  } else {
                    Utils.emitEvent(false,147690)
                  }
                  break
                }
                case 'emitConfigCookieSync016': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\tYu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync016 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync016 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 17100104 &&  resultValue === '') {
                    Utils.emitEvent(true,147700)
                  } else {
                    Utils.emitEvent(false,147700)
                  }
                  break
                }
                case 'emitConfigCookieSync017': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\rYu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync017 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync017 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync017 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147710)
                  } else {
                    Utils.emitEvent(false,147710)
                  }
                  break
                }
                case 'emitConfigCookieSync018': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\0Yu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync018 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync018 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync018 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147720)
                  } else {
                    Utils.emitEvent(false,147720)
                  }
                  break
                }
                case 'emitConfigCookieSync019': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'area=JiangNing\nArea123; Secure; HttpOnly;', true, true)
                  console.log('emitConfigCookieSync019 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync019 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'area=JiangNing') {
                    Utils.emitEvent(true,147730)
                  } else {
                    Utils.emitEvent(false,147730)
                  }
                  break
                }
                default :
                  break
              }
            })
        }
        Web({src: $rawfile('test.html'), controller: this.controller})
          .javaScriptAccess(true)
          .fileAccess(true)
          .onControllerAttached(() => {
            console.log('onControllerAttached webId:' + this.controller.getWebId())
          })
          .onPageBegin((event) => {
            console.log('onPageBegin url:' + event.url)
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
          })
    }
  }
}
