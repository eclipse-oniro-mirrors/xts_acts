'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import fileUri from '@ohos.file.fileuri';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import common from '@ohos.app.ability.common'
import {
  $r,
  Alignment,
  Button,
  ButtonType,
  Checkbox,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DragEvent,
  DropOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  Image,
  ItemAlign,
  KeyEvent,
  KeyProcessingMode,
  KeyType,
  List,
  ListItem,
  Margin,
  Row,
  Scroll,
  Scroller,
  Text,
  TextArea,
  TextClock,
  TextInput,
  UnifiedData,
  Visibility
} from '@ohos.arkui.component'
import { BusinessError } from '@ohos.base';
import application from '@ohos.app.ability.application';

@Entry
@Component
struct ImageExample {
  @State uri: string = ""
  @State AblockArr: string[] = new Array<string>()
  @State BblockArr: string[] = new Array<string>()
  @State AVisible: Visibility = Visibility.Visible
  @State dragSuccess: boolean = false
  destPath: string = '/data/';
  fileConflictOptions: unifiedDataChannel.FileConflictOptions = unifiedDataChannel.FileConflictOptions.OVERWRITE
  buttonStrArr1: string[] = new Array<string>('OVERWRITE', 'SKIP');
  index1: Int = 0
  progressIndicator: unifiedDataChannel.ProgressIndicator = unifiedDataChannel.ProgressIndicator.DEFAULT
  buttonStrArr2: string[] = new Array<string>('DEFAULT', 'NONE');
  index2: Int = 0
  buttonStrArr3: string[] = new Array<string>('true', 'false');
  index3: Int = 0;
  @State fileConflictOptionsStr: string = this.buttonStrArr1[this.index1]
  @State progressIndicatorStr: string = this.buttonStrArr2[this.index2]
  @State disableDataPrefetchStr: string = this.buttonStrArr3[this.index3]
  disableDataPrefetchArr: boolean[] = new Array<boolean>(true, false);
  disableDataPrefetch: boolean = this.disableDataPrefetchArr[this.index3];
  @State dragResult: string = '';
  @State dragResult1: string = '';
  @State udKey: string = '';
  @State cancelResult: number = 0;
  @State res: string | undefined = ''

  build() {
    Column() {
      Text(this.res).id('res')
      Text('========')
      Text(this.dragResult).id('dragResult')
      Text('========')
      Text(this.dragResult1).id('dragResult1')
      Text('========')
      Text(String(this.cancelResult)).id('cancelResult')

        .fontSize('30dp')
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Image($r('app.media.icon'))
          .id('image')
          .width('45%')
          .height('30%')
          .border({ width: 1 })
          .visibility(this.AVisible)
          .draggable(true)
      }

      Column() {
        Text('可释放区域')
          .fontSize('15dp')
          .height('10%')
        List() {
          ForEach(this.BblockArr, (item: string) => {
            ListItem() {
              Image(item)
                .width('30%')
                .height('30%')
                .border({ width: 1 })
            }
            .margin({ left: 30, top: 30 } as Margin)
          }, (item: string) => item)
        }
        .border({ width: 1 })
        .id("list")
        .height('90%')
        .width('100%')

        .onDrop((event?: DragEvent, extraParams?: string): void => {
          console.log("enter onDrop")
          // 准备 options
          let context = this.getUIContext().getHostContext()
          let pathDir: string = context!.distributedFilesDir;

          let destUri = fileUri.getUriFromPath(pathDir);

          let progressListener: unifiedDataChannel.DataProgressListener =
            (progress: unifiedDataChannel.ProgressInfo, dragData: UnifiedData | null) => {

              if (dragData != null) {
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
                let arr: Array<unifiedDataChannel.UnifiedRecord> = dragData.getRecords();
                if (arr.length > 0) {
                  console.log('30058220uri1:', this.uri);
                  if (records[0].getType() === 'uniformTypeDescriptor.UniformDataType.IMAGE') {
                    let image = arr[0] as unifiedDataChannel.Image;
                    this.uri = image.imageUri;
                    this.dragResult1 = 'Drag Success';
                    console.log('30058220uri:', this.uri);
                    console.log('30058220uri:', this.dragResult1);
                    this.BblockArr.splice((JSON.parseJsonElement(extraParams as string)
                      .getDouble('insertIndex')).toInt(),
                      0 as Int,
                      this.uri);
                  }
                  console.log('30058220type:', records[0].getType().toString());
                  if (records[0].getType() === 'uniformTypeDescriptor.UniformDataType.VIDEO') {
                    let video = arr[0] as unifiedDataChannel.Video;
                    this.uri = video.videoUri;
                    this.BblockArr.splice((JSON.parseJsonElement(extraParams as string)
                      .getDouble('insertIndex')).toInt(),
                      0 as Int,
                      this.uri);
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
            this.udKey = (event as DragEvent).startDataLoading(options) as String ?? '';
            console.log('udkey:', this.udKey);
            this.res = this.udKey
          } catch (e: BusinessError) {
            console.info('startDataLoading error:', e);
          }
        }, { disableDataPrefetch: this.disableDataPrefetch } as DropOptions)
      }
      .height("30%")
      .width("45%")

      Button('取消数据传输')
        .id('cancel')
        .onClick((e: ClickEvent) => {
          try {
            this.getUIContext().getDragController().cancelDataLoading(this.udKey);
          } catch (e: BusinessError) {
            this.cancelResult = e.code;
            console.info('cancelDataLoading error:', e.code);
          }
        })
        .margin({ top: '3%' } as Margin)
    }.width('100%').height('100%')
  }
}