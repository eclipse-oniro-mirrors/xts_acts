/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export class ImageUtils {
  private static instance: ImageUtils;

  public static getInstance(): ImageUtils {
    if (!ImageUtils.instance) {
      ImageUtils.instance = new ImageUtils()
    }
    return ImageUtils.instance
  }

  async getPixelMap(resource: Resource): Promise<image.PixelMap> {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let context = abilityDelegator.getAppContext();
    const resourceMgr = context.resourceManager;
    let data = await resourceMgr.getMediaContent(resource)
    let arrayBuffer = data.buffer.slice(data.byteOffset, data.byteLength + data.byteOffset)
    const pixelMap = await image.createImageSource(arrayBuffer).createPixelMap();
    return pixelMap;
  }

  async getPixelMapByFilePath(filePath: string): Promise<image.PixelMap> {
    const imageSource: image.ImageSource = image.createImageSource(filePath)
    const pixelMap = await imageSource.createPixelMap();
    return pixelMap;
  }

  async savePixelMap(filePath: string, resource: Resource): Promise<void> {
    let pixelMap = await ImageUtils.getInstance().getPixelMap(resource);
    const imagePackerApi = image.createImagePacker();
    const packOption: image.PackingOption = {
      format: 'image/jpeg',
      quality: 100
    };
    let uri = fileUri.getUriFromPath(filePath);
    let imageData = await imagePackerApi.packing(pixelMap, packOption);
    let file = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file.fd, imageData);
    fs.closeSync(file);
    console.info(`write data to file succeed and size is ${writeLen}`);
  }
}