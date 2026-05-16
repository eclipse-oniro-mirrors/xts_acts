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
import window from '@ohos.window';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { Driver, Rect } from '@ohos.UiTest';

const TAG: string = '[WindowSnap]'
const INFO = {
  'img': {
    prefix: 'IMG_',
    suffix: '.webp'
  },
  'txt': {
    prefix: 'TXT_',
    suffix: '.txt'
  }
}

class WindowSnap {
  async sleep(time) {
    return new Promise((resolve) => {
      setTimeout(resolve, time)
    });
  }

  createFile(context: any, type, page) {
    console.info(`${TAG}, createFile start`)
    let pathDir = context.filesDir;
    console.info(`${TAG}, createFile pathDir = ${pathDir}`)
    let name = page
    let info = INFO[type]
    let displayName = `${info.prefix}${name}${info.suffix}`
    let filePath = pathDir + '/' + displayName
    console.info(`${TAG}, createFile filePath = ${filePath}`)
    let exists = fs.accessSync(filePath)
    console.info(`${TAG}, oldFile exists = ${exists}`)
    if (exists) {
      fs.unlinkSync(filePath)
      console.info(`${TAG}, remove file succeed`)
    }
    return fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
  }

  async save(data: image.PixelMap, context: any, page) {
    console.info(`${TAG}, start save image`)
    let packOpts: image.PackingOption = {
      format: 'image/webp', quality: 100
    }
    let imagePackerApi = image.createImagePacker()
    let arrayBuffer = await imagePackerApi.packing(data, packOpts)
    let file = null
    while (file == null) {
      file = this.createFile(context, 'img', page)
    }
    let exists = fs.accessSync(file.path)
    console.info(`${TAG}, createFile exists = ${exists}`)
    let fd = file.fd
    console.info(`${TAG}, createFile fd = ${fd}`)
    imagePackerApi.release()
    try {
      fs.writeSync(fd, arrayBuffer)
    } catch (err) {
      console.error(`${TAG}, write failed, code is ${err.code}, message is ${err.message}}`)
    }
    fs.closeSync(file)
    console.info(`${TAG}, write picture done`)
  }

  /**
   * 获取窗口截图&文件保存
   * 入参必须为ability的context
   *
   * save:设备保存路径:/data/app/el2/100/base/{bundle_name}/haps/entry_test/files/IMG_test.webp
   */
  async snapShot(context, page, done?) {
    console.info(`${TAG}, start snapshot`)
    await this.sleep(2000);
    let windowClass = null
    try {
      windowClass = window.findWindow('floatWindow')
      console.info(`${TAG}, find window success`)
    } catch (exception) {
      console.error(`${TAG}, Failed to find the window. Cause: ${JSON.stringify(exception)}`)
    }

    windowClass.snapshot(async (err, data) => {
      console.info(`${TAG}, windowClass.snapshot`)
      if (err.code) {
        console.error(`${TAG}, Failed to snapshot window. Cause: ${JSON.stringify(err)}`)
        return
      }
      await this.save(data, context, page)
      data.release()
      if (done) {
        done();
      }
    })
  }

  async snapShotNext(context, page, done?) {
    console.info(`${TAG}, start snapshot`)
    let windowClass = null
    try {
      windowClass = window.findWindow('floatWindow');
    } catch (exception) {
      console.error(`${TAG}, Failed to find the window. Cause: ${JSON.stringify(exception)}`)
    }
    await this.sleep(600);
    windowClass.snapshot(async (err, data) => {
      console.info(`${TAG}, windowClass.snapshot`)

      if (err.code) {
        console.error(`${TAG}, Failed to snapshot window. Cause: ${JSON.stringify(err)}`)
        return
      }
      await this.save(data, context, page)
      data.release()
      if (done) {
        done();
      }
    })
  }

  async snapShotByDriver(context, page, done?) {
    console.info(`Start snapshot by driver`)
    await this.sleep(2000);
    let file = null
    while (file == null) {
      file = this.createFile(context, 'img', page)
    }
    let exists = fs.accessSync(file.path)
    console.info(`${TAG}, createFile exists = ${exists}`)

    try {
      let windowClass = window.findWindow('floatWindow')
      console.info(`${TAG}, find window success`)
      let windowRect = windowClass.getWindowProperties().windowRect;
      console.info(`${TAG}, windowRct is ${JSON.stringify(windowRect)}`)
      let driver = Driver.create();
      await driver.screenCapture(file.path, {
        left: windowRect.left,
        top: windowRect.top,
        right: windowRect.width,
        bottom: windowRect.height
      });
    } catch (exception) {
      console.error(`${TAG}, Failed to snap shot. Cause: ${JSON.stringify(exception)}`)
    }

    if (done) {
      done();
    }
  }
}

export default new WindowSnap()