/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { picker } from '@kit.CoreFileKit';
import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { Hypium } from '@ohos/hypium';
import { waitForExist} from '../../test/WaitTest.test';
import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { webview } from '@kit.ArkWeb';
import { pasteboard } from '@kit.BasicServicesKit';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
const EVENT_ID_SET_SUITE_KEY = 183124;
let driver = Driver.create();

@Entry
@Component
struct webViewController {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State getSuggestedName:string = ''
  @State getDefaultPath:string = ''
  @State getDescriptions:number = 90
  @State isAcceptAllOptionExcluded:boolean = true;
  @State mimeType:string = ''
  @State acceptableType:string = ''
  @State getAcceptableFileTypesArr:number = 70

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }




  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewOnShowFileSelectorButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitOnShowFileSelector01": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent('test-file.mp4', 20260105)
              } else {
                await Utils.sleep(1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let getSuggestedName = this.getSuggestedName
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(getSuggestedName, 20260105);
                }, 1000)
              }
                break;
            }

            case "emitOnShowFileSelector02": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent('downloads', 20260106)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let getDefaultPath = this.getDefaultPath;
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(getDefaultPath, 20260106);
                }, 1000)
              }
                break;
            }

            case "emitOnShowFileSelector03": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent(1, 20260107)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let getDescriptions = this.getDescriptions;
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(getDescriptions, 20260107);
                }, 1000)
              }
              break;
            }
            case "emitOnShowFileSelector04": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent(true, 20260108)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let isAcceptAllOptionExcluded = this.isAcceptAllOptionExcluded
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(isAcceptAllOptionExcluded, 20260108);
                }, 1000)
              }
              break;
            }

            case "emitOnShowFileSelector05": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent('video/*', 20260109)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let mimeType = this.mimeType;
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(mimeType, 20260109);
                }, 1000)
              }
              break;
            }

            case "emitOnShowFileSelector06": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent('[".mp4",".ogm",".wmv",".mpg"]', 20260110)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let acceptableType = this.acceptableType
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(acceptableType, 20260110);
                }, 1000)
              }
              break;
            }

            case "emitOnShowFileSelector07": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent(0, 202601077)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker1.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let getDescriptions = this.getDescriptions
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(getDescriptions, 202601077);
                }, 1000)

              }
              break;
            }

            case "emitOnShowFileSelector08": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent(false, 202601078)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker1.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let isAcceptAllOptionExcluded = this.isAcceptAllOptionExcluded
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(isAcceptAllOptionExcluded, 202601078);
                }, 1000)
              }
              break;
            }

            case "emitOnShowFileSelector09": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent(0, 202601079)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker1.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let getAcceptableFileTypesArr = this.getAcceptableFileTypesArr;
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(getAcceptableFileTypesArr, 202601079);
                }, 1000)
              }
              break;
            }

            case "emitOnShowFileSelector10": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent(1, 2026010710)
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('保存文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                let getAcceptableFileTypesArr = this.getAcceptableFileTypesArr
                let buttonTwo = await driver.findComponent(ON.text('重置内容'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  let buttonThree = await driver.findComponent(ON.text('取消'));
                  await buttonThree.click()
                }
                setTimeout(() => {
                  Utils.emitEvent(getAcceptableFileTypesArr, 2026010710);
                }, 1000)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('showSaveFilePicker5.html'), controller: this.controller })
        .onShowFileSelector((event) => {
          // event.fileSelector = event.fileSelector.getMode();
          console.log('MyFileUploader onShowFileSelector invoked');
          this.getSuggestedName = event.fileSelector.getSuggestedName();
          this.getDefaultPath = event.fileSelector.getDefaultPath();
          this.getDescriptions = event.fileSelector.getDescriptions().length;
          this.isAcceptAllOptionExcluded = event.fileSelector.isAcceptAllOptionExcluded();
          console.log('tian Suggested name are ' + event.fileSelector.getSuggestedName());
          console.log('tian Default Path are ' + event.fileSelector.getDefaultPath());
          console.log('tian Descriptions are ' + event.fileSelector.getDescriptions());
          console.log('tian Exclude accept all options are ' + event.fileSelector.isAcceptAllOptionExcluded());
          let accepts = event.fileSelector.getAcceptableFileTypes();
          this.getAcceptableFileTypesArr = event.fileSelector.getAcceptableFileTypes().length;
          for (let i = 0; i < accepts.length; i++) {
            for (let j = 0; j < accepts[i].length; j++) {
              this.mimeType = accepts[i][j].mimeType;
              this.acceptableType = JSON.stringify(accepts[i][j].acceptableType);
              console.log('tian onShowFileSelector getAcceptType.MimeType is ' + accepts[i][j].mimeType);
              console.log('tian onShowFileSelector getAcceptType,AcceptType is ' + accepts[i][j].acceptableType);
            }
          };
          return false;
        })
        .onPageEnd((event) => {
          console.log('pbbonPageEnd')
          this.isPageEnd = 1
        })


    }
    .key('RowSize')

  }
}

