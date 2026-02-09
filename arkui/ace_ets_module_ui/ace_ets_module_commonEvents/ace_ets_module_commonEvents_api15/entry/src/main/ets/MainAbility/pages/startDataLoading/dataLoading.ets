/*

Copyright (c) 2025 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { fileUri } from '@kit.CoreFileKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
@Entry
@Component
struct ImageExample {
  @State uri: string = ""
  @State AblockArr: string[] = []
  @State BblockArr: string[] = []
  @State AVisible: Visibility = Visibility.Visible
  @State dragSuccess :Boolean = false
  destPath: string = '/data/';
  fileConflictOptions: unifiedDataChannel.FileConflictOptions = unifiedDataChannel.FileConflictOptions.OVERWRITE
  fileConflictOptionsArr: unifiedDataChannel.FileConflictOptions[] = [unifiedDataChannel.FileConflictOptions.OVERWRITE, unifiedDataChannel.FileConflictOptions.SKIP]
  buttonStrArr1 = ['OVERWRITE', 'SKIP'];
  index1: number = 0
  progressIndicator: unifiedDataChannel.ProgressIndicator = unifiedDataChannel.ProgressIndicator.DEFAULT
  progressIndicatorArr: unifiedDataChannel.ProgressIndicator[] = [unifiedDataChannel.ProgressIndicator.DEFAULT, unifiedDataChannel.ProgressIndicator.NONE]
  buttonStrArr2 = ['DEFAULT', 'NONE'];
  index2: number = 0
  buttonStrArr3 = ['true', 'false'];
  index3: number = 0;
  @State fileConflictOptionsStr: string = this.buttonStrArr1[this.index1]
  @State progressIndicatorStr: string = this.buttonStrArr2[this.index2]
  @State disableDataPrefetchStr: string = this.buttonStrArr3[this.index3]
  disableDataPrefetchArr = [true, false];
  disableDataPrefetch: boolean = this.disableDataPrefetchArr[this.index3];
  @State dragResult: string = '';
  @State dragResult1: string = '';
  @State udKey: string = '';
  @State cancelResult: string = '';
  @State res:string =''

  build() {
    Column() {
      Text(this.res).id('res')
      Text(this.dragResult).id('dragResult')
      Text(this.dragResult1).id('dragResult1')
      Text(this.cancelResult).id('cancelResult')

        .fontSize('30dp')
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Image($r('app.media.icon'))
          .id('image')
          .width('45%')
          .height('30%')
          .border({ width: 1 })
          .visibility(this.AVisible)
          .draggable(true)
          .onDragStart(()=>{})
      }
      Column(){
        Text('可释放区域')
          .fontSize('15dp')
          .height('10%')
        List(){
          ForEach(this.BblockArr, (item:string, index) => {
            ListItem() {
              Image(item)
                .width('30%')
                .height('30%')
                .border({width: 1})
            }
            .margin({ left: 30 , top : 30})
          }, (item:string) => item)
        }
        .border({width: 1})
        .id("list")
        .height('90%')
        .width('100%')
        .onDrop((event?: DragEvent, extraParams?: string) => {
          console.log("enter onDrop")
          // 准备 options
          let context = getContext(this) as common.UIAbilityContext; // 获取设备A的UIAbilityContext信息
          let pathDir: string = context.distributedFilesDir;
          let destUri = fileUri.getUriFromPath(pathDir);
          let progressListener: unifiedDataChannel.DataProgressListener = (progress: unifiedDataChannel.ProgressInfo, dragData: UnifiedData | null) => {
            
            if(dragData != null) {
              let records = dragData.getRecords();
              for (let i = 0; i < records.length; i++) {
                let record = records[i];
                if (record.getType() == 'general.file' ||
                  record.getType() == 'general.image' ||
                  record.getType() == 'general.video' ||
                  record.getType() == 'general.audio' ||
                  record.getType() == 'general.folder') {
                  let file = record as unifiedDataChannel.File;
                  console.info(`zph JS file uri: ${file.uri}`);
                }
              }
              // 元数据data已ready
              let arr:Array<unifiedDataChannel.UnifiedRecord> = dragData.getRecords();
              if(arr.length > 0) {
                console.log('30058220uri1:', this.uri);
                if (records[0].getType() === uniformTypeDescriptor.UniformDataType.IMAGE) {
                  let image = arr[0] as unifiedDataChannel.Image;
                  this.uri = image.imageUri;
                  this.dragResult1 = 'Drag Success';
                  console.log('30058220uri:', this.uri);
                  this.BblockArr.splice(JSON.parse(extraParams as string).insertIndex, 0, this.uri);
                }
                console.log('30058220type:', records[0].getType().toString());
                if (records[0].getType() === uniformTypeDescriptor.UniformDataType.VIDEO) {
                  let video = arr[0] as unifiedDataChannel.Video;
                  this.uri = video.videoUri;
                  this.BblockArr.splice(JSON.parse(extraParams as string).insertIndex, 0, this.uri);
                }
              } else {
                console.log("dragData arr is null")
              }
            } else {
              console.log("dragData is undefined")
            }
            console.log("ondrop udmf data");
            this.dragSuccess = true
            console.info('percentage: ${progress.percentage}');
          };
          let options: unifiedDataChannel.GetDataParams = {
            destUri: destUri,
            fileConflictOptions: this.fileConflictOptions,
            progressIndicator: this.progressIndicator,
            dataProgressListener: progressListener,
          }
          try {
            this.udKey = (event as DragEvent).startDataLoading(options);
            console.log('udkey:', this.udKey);
            this.res = this.udKey
          } catch (e) {
            console.info('startDataLoading error:', e.errorCode, e.message);
          }
        }, {disableDataPrefetch: this.disableDataPrefetch})
      }
      .height("30%")
      .width("45%")
      Button('取消数据传输')
        .id('cancel')
        .onClick(() => {
          try {
            this.getUIContext().getDragController().cancelDataLoading(this.udKey);
          } catch (e) {
            this.cancelResult = e.code;
            console.info('cancelDataLoading error:', e.code);
          }
        })
        .margin({top: '3%'})
    }.width('100%').height('100%')
  }
}