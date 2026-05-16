/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

'use static'

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import {
  Entry,
  Column,
  Row,
  Component,
  Builder,
  Button,
  Text,
  ClickEvent,
  CustomPopupOptions,
  SaveButton,
  SaveDescription,
  $r,
  SaveIconStyle,
  SaveButtonCallback,
  SaveButtonOnClickResult,
  ColumnOptions,
  ButtonType,
  FlexAlign,
  TextOverflow
} from '@ohos.arkui.component';

@Entry
@Component
struct SaveButtonIndex {
  @State resultValue: SaveButtonOnClickResult = SaveButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED;

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  handleSaveButtonClick: SaveButtonCallback =
    (event: ClickEvent, result: SaveButtonOnClickResult, error?: BusinessError): void => {
      if (result === SaveButtonOnClickResult.SUCCESS) {
        const context = this.getUIContext().getHostContext() as common.Context;
        let helper = photoAccessHelper.getPhotoAccessHelper(context);
        if(helper){
          helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'png').then((uri: string) => {
            return fileIo.open(uri, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
          }).then((file: fileIo.File) => {
            return fileIo.write(file.fd, 'context').then(() => {
              return fileIo.close(file.fd);
            });
          }).catch((err: Error) => {
            console.error('File operation error: ' + err.message);
          });
        }
      } else if(result === SaveButtonOnClickResult.CANCELED_BY_USER){
        this.resultValue = result;
      } else {
        console.error('errCode: ' + error?.code);
        console.error('errMessage: ' + error?.message);
      }
    };

  build() {
    Column() {
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: ButtonType.Capsule })
          .id('saveButton')
          .onClick((this.handleSaveButtonClick))
          .fontSize(10)
          .setIcon($r('app.media.icon'))
          .setText('setText')
          .iconBorderRadius(4)
          .stateEffect(false)
          .userCancelEvent(false)
          .constraintSize({
            minWidth: 0,
            maxWidth: '90%',
            minHeight: 0,
            maxHeight: '12%'
          })
      }
      .width('100%')
      .layoutWeight(1)
      .constraintSize({ minHeight: 0, maxHeight: '52%' })
      .justifyContent(FlexAlign.Center)

      Text('' + this.resultValue)
        .id('saveButtonResultText')
        .fontSize(9)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 4 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
  }
}