'use static';
/**
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
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import udmfType from '@ohos.data.uniformTypeDescriptor';
import { PromptAction } from "@ohos.arkui.UIContext";
import {
  Entry,
  Component,
  Visibility,
  DragEvent,
  Margin,
  Image,
  Text,
  $r,
  CopyOptions,
  DragResult,
  Row,
  Column,
  Video,
  Color,
  Rectangle,
  TextArea,
  Search
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct Index {
  @State targetImage: string = '';
  @State targetText: string = 'Drag Text';
  @State hyperLinkText: string = 'HyperLink';
  @State hyperLinkContent: string = 'HyperLink';
  @State imageWidth: number = 100;
  @State imageHeight: number = 100;
  @State imgState: Visibility = Visibility.Visible;
  @State videoSrc: string = 'resource://RAWFILE/02.mp4';
  @State abstractContent: string = "abstract";
  @State textContent: string = "";

  getDataFromUdmfRetry(event: DragEvent, callback: (data: DragEvent) => void) {
    let records: Array<unifiedDataChannel.UnifiedRecord> = event.getData()!.getRecords()!;
    if (records.length !== 0) {
      callback(event);
      return;
    }
    setTimeout(() => {
      this.getDataFromUdmfRetry(event, callback);
    }, 1500);
  }

  build() {
    Row() {
      Column() {
        Text('start Drag')
          .fontSize(18)
          .width('100%')
          .height(40)
          .margin(10)
          .key('dragAdd')
          .backgroundColor('#008888')
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .draggable(true)
          .margin({ left: 15 } as Margin)
          .visibility(this.imgState)
          .onDragEnd((event: DragEvent): void => {
            const promptAc = new PromptAction()
            if (event.getResult() === DragResult.DRAG_SUCCESSFUL) {
              promptAc.showToast({ duration: 100, message: 'Drag Success' });
            } else if (event.getResult() === DragResult.DRAG_FAILED) {
              promptAc.showToast({ duration: 100, message: 'Drag failed' });
            }
          })
        Text('test drag event')
          .width('100%')
          .height(100)
          .draggable(true)
          .margin({ left: 15 } as Margin)
          .copyOption(CopyOptions.InApp)
        TextArea({ placeholder: 'please input words' })
          .copyOption(CopyOptions.InApp)
          .width('100%')
          .height(50)
          .draggable(true)
        Search({ placeholder: 'please input you word' })
          .searchButton('Search')
          .width('100%')
          .height(80)
          .textFont({ size: 20 })
        Column() {
          Text('change video source')
        }.draggable(true)
        .onDragStart((event: DragEvent, extraParams?: string): () => void => {

          let video: unifiedDataChannel.Video = new unifiedDataChannel.Video();
          video.videoUri = 'resource://RAWFILE/01.mp4';
          let data: unifiedDataChannel.UnifiedData = new unifiedDataChannel.UnifiedData(video);
          event.setData(data);
          return (): void => {};
        })

        Column() {
          Text('this is abstract')
            .fontSize(20)
            .width('100%')
        }.margin({ left: 40, top: 20 } as Margin)
        .width('100%')
        .height(100)
        .onDragStart((event: DragEvent, extraParams?: string): () => void => {
          let data: unifiedDataChannel.PlainText = new unifiedDataChannel.PlainText();
          data.textAbstract = 'this is abstract';
          data.textContent = 'this is content this is content';
          event.setData(new unifiedDataChannel.UnifiedData(data));
          return (): void => {};
        })
      }.width('45%')
      .height('100%')

      Column() {
        Text('Drag Target Area')
          .fontSize(20)
          .width('100%')
          .height(40)
          .margin(10)
          .backgroundColor('#008888')
        Image(this.targetImage)
          .width(this.imageWidth)
          .height(this.imageHeight)
          .draggable(true)
          .margin({ left: 15 } as Margin)
          .border({ color: Color.Black, width: 1 })
          .allowDrop([udmfType.UniformDataType.IMAGE])
          .onDrop((dragEvent: DragEvent): void => {
            this.getDataFromUdmfRetry(dragEvent, (event) => {
              let records: Array<unifiedDataChannel.UnifiedRecord> = event.getData()!.getRecords()!;
              let rect: Rectangle = event.getPreviewRect();
              this.imageWidth = rect.width as number;
              this.imageHeight = rect.height as number;
              this.targetImage = (records[0] as unifiedDataChannel.Image).imageUri;
              event.useCustomDropAnimation = false;
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                this.imageWidth = 100;
                this.imageHeight = 100;
                this.imgState = Visibility.None;
              })
              event.setResult(DragResult.DRAG_SUCCESSFUL);
            })
          })

        Text(this.targetText)
          .width('100%')
          .height(100)
          .border({ color: Color.Black, width: 1 })
          .margin(15)
          .allowDrop([udmfType.UniformDataType.TEXT])
          .onDrop((dragEvent: DragEvent): void => {
            console.info("the getDisplayX " + dragEvent.getDisplayX());
            console.info("the getDisplayY " + dragEvent.getDisplayY());
            console.info("the getWindowX " + dragEvent.getWindowX());
            console.info("the getWindowY " + dragEvent.getWindowY());
            console.info("the getDisplayX " + dragEvent.getSummary());
            console.info("the getVelocityX " + dragEvent.getVelocityX());
            console.info("the getVelocityY " + dragEvent.getVelocityY());
            console.info("the getVelocity " + dragEvent.getVelocity());
            this.getDataFromUdmfRetry(dragEvent, event => {
              let records: Array<unifiedDataChannel.UnifiedRecord> = event.getData()!.getRecords()!;
              if (records[0]) {
                let record = (records[0] as unifiedDataChannel.Text)
                if (record.details) {
                  this.targetText = record.details!['value'] ?? ""
                }
              }
            })
          })

        Video({ src: this.videoSrc, previewUri: $r('app.media.icon') })
          .width('100%')
          .height(200)
          .controls(true)
          .allowDrop([udmfType.UniformDataType.VIDEO])

        Column() {
          Text(this.abstractContent).fontSize(20).width('100%')
          Text(this.textContent).fontSize(15).width('100%')
        }
        .width('100%')
        .height(100)
        .margin(20)
        .border({ color: Color.Black, width: 1 })
        .allowDrop([udmfType.UniformDataType.PLAIN_TEXT])
        .onDrop((dragEvent: DragEvent): void => {
          this.getDataFromUdmfRetry(dragEvent, event => {
            let records: Array<unifiedDataChannel.UnifiedRecord> = event.getData()!.getRecords()!;
            let plainText: unifiedDataChannel.PlainText = records[0] as unifiedDataChannel.PlainText;
            this.abstractContent = plainText.textAbstract ?? "";
            this.textContent = plainText.textContent;
          })
        })
      }.width('45%')
      .height('100%')
      .margin({ left: '5%' } as Margin)
    }
    .height('100%')
  }
}