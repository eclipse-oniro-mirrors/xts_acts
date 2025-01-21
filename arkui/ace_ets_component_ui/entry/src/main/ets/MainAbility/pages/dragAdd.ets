/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import udmf from '@ohos.data.unifiedDataChannel';
import udmfType from '@ohos.data.uniformTypeDescriptor';
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct Index {
  @State targetImage: string = '';
  @State targetText: string|undefined = 'Drag Text';
  @State hyperLinkText: string = 'HyperLink';
  @State hyperLinkContent: string = 'HyperLink';
  @State imageWidth: number = 100;
  @State imageHeight: number = 100;
  @State imgState: Visibility = Visibility.Visible;
  @State videoSrc: string = 'resource://RAWFILE/02.mp4';
  @State abstractContent: string|undefined = "abstract";
  @State textContent: string = "";

  getDataFromUdmfRetry(event: DragEvent, callback: (data: DragEvent)=>void)
  {
    let records: Array<udmf.UnifiedRecord> = event.getData().getRecords();
    if (records.length !== 0) {
      callback(event);
      return;
    }
    setTimeout(()=>{
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
          .margin({left: 15})
          .visibility(this.imgState)
          .onDragEnd((event)=>{
            if (event.getResult() === DragResult.DRAG_SUCCESSFUL) {
              promptAction.showToast({duration: 100, message: 'Drag Success'});
            } else if (event.getResult() === DragResult.DRAG_FAILED) {
              promptAction.showToast({duration: 100, message: 'Drag failed'});
            }
          })
        Text('test drag event')
          .width('100%')
          .height(100)
          .draggable(true)
          .margin({left: 15})
          .copyOption(CopyOptions.InApp)
        TextArea({placeholder: 'please input words'})
          .copyOption(CopyOptions.InApp)
          .width('100%')
          .height(50)
          .draggable(true)
        Search({placeholder: 'please input you word'})
          .searchButton('Search')
          .width('100%')
          .height(80)
          .textFont({size: 20})
        Column() {
          Text('change video source')
        }.draggable(true)
        .onDragStart((event)=>{
          let video: udmf.Video = new udmf.Video();
          video.videoUri = 'resource://RAWFILE/01.mp4';
          let data: udmf.UnifiedData = new udmf.UnifiedData(video);
          event.setData(data);
        })
        Column() {
          Text('this is abstract')
            .fontSize(20)
            .width('100%')
        }.margin({left: 40, top: 20})
        .width('100%')
        .height(100)
        .onDragStart((event)=>{
          let data: udmf.PlainText = new udmf.PlainText();
          data.abstract = 'this is abstract';
          data.textContent = 'this is content this is content';
          event.setData(new udmf.UnifiedData(data));
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
          .margin({left: 15})
          .border({color: Color.Black, width: 1})
          .allowDrop([udmfType.UniformDataType.IMAGE])
          .onDrop((dragEvent: DragEvent)=> {
            this.getDataFromUdmfRetry(dragEvent, (event)=>{
              let records: Array<udmf.UnifiedRecord> = event.getData().getRecords();
              let rect: Rectangle = event.getPreviewRect();
              this.imageWidth = Number(rect.width);
              this.imageHeight = Number(rect.height);
              this.targetImage = (records[0] as udmf.Image).imageUri;
              event.useCustomDropAnimation = false;
              animateTo({duration: 1000}, ()=>{
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
          .border({color: Color.Black, width: 1})
          .margin(15)
          .allowDrop([udmfType.UniformDataType.TEXT])
          .onDrop((dragEvent: DragEvent)=>{
            console.info("the getDisplayX " + dragEvent.getDisplayX());
            console.info("the getDisplayY " + dragEvent.getDisplayY());
            console.info("the getWindowX " + dragEvent.getWindowX());
            console.info("the getWindowY " + dragEvent.getWindowY());
            console.info("the getDisplayX " + dragEvent.getSummary());
            console.info("the getVelocityX " + dragEvent.getVelocityX());
            console.info("the getVelocityY " + dragEvent.getVelocityY());
            console.info("the getVelocity " + dragEvent.getVelocity());
            this.getDataFromUdmfRetry(dragEvent, event => {
              let records:Array<udmf.UnifiedRecord> = event.getData().getRecords();
              this.targetText = (records[0] as udmf.Text).details?.['value'];
            })
          })

        Video({src: this.videoSrc, previewUri: $r('app.media.icon')})
          .width('100%')
          .height(200)
          .controls(true)
          .allowDrop([udmfType.UniformDataType.VIDEO])

        Column() {
          Text(this.abstractContent).fontSize(20).width('100%')
          Text(this.textContent).fontSize(15).width('100%')
        }.width('100%').height(100).margin(20).border({color: Color.Black, width: 1})
        .allowDrop([udmfType.UniformDataType.PLAIN_TEXT])
        .onDrop((dragEvent)=>{
          this.getDataFromUdmfRetry(dragEvent, event=>{
            let records: Array<udmf.UnifiedRecord> = event.getData().getRecords();
            let plainText: udmf.PlainText = records[0] as udmf.PlainText;
            this.abstractContent = plainText.abstract;
            this.textContent = plainText.textContent;
          })
        })
      }.width('45%')
      .height('100%')
      .margin({left: '5%'})
    }
    .height('100%')
  }
}