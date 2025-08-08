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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import web_webview from '@ohos.web.webview';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State isSuccess: Boolean = false;
  hitTestValue: HitTestValue = new HitTestValue();
  @State str: string = "emitUserAgent"
  webConTextMenuResult: WebContextMenuResult = new WebContextMenuResult();
  controllerWeb: WebController = new WebController();
  fileSelector: FileSelectorResult = new FileSelectorResult();
  fileSelectorParam: FileSelectorParam = new FileSelectorParam();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj = {
    test: (res) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str) => {
      console.info("ets toString:" + String(str));
    },
    register: (res) => {
      Utils.emitEvent(res, 86);
      return "web222"
    }
  }

  aboutToAppear() {
    let abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Web({ src: 'www.baidu.com', controller: this.controller })
        .onContextMenuShow((event) => {
          console.info("x coord = " + event.param.x());
          console.info("x coord = " + event.param.y());
          console.info("link url = " + event.param.getLinkUrl());
          console.info("source url = " + event.param.getSourceUrl());
          console.info("source url = " + event.param.getUnfilteredLinkUrl());
          console.info("source url = " + event.param.existsImageContents());
          console.info("" + event.result.copyImage());
          console.info("" + event.result.closeContextMenu());
          this.isSuccess = true;
          Utils.emitEvent(this.isSuccess, 1101)
          return true;
        }).onWindowNew((event) => {
        console.log("onWindowNew...");
        let popController: web_webview.WebviewController = new web_webview.WebviewController();
        event.handler.setWebController(popController);
        this.isSuccess = true;
        Utils.emitEvent(this.isSuccess, 1102)
      }).onShowFileSelector((event) => {
        AlertDialog.show({
          title: event.fileSelector.getTitle(),
          message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() + 'acceptType:' + event.fileSelector.getAcceptType(),
          confirm: {
            value: 'upload',
            action: () => {
              let fileList: Array<string> = [
                '/data/storage/el2/base/test',
              ]
              event.result.handleFileList(fileList)
            }
          },
          cancel: () => {
            let fileList: Array<string> = []
            event.result.handleFileList(fileList)
          }
        })
        return true;
      }).onAlert((event) => {
        AlertDialog.show({
          title: 'onAlert',
          message: 'text',
          primaryButton: {
            value: 'cancel',
            action: () => {
              event.result.handleCancel()
            }
          },
          secondaryButton: {
            value: 'ok',
            action: () => {
              event.result.handlePromptConfirm("已經確認")
            }
          },
          cancel: () => {
            event.result.handleCancel()
          }

        })
        return true;
      })

      Web({ src: 'www.baidu.com', controller: this.controller })
        .onShowFileSelector((event) => {
          AlertDialog.show({
            title: event.fileSelector.getTitle(),
            message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() + 'acceptType:' + event.fileSelector.getAcceptType(),
            confirm: {
              value: 'upload',
              action: () => {
                let fileList: Array<string> = [
                  '/data/storage/el2/base/test',
                ]
                event.result.handleFileList(fileList)
              }
            },
            cancel: () => {
              let fileList: Array<string> = []
              console.info("this is Capture " + event.fileSelector.isCapture());
              console.info("this is getTitle" + event.fileSelector.getTitle());
              console.info("this is getMode" + event.fileSelector.getMode());
              console.info("this is getAcceptType" + event.fileSelector.getAcceptType().length);
            }
          })
          return true;
        })


      Row() {
        Button("webTest").key('web2').onClick(async () => {
          console.info("key==>" + this.str);
          switch (this.str) {
          // add
            case "emitHitTestValue":
              let hitValue = this.controller.getHitTestValue();
              console.info("hitType: " + hitValue.getType());
              console.info("extra: " + hitValue.getExtra());
              Utils.emitEvent(hitValue.getType(), 1103);
            default:
              console.info("can not match case")
          }

        })
      }

    }
  }
}
