/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { testPng, testJpg } from '../model/testImg';

const TAG = 'MuseEditorExtensionAbility';

@Entry
@Component
struct PhotoEditor {
  async aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'PhotoEditor index aboutToAppear');

    const uiContext = getContext(this) as common.PhotoEditorExtensionContext;

    let imageSourceApi: image.ImageSource = image.createImageSource(testJpg.buffer);
    let pixmap: image.PixelMap = await imageSourceApi.createPixelMap();

    let packOpts: image.PackingOption = { format: 'image/jpeg', quality: 98 };
    try {
      uiContext.saveEditedContentWithImage(pixmap,
        packOpts).then(data => {
        if (data.resultCode == 0) {
          hilog.info(0x0000, TAG, `Save succeed.`);
        }
        hilog.info(0x0000, TAG,
          `saveContentEditingWithImage result: ${JSON.stringify(data)}`);
      })
    } catch (e) {
      hilog.error(0x0000, TAG, `saveContentEditingWithImage failed:${e}`);
    }

    try {
      uiContext.saveEditedContentWithUri(uiContext.filesDir + '/imaged.jpg').then(data => {
        if (data.resultCode == 0) {
          hilog.info(0x0000, TAG, `Save succeed.`);
        }
        hilog.info(0x0000, TAG,
          `saveEditedContentWithUri result: ${JSON.stringify(data)}`);
      })
    } catch (e) {
      hilog.error(0x0000, TAG, `saveEditedContentWithUri failed:${e}`);
    }

  }
 @State message: string = 'PhotoEditor'
   build() {
         Row() {
           Column() {
             Text(this.message)
               .fontSize(50)
               .fontWeight(FontWeight.Bold)
             Button() {
               Text('next page')
                 .fontSize(20)
                 .fontWeight(FontWeight.Bold)
             }.type(ButtonType.Capsule)
             .margin({
               top: 20
             })
             .backgroundColor('#0D9FFB')
             .width('35%')
             .height('5%')
             .onClick(()=>{
             })
           }
             .width('100%')
         }
             .height('100%')
   }
 }