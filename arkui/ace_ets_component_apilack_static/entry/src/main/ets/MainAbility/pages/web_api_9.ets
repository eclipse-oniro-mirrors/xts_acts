'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  $rawfile,
  AlertDialogParamWithButtons,
  Alignment,
  BarMode,
  BarPosition,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  DataChangeListener,
  Entry,
  FileSelectorResult,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  IDataSource,
  Image,
  InputType,
  ItemAlign,
  LazyForEach,
  Margin,
  Path,
  Progress,
  Resource,
  Row,
  Search,
  SearchController,
  Stack,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextArea,
  TextInput,
  TextOverflow,
  Video,
  VideoController,
  Visibility,
  Web,
  WebResourceResponse,
  WebviewController
} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import web_webview from '@ohos.web.webview';
import Utils from '../common/Utils';
import { RecordData } from '@ohos.base';


@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State isSuccess: Boolean = false;
  @State str: string = "emitUserAgent"
  fileSelector: FileSelectorResult = new FileSelectorResult();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
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
          // console.info("" + event.result.copyImage());
          // console.info("" + event.result.closeContextMenu());
          this.isSuccess = true;
          // Utils.emitEvent(this.isSuccess, 1101)
          return true;
        }).onWindowNew((event) => {
        console.log("onWindowNew...");
        let popController: web_webview.WebviewController = new web_webview.WebviewController();
        event.handler.setWebController(popController);
        this.isSuccess = true;
        // Utils.emitEvent(this.isSuccess, 1102)
      }).onShowFileSelector((event) => {
        this.getUIContext().showAlertDialog({
          title: event.fileSelector.getTitle(),
          message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() +
            'acceptType:' + event.fileSelector.getAcceptType(),
          primaryButton: {
            value: 'upload',
            action: () => {
              let fileList: Array<string> = [
                '/data/storage/el2/base/test',
              ]
              event.result.handleFileList(fileList)
            }
          },
          secondaryButton: {
            value: 'second',
            action: () => {

            }
          },
          cancel: () => {
            let fileList: Array<string> = []
            event.result.handleFileList(fileList)
          }
        } as AlertDialogParamWithButtons)
        return true;
      }).onAlert((event) => {
        this.getUIContext().showAlertDialog({
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

        } as AlertDialogParamWithButtons)
        return true;
      })

      Web({ src: 'www.baidu.com', controller: this.controller })
        .onShowFileSelector((event) => {
          this.getUIContext().showAlertDialog({
            title: event.fileSelector.getTitle(),
            message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() +
              'acceptType:' + event.fileSelector.getAcceptType(),
            primaryButton: {
              value: 'upload',
              action: () => {
                let fileList: Array<string> = [
                  '/data/storage/el2/base/test',
                ]
                event.result.handleFileList(fileList)
              }
            },
            secondaryButton: {
              value: 'third',
              action: () => {

              }
            },
            cancel: () => {
              let fileList: Array<string> = []
              console.info("this is Capture " + event.fileSelector.isCapture());
              console.info("this is getTitle" + event.fileSelector.getTitle());
              console.info("this is getMode" + event.fileSelector.getMode());
              console.info("this is getAcceptType" + event.fileSelector.getAcceptType().length);
            }
          } as AlertDialogParamWithButtons)
          return true;
        })


      Row() {
        Button("webTest").key('web2').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str);
          switch (this.str) {
            // add
            case "emitHitTestValue":
              let hitValue = this.controller.getLastHitTest();
              console.info("hitType: " + hitValue.type);
              console.info("extra: " + hitValue.extra);
            // Utils.emitEvent(hitValue.getType(), 1103);
            default:
              console.info("can not match case")
          }

        })
      }

    }
  }

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("web page valueChangeCallBack");
      if (eventData != null) {
        const data = eventData.data as Record<String,RecordData>
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        if (data['ACTION'] != null) {
          this.str = data['ACTION'] as string;
        }
      }
    }
}
