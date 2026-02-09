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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';

interface picTypeValue {
  name: string
  fileName: string
  value?: string
  initValue?: string
  modifyData?: string
  compareData?: string
  errorData?: string
}

interface picTypeValue2 {
  name: string
  fileName: string
  value?: Record<string, string | null>
  initValue?: Record<string, string | null>
  modifyData?: string
  compareData?: string
  errorData?: string
}

interface PropertyKeyValues {
  ImageLength:string
  ImageWidth:string
  Orientation?:string
  GPSLatitude?:string
  GPSLongitude?:string
}

interface errorCode {
  code: int
}

class Values {
  Make: string = "hw"
  ImageLength: string| null = null
  test_a: string | null = null
}

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
export default function imageExifGetModifyTest() {

  describe('ImageExifGetModify', () => {
    let filePath: string;
    let fdNumber: int
    const modfiyFileSuffixs: Array<string> = ["jpg", "webp", "png", "heic"]
    let testContext: common.UIAbilityContext;
    let filesDir: string | undefined | null;

    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      testContext = Hypium.get('context') as common.UIAbilityContext;
    })

    afterEach(async () => {
      await sleep(300)
    })

    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE);
      fdNumber = file.fd as int;
      return fdNumber;
    };

    const getBuffer = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    let getCompareData = (
      orientation: string,
      imageLength: string,
      imageWidth: string
    ): Record<string, string | null> => {
      const value: Record<string, string | null> = {};
      value[image.PropertyKey.ORIENTATION as string] = orientation;
      value[image.PropertyKey.IMAGE_LENGTH as string] = imageLength;
      value[image.PropertyKey.IMAGE_WIDTH as string] = imageWidth;
      return value;
    }

    //创建imageSource对象并返回
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //fileName: 文件名,例: test_exif_v2.jpg
    const getImageSource = async (fileName:string, type:string): Promise<image.ImageSource> => {
      let imageSourceApi:image.ImageSource | undefined;
      if(type === "buffer"){
        const buffer = getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        getFd(fileName);
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
        await resourceMgr.closeRawFd(fileName);
      }else if(type === "incremental") {
        const picBuffer = getBuffer(fileName)
        imageSourceApi = image.createIncrementalSource(picBuffer)
      }else{
        let fd = getFd(fileName);
        imageSourceApi = image.createImageSource(fd);
        fs.closeSync(fd); // getFd open fd，创建ImageSource后，close fd。
      }
      expect(imageSourceApi != undefined).assertTrue();
      return imageSourceApi!;
    }

    //创建imageSource，修改exif信息，然后读取exif信息，读取到的值与预期值对比,返回结果 True/false
    //testTag 用例编号
    //key: exif key
    //modifyData: modifyImageProperty接口传入的修改值
    //compareData: 预期调用getImageProperty接口读取key的返回值
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testModifyPromise = async (
      testTag: string,
      key: image.PropertyKey,
      modifyData: string,
      compareData: string,
      fileName:string, type:string
    ): Promise<boolean> => {
      let checkResult = false;
      const imageSourceApi = await getImageSource(fileName, type);

      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        await imageSourceApi.modifyImageProperty(key, modifyData)
        await imageSourceApi.release();
        let imageSourceApiGet = await getImageSource(fileName, type)
        const data = await imageSourceApiGet.getImageProperty(key)
        checkResult = data === compareData
        if (imageSourceApiGet != undefined) {
          await imageSourceApiGet.release();
        }
      }
      return checkResult
    }

    //创建imageSource，读取exif信息，读取到的值与预期值对比,返回结果 True/false
    //testTag 用例编号
    //key: exif key
    //compareData: 预期调用getImageProperty接口读取key的返回值
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testGetPromise = async (
      testTag: string,
      key: image.PropertyKey,
      compareData: string | undefined,
      fileName:string,
      type:string
    ): Promise<boolean> => {
      let checkResult = false
      const imageSourceApi = await getImageSource(fileName, type)
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        const result = await imageSourceApi.getImageProperty(key)
        console.info(testTag + "getImageProperty result: " + result);
        console.info(testTag + "getImageProperty compareData: " + compareData);
        checkResult = compareData == result
        console.info(testTag + "getImageProperty checkResult: " + checkResult);
        if(!checkResult){
          hilog.info(0x0000, testTag,
            `testGetPromise error %{public}s %{public}s fileName: %{public}s result: %{public}s value: %{public}s`,
            testTag, key, fileName, result, compareData);
        }
        await imageSourceApi.release();
      }
      return checkResult
    }

    const testGetIncludePromise = async (
      testTag: string,
      key: image.PropertyKey,
      compareData: string | undefined,
      fileName:string,
      type:string
    ): Promise<boolean> => {
      let checkResult = false
      const imageSourceApi = await getImageSource(fileName, type)
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        const result = await imageSourceApi.getImageProperty(key)
        checkResult = result.includes(compareData == undefined ? testTag : compareData)
        if(!checkResult){
          hilog.info(0x0000, testTag,
            `testGetIncludePromise error %{public}s %{public}s fileName: %{public}s result: %{public}s value: %{public}s`,
            testTag, key, fileName, result, compareData);
        }
        await imageSourceApi.release();
      }
      return checkResult
    }

    //创建imageSource，读取exif信息，错误码与预期错误码对比，返回结果 True/false
    //testTag 用例编号
    //key: exif key
    //expectedGetErrorCode: 预期错误码
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testGetPromiseError = async (
      testTag: string,
      key: image.PropertyKey,
      expectedGetErrorCode: int,
      fileName:string,
      type:string
    ): Promise<boolean> => {
      let checkResult = false
      const imageSourceApi = await getImageSource(fileName, type)
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        try {
          let data = await imageSourceApi.getImageProperty(key);
          hilog.info(0x0000, testTag,
            `getImageProperty promise not exist error %{public}s %{public}s %{public}s %{public}s`,
            testTag, key, data, type);
        } catch (error: BusinessError) {
          if(expectedGetErrorCode == error.code) {
            hilog.info(0x0000, testTag,
              `getImageProperty promise not exist success %{public}s %{public}s %{public}s`,
              key, error.code, type);
            checkResult = true
          } else {
            hilog.info(0x0000, testTag,
              `getImageProperty promise not exist compare error %{public}s %{public}s %{public}s `,
              key, error.code, type);
          }
        }
        await imageSourceApi.release();
      }
      return checkResult
    }

    //创建imageSource，修改exif信息，读取exif信息，modifyImageProperty接口返回的错误码与预期错误码对比,getImageProperty接口读取key
    // 的返回值与预期返回值对比，返回结果 True/false
    //testTag 用例编号
    //key: exif key
    //errorData:modifyImageProperty接口传入的修改值(非法值)
    //compareData: 预期调用getImageProperty接口读取key的返回值
    //expectedModifyErrorCode:预期错误码
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testModifyPromiseError = async (
      testTag: string,
      key: image.PropertyKey,
      errorData: string | undefined,
      compareData: string | undefined,
      fileName: string,
      expectedModifyErrorCode: int,
      type: string
    ): Promise<boolean> => {
      let checkResult = false
      const imageSourceApi = await getImageSource(fileName, type)
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        try {
          if (errorData == undefined) {
            hilog.info(0x0000, testTag,
              `modifyImageProperty errorData promise success %{public}s `, key);
          } else {
            await imageSourceApi.modifyImageProperty(key, errorData);
            hilog.info(0x0000, testTag,
              `modifyImageProperty errorData promise success %{public}s `, key);
            await imageSourceApi!.release();
          }
        } catch (error: BusinessError) {
          await imageSourceApi!.release();
          hilog.info(0x0000, testTag,
            `modifyImageProperty errorData promise failed %{public}s %{public}s `, key, error.code);
          if (expectedModifyErrorCode == error.code) {
            const imageSourceApiGet = await getImageSource(fileName, type)
            try {
              const data = await imageSourceApiGet.getImageProperty(key)
              checkResult = data == compareData
              if (imageSourceApiGet != undefined) {
                await imageSourceApiGet.release();
              }
              if(!checkResult){
                hilog.info(0x0000, testTag,
                  `testModifyPromiseError testGetPromise success %{public}s %{public}s
                    fileName: %{public}s result: %{public}s value: %{public}s`,
                  testTag, key, fileName, data, compareData);
              }
            } catch (error) {
              hilog.info(0x0000, testTag,
                `testModifyPromiseError testGetPromise error %{public}s %{public}s fileName: %{public}s `,
                testTag, key, fileName);
            }
          }
        }
      }
      return checkResult;
    }

    //创建imageSource，批量读取exif信息，读取到的值与预期值对比,返回结果 True/false
    //testTag 用例编号
    //keys: 需要读取的字段列表，例 [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
    //compareData: 预期读取到的值，使用JSON序列化后的结果
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testGetImageProperties = async (
      testTag: string,
      keys: Array<image.PropertyKey>,
      compareData: Record<string, string | null> | undefined,
      fileName:string,
      type:string
    ): Promise<boolean> => {
      let checkResult = false
      try {
        const imageSourceApi = await getImageSource(fileName, type)
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
        } else {
          const data = await imageSourceApi.getImageProperties(keys)
          if (compareData == undefined) {
            console.info(testTag + "compareData == undefined");
          } else {
            keys.forEach((item: image.PropertyKey) => {
              console.info(testTag + "data: " + data[item as string]);
              console.info(testTag + "compareData: " + compareData[item as string]);
              checkResult = data[item as string] == compareData[item as string];
              console.info(testTag + "checkResult: " + checkResult);
            })
          }
          if(!checkResult){
            hilog.info(0x0000, testTag,
              `testGetPromise error %{public}s  fileName: %{public}s result: %{public}s value: %{public}s`,
              testTag, fileName, `${data}`, compareData);
          }
          await imageSourceApi.release();
        }
      } catch (error) {
        console.info(testTag + "testGetImageProperties" + error);
      }
      return checkResult
    }

    //创建imageSource，批量读取exif信息，错误码与预期错误码对比，返回结果 True/false
    //testTag 用例编号
    //keys: 需要读取的字段列表，例 [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
    //expectedErrorCode: 预期错误码
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testGetImagePropertiesError = async (
      testTag: string,
      keys: Array<image.PropertyKey>,
      expectedErrorCode: int,
      fileName: string,
      type: string
    ): Promise<boolean> => {
      let checkResult = false
      const imageSourceApi = await getImageSource(fileName, type)
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        try {
          let data = await imageSourceApi.getImageProperties(keys);
          hilog.info(0x0000, testTag, `${testTag} getImageProperties data ${data} %{public}s`,
            type)
          checkResult = false
        } catch (error: BusinessError) {
          hilog.info(0x0000, testTag, `${testTag} getImageProperties error ${JSON.stringify(error)} %{public}s`, type)
          checkResult = true
          checkResult = checkResult && error.code == expectedErrorCode;
        }
        await imageSourceApi.release();
      }
      await sleep(1000)
      return checkResult
    }

    //创建imageSource，批量修改exif信息，批量读取exif信息，读取到的值与预期值对比，返回结果 True/false
    //testTag 用例编号
    //keys:  需要读取的字段列表，例 [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
    //records: 需要批量写的字段和值
    //compareData: 预期调用getImageProperties接口读取keys的返回值
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testModifyImageProperties = async (
      testTag: string,
      keys: Array<image.PropertyKey>,
      records: Record<string, string | null>,
      compareData: Record<string, string | null> | undefined,
      fileName: string,
      type:string
    ): Promise<boolean> => {
      const imageSourceApi = await getImageSource(fileName, type)
      let checkResult = false
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        await imageSourceApi.modifyImageProperties(records)
        let imageSourceApiGet = await getImageSource(fileName, type)
        const data = await imageSourceApiGet.getImageProperties(keys)
        if (compareData == undefined) {
          hilog.info(0x0000, testTag,
            `testGetPromise error %{public}s %{public}s fileName: %{public}s result: %{public}s`,
            testTag, fileName, JSON.stringify(data))
        } else {
          keys.forEach((item: image.PropertyKey) => {
            console.info(testTag + "data: " + data[item as string]);
            console.info(testTag + "compareData: " + compareData[item as string]);
            checkResult = data[item as string] == compareData[item as string];
            console.info(testTag + "checkResult: " + checkResult);
          })
          // checkResult = JSON.stringify(data) == compareData
        }
        if (!checkResult) {
          hilog.info(0x0000, testTag,
            `testGetPromise error %{public}s %{public}s fileName: %{public}s result: %{public}s`,
            testTag, fileName, JSON.stringify(data))
        }
        await imageSourceApi.release();
        if (imageSourceApiGet != undefined) {
          await imageSourceApiGet.release();
        }
      }
      return checkResult
    }

    //创建imageSource，批量修改exif信息，错误码与预期错误码对比，返回结果 True/false
    //testTag 用例编号
    //records: 需要批量写的字段和值
    //expectedErrorCodes: 预期错误码
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testModifyImagePropertiesError = async (
      testTag: string,
      records: Record<string, string | null>,
      expectedErrorCodes: int,
      fileName: string,
      type: string
    ): Promise<boolean> => {
      const imageSourceApi = await getImageSource(fileName, type)
      let checkResult = false
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        try {
          await imageSourceApi.modifyImageProperties(records);
          hilog.info(0x0000, testTag, `modifyImageProperty success  %{public}s %{public}s %{public}s %{public}s`,
            testTag, type, fileName);
          checkResult = false
        } catch (error: BusinessError) {
          hilog.info(0x0000, testTag, `modifyImageProperty error  testTag: %{public}s error: %{public}s,
            errorCodes: %{public}s  expectedErrorCodes: %{public}s, type: %{public}s fileName: %{public}s`, testTag,
            JSON.stringify(error), JSON.stringify(expectedErrorCodes), type, fileName);
          checkResult = true
          checkResult = checkResult && error.code == expectedErrorCodes
        }
        await imageSourceApi.release();
      }
      return checkResult
    }

    //创建imageSource，批量修改exif信息，传入异常字段和值records，预期修改失败，修改失败时读取到的值与预期值对比，返回结果 True/false
    //testTag 用例编号
    //keys:  需要读取的字段列表，例 [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
    //records: 需要批量写的字段和值
    //expectedErrorCode: 预期错误码
    //compareData: 预期调用getImageProperties接口读取keys的返回值
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testModifyGetPropertiesError = async (
      testTag: string,
      records: Record<string, string | null>,
      expectedErrorCodes: int,
      keys: Array<image.PropertyKey>,
      compareData: string | undefined,
      fileName: string,
      type: string
    ): Promise<boolean> => {
      let checkResult = await testModifyImagePropertiesError(testTag, records, expectedErrorCodes, fileName, type)
      if(checkResult){
        let imageSourceApiGet = await getImageSource(fileName, type)
        const data = await imageSourceApiGet.getImageProperties(keys)
        checkResult = JSON.stringify(data) == compareData
        if (imageSourceApiGet != undefined) {
          await imageSourceApiGet.release();
        }
      }
      return checkResult
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0100
     * @tc.desc   getImageProperty('BitsPerSample', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0100'
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const values: Array<picTypeValue> = [
        {name:"jpeg", fileName:"test_exif_v2.jpg", value:"1, 1, 1"},
        {name:"webp", fileName:"test_exif_v2.webp", value:"8, 8, 8"},
        {name:"png", fileName:"test_exif_v2.png", value:"1, 1, 1"},
        {name:"dng", fileName:"test_exif_v2.dng", value:"8, 8, 8"},
        {name:"heif", fileName:"test_exif_v2.heic", value:"1, 1, 1"}
      ]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName, 'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0200
     * @tc.desc   getImageProperty('Orientation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0200'
      const key = image.PropertyKey.ORIENTATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Top-left"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Top-right"},
        {name: "png", fileName: "test_exif_v2.png", value: "Top-left"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Top-left"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Top-left"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'rawfile');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0300
     * @tc.desc   getImageProperty('ImageLength', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0300'
      const key = image.PropertyKey.IMAGE_LENGTH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4608"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "192"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0400
     * @tc.desc   getImageProperty('ImageWidth', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0400'
      const key = image.PropertyKey.IMAGE_WIDTH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3456"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "256"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'rawfile');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0500
     * @tc.desc   getImageProperty('GPSLatitude', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0500'
      const key = image.PropertyKey.GPS_LATITUDE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "39, 54, 20"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "39, 54, 20"},
        {name: "png", fileName: "test_exif_v2.png", value: "39, 54, 20"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "39, 54, 20"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "39, 54, 20"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0600
     * @tc.desc   getImageProperty('GPSLongitude', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0600'
      const key = image.PropertyKey.GPS_LONGITUDE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "120, 52, 26"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "120, 52, 26"},
        {name: "png", fileName: "test_exif_v2.png", value: "120, 52, 26"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "120, 52, 26"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "120, 52, 26"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'rawfile');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0700
     * @tc.desc   getImageProperty('GPSLatitudeRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0700'
      const key = image.PropertyKey.GPS_LATITUDE_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "N"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0800
     * @tc.desc   getImageProperty('GPSLongitudeRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0800'
      const key = image.PropertyKey.GPS_LONGITUDE_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "E"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", value: "E"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "E"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "E"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0900
     * @tc.desc   getImageProperty('DateTimeOriginal', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_0900'
      const key = image.PropertyKey.DATE_TIME_ORIGINAL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2024:01:25 05:51:34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:06:02 15:51:35"},
        {name: "png", fileName: "test_exif_v2.png", value: "2024:01:25 05:51:34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2024:04:18 18:18:43"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2024:01:25 05:51:34"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01000
     * @tc.desc   getImageProperty('ExposureTime', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01000'
      const key = image.PropertyKey.EXPOSURE_TIME
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "1/34 sec."},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1/33 sec."},
        {name: "png", fileName: "test_exif_v2.png", value: "1/34 sec."},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1/100 sec."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1/34 sec."}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01100
     * @tc.desc   getImageProperty('SceneType', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01100'
      const key = image.PropertyKey.SCENE_TYPE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Directly photographed"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Directly photographed"},
        {name: "png", fileName: "test_exif_v2.png", value: "Directly photographed"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Directly photographed"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Directly photographed"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SceneType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01200
     * @tc.desc   getImageProperty('ISOSpeedRatings', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01200'
      const key = image.PropertyKey.ISO_SPEED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "200"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "205"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01300
     * @tc.desc   getImageProperty('FNumber', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01300'
      const key = image.PropertyKey.F_NUMBER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "f/1.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "f/1.8"},
        {name: "png", fileName: "test_exif_v2.png", value: "f/1.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "f/2.0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "f/1.0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01400
     * @tc.desc   getImageProperty('DateTime', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01400'
      const key = image.PropertyKey.DATE_TIME
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2024:12:31"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:06:02 15:51:35"},
        {name: "png", fileName: "test_exif_v2.png", value: "2024:12:31"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2024:04:18 18:18:43"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2024:12:31"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01500
     * @tc.desc   getImageProperty('GPSTimeStamp', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01500'
      const key = image.PropertyKey.GPS_TIME_STAMP
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "11:37:58.00"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "11:37:58.00"},
        {name: "png", fileName: "test_exif_v2.png", value: "11:37:58.00"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "11:37:56.00"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "11:37:58.00"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01600
     * @tc.desc   getImageProperty('GPSDateStamp', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01600'
      const key = image.PropertyKey.GPS_DATE_STAMP
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2025:01:11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:01:11"},
        {name: "png", fileName: "test_exif_v2.png", value: "2025:01:11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2023:10:19"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2025:01:11"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01700
     * @tc.desc   getImageProperty('ImageDescription', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01700'
      const key = image.PropertyKey.IMAGE_DESCRIPTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "_cuva%s\\d"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "cuva"},
        {name: "png", fileName: "test_exif_v2.png", value: "_cuva%s\\d"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "_cuva"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "_cuva%s\\d"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01800
     * @tc.desc   getImageProperty('Make', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01800'
      const key = image.PropertyKey.MAKE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "华为"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "华为"},
        {name: "png", fileName: "test_exif_v2.png", value: "华为"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "HUAWEI"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "华为"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01900
     * @tc.desc   getImageProperty('Model', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_01900'
      const key = image.PropertyKey.MODEL
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "TNY-AL00"},
        {name: "webp", fileName: "test_webp_exif.webp", value: "TNY-AL00"},
        {name: "png", fileName: "test_exif_v2.png", value: "TNY-AL00"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "MNA-AL00"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "TNY-AL00"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02000
     * @tc.desc   getImageProperty('PhotoMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02000'
      const key = image.PropertyKey.PHOTO_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "252"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "252"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "252"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "252"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02100
     * @tc.desc   getImageProperty('SensitivityType', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02100'
      const key = image.PropertyKey.SENSITIVITY_TYPE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "png", fileName: "test_exif_v2.png", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Standard output sensitivity (SOS) and ISO speed"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02200
     * @tc.desc   getImageProperty('StandardOutputSensitivity', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02200'
      const key = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", value: "5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02300
     * @tc.desc   getImageProperty('RecommendedExposureIndex', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02300'
      const key = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "241"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "241"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02400
     * @tc.desc   getImageProperty('ApertureValue', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02400'
      const key = image.PropertyKey.APERTURE_VALUE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "4.00 EV (f/4.0)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.69 EV (f/1.8)"},
        {name: "png", fileName: "test_exif_v2.png", value: "4.00 EV (f/4.0)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.00 EV (f/2.0)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4.00 EV (f/4.0)"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02500
     * @tc.desc   getImageProperty('ExposureBiasValue', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02500'
      const key = image.PropertyKey.EXPOSURE_BIAS_VALUE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "23.00 EV"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.00 EV"},
        {name: "png", fileName: "test_exif_v2.png", value: "23.00 EV"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "23.00 EV"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "23.00 EV"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02600
     * @tc.desc   getImageProperty('MeteringMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02600'
      const key = image.PropertyKey.METERING_MODE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Pattern"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Pattern"},
        {name: "png", fileName: "test_exif_v2.png", value: "Pattern"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Pattern"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Pattern"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02700
     * @tc.desc   getImageProperty('LightSource', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02700'
      const key = image.PropertyKey.LIGHT_SOURCE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Daylight"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Daylight"},
        {name: "png", fileName: "test_exif_v2.png", value: "Daylight"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Fluorescent"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Daylight"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02800
     * @tc.desc   getImageProperty('Flash', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02800'
      const key = image.PropertyKey.FLASH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Strobe return light not detected"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Flash did not fire, auto mode"},
        {name: "png", fileName: "test_exif_v2.png", value: "Strobe return light not detected"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Strobe return light not detected"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Strobe return light not detected"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02900
     * @tc.desc   getImageProperty('FocalLength', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_02900'
      const key = image.PropertyKey.FOCAL_LENGTH
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.0 mm"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "31.0 mm"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.0 mm"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6.3 mm"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.0 mm"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03000
     * @tc.desc   getImageProperty('UserComment', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03000'
      const key = image.PropertyKey.USER_COMMENT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "place for user comments"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "place for user comments."},
        {name: "png", fileName: "test_exif_v2.png", value: "place for user comments"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "comm"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "place for user comments"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03100
     * @tc.desc   getImageProperty('PixelXDimension', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03100'
      const key = image.PropertyKey.PIXEL_X_DIMENSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03200
     * @tc.desc   getImageProperty('PixelYDimension', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03200'
      const key = image.PropertyKey.PIXEL_Y_DIMENSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "234"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4608"},
        {name: "png", fileName: "test_exif_v2.png", value: "234"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "234"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03300
     * @tc.desc   getImageProperty('WhiteBalance', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03300'
      const key = image.PropertyKey.WHITE_BALANCE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Manual white balance"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Auto white balance"},
        {name: "png", fileName: "test_exif_v2.png", value: "Manual white balance"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Manual white balance"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Manual white balance"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03400
     * @tc.desc   getImageProperty('FocalLengthIn35mmFilm', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03400'
      const key = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "27"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "26"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03500
     * @tc.desc   getImageProperty('Compression', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03500'
      const key = image.PropertyKey.COMPRESSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Uncompressed"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Uncompressed"},
        {name: "png", fileName: "test_exif_v2.png", value: "Uncompressed"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Uncompressed"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Uncompressed"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03600
     * @tc.desc   getImageProperty('PhotometricInterpretation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03600'
      const key = image.PropertyKey.PHOTOMETRIC_INTERPRETATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Reversed mono"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Reversed mono"},
        {name: "png", fileName: "test_exif_v2.png", value: "Reversed mono"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "RGB"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Reversed mono"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03700
     * @tc.desc   getImageProperty('StripOffsets', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03700'
      const key = image.PropertyKey.STRIP_OFFSETS
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10348"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03800
     * @tc.desc   getImageProperty('SamplesPerPixel', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03800'
      const key = image.PropertyKey.SAMPLES_PER_PIXEL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "23"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03900
     * @tc.desc   getImageProperty('RowsPerStrip', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_03900'
      const key = image.PropertyKey.ROWS_PER_STRIP
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "192"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04000
     * @tc.desc   getImageProperty('StripByteCounts', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04000'
      const key = image.PropertyKey.STRIP_BYTE_COUNTS
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "147456"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04100
     * @tc.desc   getImageProperty('XResolution', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04100'
      const key = image.PropertyKey.X_RESOLUTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "72"},
        {name: "png", fileName: "test_exif_v2.png", value: " 0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "72"},
        {name: "heif", fileName: "test_exif_v2.heic", value: " 0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04200
     * @tc.desc   getImageProperty('YResolution', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04200'
      const key = image.PropertyKey.Y_RESOLUTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "72"},
        {name: "png", fileName: "test_exif_v2.png", value: " 0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "72"},
        {name: "heif", fileName: "test_exif_v2.heic", value: " 0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04300
     * @tc.desc   getImageProperty('PlanarConfiguration', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04300'
      const key = image.PropertyKey.PLANAR_CONFIGURATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Chunky format"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Chunky format"},
        {name: "png", fileName: "test_exif_v2.png", value: "Chunky format"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Chunky format"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Chunky format"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04400
     * @tc.desc   getImageProperty('ResolutionUnit', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04400'
      const key = image.PropertyKey.RESOLUTION_UNIT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Inch"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Inch"},
        {name: "png", fileName: "test_exif_v2.png", value: "Inch"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Inch"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Inch"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04500
     * @tc.desc   getImageProperty('TransferFunction', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04500'
      const key = image.PropertyKey.TRANSFER_FUNCTION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "3 bytes undefined data"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 bytes undefined data"},
        {name: "png", fileName: "test_exif_v2.png", value: "3 bytes undefined data"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3 bytes undefined data"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04600
     * @tc.desc   getImageProperty('Software', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04600'
      const key = image.PropertyKey.SOFTWARE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "华为"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "TNY-AL00"},
        {name: "png", fileName: "test_exif_v2.png", value: "华为"},
        {name: "dng", fileName: "test_exif_v2.dng",
          value: "HUAWEI/MNA-AL00/HWMNA:12/HUAWEIMNA-AL00/104.0.0.56C00:user/release-keys"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "华为"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04700
     * @tc.desc   getImageProperty('Artist', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04700'
      const key = image.PropertyKey.ARTIST
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "None"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Bogdan Hrastnik"},
        {name: "png", fileName: "test_exif_v2.png", value: "None"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Joseph.Xu"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "None"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04800
     * @tc.desc   getImageProperty('WhitePoint', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04800'
      const key = image.PropertyKey.WHITE_POINT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "252, 0/0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "124, 0/0"},
        {name: "png", fileName: "test_exif_v2.png", value: "252, 0/0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "124.2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "252, 0/0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04900
     * @tc.desc   getImageProperty('PrimaryChromaticities', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_04900'
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "124"},
        {name: "png", fileName: "test_exif_v2.png", value: " 0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "124"},
        {name: "heif", fileName: "test_exif_v2.heic", value: " 0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05000
     * @tc.desc   getImageProperty('YCbCrCoefficients', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05000'
      const key = image.PropertyKey.YCBCR_COEFFICIENTS
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.299, 0.587, 0.114"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.299, 0.587, 0.114"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.299, 0.587, 0.114"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0.299, 0.587, 0.114"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.299, 0.587, 0.114"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05100
     * @tc.desc   getImageProperty('YCbCrSubSampling', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05100'
      const key = image.PropertyKey.YCBCR_SUB_SAMPLING
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3, 2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3, 3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3, 2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3, 2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3, 2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05200
     * @tc.desc   getImageProperty('YCbCrPositioning', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05200'
      const key = image.PropertyKey.YCBCR_POSITIONING
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Centered"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Centered"},
        {name: "png", fileName: "test_exif_v2.png", value: "Centered"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Centered"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Centered"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05300
     * @tc.desc   getImageProperty('ReferenceBlackWhite', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05300'
      const key = image.PropertyKey.REFERENCE_BLACK_WHITE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "222,  0, 1.5,  0, 25.2, 25.2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "221, 255,  0, 255,  0, 255"},
        {name: "png", fileName: "test_exif_v2.png", value: "222,  0, 1.5,  0, 25.2, 25.2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "221"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "222,  0, 1.5,  0, 25.2, 25.2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05400
     * @tc.desc   getImageProperty('Copyright', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05400'
      const key = image.PropertyKey.COPYRIGHT
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "undefined (Photographer) - [None] (Editor)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "ABB (Photographer) - [None] (Editor)"},
        {name: "png", fileName: "test_exif_v2.png", value: "undefined (Photographer) - [None] (Editor)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Hw (Photographer) - [None] (Editor)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "undefined (Photographer) - [None] (Editor)"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x2025, testTag, `getImageProperty error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05500
     * @tc.desc   getImageProperty('JPEGInterchangeFormat', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05500'
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2798"},
        {name: "webp", fileName: "test_webp_exif.webp", value: "1252"},
        {name: "png", fileName: "test_exif_v2.png", value: "2798"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10344"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2798"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error JPEGInterchangeFormat ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05600
     * @tc.desc   getImageProperty('JPEGInterchangeFormatLength', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05600'
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4"},
        {name: "webp", fileName: "test_webp_exif.webp", value: "24042"},
        {name: "png", fileName: "test_exif_v2.png", value: "4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error JPEGInterchangeFormatLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05700
     * @tc.desc   getImageProperty('ExposureProgram', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05700'
      const key = image.PropertyKey.EXPOSURE_PROGRAM
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Not defined"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal program"},
        {name: "png", fileName: "test_exif_v2.png", value: "Not defined"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal program"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Not defined"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05800
     * @tc.desc   getImageProperty('SpectralSensitivity', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05800'
      const key = image.PropertyKey.SPECTRAL_SENSITIVITY
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "abc"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "sensitivity"},
        {name: "png", fileName: "test_exif_v2.png", value: "abc"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "sensitivity"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "abc"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05900
     * @tc.desc   getImageProperty('OECF', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_05900'
      const key = image.PropertyKey.OECF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4 bytes undefined data"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2 bytes undefined data"},
        {name: "png", fileName: "test_exif_v2.png", value: "4 bytes undefined data"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 bytes undefined data"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4 bytes undefined data"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06000
     * @tc.desc   getImageProperty('ExifVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06000'
      const key = image.PropertyKey.EXIF_VERSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Exif Version 1.1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Exif Version 1.1"},
        {name: "png", fileName: "test_exif_v2.png", value: "Exif Version 1.1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Exif Version 2.2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Exif Version 1.1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06100
     * @tc.desc   getImageProperty('DateTimeDigitized', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06100'
      const key = image.PropertyKey.DATE_TIME_DIGITIZED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2022:06:02 15:51:34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:06:02 15:51:35"},
        {name: "png", fileName: "test_exif_v2.png", value: "2022:06:02 15:51:34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2023:01:19 10:39:58"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2022:06:02 15:51:34"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06200
     * @tc.desc   getImageProperty('ComponentsConfiguration', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06200'
      const key = image.PropertyKey.COMPONENTS_CONFIGURATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Y R G B"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Y R G B"},
        {name: "png", fileName: "test_exif_v2.png", value: "Y R G B"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "R G B -"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Y R G B"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06300
     * @tc.desc   getImageProperty('ShutterSpeedValue', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06300'
      const key = image.PropertyKey.SHUTTER_SPEED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (1/6 sec.)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "14.00 EV (1/16384 sec.)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (1/6 sec.)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6.64 EV (1/100 sec.)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (1/6 sec.)"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06400
     * @tc.desc   getImageProperty('BrightnessValue', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06400'
      const key = image.PropertyKey.BRIGHTNESS_VALUE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (19.38 cd/m^2)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.00 EV (3.43 cd/m^2)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (19.38 cd/m^2)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.50 EV (19.38 cd/m^2)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (19.38 cd/m^2)"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06500
     * @tc.desc   getImageProperty('MaxApertureValue', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06500'
      const key = image.PropertyKey.MAX_APERTURE_VALUE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (f/2.4)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.69 EV (f/1.8)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (f/2.4)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0.08 EV (f/1.0)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (f/2.4)"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06600
     * @tc.desc   getImageProperty('SubjectDistance', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06600'
      const key = image.PropertyKey.SUBJECT_DISTANCE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.5 m"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "25.0 m"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.5 m"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.5 m"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.5 m"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06700
     * @tc.desc   getImageProperty('SubjectArea', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06700'
      const key = image.PropertyKey.SUBJECT_AREA
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "(x,y) = (12,13)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "(x,y) = (10,20)"},
        {name: "png", fileName: "test_exif_v2.png", value: "(x,y) = (12,13)"},
        {name: "dng", fileName: "test_exif_v2.dng",
          value: "Within rectangle (width 2318, height 1390) around (x,y) = (2009,1506)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "(x,y) = (12,13)"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06800
     * @tc.desc   getImageProperty('MakerNote', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06800'
      const key = image.PropertyKey.MAKER_NOTE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg",
        value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' +
          'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,' +
          'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "webp", fileName: "test_exif_v2.webp", value: "HwMnoteCaptureMode:1,HwMnoteBurstNumber:2," +
          "HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7," +
          "HwMnoteFacePointer:122,HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3," +
          "HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8," +
          "HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8," +
          "HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,HwMnoteSceneStageConf:3," +
          "HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,HwMnoteSceneSnowConf:7," +
          "HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,HwMnoteSceneTextConf:11"},
        {name: "png", fileName: "test_exif_v2.png", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
          'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,' +
          'HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "dng", fileName: "test_exif_v2.dng", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:' +
          '3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,' +
          'HwMnoteWindSnapshotMode:8,HwMnoteFacePointer:166,HwMnoteFaceVersion:1,' +
          'HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:300,' +
          'HwMnoteSceneVersion:1,' + 'HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "heif", fileName: "test_exif_v2.heic", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' + 'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
          'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,' +
          'HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' + 'HwMnoteSceneStageConf:3,' +
          'HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetIncludePromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MakerNote ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06900
     * @tc.desc   getImageProperty('SubsecTime', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_06900'
      const key = image.PropertyKey.SUBSEC_TIME
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123456"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123456"},
        {name: "png", fileName: "test_exif_v2.png", value: "123456"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "427000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123456"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07000
     * @tc.desc   getImageProperty('SubsecTimeOriginal', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07000'
      const key = image.PropertyKey.SUBSEC_TIME_ORIGINAL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "427000"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "543792"},
        {name: "png", fileName: "test_exif_v2.png", value: "427000"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "427000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "427000"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07100
     * @tc.desc   getImageProperty('SubsecTimeDigitized', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07100'
      const key = image.PropertyKey.SUBSEC_TIME_DIGITIZED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "427000"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "427000"},
        {name: "png", fileName: "test_exif_v2.png", value: "427000"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "427000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "427000"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07200
     * @tc.desc   getImageProperty('FlashpixVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07200'
      const key = image.PropertyKey.FLASHPIX_VERSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "FlashPix Version 1.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "FlashPix Version 1.0"},
        {name: "png", fileName: "test_exif_v2.png", value: "FlashPix Version 1.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "FlashPix Version 1.0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "FlashPix Version 1.0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07300
     * @tc.desc   getImageProperty('ColorSpace', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07300'
      const key = image.PropertyKey.COLOR_SPACE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "sRGB"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "sRGB"},
        {name: "png", fileName: "test_exif_v2.png", value: "sRGB"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Adobe RGB"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "sRGB"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07400
     * @tc.desc   getImageProperty('RelatedSoundFile', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07400'
      const key = image.PropertyKey.RELATED_SOUND_FILE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "/usr/home"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "abb"},
        {name: "png", fileName: "test_exif_v2.png", value: "/usr/home"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "/usr/home/sound/sea.wav"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "/usr/home"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07500
     * @tc.desc   getImageProperty('FlashEnergy', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07500'
      const key = image.PropertyKey.FLASH_ENERGY
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "832"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "832"},
        {name: "png", fileName: "test_exif_v2.png", value: "832"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "832"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "832"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07600
     * @tc.desc   getImageProperty('SpatialFrequencyResponse', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07600'
      const key = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "13"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "13"},
        {name: "png", fileName: "test_exif_v2.png", value: "13"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "13"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07700
     * @tc.desc   getImageProperty('FocalPlaneXResolution', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07700'
      const key = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1080"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1080"},
        {name: "png", fileName: "test_exif_v2.png", value: "1080"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1080"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1080"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07800
     * @tc.desc   getImageProperty('FocalPlaneYResolution', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07800'
      const key = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "880"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "880"},
        {name: "png", fileName: "test_exif_v2.png", value: "880"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "880"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "880"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07900
     * @tc.desc   getImageProperty('FocalPlaneResolutionUnit', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_07900'
      const key = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Inch"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Centimeter"},
        {name: "png", fileName: "test_exif_v2.png", value: "Inch"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Centimeter"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Inch"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08000
     * @tc.desc   getImageProperty('SubjectLocation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08000'
      const key = image.PropertyKey.SUBJECT_LOCATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0, 1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5, 6"},
        {name: "png", fileName: "test_exif_v2.png", value: "0, 1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2009, 1506, 2318, 1390"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0, 1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08100
     * @tc.desc   getImageProperty('ExposureIndex', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08100'
      const key = image.PropertyKey.EXPOSURE_INDEX
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.5"},
        {name: "png", fileName: "test_exif_v2.png", value: "1.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1.5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08200
     * @tc.desc   getImageProperty('SensingMethod', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08200'
      const key = image.PropertyKey.SENSING_METHOD
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Two-chip color area sensor"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "One-chip color area sensor"},
        {name: "png", fileName: "test_exif_v2.png", value: "Two-chip color area sensor"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Two-chip color area sensor"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Two-chip color area sensor"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08300
     * @tc.desc   getImageProperty('FileSource', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08300'
      const key = image.PropertyKey.FILE_SOURCE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "DSC"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "DSC"},
        {name: "png", fileName: "test_exif_v2.png", value: "DSC"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "DSC"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "DSC"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08400
     * @tc.desc   getImageProperty('CFAPattern', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08400'
      const key = image.PropertyKey.CFA_PATTERN
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 bytes undefined data"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 bytes undefined data"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 bytes undefined data"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 bytes undefined data"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 bytes undefined data"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08500
     * @tc.desc   getImageProperty('CustomRendered', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08500'
      const key = image.PropertyKey.CUSTOM_RENDERED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal process"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Custom process"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal process"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Custom process"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal process"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08600
     * @tc.desc   getImageProperty('ExposureMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08600'
      const key = image.PropertyKey.EXPOSURE_MODE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Auto exposure"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Auto exposure"},
        {name: "png", fileName: "test_exif_v2.png", value: "Auto exposure"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Auto exposure"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Auto exposure"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08700
     * @tc.desc   getImageProperty('DigitalZoomRatio', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08700'
      const key = image.PropertyKey.DIGITAL_ZOOM_RATIO
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "321"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.00"},
        {name: "png", fileName: "test_exif_v2.png", value: "321"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "321"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08800
     * @tc.desc   getImageProperty('SceneCaptureType', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08800'
      const key = image.PropertyKey.SCENE_CAPTURE_TYPE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Standard"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Standard"},
        {name: "png", fileName: "test_exif_v2.png", value: "Standard"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Standard"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Standard"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08900
     * @tc.desc   getImageProperty('GainControl', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_08900'
      const key = image.PropertyKey.GAIN_CONTROL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09000
     * @tc.desc   getImageProperty('Contrast', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09000'
      const key = image.PropertyKey.CONTRAST
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09100
     * @tc.desc   getImageProperty('Saturation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09100'
      const key = image.PropertyKey.SATURATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09200
     * @tc.desc   getImageProperty('Sharpness', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09200'
      const key = image.PropertyKey.SHARPNESS
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09300
     * @tc.desc   getImageProperty('DeviceSettingDescription', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09300'
      const key = image.PropertyKey.DEVICE_SETTING_DESCRIPTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2xxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2xxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2xxx"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09400
     * @tc.desc   getImageProperty('SubjectDistanceRange', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09400'
      const key = image.PropertyKey.SUBJECT_DISTANCE_RANGE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Unknown"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Unknown"},
        {name: "png", fileName: "test_exif_v2.png", value: "Unknown"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Unknown"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Unknown"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09500
     * @tc.desc   getImageProperty('ImageUniqueID', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09500'
      const key = image.PropertyKey.IMAGE_UNIQUE_ID
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "FXIC012"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "FXIC012"},
        {name: "png", fileName: "test_exif_v2.png", value: "FXIC012"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "FXIC012"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "FXIC012"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09600
     * @tc.desc   getImageProperty('GPSVersionID', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09600'
      const key = image.PropertyKey.GPS_VERSION_ID
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.2.0.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2.2.0.0"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.2.0.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.2.0.0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.2.0.0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09700
     * @tc.desc   getImageProperty('GPSAltitudeRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09700'
      const key = image.PropertyKey.GPS_ALTITUDE_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Sea level"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Sea level reference"},
        {name: "png", fileName: "test_exif_v2.png", value: "Sea level"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Sea level reference"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Sea level"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09800
     * @tc.desc   getImageProperty('GPSAltitude', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09800'
      const key = image.PropertyKey.GPS_ALTITUDE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.00"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.00"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.00"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0.00"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.00"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09900
     * @tc.desc   getImageProperty('GPSSatellites', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_09900'
      const key = image.PropertyKey.GPS_SATELLITES
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "BBA"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxx"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010000
     * @tc.desc   getImageProperty('GPSStatus', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010000'
      const key = image.PropertyKey.GPS_STATUS
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "A"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "A"},
        {name: "png", fileName: "test_exif_v2.png", value: "A"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "A"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "A"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010100
     * @tc.desc   getImageProperty('GPSMeasureMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010100'
      const key = image.PropertyKey.GPS_MEASURE_MODE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010200
     * @tc.desc   getImageProperty('GPSDOP', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010200'
      const key = image.PropertyKey.GPS_DOP
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "182"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "182"},
        {name: "png", fileName: "test_exif_v2.png", value: "182"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "182"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "182"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010300
     * @tc.desc   getImageProperty('GPSSpeedRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010300'
      const key = image.PropertyKey.GPS_SPEED_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "K"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "K"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010400
     * @tc.desc   getImageProperty('GPSSpeed', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010400'
      const key = image.PropertyKey.GPS_SPEED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "150"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "150"},
        {name: "png", fileName: "test_exif_v2.png", value: "150"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "150"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "150"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010500
     * @tc.desc   getImageProperty('GPSTrackRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010500'
      const key = image.PropertyKey.GPS_TRACK_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "T"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "T"},
        {name: "png", fileName: "test_exif_v2.png", value: "T"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "T"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "T"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010600
     * @tc.desc   getImageProperty('GPSTrack', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010600'
      const key = image.PropertyKey.GPS_TRACK
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "38.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "111"},
        {name: "png", fileName: "test_exif_v2.png", value: "38.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "56"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "38.0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010700
     * @tc.desc   getImageProperty('GPSImgDirectionRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010700'
      const key = image.PropertyKey.GPS_IMG_DIRECTION_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "M"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "M"},
        {name: "png", fileName: "test_exif_v2.png", value: "M"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "M"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "M"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010800
     * @tc.desc   getImageProperty('GPSImgDirection', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010800'
      const key = image.PropertyKey.GPS_IMG_DIRECTION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.23"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2.23"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.23"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.23214"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.23"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010900
     * @tc.desc   getImageProperty('GPSMapDatum', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_010900'
      const key = image.PropertyKey.GPS_MAP_DATUM
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "TEST"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxx"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011000
     * @tc.desc   getImageProperty('GPSDestLatitudeRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011000'
      const key = image.PropertyKey.GPS_DEST_LATITUDE_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "S"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011100
     * @tc.desc   getImageProperty('GPSDestLatitude', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011100'
      const key = image.PropertyKey.GPS_DEST_LATITUDE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "33, 22, 11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "33, 22, 11"},
        {name: "png", fileName: "test_exif_v2.png", value: "33, 22, 11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "33, 22, 11"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "33, 22, 11"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011200
     * @tc.desc   getImageProperty('GPSDestLongitudeRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011200'
      const key = image.PropertyKey.GPS_DEST_LONGITUDE_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "E"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", value: "E"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "E"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "E"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011300
     * @tc.desc   getImageProperty('GPSDestLongitude', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011300'
      const key = image.PropertyKey.GPS_DEST_LONGITUDE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "33, 22, 11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "33, 22, 11"},
        {name: "png", fileName: "test_exif_v2.png", value: "33, 22, 11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "33, 22, 11"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "33, 22, 11"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011400
     * @tc.desc   getImageProperty('GPSDestBearingRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011400'
      const key = image.PropertyKey.GPS_DEST_BEARING_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "T"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "M"},
        {name: "png", fileName: "test_exif_v2.png", value: "T"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "T"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "T"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011500
     * @tc.desc   getImageProperty('GPSDestBearing', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011500'
      const key = image.PropertyKey.GPS_DEST_BEARING
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2.0"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011600
     * @tc.desc   getImageProperty('GPSDestDistanceRef', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011600'
      const key = image.PropertyKey.GPS_DEST_DISTANCE_REF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "K"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011700
     * @tc.desc   getImageProperty('GPSDestDistance', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011700'
      const key = image.PropertyKey.GPS_DEST_DISTANCE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "10"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "10"},
        {name: "png", fileName: "test_exif_v2.png", value: "10"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "10"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011800
     * @tc.desc   getImageProperty('GPSProcessingMethod', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011800'
      const key = image.PropertyKey.GPS_PROCESSING_METHOD
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "CELLID"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "CELLID"},
        {name: "png", fileName: "test_exif_v2.png", value: "CELLID"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "GPS"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "CELLID"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011900
     * @tc.desc   getImageProperty('GPSAreaInformation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_011900'
      const key = image.PropertyKey.GPS_AREA_INFORMATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "arexxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "accxx"},
        {name: "png", fileName: "test_exif_v2.png", value: "arexxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "23...15...57"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "arexxx"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012000
     * @tc.desc   getImageProperty('GPSDifferential', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012000'
      const key = image.PropertyKey.GPS_DIFFERENTIAL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012100
     * @tc.desc   getImageProperty('BodySerialNumber', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012100'
      const key = image.PropertyKey.BODY_SERIAL_NUMBER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "exoch"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "x1"},
        {name: "png", fileName: "test_exif_v2.png", value: "exoch"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "exoch"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012200
     * @tc.desc   getImageProperty('CameraOwnerName', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012200'
      const key = image.PropertyKey.CAMERA_OWNER_NAME
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "c.uec"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "c.uec"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "c.uec"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012300
     * @tc.desc   getImageProperty('CompositeImage', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012300'
      const key = image.PropertyKey.COMPOSITE_IMAGE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012400
     * @tc.desc   getImageProperty('CompressedBitsPerPixel', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012400'
      const key = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "24"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.95"},
        {name: "png", fileName: "test_exif_v2.png", value: "24"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "24"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012500
     * @tc.desc   getImageProperty('DNGVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012500'
      const key = image.PropertyKey.DNG_VERSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2, 2, 3, 1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1, 1, 2, 3"},
        {name: "png", fileName: "test_exif_v2.png", value: "2, 2, 3, 1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0x01, 0x01, 0x02, 0x03"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2, 2, 3, 1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012600
     * @tc.desc   getImageProperty('DefaultCropSize', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012600'
      const key = image.PropertyKey.DEFAULT_CROP_SIZE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "153, 841"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "12, 1"},
        {name: "png", fileName: "test_exif_v2.png", value: "153, 841"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "153, 841"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012700
     * @tc.desc   getImageProperty('Gamma', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012700'
      const key = image.PropertyKey.GAMMA
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.5"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012800
     * @tc.desc   getImageProperty('ISOSpeedLatitudeyyy', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012800'
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_YYY
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1456"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "1456"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1456"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012900
     * @tc.desc   getImageProperty('ISOSpeedLatitudezzz', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_012900'
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1456"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "1456"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1456"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013000
     * @tc.desc   getImageProperty('LensMake', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013000'
      const key = image.PropertyKey.LENS_MAKE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxwx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "aaa"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxwx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxwx"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013100
     * @tc.desc   getImageProperty('LensModel', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013100'
      const key = image.PropertyKey.LENS_MODEL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "txaw"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "xxx"},
        {name: "png", fileName: "test_exif_v2.png", value: "txaw"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "txaw"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013200
     * @tc.desc   getImageProperty('LensSerialNumber', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013200'
      const key = image.PropertyKey.LENS_SERIAL_NUMBER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "qxhc"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "111"},
        {name: "png", fileName: "test_exif_v2.png", value: "qxhc"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "qxhc"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013300
     * @tc.desc   getImageProperty('LensSpecification', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013300'
      const key = image.PropertyKey.LENS_SPECIFICATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.8, 2.5, 1.5, 0.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: " 1, 2.5,  3,  2"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.8, 2.5, 1.5, 0.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 1, 1.5,  1,  2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.8, 2.5, 1.5, 0.5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013400
     * @tc.desc   getImageProperty('NewSubfileType', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013400'
      const key = image.PropertyKey.NEW_SUBFILE_TYPE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013500
     * @tc.desc   getImageProperty('OffsetTime', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013500'
      const key = image.PropertyKey.OFFSET_TIME
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2024:01:25"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "111"},
        {name: "png", fileName: "test_exif_v2.png", value: "2024:01:25"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2024:01:25"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013600
     * @tc.desc   getImageProperty('OffsetTimeDigitized', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013600'
      const key = image.PropertyKey.OFFSET_TIME_DIGITIZED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "cfh"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "abs"},
        {name: "png", fileName: "test_exif_v2.png", value: "cfh"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "cfh"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013700
     * @tc.desc   getImageProperty('OffsetTimeOriginal', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013700'
      const key = image.PropertyKey.OFFSET_TIME_ORIGINAL
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "chex"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "00xx"},
        {name: "png", fileName: "test_exif_v2.png", value: "chex"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "chex"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013800
     * @tc.desc   getImageProperty('SourceExposureTimesOfCompositeImage', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013800'
      const key = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxxw"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxxw"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxxw"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013900
     * @tc.desc   getImageProperty('SourceImageNumberOfCompositeImage', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_013900'
      const key = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "23, 34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1234, 1"},
        {name: "png", fileName: "test_exif_v2.png", value: "23, 34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1234"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "23, 34"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014000
     * @tc.desc   getImageProperty('SubfileType', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014000'
      const key = image.PropertyKey.SUBFILE_TYPE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014100
     * @tc.desc   getImageProperty('GPSHPositioningError', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014100'
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: " 2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014200
     * @tc.desc   getImageProperty('PhotographicSensitivity', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014200'
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "200"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "205"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014300
     * @tc.desc   getImageProperty('HwMnoteCaptureMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014300'
      const key = image.PropertyKey.CAPTURE_MODE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014400
     * @tc.desc   getImageProperty('HwMnotePhysicalAperture', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014400'
      const key = image.PropertyKey.PHYSICAL_APERTURE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "6"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "6"},
        {name: "png", fileName: "test_exif_v2.png", value: "6"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "6"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnotePhysicalAperture ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014500
     * @tc.desc   getImageProperty('HwMnoteRollAngle', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014500'
      const key = image.PropertyKey.ROLL_ANGLE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4"},
        {name: "png", fileName: "test_exif_v2.png", value: "4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteRollAngle ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014600
     * @tc.desc   getImageProperty('HwMnotePitchAngle', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014600'
      const key = image.PropertyKey.PITCH_ANGLE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", value: "5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnotePitchAngle ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014700
     * @tc.desc   getImageProperty('HwMnoteSceneFoodConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014700'
      const key = image.PropertyKey.SCENE_FOOD_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneFoodConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014800
     * @tc.desc   getImageProperty('HwMnoteSceneStageConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014800'
      const key = image.PropertyKey.SCENE_STAGE_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneStageConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014900
     * @tc.desc   getImageProperty('HwMnoteSceneBlueSkyConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_014900'
      const key = image.PropertyKey.SCENE_BLUE_SKY_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4"},
        {name: "png", fileName: "test_exif_v2.png", value: "4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneBlueSkyConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015000
     * @tc.desc   getImageProperty('HwMnoteSceneGreenPlantConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015000'
      const key = image.PropertyKey.SCENE_GREEN_PLANT_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", value: "5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneGreenPlantConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015100
     * @tc.desc   getImageProperty('HwMnoteSceneBeachConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015100'
      const key = image.PropertyKey.SCENE_BEACH_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "6"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "6"},
        {name: "png", fileName: "test_exif_v2.png", value: "6"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "6"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'rawfile');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneBeachConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015200
     * @tc.desc   getImageProperty('HwMnoteSceneSnowConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015200'
      const key = image.PropertyKey.SCENE_SNOW_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "7"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "7"},
        {name: "png", fileName: "test_exif_v2.png", value: "7"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "7"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "7"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneSnowConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015300
     * @tc.desc   getImageProperty('HwMnoteSceneSunsetConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015300'
      const key = image.PropertyKey.SCENE_SUNSET_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "8"},
        {name: "png", fileName: "test_exif_v2.png", value: "8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "8"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneSunsetConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015400
     * @tc.desc   getImageProperty('HwMnoteSceneFlowersConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015400'
      const key = image.PropertyKey.SCENE_FLOWERS_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "9"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "9"},
        {name: "png", fileName: "test_exif_v2.png", value: "9"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "9"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "9"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneFlowersConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015500
     * @tc.desc   getImageProperty('HwMnoteSceneNightConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015500'
      const key = image.PropertyKey.SCENE_NIGHT_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "10"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "10"},
        {name: "png", fileName: "test_exif_v2.png", value: "10"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "10"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneNightConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015600
     * @tc.desc   getImageProperty('HwMnoteSceneTextConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015600'
      const key = image.PropertyKey.SCENE_TEXT_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "11"},
        {name: "png", fileName: "test_exif_v2.png", value: "11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "11"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "11"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneTextConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015700
     * @tc.desc   getImageProperty('HwMnoteFaceCount', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015700'
      const key = image.PropertyKey.FACE_COUNT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceCount ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015800
     * @tc.desc   getImageProperty('HwMnoteFocusMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015800'
      const key = image.PropertyKey.FOCUS_MODE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "7"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "7"},
        {name: "png", fileName: "test_exif_v2.png", value: "7"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "7"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "7"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFocusMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015900
     * @tc.desc   getImageProperty('HwMnoteBurstNumber', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_015900'
      const key = image.PropertyKey.BURST_NUMBER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteBurstNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016000
     * @tc.desc   getImageProperty('HwMnoteFaceConf', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016000'
      const key = image.PropertyKey.FACE_CONF
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016100
     * @tc.desc   getImageProperty('HwMnoteFaceLeyeCenter', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016100'
      const key = image.PropertyKey.FACE_LEYE_CENTER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceLeyeCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016200
     * @tc.desc   getImageProperty('HwMnoteFaceMouthCenter', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016200'
      const key = image.PropertyKey.FACE_MOUTH_CENTER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4 5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4 5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4 5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4 5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4 5 6 7 8"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016300
     * @tc.desc   getImageProperty('HwMnoteFacePointer', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016300'
      const key = image.PropertyKey.FACE_POINTER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "122"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "122"},
        {name: "png", fileName: "test_exif_v2.png", value: "122"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "166"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "122"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFacePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016400
     * @tc.desc   getImageProperty('HwMnoteFaceRect', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016400'
      const key = image.PropertyKey.FACE_RECT
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceRect ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016500
     * @tc.desc   getImageProperty('HwMnoteFaceReyeCenter', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016500'
      const key = image.PropertyKey.FACE_REYE_CENTER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5 6 7 8"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceReyeCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016600
     * @tc.desc   getImageProperty('HwMnoteFaceSmileScore', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016600'
      const key = image.PropertyKey.FACE_SMILE_SCORE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4 5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4 5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4 5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4 5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4 5 6 7 8"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceSmileScore ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016700
     * @tc.desc   getImageProperty('HwMnoteFaceVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016700'
      const key = image.PropertyKey.FACE_VERSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016800
     * @tc.desc   getImageProperty('HwMnoteFrontCamera', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016800'
      const key = image.PropertyKey.FRONT_CAMERA
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFrontCamera ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016900
     * @tc.desc   getImageProperty('HwMnoteScenePointer', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_016900'
      const key = image.PropertyKey.SCENE_POINTER
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "256"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "256"},
        {name: "png", fileName: "test_exif_v2.png", value: "256"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "300"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "256"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteScenePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_017000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_017000
     * @tc.desc   getImageProperty('HwMnoteSceneVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_017000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_017000'
      const key = image.PropertyKey.SCENE_VERSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_018000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_018000
     * @tc.desc   getImageProperty('HwMnoteIsXmageSupported', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_018000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_018000'
      const key = image.PropertyKey.IS_XMAGE_SUPPORTED
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteIsXmageSupported ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_019000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_019000
     * @tc.desc   getImageProperty('HwMnoteXmageMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_019000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_019000'
      const key = image.PropertyKey.XMAGE_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteXmageMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_020000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_020000
     * @tc.desc   getImageProperty('HwMnoteXmageLeft', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_020000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_020000'
      const key = image.PropertyKey.XMAGE_LEFT
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for (let i = 0; i < values.length; i++) {
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteXmageLeft ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_021000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_021000
     * @tc.desc   getImageProperty('HwMnoteXmageTop', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_021000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_021000'
      const key = image.PropertyKey.XMAGE_TOP
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteXmageTop ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_022000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_022000
     * @tc.desc   getImageProperty('HwMnoteXmageRight', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_022000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_022000'
      const key = image.PropertyKey.XMAGE_RIGHT
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteXmageRight ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_023000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_023000
     * @tc.desc   getImageProperty('HwMnoteXmageBottom', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_023000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_023000'
      const key = image.PropertyKey.XMAGE_BOTTOM
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName, 'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteXmageBottom ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_024000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_024000
     * @tc.desc   getImageProperty('HwMnoteCloudEnhancementMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_024000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_024000'
      const key = image.PropertyKey.CLOUD_ENHANCEMENT_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteCloudEnhancementMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_025000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_025000
     * @tc.desc   getImageProperty('HwMnoteWindSnapshotMode', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_025000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_PROMISE_STATIC_025000'
      const key = image.PropertyKey.WIND_SNAPSHOT_MODE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteWindSnapshotMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0100
     * @tc.desc   getImageProperty('HwMnoteFaceVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0100'
      const key = image.PropertyKey.FACE_VERSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName, 'buffer');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0200
     * @tc.desc   getImageProperty('HwMnoteFrontCamera', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0200'
      const key = image.PropertyKey.FRONT_CAMERA
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'buffer');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFrontCamera ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0300
     * @tc.desc   getImageProperty('Orientation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0300'
      const key = image.PropertyKey.ORIENTATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Top-left"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Top-right"},
        {name: "png", fileName: "test_exif_v2.png", value: "Top-left"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Top-left"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Top-left"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'buffer');
          result = result && checkResult

        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0400
     * @tc.desc   getImageProperty('BitsPerSample', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_BUFFER_PROMISE_STATIC_0400'
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const values:Array<picTypeValue> = [{name:"jpeg", fileName:"test_exif_v2.jpg", value:"1, 1, 1"},
        {name:"webp", fileName:"test_exif_v2.webp", value:"8, 8, 8"},
        {name:"png", fileName:"test_exif_v2.png", value:"1, 1, 1"},
        {name:"dng", fileName:"test_exif_v2.dng", value:"8, 8, 8"},
        {name:"heif", fileName:"test_exif_v2.heic", value:"1, 1, 1"}
      ]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'buffer');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0100
     * @tc.desc   getImageProperty('HwMnoteFaceVersion', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0100'
      const key = image.PropertyKey.FACE_VERSION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName, 'uri');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0200
     * @tc.desc   getImageProperty('HwMnoteFrontCamera', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0200'
      const key = image.PropertyKey.FRONT_CAMERA
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'uri');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFrontCamera ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0300
     * @tc.desc   getImageProperty('Orientation', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0300'
      const key = image.PropertyKey.ORIENTATION
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Top-left"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Top-right"},
        {name: "png", fileName: "test_exif_v2.png", value: "Top-left"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Top-left"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Top-left"}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'uri');
          result = result && checkResult

        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0400
     * @tc.desc   getImageProperty('BitsPerSample', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_URI_PROMISE_STATIC_0400'
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const values:Array<picTypeValue> = [{name:"jpeg", fileName:"test_exif_v2.jpg", value:"1, 1, 1"},
        {name:"webp", fileName:"test_exif_v2.webp", value:"8, 8, 8"},
        {name:"png", fileName:"test_exif_v2.png", value:"1, 1, 1"},
        {name:"dng", fileName:"test_exif_v2.dng", value:"8, 8, 8"},
        {name:"heif", fileName:"test_exif_v2.heic", value:"1, 1, 1"}
      ]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName,'uri');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETMODIFYIMAGEPROPERTY_PROMISE_RAWFILE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETMODIFYIMAGEPROPERTY_PROMISE_RAWFILE_PROMISE_STATIC_0100
     * @tc.desc   getImageProperty('BitsPerSample', property)_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETMODIFYIMAGEPROPERTY_PROMISE_RAWFILE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETMODIFYIMAGEPROPERTY_PROMISE_RAWFILE_PROMISE_STATIC_0100'
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const modifyData: string = `65535,65535,65535`;
      const values:Array<picTypeValue> = [{name:"jpeg", fileName:"test_exif_v2.jpg", value:"1, 1, 1"},
        {name:"webp", fileName:"test_exif_v2.webp", value:"8, 8, 8"},
        {name:"png", fileName:"test_exif_v2.png", value:"1, 1, 1"},
        {name:"dng", fileName:"test_exif_v2.dng", value:"8, 8, 8"},
        {name:"heif", fileName:"test_exif_v2.heic", value:"1, 1, 1"}
      ]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++) {
          const imageSourceApi = await getImageSource(values[i].fileName, 'rawfile')
          let checkResult: boolean = true
          try {
            await imageSourceApi.modifyImageProperty(key, modifyData);
            checkResult = false
          } catch (error: BusinessError) {
            hilog.info(0x0000, testTag, `${testTag} modifyImageProperty  BitsPerSample error ${JSON.stringify(error)}`);
            checkResult = await testGetPromise(testTag, key, values[i].value, values[i].fileName, 'rawfile');
          }
          if (imageSourceApi != undefined) {
            imageSourceApi.release();
          }
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0100
     * @tc.desc   modifyImageProperty('BitsPerSample')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0100';
      const key = image.PropertyKey.BITS_PER_SAMPLE
      const modifyData: string = `1,1,1`;
      const compareData: string = `1, 1, 1`;
      try {
        let result: boolean = true
        for(let i=0; i< modfiyFileSuffixs.length; i++){
          let checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0200
     * @tc.desc   modifyImageProperty('Orientation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0200';
      const key = image.PropertyKey.ORIENTATION
      const modifyData: string = `1`;
      const compareData: string = `Top-left`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0300
     * @tc.desc   modifyImageProperty('ImageLength')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0300';
      const key = image.PropertyKey.IMAGE_LENGTH
      const modifyData: string = `0`;
      const compareData: string = `0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0400
     * @tc.desc   modifyImageProperty('ImageWidth')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0400';
      const key = image.PropertyKey.IMAGE_WIDTH
      const modifyData: string = `0`;
      const compareData: string = `0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0500
     * @tc.desc   modifyImageProperty('GPSLatitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0500';
      const key = image.PropertyKey.GPS_LATITUDE
      const modifyData: string = `39,54,20`;
      const compareData: string = `39, 54, 20`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0600
     * @tc.desc   modifyImageProperty('GPSLongitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0600';
      const key = image.PropertyKey.GPS_LONGITUDE
      const modifyData: string = `120/1 52/1 26/1`;
      const compareData: string = `120, 52, 26`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0700
     * @tc.desc   modifyImageProperty('GPSLatitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0700';
      const key = image.PropertyKey.GPS_LATITUDE_REF
      const modifyData: string = `N`;
      const compareData: string = `N`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0800
     * @tc.desc   modifyImageProperty('GPSLongitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0800';
      const key = image.PropertyKey.GPS_LONGITUDE_REF
      const modifyData: string = `E`;
      const compareData: string = `E`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0900
     * @tc.desc   modifyImageProperty('DateTimeOriginal')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_0900';
      const key = image.PropertyKey.DATE_TIME_ORIGINAL
      const modifyData: string = `2024:01:25 05:51:34`;
      const compareData: string = `2024:01:25 05:51:34`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01000
     * @tc.desc   modifyImageProperty('ExposureTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01000';
      const key = image.PropertyKey.EXPOSURE_TIME
      const modifyData: string = `1/34`;
      const compareData: string = `1/34 sec.`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01100
     * @tc.desc   modifyImageProperty('SceneType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01100';
      const key = image.PropertyKey.SCENE_TYPE
      const modifyData: string = `1`;
      const compareData: string = `Directly photographed`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SceneType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01200
     * @tc.desc   modifyImageProperty('ISOSpeedRatings')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01200';
      const key = image.PropertyKey.ISO_SPEED
      const modifyData: string = `1`;
      const compareData: string = `1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01300
     * @tc.desc   modifyImageProperty('FNumber')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01300';
      const key = image.PropertyKey.F_NUMBER
      const modifyData: string = `1/1`;
      const compareData: string = `f/1.0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01400
     * @tc.desc   modifyImageProperty('DateTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01400';
      const key = image.PropertyKey.DATE_TIME
      const modifyData: string = `2024:12:31`;
      const compareData: string = `2024:12:31`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01500
     * @tc.desc   modifyImageProperty('GPSTimeStamp')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01500';
      const key = image.PropertyKey.GPS_TIME_STAMP
      const modifyData: string = `11/1 37/1 58/1`;
      const compareData: string = `11:37:58.00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01600
     * @tc.desc   modifyImageProperty('GPSDateStamp')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01600';
      const key = image.PropertyKey.GPS_DATE_STAMP
      const modifyData: string = `2025:01:11`;
      const compareData: string = `2025:01:11`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01700
     * @tc.desc   modifyImageProperty('ImageDescription')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01700';
      const key = image.PropertyKey.IMAGE_DESCRIPTION
      const modifyData: string = `_cuva%s\\d`;
      const compareData: string = `_cuva%s\\d`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01800
     * @tc.desc   modifyImageProperty('Make')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01800';
      const key = image.PropertyKey.MAKE
      const modifyData: string = `华为`;
      const compareData: string = `华为`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01900
     * @tc.desc   modifyImageProperty('Model')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_01900';
      const key = image.PropertyKey.MODEL
      const modifyData: string = `TNY-AL00`;
      const compareData: string = `TNY-AL00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02000
     * @tc.desc   modifyImageProperty('PhotoMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02000';
      const key = image.PropertyKey.PHOTO_MODE
      const modifyData: string = `252`;
      const compareData: string = `252`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02100
     * @tc.desc   modifyImageProperty('SensitivityType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02100';
      const key = image.PropertyKey.SENSITIVITY_TYPE
      const modifyData: string = `5`;
      const compareData: string = `Standard output sensitivity (SOS) and ISO speed`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02200
     * @tc.desc   modifyImageProperty('StandardOutputSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02200';
      const key = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY
      const modifyData: string = `5`;
      const compareData: string = `5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02300
     * @tc.desc   modifyImageProperty('RecommendedExposureIndex')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02300';
      const key = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02400
     * @tc.desc   modifyImageProperty('ApertureValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02400';
      const key = image.PropertyKey.APERTURE_VALUE
      const modifyData: string = `4/1`;
      const compareData: string = `4.00 EV (f/4.0)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02500
     * @tc.desc   modifyImageProperty('ExposureBiasValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02500';
      const key = image.PropertyKey.EXPOSURE_BIAS_VALUE
      const modifyData: string = `23/1`;
      const compareData: string = `23.00 EV`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02600
     * @tc.desc   modifyImageProperty('MeteringMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02600';
      const key = image.PropertyKey.METERING_MODE
      const modifyData: string = `5`;
      const compareData: string = `Pattern`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02700
     * @tc.desc   modifyImageProperty('LightSource')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02700';
      const key = image.PropertyKey.LIGHT_SOURCE
      const modifyData: string = `1`;
      const compareData: string = `Daylight`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02800
     * @tc.desc   modifyImageProperty('Flash')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02800';
      const key = image.PropertyKey.FLASH
      const modifyData: string = `5`;
      const compareData: string = `Strobe return light not detected`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02900
     * @tc.desc   modifyImageProperty('FocalLength')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_02900';
      const key = image.PropertyKey.FOCAL_LENGTH
      const modifyData: string = `0/1`;
      const compareData: string = `0.0 mm`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03000
     * @tc.desc   modifyImageProperty('UserComment')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03000';
      const key = image.PropertyKey.USER_COMMENT
      const modifyData: string = `place for user comments`;
      const compareData: string = `place for user comments`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03100
     * @tc.desc   modifyImageProperty('PixelXDimension')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03100';
      const key = image.PropertyKey.PIXEL_X_DIMENSION
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03200
     * @tc.desc   modifyImageProperty('PixelYDimension')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03200';
      const key = image.PropertyKey.PIXEL_Y_DIMENSION
      const modifyData: string = `234`;
      const compareData: string = `234`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03300
     * @tc.desc   modifyImageProperty('WhiteBalance')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03300';
      const key = image.PropertyKey.WHITE_BALANCE
      const modifyData: string = `1`;
      const compareData: string = `Manual white balance`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03400
     * @tc.desc   modifyImageProperty('FocalLengthIn35mmFilm')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03400';
      const key = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM
      const modifyData: string = `2`;
      const compareData: string = `2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03500
     * @tc.desc   modifyImageProperty('Compression')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03500';
      const key = image.PropertyKey.COMPRESSION
      const modifyData: string = `1`;
      const compareData: string = `Uncompressed`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03600
     * @tc.desc   modifyImageProperty('PhotometricInterpretation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03600';
      const key = image.PropertyKey.PHOTOMETRIC_INTERPRETATION
      const modifyData: string = `0`;
      const compareData: string = `Reversed mono`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03700
     * @tc.desc   modifyImageProperty('StripOffsets')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03700';
      const key = image.PropertyKey.STRIP_OFFSETS
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03800
     * @tc.desc   modifyImageProperty('SamplesPerPixel')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03800';
      const key = image.PropertyKey.SAMPLES_PER_PIXEL
      const modifyData: string = `0`;
      const compareData: string = `0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03900
     * @tc.desc   modifyImageProperty('RowsPerStrip')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_03900';
      const key = image.PropertyKey.ROWS_PER_STRIP
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04000
     * @tc.desc   modifyImageProperty('StripByteCounts')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04000';
      const key = image.PropertyKey.STRIP_BYTE_COUNTS
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04100
     * @tc.desc   modifyImageProperty('XResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04100';
      const key = image.PropertyKey.X_RESOLUTION
      const modifyData: string = `0/1`;
      const compareData: string = ` 0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04200
     * @tc.desc   modifyImageProperty('YResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04200';
      const key = image.PropertyKey.Y_RESOLUTION
      const modifyData: string = `0/1`;
      const compareData: string = ` 0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04300
     * @tc.desc   modifyImageProperty('PlanarConfiguration')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04300';
      const key = image.PropertyKey.PLANAR_CONFIGURATION
      const modifyData: string = `1`;
      const compareData: string = `Chunky format`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04400
     * @tc.desc   modifyImageProperty('ResolutionUnit')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04400';
      const key = image.PropertyKey.RESOLUTION_UNIT
      const modifyData: string = `2`;
      const compareData: string = `Inch`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04500
     * @tc.desc   modifyImageProperty('TransferFunction')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04500';
      const key = image.PropertyKey.TRANSFER_FUNCTION
      const modifyData: string = `abc`;
      const compareData: string = `3 bytes undefined data`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04600
     * @tc.desc   modifyImageProperty('Software')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04600';
      const key = image.PropertyKey.SOFTWARE
      const modifyData: string = `华为`;
      const compareData: string = `华为`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04700
     * @tc.desc   modifyImageProperty('Artist')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04700';
      const key = image.PropertyKey.ARTIST
      const modifyData: string = `None`;
      const compareData: string = `None`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04800
     * @tc.desc   modifyImageProperty('WhitePoint')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04800';
      const key = image.PropertyKey.WHITE_POINT
      const modifyData: string = `252/1`;
      const compareData: string = `252, 0/0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04900
     * @tc.desc   modifyImageProperty('PrimaryChromaticities')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_04900';
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES
      const modifyData: string = `0/1`;
      const compareData: string = ` 0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05000
     * @tc.desc   modifyImageProperty('YCbCrCoefficients')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05000';
      const key = image.PropertyKey.YCBCR_COEFFICIENTS
      const modifyData: string = `299/1000 587/1000 114/1000`;
      const compareData: string = `0.299, 0.587, 0.114`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05100
     * @tc.desc   modifyImageProperty('YCbCrSubSampling')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05100';
      const key = image.PropertyKey.YCBCR_SUB_SAMPLING
      const modifyData: string = `3 2`;
      const compareData: string = `3, 2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05200
     * @tc.desc   modifyImageProperty('YCbCrPositioning')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05200';
      const key = image.PropertyKey.YCBCR_POSITIONING
      const modifyData: string = `1`;
      const compareData: string = `Centered`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05300
     * @tc.desc   modifyImageProperty('ReferenceBlackWhite')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05300';
      const key = image.PropertyKey.REFERENCE_BLACK_WHITE
      const modifyData: string = `222 0 1.5 0 25.2 25.2`;
      const compareData: string = `222,  0, 1.5,  0, 25.2, 25.2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05400
     * @tc.desc   modifyImageProperty('Copyright')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05400';
      const key = image.PropertyKey.COPYRIGHT
      const modifyData: string = `undefined`;
      const compareData: string = `undefined (Photographer) - [None] (Editor)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x2025, testTag, `modifyImageProperty promise error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05700
     * @tc.desc   modifyImageProperty('ExposureProgram')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05700';
      const key = image.PropertyKey.EXPOSURE_PROGRAM
      const modifyData: string = `0`;
      const compareData: string = `Not defined`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05800
     * @tc.desc   modifyImageProperty('SpectralSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05800';
      const key = image.PropertyKey.SPECTRAL_SENSITIVITY
      const modifyData: string = `abc`;
      const compareData: string = `abc`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05900
     * @tc.desc   modifyImageProperty('OECF')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_05900';
      const key = image.PropertyKey.OECF
      const modifyData: string = `excc`;
      const compareData: string = `4 bytes undefined data`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06000
     * @tc.desc   modifyImageProperty('ExifVersion')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06000';
      const key = image.PropertyKey.EXIF_VERSION
      const modifyData: string = `0110`;
      const compareData: string = `Exif Version 1.1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06100
     * @tc.desc   modifyImageProperty('DateTimeDigitized')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06100';
      const key = image.PropertyKey.DATE_TIME_DIGITIZED
      const modifyData: string = `2022:06:02 15:51:34`;
      const compareData: string = `2022:06:02 15:51:34`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06200
     * @tc.desc   modifyImageProperty('ComponentsConfiguration')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06200';
      const key = image.PropertyKey.COMPONENTS_CONFIGURATION
      const modifyData: string = `1456`;
      const compareData: string = `Y R G B`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06300
     * @tc.desc   modifyImageProperty('ShutterSpeedValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06300';
      const key = image.PropertyKey.SHUTTER_SPEED
      const modifyData: string = `5/2`;
      const compareData: string = `2.50 EV (1/6 sec.)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06400
     * @tc.desc   modifyImageProperty('BrightnessValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06400';
      const key = image.PropertyKey.BRIGHTNESS_VALUE
      const modifyData: string = `5/2`;
      const compareData: string = `2.50 EV (19.38 cd/m^2)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06500
     * @tc.desc   modifyImageProperty('MaxApertureValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06500';
      const key = image.PropertyKey.MAX_APERTURE_VALUE
      const modifyData: string = `5/2`;
      const compareData: string = `2.50 EV (f/2.4)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06600
     * @tc.desc   modifyImageProperty('SubjectDistance')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06600';
      const key = image.PropertyKey.SUBJECT_DISTANCE
      const modifyData: string = `5/2`;
      const compareData: string = `2.5 m`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06700
     * @tc.desc   modifyImageProperty('SubjectArea')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06700';
      const key = image.PropertyKey.SUBJECT_AREA
      const modifyData: string = `12 13`;
      const compareData: string = `(x,y) = (12,13)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06900
     * @tc.desc   modifyImageProperty('SubsecTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_06900';
      const key = image.PropertyKey.SUBSEC_TIME
      const modifyData: string = `123456`;
      const compareData: string = `123456`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07000
     * @tc.desc   modifyImageProperty('SubsecTimeOriginal')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07000';
      const key = image.PropertyKey.SUBSEC_TIME_ORIGINAL
      const modifyData: string = `427000`;
      const compareData: string = `427000`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07100
     * @tc.desc   modifyImageProperty('SubsecTimeDigitized')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07100';
      const key = image.PropertyKey.SUBSEC_TIME_DIGITIZED
      const modifyData: string = `427000`;
      const compareData: string = `427000`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07200
     * @tc.desc   modifyImageProperty('FlashpixVersion')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07200';
      const key = image.PropertyKey.FLASHPIX_VERSION
      const modifyData: string = `0100`;
      const compareData: string = `FlashPix Version 1.0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07300
     * @tc.desc   modifyImageProperty('ColorSpace')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07300';
      const key = image.PropertyKey.COLOR_SPACE
      const modifyData: string = `1`;
      const compareData: string = `sRGB`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07400
     * @tc.desc   modifyImageProperty('RelatedSoundFile')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07400';
      const key = image.PropertyKey.RELATED_SOUND_FILE
      const modifyData: string = `/usr/home`;
      const compareData: string = `/usr/home`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07500
     * @tc.desc   modifyImageProperty('FlashEnergy')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07500';
      const key = image.PropertyKey.FLASH_ENERGY
      const modifyData: string = `832/1`;
      const compareData: string = `832`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07600
     * @tc.desc   modifyImageProperty('SpatialFrequencyResponse')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07600';
      const key = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE
      const modifyData: string = `13`;
      const compareData: string = `13`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07700
     * @tc.desc   modifyImageProperty('FocalPlaneXResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07700';
      const key = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION
      const modifyData: string = `1080/1`;
      const compareData: string = `1080`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07800
     * @tc.desc   modifyImageProperty('FocalPlaneYResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07800';
      const key = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION
      const modifyData: string = `880/1`;
      const compareData: string = `880`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07900
     * @tc.desc   modifyImageProperty('FocalPlaneResolutionUnit')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_07900';
      const key = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT
      const modifyData: string = `2`;
      const compareData: string = `Inch`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08000
     * @tc.desc   modifyImageProperty('SubjectLocation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08000';
      const key = image.PropertyKey.SUBJECT_LOCATION
      const modifyData: string = `0 1`;
      const compareData: string = `0, 1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08100
     * @tc.desc   modifyImageProperty('ExposureIndex')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08100';
      const key = image.PropertyKey.EXPOSURE_INDEX
      const modifyData: string = `3/2`;
      const compareData: string = `1.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08200
     * @tc.desc   modifyImageProperty('SensingMethod')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08200';
      const key = image.PropertyKey.SENSING_METHOD
      const modifyData: string = `3`;
      const compareData: string = `Two-chip color area sensor`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08300
     * @tc.desc   modifyImageProperty('FileSource')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08300';
      const key = image.PropertyKey.FILE_SOURCE
      const modifyData: string = `3`;
      const compareData: string = `DSC`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08400
     * @tc.desc   modifyImageProperty('CFAPattern')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08400';
      const key = image.PropertyKey.CFA_PATTERN
      const modifyData: string = `3`;
      const compareData: string = `1 bytes undefined data`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08500
     * @tc.desc   modifyImageProperty('CustomRendered')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08500';
      const key = image.PropertyKey.CUSTOM_RENDERED
      const modifyData: string = `0`;
      const compareData: string = `Normal process`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08600
     * @tc.desc   modifyImageProperty('ExposureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08600';
      const key = image.PropertyKey.EXPOSURE_MODE
      const modifyData: string = `0`;
      const compareData: string = `Auto exposure`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08700
     * @tc.desc   modifyImageProperty('DigitalZoomRatio')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08700';
      const key = image.PropertyKey.DIGITAL_ZOOM_RATIO
      const modifyData: string = `321/1`;
      const compareData: string = `321`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08800
     * @tc.desc   modifyImageProperty('SceneCaptureType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08800';
      const key = image.PropertyKey.SCENE_CAPTURE_TYPE
      const modifyData: string = `0`;
      const compareData: string = `Standard`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08900
     * @tc.desc   modifyImageProperty('GainControl')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_08900';
      const key = image.PropertyKey.GAIN_CONTROL
      const modifyData: string = `0`;
      const compareData: string = `Normal`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09000
     * @tc.desc   modifyImageProperty('Contrast')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09000';
      const key = image.PropertyKey.CONTRAST
      const modifyData: string = `0`;
      const compareData: string = `Normal`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09100
     * @tc.desc   modifyImageProperty('Saturation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09100';
      const key = image.PropertyKey.SATURATION
      const modifyData: string = `0`;
      const compareData: string = `Normal`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09200
     * @tc.desc   modifyImageProperty('Sharpness')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09200';
      const key = image.PropertyKey.SHARPNESS
      const modifyData: string = `0`;
      const compareData: string = `Normal`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09300
     * @tc.desc   modifyImageProperty('DeviceSettingDescription')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09300';
      const key = image.PropertyKey.DEVICE_SETTING_DESCRIPTION
      const modifyData: string = `2xxx`;
      const compareData: string = `2xxx`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09400
     * @tc.desc   modifyImageProperty('SubjectDistanceRange')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09400';
      const key = image.PropertyKey.SUBJECT_DISTANCE_RANGE
      const modifyData: string = `0`;
      const compareData: string = `Unknown`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09500
     * @tc.desc   modifyImageProperty('ImageUniqueID')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09500';
      const key = image.PropertyKey.IMAGE_UNIQUE_ID
      const modifyData: string = `FXIC012`;
      const compareData: string = `FXIC012`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09600
     * @tc.desc   modifyImageProperty('GPSVersionID')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09600';
      const key = image.PropertyKey.GPS_VERSION_ID
      const modifyData: string = `2.2.0.0`;
      const compareData: string = `2.2.0.0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09700
     * @tc.desc   modifyImageProperty('GPSAltitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09700';
      const key = image.PropertyKey.GPS_ALTITUDE_REF
      const modifyData: string = `0`;
      const compareData: string = `Sea level`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09800
     * @tc.desc   modifyImageProperty('GPSAltitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09800';
      const key = image.PropertyKey.GPS_ALTITUDE
      const modifyData: string = `0/100`;
      const compareData: string = `0.00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09900
     * @tc.desc   modifyImageProperty('GPSSatellites')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_09900';
      const key = image.PropertyKey.GPS_SATELLITES
      const modifyData: string = `xxx`;
      const compareData: string = `xxx`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010000
     * @tc.desc   modifyImageProperty('GPSStatus')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010000';
      const key = image.PropertyKey.GPS_STATUS
      const modifyData: string = `A`;
      const compareData: string = `A`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010100
     * @tc.desc   modifyImageProperty('GPSMeasureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010100';
      const key = image.PropertyKey.GPS_MEASURE_MODE
      const modifyData: string = `2`;
      const compareData: string = `2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010200
     * @tc.desc   modifyImageProperty('GPSDOP')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010200';
      const key = image.PropertyKey.GPS_DOP
      const modifyData: string = `182/1`;
      const compareData: string = `182`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010300
     * @tc.desc   modifyImageProperty('GPSSpeedRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010300';
      const key = image.PropertyKey.GPS_SPEED_REF
      const modifyData: string = `N`;
      const compareData: string = `N`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010400
     * @tc.desc   modifyImageProperty('GPSSpeed')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010400';
      const key = image.PropertyKey.GPS_SPEED
      const modifyData: string = `150/1`;
      const compareData: string = `150`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010500
     * @tc.desc   modifyImageProperty('GPSTrackRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010500';
      const key = image.PropertyKey.GPS_TRACK_REF
      const modifyData: string = `T`;
      const compareData: string = `T`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010600
     * @tc.desc   modifyImageProperty('GPSTrack')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010600';
      const key = image.PropertyKey.GPS_TRACK
      const modifyData: string = `114/3`;
      const compareData: string = `38.0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010700
     * @tc.desc   modifyImageProperty('GPSImgDirectionRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010700';
      const key = image.PropertyKey.GPS_IMG_DIRECTION_REF
      const modifyData: string = `M`;
      const compareData: string = `M`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010800
     * @tc.desc   modifyImageProperty('GPSImgDirection')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010800';
      const key = image.PropertyKey.GPS_IMG_DIRECTION
      const modifyData: string = `125/56`;
      const compareData: string = `2.23`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010900
     * @tc.desc   modifyImageProperty('GPSMapDatum')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_010900';
      const key = image.PropertyKey.GPS_MAP_DATUM
      const modifyData: string = `xxx`;
      const compareData: string = `xxx`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011000
     * @tc.desc   modifyImageProperty('GPSDestLatitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011000';
      const key = image.PropertyKey.GPS_DEST_LATITUDE_REF
      const modifyData: string = `N`;
      const compareData: string = `N`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011100
     * @tc.desc   modifyImageProperty('GPSDestLatitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011100';
      const key = image.PropertyKey.GPS_DEST_LATITUDE
      const modifyData: string = `33/1 22/1 11/1`;
      const compareData: string = `33, 22, 11`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011200
     * @tc.desc   modifyImageProperty('GPSDestLongitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011200';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE_REF
      const modifyData: string = `E`;
      const compareData: string = `E`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011300
     * @tc.desc   modifyImageProperty('GPSDestLongitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011300';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE
      const modifyData: string = `33/1 22/1 11/1`;
      const compareData: string = `33, 22, 11`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011400
     * @tc.desc   modifyImageProperty('GPSDestBearingRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011400';
      const key = image.PropertyKey.GPS_DEST_BEARING_REF
      const modifyData: string = `T`;
      const compareData: string = `T`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011500
     * @tc.desc   modifyImageProperty('GPSDestBearing')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011500';
      const key = image.PropertyKey.GPS_DEST_BEARING
      const modifyData: string = `22/11`;
      const compareData: string = `2.0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011600
     * @tc.desc   modifyImageProperty('GPSDestDistanceRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011600';
      const key = image.PropertyKey.GPS_DEST_DISTANCE_REF
      const modifyData: string = `N`;
      const compareData: string = `N`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011700
     * @tc.desc   modifyImageProperty('GPSDestDistance')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011700';
      const key = image.PropertyKey.GPS_DEST_DISTANCE
      const modifyData: string = `10/1`;
      const compareData: string = `10`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011800
     * @tc.desc   modifyImageProperty('GPSProcessingMethod')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011800';
      const key = image.PropertyKey.GPS_PROCESSING_METHOD
      const modifyData: string = `CELLID`;
      const compareData: string = `CELLID`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011900
     * @tc.desc   modifyImageProperty('GPSAreaInformation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_011900';
      const key = image.PropertyKey.GPS_AREA_INFORMATION
      const modifyData: string = `arexxx`;
      const compareData: string = `arexxx`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012000
     * @tc.desc   modifyImageProperty('GPSDifferential')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012000';
      const key = image.PropertyKey.GPS_DIFFERENTIAL
      const modifyData: string = `0`;
      const compareData: string = `0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012100
     * @tc.desc   modifyImageProperty('BodySerialNumber')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012100';
      const key = image.PropertyKey.BODY_SERIAL_NUMBER
      const modifyData: string = `exoch`;
      const compareData: string = `exoch`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012200
     * @tc.desc   modifyImageProperty('CameraOwnerName')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012200';
      const key = image.PropertyKey.CAMERA_OWNER_NAME
      const modifyData: string = `c.uec`;
      const compareData: string = `c.uec`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012300
     * @tc.desc   modifyImageProperty('CompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012300';
      const key = image.PropertyKey.COMPOSITE_IMAGE
      const modifyData: string = `2`;
      const compareData: string = `2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012400
     * @tc.desc   modifyImageProperty('CompressedBitsPerPixel')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012400';
      const key = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL
      const modifyData: string = `24/1`;
      const compareData: string = `24`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012500
     * @tc.desc   modifyImageProperty('DNGVersion')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012500';
      const key = image.PropertyKey.DNG_VERSION
      const modifyData: string = `2 2 3 1`;
      const compareData: string = `2, 2, 3, 1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012600
     * @tc.desc   modifyImageProperty('DefaultCropSize')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012600';
      const key = image.PropertyKey.DEFAULT_CROP_SIZE
      const modifyData: string = `153 841`;
      const compareData: string = `153, 841`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012700
     * @tc.desc   modifyImageProperty('Gamma')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012700';
      const key = image.PropertyKey.GAMMA
      const modifyData: string = `5/2`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012800
     * @tc.desc   modifyImageProperty('ISOSpeedLatitudeyyy')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012800';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_YYY
      const modifyData: string = `1456`;
      const compareData: string = `1456`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012900
     * @tc.desc   modifyImageProperty('ISOSpeedLatitudezzz')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_012900';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ
      const modifyData: string = `1456`;
      const compareData: string = `1456`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013000
     * @tc.desc   modifyImageProperty('LensMake')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013000';
      const key = image.PropertyKey.LENS_MAKE
      const modifyData: string = `xxwx`;
      const compareData: string = `xxwx`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013100
     * @tc.desc   modifyImageProperty('LensModel')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013100';
      const key = image.PropertyKey.LENS_MODEL
      const modifyData: string = `txaw`;
      const compareData: string = `txaw`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013200
     * @tc.desc   modifyImageProperty('LensSerialNumber')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013200';
      const key = image.PropertyKey.LENS_SERIAL_NUMBER
      const modifyData: string = `qxhc`;
      const compareData: string = `qxhc`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013300
     * @tc.desc   modifyImageProperty('LensSpecification')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013300';
      const key = image.PropertyKey.LENS_SPECIFICATION
      const modifyData: string = `3/4 5/2 3/2 1/2`;
      const compareData: string = `0.8, 2.5, 1.5, 0.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013400
     * @tc.desc   modifyImageProperty('NewSubfileType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013400';
      const key = image.PropertyKey.NEW_SUBFILE_TYPE
      const modifyData: string = `3`;
      const compareData: string = `3`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013500
     * @tc.desc   modifyImageProperty('OffsetTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013500';
      const key = image.PropertyKey.OFFSET_TIME
      const modifyData: string = `2024:01:25`;
      const compareData: string = `2024:01:25`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013600
     * @tc.desc   modifyImageProperty('OffsetTimeDigitized')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013600';
      const key = image.PropertyKey.OFFSET_TIME_DIGITIZED
      const modifyData: string = `cfh`;
      const compareData: string = `cfh`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013700
     * @tc.desc   modifyImageProperty('OffsetTimeOriginal')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013700';
      const key = image.PropertyKey.OFFSET_TIME_ORIGINAL
      const modifyData: string = `chex`;
      const compareData: string = `chex`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013800
     * @tc.desc   modifyImageProperty('SourceExposureTimesOfCompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013800';
      const key = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
      const modifyData: string = `xxxw`;
      const compareData: string = `xxxw`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013900
     * @tc.desc   modifyImageProperty('SourceImageNumberOfCompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_013900';
      const key = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
      const modifyData: string = `23 34`;
      const compareData: string = `23, 34`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014000
     * @tc.desc   modifyImageProperty('SubfileType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014000';
      const key = image.PropertyKey.SUBFILE_TYPE
      const modifyData: string = `2`;
      const compareData: string = `2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014100
     * @tc.desc   modifyImageProperty('GPSHPositioningError')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014100';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const modifyData: string = `5/2`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014200
     * @tc.desc   modifyImageProperty('PhotographicSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014200';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const modifyData: string = `1`;
      const compareData: string = `1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014500
     * @tc.desc   modifyImageProperty('HwMnoteCaptureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014500';
      const key = image.PropertyKey.CAPTURE_MODE;
      const modifyData: string = `1`;
      const compareData: string = `1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0100
     * @tc.desc   modifyImageProperty('SourceImageNumberOfCompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0100';
      const key = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
      const modifyData: string = `23 34`;
      const compareData: string = `23, 34`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0200
     * @tc.desc   modifyImageProperty('SubfileType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0200';
      const key = image.PropertyKey.SUBFILE_TYPE
      const modifyData: string = `2`;
      const compareData: string = `2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0300
     * @tc.desc   modifyImageProperty('GPSHPositioningError')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0300';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const modifyData: string = `5/2`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0400
     * @tc.desc   modifyImageProperty('PhotographicSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_URI_PROMISE_STATIC_0400';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const modifyData: string = `1`;
      const compareData: string = `1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0100
     * @tc.desc   modifyImageProperty('BitsPerSample')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0100';
      const key = image.PropertyKey.BITS_PER_SAMPLE
      const modifyData: string = `65535,65535,65535`;
      const compareData: string = `65535, 65535, 65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty  error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0200
     * @tc.desc   modifyImageProperty('Orientation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0200';
      const key = image.PropertyKey.ORIENTATION
      const modifyData: string = `8`;
      const compareData: string = `Left-bottom`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0300
     * @tc.desc   modifyImageProperty('ImageLength')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0300';
      const key = image.PropertyKey.IMAGE_LENGTH
      const modifyData: string = `65535`;
      const compareData: string = `65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0400
     * @tc.desc   modifyImageProperty('ImageWidth')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0400';
      const key = image.PropertyKey.IMAGE_WIDTH
      const modifyData: string = `65535`;
      const compareData: string = `65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0500
     * @tc.desc   modifyImageProperty('GPSLatitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0500';
      const key = image.PropertyKey.GPS_LATITUDE
      const modifyData: string = `114,3`;
      const compareData: string = `38.0,  0,  0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0600
     * @tc.desc   modifyImageProperty('GPSLongitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0600';
      const key = image.PropertyKey.GPS_LONGITUDE
      const modifyData: string = `114,3`;
      const compareData: string = `38.0,  0,  0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0700
     * @tc.desc   modifyImageProperty('GPSLatitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0700';
      const key = image.PropertyKey.GPS_LATITUDE_REF
      const modifyData: string = `S`;
      const compareData: string = `S`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0800
     * @tc.desc   modifyImageProperty('GPSLongitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0800';
      const key = image.PropertyKey.GPS_LONGITUDE_REF
      const modifyData: string = `W`;
      const compareData: string = `W`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0900
     * @tc.desc   modifyImageProperty('DateTimeOriginal')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_0900';
      const key = image.PropertyKey.DATE_TIME_ORIGINAL
      const modifyData: string = `1900:01:01 00:00:00`;
      const compareData: string = `1900:01:01 00:00:00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01000
     * @tc.desc   modifyImageProperty('ExposureTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01000';
      const key = image.PropertyKey.EXPOSURE_TIME
      const modifyData: string = `1/60`;
      const compareData: string = `1/60 sec.`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01200
     * @tc.desc   modifyImageProperty('ISOSpeedRatings')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01200';
      const key = image.PropertyKey.ISO_SPEED
      const modifyData: string = `65535`;
      const compareData: string = `65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01300
     * @tc.desc   modifyImageProperty('FNumber')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01300';
      const key = image.PropertyKey.F_NUMBER
      const modifyData: string = `1/30`;
      const compareData: string = `f/0.03`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01400
     * @tc.desc   modifyImageProperty('DateTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01400';
      const key = image.PropertyKey.DATE_TIME
      const modifyData: string = `1900:01:01`;
      const compareData: string = `1900:01:01`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01500
     * @tc.desc   modifyImageProperty('GPSTimeStamp')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01500';
      const key = image.PropertyKey.GPS_TIME_STAMP
      const modifyData: string = `12 54 20`;
      const compareData: string = `12:54:20.00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01600
     * @tc.desc   modifyImageProperty('GPSDateStamp')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01600';
      const key = image.PropertyKey.GPS_DATE_STAMP
      const modifyData: string = `1900:01:01`;
      const compareData: string = `1900:01:01`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01700
     * @tc.desc   modifyImageProperty('ImageDescription')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01700';
      const key = image.PropertyKey.IMAGE_DESCRIPTION
      const modifyData: string = `@  @`;
      const compareData: string = `@  @`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01800
     * @tc.desc   modifyImageProperty('Make')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01800';
      const key = image.PropertyKey.MAKE
      const modifyData: string = `APPLE`;
      const compareData: string = `APPLE`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01900
     * @tc.desc   modifyImageProperty('Model')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_01900';
      const key = image.PropertyKey.MODEL
      const modifyData: string = `%s \\0`;
      const compareData: string = `%s \\0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02000
     * @tc.desc   modifyImageProperty('PhotoMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02000';
      const key = image.PropertyKey.PHOTO_MODE
      const modifyData: string = `13`;
      const compareData: string = `13`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02100
     * @tc.desc   modifyImageProperty('SensitivityType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02100';
      const key = image.PropertyKey.SENSITIVITY_TYPE
      const modifyData: string = `0`;
      const compareData: string = `Unknown`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02200
     * @tc.desc   modifyImageProperty('StandardOutputSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02200';
      const key = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY
      const modifyData: string = `1000`;
      const compareData: string = `1000`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02300
     * @tc.desc   modifyImageProperty('RecommendedExposureIndex')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02300';
      const key = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX
      const modifyData: string = `2147483647`;
      const compareData: string = `2147483647`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02400
     * @tc.desc   modifyImageProperty('ApertureValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02400';
      const key = image.PropertyKey.APERTURE_VALUE
      const modifyData: string = `16`;
      const compareData: string = `16.00 EV (f/256.0)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02500
     * @tc.desc   modifyImageProperty('ExposureBiasValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02500';
      const key = image.PropertyKey.EXPOSURE_BIAS_VALUE
      const modifyData: string = `4`;
      const compareData: string = `4.00 EV`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02600
     * @tc.desc   modifyImageProperty('MeteringMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02600';
      const key = image.PropertyKey.METERING_MODE
      const modifyData: string = `0`;
      const compareData: string = `Unknown`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02700
     * @tc.desc   modifyImageProperty('LightSource')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02700';
      const key = image.PropertyKey.LIGHT_SOURCE
      const modifyData: string = `2`;
      const compareData: string = `Fluorescent`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02800
     * @tc.desc   modifyImageProperty('Flash')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02800';
      const key = image.PropertyKey.FLASH
      const modifyData: string = `95`;
      const compareData: string = `Flash fired, auto mode, return light detected, red-eye reduction mode`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02900
     * @tc.desc   modifyImageProperty('FocalLength')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_02900';
      const key = image.PropertyKey.FOCAL_LENGTH
      const modifyData: string = `31/1`;
      const compareData: string = `31.0 mm`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03000
     * @tc.desc   modifyImageProperty('UserComment')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03000';
      const key = image.PropertyKey.USER_COMMENT
      const modifyData: string = `%s \\0`;
      const compareData: string = `%s \\0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03100
     * @tc.desc   modifyImageProperty('PixelXDimension')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03100';
      const key = image.PropertyKey.PIXEL_X_DIMENSION
      const modifyData: string = `0`;
      const compareData: string = `0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03200
     * @tc.desc   modifyImageProperty('PixelYDimension')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03200';
      const key = image.PropertyKey.PIXEL_Y_DIMENSION
      const modifyData: string = `0`;
      const compareData: string = `0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03300
     * @tc.desc   modifyImageProperty('WhiteBalance')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03300';
      const key = image.PropertyKey.WHITE_BALANCE
      const modifyData: string = `0`;
      const compareData: string = `Auto white balance`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03400
     * @tc.desc   modifyImageProperty('FocalLengthIn35mmFilm')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03400';
      const key = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM
      const modifyData: string = `12`;
      const compareData: string = `12`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03500
     * @tc.desc   modifyImageProperty('Compression')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03500';
      const key = image.PropertyKey.COMPRESSION
      const modifyData: string = `32773`;
      const compareData: string = `PackBits compression`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03600
     * @tc.desc   modifyImageProperty('PhotometricInterpretation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03600';
      const key = image.PropertyKey.PHOTOMETRIC_INTERPRETATION
      const modifyData: string = `1`;
      const compareData: string = `Normal mono`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03700
     * @tc.desc   modifyImageProperty('StripOffsets')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03700';
      const key = image.PropertyKey.STRIP_OFFSETS
      const modifyData: string = `456`;
      const compareData: string = `456`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03800
     * @tc.desc   modifyImageProperty('SamplesPerPixel')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03800';
      const key = image.PropertyKey.SAMPLES_PER_PIXEL
      const modifyData: string = `65535`;
      const compareData: string = `65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03900
     * @tc.desc   modifyImageProperty('RowsPerStrip')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_03900';
      const key = image.PropertyKey.ROWS_PER_STRIP
      const modifyData: string = `345`;
      const compareData: string = `345`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04000
     * @tc.desc   modifyImageProperty('StripByteCounts')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04000';
      const key = image.PropertyKey.STRIP_BYTE_COUNTS
      const modifyData: string = `345`;
      const compareData: string = `345`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04100
     * @tc.desc   modifyImageProperty('XResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04100';
      const key = image.PropertyKey.X_RESOLUTION
      const modifyData: string = `31/1`;
      const compareData: string = `31`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04200
     * @tc.desc   modifyImageProperty('YResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04200';
      const key = image.PropertyKey.Y_RESOLUTION
      const modifyData: string = `31/1`;
      const compareData: string = `31`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04300
     * @tc.desc   modifyImageProperty('PlanarConfiguration')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04300';
      const key = image.PropertyKey.PLANAR_CONFIGURATION
      const modifyData: string = `2`;
      const compareData: string = `Planar format`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04400
     * @tc.desc   modifyImageProperty('ResolutionUnit')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04400';
      const key = image.PropertyKey.RESOLUTION_UNIT
      const modifyData: string = `3`;
      const compareData: string = `Centimeter`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04500
     * @tc.desc   modifyImageProperty('TransferFunction')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04500';
      const key = image.PropertyKey.TRANSFER_FUNCTION
      const modifyData: string = `123`;
      const compareData: string = `3 bytes undefined data`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04600
     * @tc.desc   modifyImageProperty('Software')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04600';
      const key = image.PropertyKey.SOFTWARE
      const modifyData: string = `%s \\0`;
      const compareData: string = `%s \\0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04700
     * @tc.desc   modifyImageProperty('Artist')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04700';
      const key = image.PropertyKey.ARTIST
      const modifyData: string = `%s \\0`;
      const compareData: string = `%s \\0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04800
     * @tc.desc   modifyImageProperty('WhitePoint')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04800';
      const key = image.PropertyKey.WHITE_POINT
      const modifyData: string = `31/1`;
      const compareData: string = `31, 0/0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04900
     * @tc.desc   modifyImageProperty('PrimaryChromaticities')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_04900';
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES
      const modifyData: string = `31/1`;
      const compareData: string = `31`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05000
     * @tc.desc   modifyImageProperty('YCbCrCoefficients')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05000';
      const key = image.PropertyKey.YCBCR_COEFFICIENTS
      const modifyData: string = `3/2 4/2 9/3`;
      const compareData: string = `1.5, 2.0, 3.0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05100
     * @tc.desc   modifyImageProperty('YCbCrSubSampling')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05100';
      const key = image.PropertyKey.YCBCR_SUB_SAMPLING
      const modifyData: string = `4 5`;
      const compareData: string = `4, 5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05200
     * @tc.desc   modifyImageProperty('YCbCrPositioning')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05200';
      const key = image.PropertyKey.YCBCR_POSITIONING
      const modifyData: string = `2`;
      const compareData: string = `Co-sited`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05300
     * @tc.desc   modifyImageProperty('ReferenceBlackWhite')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05300';
      const key = image.PropertyKey.REFERENCE_BLACK_WHITE
      const modifyData: string = `3 255 0 255 0 255`;
      const compareData: string = ` 3, 255,  0, 255,  0, 255`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05400
     * @tc.desc   modifyImageProperty('Copyright')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05400';
      const key = image.PropertyKey.COPYRIGHT
      const modifyData: string = `joseph`;
      const compareData: string = `joseph (Photographer) - [None] (Editor)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05700
     * @tc.desc   modifyImageProperty('ExposureProgram')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05700';
      const key = image.PropertyKey.EXPOSURE_PROGRAM
      const modifyData: string = `8`;
      const compareData: string = `Landscape mode (for landscape photos with the background in focus)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05800
     * @tc.desc   modifyImageProperty('SpectralSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05800';
      const key = image.PropertyKey.SPECTRAL_SENSITIVITY
      const modifyData: string = `1234`;
      const compareData: string = `1234`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05900
     * @tc.desc   modifyImageProperty('OECF')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_05900';
      const key = image.PropertyKey.OECF
      const modifyData: string = `ab`;
      const compareData: string = `2 bytes undefined data`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06000
     * @tc.desc   modifyImageProperty('ExifVersion')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06000';
      const key = image.PropertyKey.EXIF_VERSION
      const modifyData: string = `0120`;
      const compareData: string = `Exif Version 1.2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06100
     * @tc.desc   modifyImageProperty('DateTimeDigitized')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06100';
      const key = image.PropertyKey.DATE_TIME_DIGITIZED
      const modifyData: string = `1900:01:01 00:00:00`;
      const compareData: string = `1900:01:01 00:00:00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06200
     * @tc.desc   modifyImageProperty('ComponentsConfiguration')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06200';
      const key = image.PropertyKey.COMPONENTS_CONFIGURATION
      const modifyData: string = `1256`;
      const compareData: string = `Y Cb G B`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06300
     * @tc.desc   modifyImageProperty('ShutterSpeedValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06300';
      const key = image.PropertyKey.SHUTTER_SPEED
      const modifyData: string = `3/2`;
      const compareData: string = `1.50 EV (1/3 sec.)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06400
     * @tc.desc   modifyImageProperty('BrightnessValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06400';
      const key = image.PropertyKey.BRIGHTNESS_VALUE
      const modifyData: string = `6/5`;
      const compareData: string = `1.20 EV (7.87 cd/m^2)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06500
     * @tc.desc   modifyImageProperty('MaxApertureValue')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06500';
      const key = image.PropertyKey.MAX_APERTURE_VALUE
      const modifyData: string = `8/5`;
      const compareData: string = `1.60 EV (f/1.7)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06600
     * @tc.desc   modifyImageProperty('SubjectDistance')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06600';
      const key = image.PropertyKey.SUBJECT_DISTANCE
      const modifyData: string = `1/2`;
      const compareData: string = `0.5 m`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06700
     * @tc.desc   modifyImageProperty('SubjectArea')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06700';
      const key = image.PropertyKey.SUBJECT_AREA
      const modifyData: string = `45 23`;
      const compareData: string = `(x,y) = (45,23)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06900
     * @tc.desc   modifyImageProperty('SubsecTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_06900';
      const key = image.PropertyKey.SUBSEC_TIME
      const modifyData: string = `427000`;
      const compareData: string = `427000`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07000
     * @tc.desc   modifyImageProperty('SubsecTimeOriginal')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07000';
      const key = image.PropertyKey.SUBSEC_TIME_ORIGINAL
      const modifyData: string = `123456`;
      const compareData: string = `123456`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07100
     * @tc.desc   modifyImageProperty('SubsecTimeDigitized')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07100';
      const key = image.PropertyKey.SUBSEC_TIME_DIGITIZED
      const modifyData: string = `999999`;
      const compareData: string = `999999`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07200
     * @tc.desc   modifyImageProperty('FlashpixVersion')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07200';
      const key = image.PropertyKey.FLASHPIX_VERSION
      const modifyData: string = `0101`;
      const compareData: string = `FlashPix Version 1.01`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07300
     * @tc.desc   modifyImageProperty('ColorSpace')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07300';
      const key = image.PropertyKey.COLOR_SPACE
      const modifyData: string = `2`;
      const compareData: string = `Adobe RGB`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07400
     * @tc.desc   modifyImageProperty('RelatedSoundFile')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07400';
      const key = image.PropertyKey.RELATED_SOUND_FILE
      const modifyData: string = `abc`;
      const compareData: string = `abc`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07500
     * @tc.desc   modifyImageProperty('FlashEnergy')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07500';
      const key = image.PropertyKey.FLASH_ENERGY
      const modifyData: string = `5/2`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07600
     * @tc.desc   modifyImageProperty('SpatialFrequencyResponse')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07600';
      const key = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE
      const modifyData: string = `corn`;
      const compareData: string = `corn`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07700
     * @tc.desc   modifyImageProperty('FocalPlaneXResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07700';
      const key = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION
      const modifyData: string = `102/1`;
      const compareData: string = `102`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07800
     * @tc.desc   modifyImageProperty('FocalPlaneYResolution')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07800';
      const key = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION
      const modifyData: string = `81/1`;
      const compareData: string = `81`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07900
     * @tc.desc   modifyImageProperty('FocalPlaneResolutionUnit')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_07900';
      const key = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT
      const modifyData: string = `3`;
      const compareData: string = `Centimeter`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08000
     * @tc.desc   modifyImageProperty('SubjectLocation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08000';
      const key = image.PropertyKey.SUBJECT_LOCATION
      const modifyData: string = `23 112`;
      const compareData: string = `23, 112`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08100
     * @tc.desc   modifyImageProperty('ExposureIndex')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08100';
      const key = image.PropertyKey.EXPOSURE_INDEX
      const modifyData: string = `5/2`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08200
     * @tc.desc   modifyImageProperty('SensingMethod')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08200';
      const key = image.PropertyKey.SENSING_METHOD
      const modifyData: string = `8`;
      const compareData: string = `Color sequential linear sensor`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08300
     * @tc.desc   modifyImageProperty('FileSource')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08300';
      const key = image.PropertyKey.FILE_SOURCE
      const modifyData: string = `4`;
      const compareData: string = `Internal error (unknown value 4)`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08400
     * @tc.desc   modifyImageProperty('CFAPattern')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08400';
      const key = image.PropertyKey.CFA_PATTERN
      const modifyData: string = `ab`;
      const compareData: string = `2 bytes undefined data`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08500
     * @tc.desc   modifyImageProperty('CustomRendered')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08500';
      const key = image.PropertyKey.CUSTOM_RENDERED
      const modifyData: string = `1`;
      const compareData: string = `Custom process`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08600
     * @tc.desc   modifyImageProperty('ExposureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08600';
      const key = image.PropertyKey.EXPOSURE_MODE
      const modifyData: string = `2`;
      const compareData: string = `Auto bracket`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08700
     * @tc.desc   modifyImageProperty('DigitalZoomRatio')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08700';
      const key = image.PropertyKey.DIGITAL_ZOOM_RATIO
      const modifyData: string = `23/1`;
      const compareData: string = `23`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08800
     * @tc.desc   modifyImageProperty('SceneCaptureType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08800';
      const key = image.PropertyKey.SCENE_CAPTURE_TYPE
      const modifyData: string = `3`;
      const compareData: string = `Night scene`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08900
     * @tc.desc   modifyImageProperty('GainControl')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_08900';
      const key = image.PropertyKey.GAIN_CONTROL
      const modifyData: string = `4`;
      const compareData: string = `High gain down`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09000
     * @tc.desc   modifyImageProperty('Contrast')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09000';
      const key = image.PropertyKey.CONTRAST
      const modifyData: string = `2`;
      const compareData: string = `Hard`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09100
     * @tc.desc   modifyImageProperty('Saturation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09100';
      const key = image.PropertyKey.SATURATION
      const modifyData: string = `2`;
      const compareData: string = `High saturation`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09200
     * @tc.desc   modifyImageProperty('Sharpness')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09200';
      const key = image.PropertyKey.SHARPNESS
      const modifyData: string = `2`;
      const compareData: string = `Hard`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09300
     * @tc.desc   modifyImageProperty('DeviceSettingDescription')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09300';
      const key = image.PropertyKey.DEVICE_SETTING_DESCRIPTION
      const modifyData: string = `coxex`;
      const compareData: string = `coxex`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09400
     * @tc.desc   modifyImageProperty('SubjectDistanceRange')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09400';
      const key = image.PropertyKey.SUBJECT_DISTANCE_RANGE
      const modifyData: string = `3`;
      const compareData: string = `Distant view`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09500
     * @tc.desc   modifyImageProperty('ImageUniqueID')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09500';
      const key = image.PropertyKey.IMAGE_UNIQUE_ID
      const modifyData: string = `xxx`;
      const compareData: string = `xxx`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09600
     * @tc.desc   modifyImageProperty('GPSVersionID')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09600';
      const key = image.PropertyKey.GPS_VERSION_ID
      const modifyData: string = `2.2.0.1`;
      const compareData: string = `2.2.0.1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09700
     * @tc.desc   modifyImageProperty('GPSAltitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09700';
      const key = image.PropertyKey.GPS_ALTITUDE_REF
      const modifyData: string = `1`;
      const compareData: string = `Sea level reference`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09800
     * @tc.desc   modifyImageProperty('GPSAltitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09800';
      const key = image.PropertyKey.GPS_ALTITUDE
      const modifyData: string = `100/100`;
      const compareData: string = `1.00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09900
     * @tc.desc   modifyImageProperty('GPSSatellites')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_09900';
      const key = image.PropertyKey.GPS_SATELLITES
      const modifyData: string = `a b c`;
      const compareData: string = `a b c`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010000
     * @tc.desc   modifyImageProperty('GPSStatus')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010000';
      const key = image.PropertyKey.GPS_STATUS
      const modifyData: string = `V`;
      const compareData: string = `V`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010100
     * @tc.desc   modifyImageProperty('GPSMeasureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010100';
      const key = image.PropertyKey.GPS_MEASURE_MODE
      const modifyData: string = `3`;
      const compareData: string = `3`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010200
     * @tc.desc   modifyImageProperty('GPSDOP')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010200';
      const key = image.PropertyKey.GPS_DOP
      const modifyData: string = `100/100`;
      const compareData: string = `1.00`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010300
     * @tc.desc   modifyImageProperty('GPSSpeedRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010300';
      const key = image.PropertyKey.GPS_SPEED_REF
      const modifyData: string = `K`;
      const compareData: string = `K`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010400
     * @tc.desc   modifyImageProperty('GPSSpeed')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010400';
      const key = image.PropertyKey.GPS_SPEED
      const modifyData: string = `0/1`;
      const compareData: string = ` 0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010500
     * @tc.desc   modifyImageProperty('GPSTrackRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010500';
      const key = image.PropertyKey.GPS_TRACK_REF
      const modifyData: string = `M`;
      const compareData: string = `M`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010600
     * @tc.desc   modifyImageProperty('GPSTrack')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010600';
      const key = image.PropertyKey.GPS_TRACK
      const modifyData: string = `3.5`;
      const compareData: string = `3.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010700
     * @tc.desc   modifyImageProperty('GPSImgDirectionRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010700';
      const key = image.PropertyKey.GPS_IMG_DIRECTION_REF
      const modifyData: string = `T`;
      const compareData: string = `T`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010800
     * @tc.desc   modifyImageProperty('GPSImgDirection')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010800';
      const key = image.PropertyKey.GPS_IMG_DIRECTION
      const modifyData: string = `2.5`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010900
     * @tc.desc   modifyImageProperty('GPSMapDatum')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_010900';
      const key = image.PropertyKey.GPS_MAP_DATUM
      const modifyData: string = `%s\\0`;
      const compareData: string = `%s\\0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011000
     * @tc.desc   modifyImageProperty('GPSDestLatitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011000';
      const key = image.PropertyKey.GPS_DEST_LATITUDE_REF
      const modifyData: string = `S`;
      const compareData: string = `S`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011100
     * @tc.desc   modifyImageProperty('GPSDestLatitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011100';
      const key = image.PropertyKey.GPS_DEST_LATITUDE
      const modifyData: string = `0/1 0/1 0/1`;
      const compareData: string = ` 0,  0,  0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011200
     * @tc.desc   modifyImageProperty('GPSDestLongitudeRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011200';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE_REF
      const modifyData: string = `W`;
      const compareData: string = `W`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011300
     * @tc.desc   modifyImageProperty('GPSDestLongitude')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011300';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE
      const modifyData: string = `0/1 0/1 0/1`;
      const compareData: string = ` 0,  0,  0`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011400
     * @tc.desc   modifyImageProperty('GPSDestBearingRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011400';
      const key = image.PropertyKey.GPS_DEST_BEARING_REF
      const modifyData: string = `M`;
      const compareData: string = `M`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011500
     * @tc.desc   modifyImageProperty('GPSDestBearing')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011500';
      const key = image.PropertyKey.GPS_DEST_BEARING
      const modifyData: string = `2.5`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011600
     * @tc.desc   modifyImageProperty('GPSDestDistanceRef')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011600';
      const key = image.PropertyKey.GPS_DEST_DISTANCE_REF
      const modifyData: string = `K`;
      const compareData: string = `K`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011700
     * @tc.desc   modifyImageProperty('GPSDestDistance')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011700';
      const key = image.PropertyKey.GPS_DEST_DISTANCE
      const modifyData: string = `2.5`;
      const compareData: string = `2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011800
     * @tc.desc   modifyImageProperty('GPSProcessingMethod')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011800';
      const key = image.PropertyKey.GPS_PROCESSING_METHOD
      const modifyData: string = `XXX`;
      const compareData: string = `XXX`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011900
     * @tc.desc   modifyImageProperty('GPSAreaInformation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_011900';
      const key = image.PropertyKey.GPS_AREA_INFORMATION
      const modifyData: string = `client`;
      const compareData: string = `client`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012000
     * @tc.desc   modifyImageProperty('GPSDifferential')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012000';
      const key = image.PropertyKey.GPS_DIFFERENTIAL
      const modifyData: string = `1`;
      const compareData: string = `1`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012100
     * @tc.desc   modifyImageProperty('BodySerialNumber')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012100';
      const key = image.PropertyKey.BODY_SERIAL_NUMBER
      const modifyData: string = `xoinc`;
      const compareData: string = `xoinc`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012200
     * @tc.desc   modifyImageProperty('CameraOwnerName')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012200';
      const key = image.PropertyKey.CAMERA_OWNER_NAME
      const modifyData: string = `joseph`;
      const compareData: string = `joseph`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012300
     * @tc.desc   modifyImageProperty('CompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012300';
      const key = image.PropertyKey.COMPOSITE_IMAGE
      const modifyData: string = `3`;
      const compareData: string = `3`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012400
     * @tc.desc   modifyImageProperty('CompressedBitsPerPixel')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012400';
      const key = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL
      const modifyData: string = `25`;
      const compareData: string = `25`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012500
     * @tc.desc   modifyImageProperty('DNGVersion')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012500';
      const key = image.PropertyKey.DNG_VERSION
      const modifyData: string = `2 2 3 2`;
      const compareData: string = `2, 2, 3, 2`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012600
     * @tc.desc   modifyImageProperty('DefaultCropSize')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012600';
      const key = image.PropertyKey.DEFAULT_CROP_SIZE
      const modifyData: string = `123 654`;
      const compareData: string = `123, 654`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012700
     * @tc.desc   modifyImageProperty('Gamma')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012700';
      const key = image.PropertyKey.GAMMA
      const modifyData: string = `3/2`;
      const compareData: string = `1.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012800
     * @tc.desc   modifyImageProperty('ISOSpeedLatitudeyyy')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012800';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_YYY
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012900
     * @tc.desc   modifyImageProperty('ISOSpeedLatitudezzz')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_012900';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ
      const modifyData: string = `123`;
      const compareData: string = `123`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013000
     * @tc.desc   modifyImageProperty('LensMake')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013000';
      const key = image.PropertyKey.LENS_MAKE
      const modifyData: string = `plex`;
      const compareData: string = `plex`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013100
     * @tc.desc   modifyImageProperty('LensModel')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013100';
      const key = image.PropertyKey.LENS_MODEL
      const modifyData: string = `world`;
      const compareData: string = `world`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013200
     * @tc.desc   modifyImageProperty('LensSerialNumber')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013200';
      const key = image.PropertyKey.LENS_SERIAL_NUMBER
      const modifyData: string = `root`;
      const compareData: string = `root`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013300
     * @tc.desc   modifyImageProperty('LensSpecification')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013300';
      const key = image.PropertyKey.LENS_SPECIFICATION
      const modifyData: string = `3/4 5/2 3/2 5/2`;
      const compareData: string = `0.8, 2.5, 1.5, 2.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013400
     * @tc.desc   modifyImageProperty('NewSubfileType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013400';
      const key = image.PropertyKey.NEW_SUBFILE_TYPE
      const modifyData: string = `5`;
      const compareData: string = `5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013500
     * @tc.desc   modifyImageProperty('OffsetTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013500';
      const key = image.PropertyKey.OFFSET_TIME
      const modifyData: string = `2023:01:25`;
      const compareData: string = `2023:01:25`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013600
     * @tc.desc   modifyImageProperty('OffsetTimeDigitized')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013600';
      const key = image.PropertyKey.OFFSET_TIME_DIGITIZED
      const modifyData: string = `cirtize`;
      const compareData: string = `cirtize`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013700
     * @tc.desc   modifyImageProperty('OffsetTimeOriginal')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013700';
      const key = image.PropertyKey.OFFSET_TIME_ORIGINAL
      const modifyData: string = `ject`;
      const compareData: string = `ject`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013800
     * @tc.desc   modifyImageProperty('SourceExposureTimesOfCompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013800';
      const key = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
      const modifyData: string = `xixe`;
      const compareData: string = `xixe`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013900
     * @tc.desc   modifyImageProperty('SourceImageNumberOfCompositeImage')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_013900';
      const key = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
      const modifyData: string = `11 23`;
      const compareData: string = `11, 23`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014000
     * @tc.desc   modifyImageProperty('SubfileType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014000';
      const key = image.PropertyKey.SUBFILE_TYPE
      const modifyData: string = `3`;
      const compareData: string = `3`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014100
     * @tc.desc   modifyImageProperty('GPSHPositioningError')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014100';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const modifyData: string = `1/2`;
      const compareData: string = `0.5`;
      try {
        let result: boolean = true
        for(let i = 0; i <modfiyFileSuffixs.length; i++) {
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014200
     * @tc.desc   modifyImageProperty('PhotographicSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014200';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const modifyData: string = `65535`;
      const compareData: string = `65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014500
     * @tc.desc   modifyImageProperty('HwMnoteCaptureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014500';
      const key = image.PropertyKey.CAPTURE_MODE
      const modifyData: string = `123456789`;
      const compareData: string = `123456789`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0100
     * @tc.desc   modifyImageProperty('SubfileType')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0100';
      const key = image.PropertyKey.SUBFILE_TYPE
      const modifyData: string = `3`;
      const compareData: string = `3`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0200
     * @tc.desc   modifyImageProperty('GPSHPositioningError')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0200';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const modifyData: string = `1/2`;
      const compareData: string = `0.5`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0300
     * @tc.desc   modifyImageProperty('PhotographicSensitivity')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0300';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const modifyData: string = `65535`;
      const compareData: string = `65535`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0400
     * @tc.desc   modifyImageProperty('HwMnoteCaptureMode')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_URI_PROMISE_STATIC_0400';
      const key = image.PropertyKey.CAPTURE_MODE
      const modifyData: string = `123456789`;
      const compareData: string = `123456789`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0100
     * @tc.desc   modifyImageProperty('BitsPerSample', `8,8`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0100';
      const key = image.PropertyKey.BITS_PER_SAMPLE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "8,8", value: "65535, 65535, 65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "8,8", value: "65535, 65535, 65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "8,8", value: "65535, 65535, 65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "8,8", value: "65535, 65535, 65535"}]
      const expectedModifyErrorCode:int = 62980135
      try {
        let result: boolean = true
        for(let i = 0; i < values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0200
     * @tc.desc   modifyImageProperty('Orientation', `0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0200';
      const key = image.PropertyKey.ORIENTATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "0", value: "Left-bottom"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "0", value: "Left-bottom"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "0", value: "Left-bottom"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "0", value: "Left-bottom"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0300
     * @tc.desc   modifyImageProperty('ImageLength', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0300';
      const key = image.PropertyKey.IMAGE_LENGTH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "65535"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0400
     * @tc.desc   modifyImageProperty('ImageWidth', `@@@`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0400';
      const key = image.PropertyKey.IMAGE_WIDTH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "@@@", value: "65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "@@@", value: "65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "@@@", value: "65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "@@@", value: "65535"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0500
     * @tc.desc   modifyImageProperty('GPSLatitude', `abc,3`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0500';
      const key = image.PropertyKey.GPS_LATITUDE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc,3", value: "38.0,  0,  0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc,3", value: "38.0,  0,  0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc,3", value: "38.0,  0,  0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc,3", value: "38.0,  0,  0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0600
     * @tc.desc   modifyImageProperty('GPSLongitude', `12,a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0600';
      const key = image.PropertyKey.GPS_LONGITUDE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "12,a", value: "38.0,  0,  0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "12,a", value: "38.0,  0,  0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "12,a", value: "38.0,  0,  0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "12,a", value: "38.0,  0,  0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0700
     * @tc.desc   modifyImageProperty('GPSLatitudeRef', `W`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0700';
      const key = image.PropertyKey.GPS_LATITUDE_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "W", value: "S"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "W", value: "S"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "W", value: "S"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "W", value: "S"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0800
     * @tc.desc   modifyImageProperty('GPSLongitudeRef', `S`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0800';
      const key = image.PropertyKey.GPS_LONGITUDE_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "S", value: "W"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "S", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "S", value: "W"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "S", value: "W"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0900
     * @tc.desc   modifyImageProperty('PhotoMode', `05:61:34`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_0900';
      const key = image.PropertyKey.DATE_TIME_ORIGINAL
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "05:61:34", value: "1900:01:01 00:00:00"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "05:61:34", value: "1900:01:01 00:00:00"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "05:61:34", value: "1900:01:01 00:00:00"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "05:61:34", value: "1900:01:01 00:00:00"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01000
     * @tc.desc   modifyImageProperty('ExposureTime', `1/0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01000';
      const key = image.PropertyKey.EXPOSURE_TIME
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "1/0", value: "1/60 sec."},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "1/0", value: "1/60 sec."},
        {name: "png", fileName: "test_exif_v2.png", errorData: "1/0", value: "1/60 sec."},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "1/0", value: "1/60 sec."}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01200
     * @tc.desc   modifyImageProperty('ISOSpeedRatings', `-1`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01200';
      const key = image.PropertyKey.ISO_SPEED
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-1", value: "65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-1", value: "65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-1", value: "65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-1", value: "65535"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01300
     * @tc.desc   modifyImageProperty('FNumber', `1/0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01300';
      const key = image.PropertyKey.F_NUMBER
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "1/0", value: "f/0.03"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "1/0", value: "f/0.03"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "1/0", value: "f/0.03"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "1/0", value: "f/0.03"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01400
     * @tc.desc   modifyImageProperty('DateTime', `2024:13:01`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01400';
      const key = image.PropertyKey.DATE_TIME
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2024:13:01", value: "1900:01:01"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2024:13", value: "1900:01:01"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2024:13:01", value: "1900:01:01"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2024:13:01", value: "1900:01:01"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01500
     * @tc.desc   modifyImageProperty('GPSTimeStamp', `37/0,58/0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01500';
      const key = image.PropertyKey.GPS_TIME_STAMP
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "37/0,58/0", value: "12:54:20.00"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "37/0,58/0", value: "12:54:20.00"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "37/0,58/0", value: "12:54:20.00"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "37/0,58/0", value: "12:54:20.00"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01600
     * @tc.desc   modifyImageProperty('GPSDateStamp', `2023:01`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_01600';
      const key = image.PropertyKey.GPS_DATE_STAMP
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2023:01", value: "1900:01:01"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2023:01", value: "1900:01:01"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2023:01", value: "1900:01:01"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2023:01", value: "1900:01:01"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02000
     * @tc.desc   modifyImageProperty('PhotoMode', `Unknown`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02000';
      const key = image.PropertyKey.PHOTO_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "Unknown", value: "13"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "Unknown", value: "13"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "Unknown", value: "13"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "Unknown", value: "13"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02100
     * @tc.desc   modifyImageProperty('SensitivityType', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02100';
      const key = image.PropertyKey.SENSITIVITY_TYPE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "Unknown"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "Unknown"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "Unknown"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "Unknown"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02200
     * @tc.desc   modifyImageProperty('StandardOutputSensitivity', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02200';
      const key = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "1000"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "1000"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "1000"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "1000"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02300
     * @tc.desc   modifyImageProperty('RecommendedExposureIndex', `-123`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02300';
      const key = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-123", value: "2147483647"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-123", value: "2147483647"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-123", value: "2147483647"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-123", value: "2147483647"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02400
     * @tc.desc   modifyImageProperty('ApertureValue', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02400';
      const key = image.PropertyKey.APERTURE_VALUE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "16.00 EV (f/256.0)"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "16.00 EV (f/256.0)"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "16.00 EV (f/256.0)"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "16.00 EV (f/256.0)"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02500
     * @tc.desc   modifyImageProperty('ExposureBiasValue', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02500';
      const key = image.PropertyKey.EXPOSURE_BIAS_VALUE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "4.00 EV"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "4.00 EV"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "4.00 EV"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "4.00 EV"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02600
     * @tc.desc   modifyImageProperty('MeteringMode', `256`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02600';
      const key = image.PropertyKey.METERING_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "256", value: "Unknown"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "256", value: "Unknown"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "256", value: "Unknown"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "256", value: "Unknown"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02700
     * @tc.desc   modifyImageProperty('LightSource', `256`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02700';
      const key = image.PropertyKey.LIGHT_SOURCE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "256", value: "Fluorescent"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "256", value: "Fluorescent"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "256", value: "Fluorescent"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "256", value: "Fluorescent"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02800
     * @tc.desc   modifyImageProperty('Flash', `999`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02800';
      const key = image.PropertyKey.FLASH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "999",
          value: "Flash fired, auto mode, return light detected, red-eye reduction mode"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "999",
          value: "Flash fired, auto mode, return light detected, red-eye reduction mode"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "999",
          value: "Flash fired, auto mode, return light detected, red-eye reduction mode"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "999",
          value: "Flash fired, auto mode, return light detected, red-eye reduction mode"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02900
     * @tc.desc   modifyImageProperty('FocalLength', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_02900';
      const key = image.PropertyKey.FOCAL_LENGTH
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "31.0 mm"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "31.0 mm"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "31.0 mm"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "31.0 mm"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03100
     * @tc.desc   modifyImageProperty('PixelXDimension', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03100';
      const key = image.PropertyKey.PIXEL_X_DIMENSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03200
     * @tc.desc   modifyImageProperty('PixelYDimension', `!!!`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03200';
      const key = image.PropertyKey.PIXEL_Y_DIMENSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "!!!", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "!!!", value: "0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "!!!", value: "0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "!!!", value: "0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03300
     * @tc.desc   modifyImageProperty('WhiteBalance', `2`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03300';
      const key = image.PropertyKey.WHITE_BALANCE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2", value: "Auto white balance"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2", value: "Auto white balance"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2", value: "Auto white balance"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2", value: "Auto white balance"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03400
     * @tc.desc   modifyImageProperty('FocalLengthIn35mmFilm', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03400';
      const key = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "12"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "12"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "12"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "12"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03500
     * @tc.desc   modifyImageProperty('Compression', `11`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03500';
      const key = image.PropertyKey.COMPRESSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "11", value: "PackBits compression"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "11", value: "PackBits compression"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "11", value: "PackBits compression"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "11", value: "PackBits compression"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03600
     * @tc.desc   modifyImageProperty('PhotometricInterpretation', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03600';
      const key = image.PropertyKey.PHOTOMETRIC_INTERPRETATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "Normal mono"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "Normal mono"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "Normal mono"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "Normal mono"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03700
     * @tc.desc   modifyImageProperty('StripOffsets', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03700';
      const key = image.PropertyKey.STRIP_OFFSETS
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "456"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "456"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "456"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "456"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03800
     * @tc.desc   modifyImageProperty('SamplesPerPixel', `-1`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03800';
      const key = image.PropertyKey.SAMPLES_PER_PIXEL
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-1", value: "65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-1", value: "65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-1", value: "65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-1", value: "65535"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03900
     * @tc.desc   modifyImageProperty('RowsPerStrip', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_03900';
      const key = image.PropertyKey.ROWS_PER_STRIP
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "345"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "345"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "345"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "345"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04000
     * @tc.desc   modifyImageProperty('StripByteCounts', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04000';
      const key = image.PropertyKey.STRIP_BYTE_COUNTS
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "345"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "345"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "345"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "345"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04100
     * @tc.desc   modifyImageProperty('XResolution', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04100';
      const key = image.PropertyKey.X_RESOLUTION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "31"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "31"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "31"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "31"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04200
     * @tc.desc   modifyImageProperty('YResolution', `b`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04200';
      const key = image.PropertyKey.Y_RESOLUTION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "b", value: "31"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "b", value: "31"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "b", value: "31"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "b", value: "31"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04300
     * @tc.desc   modifyImageProperty('PlanarConfiguration', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04300';
      const key = image.PropertyKey.PLANAR_CONFIGURATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "Planar format"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "Planar format"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "Planar format"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "Planar format"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04400
     * @tc.desc   modifyImageProperty('ResolutionUnit', `4`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04400';
      const key = image.PropertyKey.RESOLUTION_UNIT
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "4", value: "Centimeter"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "4", value: "Centimeter"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "4", value: "Centimeter"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "4", value: "Centimeter"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04800
     * @tc.desc   modifyImageProperty('WhitePoint', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04800';
      const key = image.PropertyKey.WHITE_POINT
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "31, 0/0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "31, 0/0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "31, 0/0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "31, 0/0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04900
     * @tc.desc   modifyImageProperty('PrimaryChromaticities', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_04900';
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "31"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "31"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "31"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "31"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05000
     * @tc.desc   modifyImageProperty('YCbCrCoefficients', `123,345`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05000';
      const key = image.PropertyKey.YCBCR_COEFFICIENTS
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "123,345", value: "1.5, 2.0, 3.0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "123,345", value: "1.5, 2.0, 3.0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "123,345", value: "1.5, 2.0, 3.0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "123,345", value: "1.5, 2.0, 3.0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05100
     * @tc.desc   modifyImageProperty('YCbCrSubSampling', `4`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05100';
      const key = image.PropertyKey.YCBCR_SUB_SAMPLING
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "4", value: "4, 5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "4", value: "4, 5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "4", value: "4, 5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "4", value: "4, 5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05200
     * @tc.desc   modifyImageProperty('YCbCrPositioning', `3`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05200';
      const key = image.PropertyKey.YCBCR_POSITIONING
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "3", value: "Co-sited"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "3", value: "Co-sited"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "3", value: "Co-sited"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "3", value: "Co-sited"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05300
     * @tc.desc   modifyImageProperty('ReferenceBlackWhite', `undefined`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05300';
      const key = image.PropertyKey.REFERENCE_BLACK_WHITE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "undefined", value: " 3, 255,  0, 255,  0, 255"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "undefined", value: " 3, 255,  0, 255,  0, 255"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "undefined", value: " 3, 255,  0, 255,  0, 255"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "undefined", value: " 3, 255,  0, 255,  0, 255"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05700
     * @tc.desc   modifyImageProperty('ExposureProgram', `-1`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_05700';
      const key = image.PropertyKey.EXPOSURE_PROGRAM
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-1",
          value: "Landscape mode (for landscape photos with the background in focus)"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-1",
          value: "Landscape mode (for landscape photos with the background in focus)"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-1",
          value: "Landscape mode (for landscape photos with the background in focus)"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-1",
          value: "Landscape mode (for landscape photos with the background in focus)"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06000
     * @tc.desc   modifyImageProperty('ExifVersion', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06000';
      const key = image.PropertyKey.EXIF_VERSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "Exif Version 1.2"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "Exif Version 1.2"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "Exif Version 1.2"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "Exif Version 1.2"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06100
     * @tc.desc   modifyImageProperty('DateTimeDigitized', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06100';
      const key = image.PropertyKey.DATE_TIME_DIGITIZED
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "1900:01:01 00:00:00"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "1900:01:01 00:00:00"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "1900:01:01 00:00:00"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "1900:01:01 00:00:00"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06200
     * @tc.desc   modifyImageProperty('ComponentsConfiguration', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06200';
      const key = image.PropertyKey.COMPONENTS_CONFIGURATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "Y Cb G B"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "Y Cb G B"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "Y Cb G B"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "Y Cb G B"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06300
     * @tc.desc   modifyImageProperty('ShutterSpeedValue', `0/0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06300';
      const key = image.PropertyKey.SHUTTER_SPEED
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "0/0", value: "1.50 EV (1/3 sec.)"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "0/0", value: "1.50 EV (1/3 sec.)"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "0/0", value: "1.50 EV (1/3 sec.)"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "0/0", value: "1.50 EV (1/3 sec.)"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06400
     * @tc.desc   modifyImageProperty('BrightnessValue', `12000000/0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06400';
      const key = image.PropertyKey.BRIGHTNESS_VALUE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "12000000/0", value: "1.20 EV (7.87 cd/m^2)"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "12000000/0", value: "1.20 EV (7.87 cd/m^2)"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "12000000/0", value: "1.20 EV (7.87 cd/m^2)"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "12000000/0", value: "1.20 EV (7.87 cd/m^2)"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06500
     * @tc.desc   modifyImageProperty('MaxApertureValue', `-1/0`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06500';
      const key = image.PropertyKey.MAX_APERTURE_VALUE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-1/0", value: "1.60 EV (f/1.7)"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-1/0", value: "1.60 EV (f/1.7)"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-1/0", value: "1.60 EV (f/1.7)"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-1/0", value: "1.60 EV (f/1.7)"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06600
     * @tc.desc   modifyImageProperty('SubjectDistance', `meter`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06600';
      const key = image.PropertyKey.SUBJECT_DISTANCE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "meter", value: "0.5 m"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "meter", value: "0.5 m"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "meter", value: "0.5 m"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "meter", value: "0.5 m"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06700
     * @tc.desc   modifyImageProperty('SubjectArea', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_06700';
      const key = image.PropertyKey.SUBJECT_AREA
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "(x,y) = (45,23)"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "(x,y) = (45,23)"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "(x,y) = (45,23)"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "(x,y) = (45,23)"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07200
     * @tc.desc   modifyImageProperty('FlashpixVersion', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07200';
      const key = image.PropertyKey.FLASHPIX_VERSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "FlashPix Version 1.01"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "FlashPix Version 1.01"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "FlashPix Version 1.01"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "FlashPix Version 1.01"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07300
     * @tc.desc   modifyImageProperty('ColorSpace', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07300';
      const key = image.PropertyKey.COLOR_SPACE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "Adobe RGB"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "Adobe RGB"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "Adobe RGB"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "Adobe RGB"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07500
     * @tc.desc   modifyImageProperty('FlashEnergy', `华为`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07500';
      const key = image.PropertyKey.FLASH_ENERGY
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "华为", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "华为", value: "2.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "华为", value: "2.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "华为", value: "2.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07700
     * @tc.desc   modifyImageProperty('FocalPlaneXResolution', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07700';
      const key = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "102"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "102"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "102"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "102"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07800
     * @tc.desc   modifyImageProperty('FocalPlaneYResolution', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07800';
      const key = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "81"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "81"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "81"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "81"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07900
     * @tc.desc   modifyImageProperty('FocalPlaneResolutionUnit', `255`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_07900';
      const key = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "255", value: "Centimeter"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "255", value: "Centimeter"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "255", value: "Centimeter"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "255", value: "Centimeter"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08000
     * @tc.desc   modifyImageProperty('SubjectLocation', `beijing`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08000';
      const key = image.PropertyKey.SUBJECT_LOCATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "beijing", value: "23, 112"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "beijing", value: "23, 112"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "beijing", value: "23, 112"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "beijing", value: "23, 112"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08100
     * @tc.desc   modifyImageProperty('ExposureIndex', `-1/1`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08100';
      const key = image.PropertyKey.EXPOSURE_INDEX
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-1/1", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-1/1", value: "2.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-1/1", value: "2.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-1/1", value: "2.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08200
     * @tc.desc   modifyImageProperty('SensingMethod', `9`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08200';
      const key = image.PropertyKey.SENSING_METHOD
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "9", value: "Color sequential linear sensor"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "9", value: "Color sequential linear sensor"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "9", value: "Color sequential linear sensor"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "9", value: "Color sequential linear sensor"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08500
     * @tc.desc   modifyImageProperty('CustomRendered', `2`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08500';
      const key = image.PropertyKey.CUSTOM_RENDERED
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2", value: "Custom process"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2", value: "Custom process"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2", value: "Custom process"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2", value: "Custom process"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08600
     * @tc.desc   modifyImageProperty('ExposureMode', `3`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08600';
      const key = image.PropertyKey.EXPOSURE_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "3", value: "Auto bracket"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "3", value: "Auto bracket"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "3", value: "Auto bracket"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "3", value: "Auto bracket"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08700
     * @tc.desc   modifyImageProperty('DigitalZoomRatio', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08700';
      const key = image.PropertyKey.DIGITAL_ZOOM_RATIO
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "23"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "23"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "23"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "23"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08800
     * @tc.desc   modifyImageProperty('SceneCaptureType', `4`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08800';
      const key = image.PropertyKey.SCENE_CAPTURE_TYPE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "4", value: "Night scene"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "4", value: "Night scene"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "4", value: "Night scene"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "4", value: "Night scene"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08900
     * @tc.desc   modifyImageProperty('GainControl', `5`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_08900';
      const key = image.PropertyKey.GAIN_CONTROL
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "5", value: "High gain down"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "5", value: "High gain down"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "5", value: "High gain down"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "5", value: "High gain down"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09000
     * @tc.desc   modifyImageProperty('Contrast', `3`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09000';
      const key = image.PropertyKey.CONTRAST
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "3", value: "Hard"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "3", value: "Hard"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "3", value: "Hard"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "3", value: "Hard"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09100
     * @tc.desc   modifyImageProperty('Saturation', `65536`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09100';
      const key = image.PropertyKey.SATURATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "65536", value: "High saturation"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "65536", value: "High saturation"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "65536", value: "High saturation"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "65536", value: "High saturation"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09200
     * @tc.desc   modifyImageProperty('Sharpness', `65535`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09200';
      const key = image.PropertyKey.SHARPNESS
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "65535", value: "Hard"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "65535", value: "Hard"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "65535", value: "Hard"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "65535", value: "Hard"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09400
     * @tc.desc   modifyImageProperty('SubjectDistanceRange', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09400';
      const key = image.PropertyKey.SUBJECT_DISTANCE_RANGE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "Distant view"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "Distant view"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "Distant view"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "Distant view"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09600
     * @tc.desc   modifyImageProperty('GPSVersionID', `23`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09600';
      const key = image.PropertyKey.GPS_VERSION_ID
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "23", value: "2.2.0.1"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "23", value: "2.2.0.1"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "23", value: "2.2.0.1"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "23", value: "2.2.0.1"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09700
     * @tc.desc   modifyImageProperty('GPSAltitudeRef', `2`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09700';
      const key = image.PropertyKey.GPS_ALTITUDE_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2", value: "Sea level reference"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2", value: "Sea level reference"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2", value: "Sea level reference"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2", value: "Sea level reference"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09800
     * @tc.desc   modifyImageProperty('GPSAltitude', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_09800';
      const key = image.PropertyKey.GPS_ALTITUDE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: "1.00"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: "1.00"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: "1.00"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: "1.00"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010000
     * @tc.desc   modifyImageProperty('GPSStatus', `C`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010000';
      const key = image.PropertyKey.GPS_STATUS
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "C", value: "V"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "C", value: "V"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "C", value: "V"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "C", value: "V"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010100
     * @tc.desc   modifyImageProperty('GPSMeasureMode', `4`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010100';
      const key = image.PropertyKey.GPS_MEASURE_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "4", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "4", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "4", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "4", value: "3"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010200
     * @tc.desc   modifyImageProperty('GPSDOP', `-1`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010200';
      const key = image.PropertyKey.GPS_DOP
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "-1", value: "1.00"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "-1", value: "1.00"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "-1", value: "1.00"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "-1", value: "1.00"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010300
     * @tc.desc   modifyImageProperty('GPSSpeedRef', `AA`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010300';
      const key = image.PropertyKey.GPS_SPEED_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "AA", value: "K"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "AA", value: "K"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "AA", value: "K"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "AA", value: "K"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010400
     * @tc.desc   modifyImageProperty('GPSSpeed', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010400';
      const key = image.PropertyKey.GPS_SPEED
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: " 0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: " 0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: " 0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010500
     * @tc.desc   modifyImageProperty('GPSTrackRef', `C`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010500';
      const key = image.PropertyKey.GPS_TRACK_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "C", value: "M"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "666", value: "M"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "C", value: "M"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "C", value: "M"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010600
     * @tc.desc   modifyImageProperty('GPSTrack', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010600';
      const key = image.PropertyKey.GPS_TRACK
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "3.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "3.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "3.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "3.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010700
     * @tc.desc   modifyImageProperty('GPSImgDirectionRef', `C`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010700';
      const key = image.PropertyKey.GPS_IMG_DIRECTION_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "C", value: "T"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "C", value: "T"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "C", value: "T"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "C", value: "T"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010800
     * @tc.desc   modifyImageProperty('GPSImgDirection', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_010800';
      const key = image.PropertyKey.GPS_IMG_DIRECTION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "2.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "2.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "2.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011000
     * @tc.desc   modifyImageProperty('GPSDestLatitudeRef', `W`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011000';
      const key = image.PropertyKey.GPS_DEST_LATITUDE_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "W", value: "S"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "W", value: "S"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "W", value: "S"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "W", value: "S"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011100
     * @tc.desc   modifyImageProperty('GPSDestLatitude', `abc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011100';
      const key = image.PropertyKey.GPS_DEST_LATITUDE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "abc", value: " 0,  0,  0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "abc", value: " 0,  0,  0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "abc", value: " 0,  0,  0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "abc", value: " 0,  0,  0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011200
     * @tc.desc   modifyImageProperty('GPSDestLongitudeRef', `S`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011200';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "S", value: "W"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "S", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "S", value: "W"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "S", value: "W"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011300
     * @tc.desc   modifyImageProperty('GPSDestLongitude', `none`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011300';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "none", value: " 0,  0,  0"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "none", value: " 0,  0,  0"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "none", value: " 0,  0,  0"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "none", value: " 0,  0,  0"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011500
     * @tc.desc   modifyImageProperty('GPSDestBearing', `x`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011500';
      const key = image.PropertyKey.GPS_DEST_BEARING
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "x", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "x", value: "2.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "x", value: "2.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "x", value: "2.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011600
     * @tc.desc   modifyImageProperty('GPSDestDistanceRef', `C`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011600';
      const key = image.PropertyKey.GPS_DEST_DISTANCE_REF
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "C", value: "K"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "C", value: "K"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "C", value: "K"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "C", value: "K"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011700
     * @tc.desc   modifyImageProperty('GPSDestDistance', `B`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_011700';
      const key = image.PropertyKey.GPS_DEST_DISTANCE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "B", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "B", value: "2.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "B", value: "2.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "B", value: "2.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012000
     * @tc.desc   modifyImageProperty('GPSDifferential', `4`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012000';
      const key = image.PropertyKey.GPS_DIFFERENTIAL
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "4", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "4", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "4", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "4", value: "1"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012300
     * @tc.desc   modifyImageProperty('CompositeImage', `5`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012300';
      const key = image.PropertyKey.COMPOSITE_IMAGE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "5", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "5", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "5", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "5", value: "3"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012400
     * @tc.desc   modifyImageProperty('CompressedBitsPerPixel', `diry`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012400';
      const key = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "diry", value: "25"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "diry", value: "25"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "diry", value: "25"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "diry", value: "25"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012500
     * @tc.desc   modifyImageProperty('DNGVersion', `2 3`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012500';
      const key = image.PropertyKey.DNG_VERSION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2 3", value: "2, 2, 3, 2"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2 3", value: "2, 2, 3, 2"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2 3", value: "2, 2, 3, 2"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2 3", value: "2, 2, 3, 2"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012600
     * @tc.desc   modifyImageProperty('DefaultCropSize', `hi xic`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012600';
      const key = image.PropertyKey.DEFAULT_CROP_SIZE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "hi xic", value: "123, 654"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "hi xic", value: "123, 654"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "hi xic", value: "123, 654"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "hi xic", value: "123, 654"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012700
     * @tc.desc   modifyImageProperty('Gamma', `rat`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012700';
      const key = image.PropertyKey.GAMMA
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "rat", value: "1.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "rat", value: "1.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "rat", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "rat", value: "1.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012800
     * @tc.desc   modifyImageProperty('ISOSpeedLatitudeyyy', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012800';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_YYY
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "123"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "123"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012900
     * @tc.desc   modifyImageProperty('ISOSpeedLatitudezzz', `bc`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_012900';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "bc", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "bc", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "bc", value: "123"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "bc", value: "123"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013300
     * @tc.desc   modifyImageProperty('LensSpecification', `a b c`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013300';
      const key = image.PropertyKey.LENS_SPECIFICATION
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a b c", value: "0.8, 2.5, 1.5, 2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a b c", value: "0.8, 2.5, 1.5, 2.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a b c", value: "0.8, 2.5, 1.5, 2.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a b c", value: "0.8, 2.5, 1.5, 2.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013400
     * @tc.desc   modifyImageProperty('NewSubfileType', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013400';
      const key = image.PropertyKey.NEW_SUBFILE_TYPE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013500
     * @tc.desc   modifyImageProperty('OffsetTime', `2023:01`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013500';
      const key = image.PropertyKey.OFFSET_TIME
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "2023:01", value: "2023:01:25"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "2023:01", value: "2023:01:25"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "2023:01", value: "2023:01:25"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "2023:01", value: "2023:01:25"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013900
     * @tc.desc   modifyImageProperty('SourceImageNumberOfCompositeImage', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_013900';
      const key = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "11, 23"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "11, 23"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "11, 23"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "11, 23"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014000
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014000
     * @tc.desc   modifyImageProperty('SubfileType', `5`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014000';
      const key = image.PropertyKey.SUBFILE_TYPE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "5", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "5", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "5", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "5", value: "3"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014100
     * @tc.desc   modifyImageProperty('GPSHPositioningError', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014100';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "0.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "0.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "0.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "0.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014200
     * @tc.desc   modifyImageProperty('PhotographicSensitivity', `华为`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014200';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "华为", value: "65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "华为", value: "65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "华为", value: "65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "华为", value: "65535"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014500
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014500
     * @tc.desc   modifyImageProperty('HwMnoteCaptureMode', `á`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014500';
      const key = image.PropertyKey.CAPTURE_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "á", value: "123456789"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "á", value: "123456789"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "á", value: "123456789"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "á", value: "123456789"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0100
     * @tc.desc   modifyImageProperty('SubfileType', `5`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0100';
      const key = image.PropertyKey.SUBFILE_TYPE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "5", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "5", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "5", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "5", value: "3"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "uri");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0200
     * @tc.desc   modifyImageProperty('GPSHPositioningError', `a`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0200';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "a", value: "0.5"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "a", value: "0.5"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "a", value: "0.5"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "a", value: "0.5"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "uri");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0300
     * @tc.desc   modifyImageProperty('PhotographicSensitivity', `华为`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0300';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "华为", value: "65535"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "华为", value: "65535"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "华为", value: "65535"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "华为", value: "65535"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "uri");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0400
     * @tc.desc   modifyImageProperty('HwMnoteCaptureMode', `á`)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_URI_ERROR_STATIC_0400';
      const key = image.PropertyKey.CAPTURE_MODE
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "á", value: "123456789"},
        {name: "png", fileName: "test_exif_v2.png", errorData: "á", value: "123456789"},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "á", value: "123456789"},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "á", value: "123456789"}]
      const expectedModifyErrorCode = 62980135
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testModifyPromiseError(testTag, key,
            values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode, "uri");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_ERROR_STATIC_0100
     * @tc.desc   getImageProperty('BitsPerSample')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_ERROR_STATIC_0100';
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const expectedGetErrorCode = 62980123
      try {
        const fileList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg"},
          {name: "png", fileName: "test_exif_empty_2.png"},
          {name: "heif", fileName: "test_exif_empty_2.heic"},
          {name: "webp", fileName: "test_exif_empty2.webp"},
          {name: "dng", fileName: "test_exif_empty2.dng"}
        ]
        let result = true
        const createImageSourceTypes = ["fd", "uri", "buffer"]
        for(let k=0; k<createImageSourceTypes.length; k++){
          for(let i=0; i<fileList.length; i++){
            const testType = createImageSourceTypes[k]
            const checkResult = await testGetPromiseError(testTag, key, expectedGetErrorCode,
              fileList[i].fileName, testType)
            result = checkResult && result
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty promise error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014600
     * @tc.desc   getImageProperty('HwMnoteFaceMouthCenter')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014600';
      const key = image.PropertyKey.FACE_MOUTH_CENTER;
      const expectedModifyErrorCode = 62980146
      try {
        const values:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "987654321", value: '1 2 3 4 5 6 7 8'},
          {name: "png", fileName: "test_exif_v2.png", errorData: "987654321", value: '1 2 3 4 5 6 7 8'},
          {name: "heif", fileName: "test_exif_v2.heic", errorData: "987654321", value: '1 2 3 4 5 6 7 8'},
          {name: "webp", fileName: "test_exif_v2.webp", errorData: "987654321", value: '1 2 3 4 5 6 7 8'}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        for(let k=0; k<createImageSourceTypes.length; k++){
          for(let i=0; i<values.length; i++){
            const checkResult = await testModifyPromiseError(testTag, key,
              values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode,
              createImageSourceTypes[k]);
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014700
     * @tc.desc   getImageProperty('HwMnoteFaceMouthCenter')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014700';
      const key = image.PropertyKey.FACE_MOUTH_CENTER;
      const expectedModifyErrorCode = 62980146
      try {
        const values:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg", errorData: "987654321", value: 'default_exif_value'},
          {name: "png", fileName: "test_exif_empty_2.png", errorData: "987654321", value: 'default_exif_value'},
          {name: "heif", fileName: "test_exif_empty_2.heic", errorData: "987654321", value: 'default_exif_value'},
          {name: "webp", fileName: "test_exif_empty2.webp", errorData: "987654321", value: 'default_exif_value'}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for(let i=0; i<values.length; i++){
            const checkResult = await testModifyPromiseError(testTag, key,
              values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode,
              createImageSourceTypes[k]);
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014800
     * @tc.desc   getImageProperty('MakerNote')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014800';
      const key = image.PropertyKey.MAKER_NOTE;
      const expectedModifyErrorCode = 62980146
      const expectedGetErrorCode = 62980123
      try {
        const values:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg"},
          {name: "png", fileName: "test_exif_empty_2.png"},
          {name: "heif", fileName: "test_exif_empty_2.heic"},
          {name: "webp", fileName: "test_exif_empty2.webp"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < values.length; i++) {
            let checkResult = false
            const testType = createImageSourceTypes[k]
            const imageSourceApi = await getImageSource(values[i].fileName, testType)
            if (imageSourceApi == undefined) {
              console.info(testTag + " create image source failed");
              expect().assertFail();
              done();
            } else {
              try {
                await imageSourceApi.modifyImageProperty(key, 'abc');
                hilog.info(0x0000, testTag, `modifyImageProperty promise success %{public}s %{public}s %{public}s`, key,testType);
                checkResult = true
                if (imageSourceApi != undefined) {
                  await imageSourceApi.release();
                }
                done();
              } catch (error: BusinessError) {
                hilog.info(0x0000, testTag, `modifyImageProperty promise failed %{public}s %{public}s %{public}s`, key, error.code, '62980146',testType);
                checkResult = false
                expect(false).assertTrue();
                if (imageSourceApi != undefined) {
                  await imageSourceApi.release();
                }
                done();
              }
            }
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error MakerNote ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014900
     * @tc.desc   getImageProperty('BitsPerSample')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_ERROR_STATIC_014900';
      const key = image.PropertyKey.BITS_PER_SAMPLE
      const expectedModifyErrorCode = 62980135
      try {
        const values:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "", value: '65535, 65535, 65535'},
          {name: "png", fileName: "test_exif_v2.png", errorData: "", value: '65535, 65535, 65535'},
          {name: "heif", fileName: "test_exif_v2.heic", errorData: "", value: '65535, 65535, 65535'},
          {name: "webp", fileName: "test_exif_v2.webp", errorData: "", value: '65535, 65535, 65535'}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        for(let k=0; k<createImageSourceTypes.length; k++){
          for(let i=0; i<values.length; i++){
            const checkResult = await testModifyPromiseError(testTag, key,
              values[i].errorData, values[i].value, values[i].fileName, expectedModifyErrorCode,
              createImageSourceTypes[k]);
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014600
     * @tc.desc   getImageProperty('LightSource')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014600';
      const key = image.PropertyKey.LIGHT_SOURCE;
      try {
        let result = true
        const modifyData = '1'
        const compareData = 'Daylight'
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014700
     * @tc.desc   getImageProperty('Orientation')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014700';
      const key = image.PropertyKey.ORIENTATION;
      try {
        const writes:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg"}, {name: "png", fileName: "test_exif_empty_2.png"},
          {name: "heif", fileName: "test_exif_empty_2.heic"}, {name: "webp", fileName: "test_exif_empty2.webp"}]
        const reads:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg"}, {name: "png", fileName: "test_exif_v2.png"},
          {name: "heif", fileName: "test_exif_v2.heic"}, {name: "webp", fileName: "test_exif_v2.webp"}]
        let result = true
        for(let i=0; i<reads.length; i++) {
          let checkResult = false
          getFd(reads[i].fileName);
          const imageSourceApi = image.createImageSource(fdNumber);
          fs.closeSync(fdNumber) // getFd open fd，创建ImageSource后，close fd。
          if (imageSourceApi == undefined) {
            console.info(testTag + " create image source failed");
          } else {
            const readValue = await imageSourceApi.getImageProperty(key)
            getFd(writes[i].fileName)
            const imageSourceApiWrite = image.createImageSource(fdNumber);
            fs.closeSync(fdNumber) // getFd open fd，创建ImageSource后，close fd。
            if (imageSourceApiWrite != undefined) {
              await imageSourceApiWrite.modifyImageProperty(key, readValue)
              const reReadValue = await imageSourceApiWrite.getImageProperty(key)
              checkResult = reReadValue == readValue
            } else {
              checkResult = false
            }
          }
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100';
      try {
        let valueDng: Record<string, string | null> = getCompareData("Top-left", "192", "256");
        let value: Record<string, string | null> = getCompareData("Left-bottom", "65535", "65535");
        let rawfileValue: Record<string, string | null> = getCompareData("Top-left", "0", "0");
        let rawfileValueWebp: Record<string, string | null> = getCompareData("Top-right", "4608", "3456");

        const filesList: Array<picTypeValue2> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg", value: value, initValue: rawfileValue},
          {name: "png", fileName: "test_exif_v2.png", value: value, initValue: rawfileValue},
          {name: "heif", fileName: "test_exif_v2.heic", value: value, initValue: rawfileValue},
          {name: "webp", fileName: "test_exif_v2.webp", value: value, initValue: rawfileValueWebp},
          {name: "dng", fileName: "test_exif_v2.dng", value: valueDng, initValue: valueDng}]
        let result = true
        const createImageSourceTypes = ["fd", "uri", "buffer", "rawfile"]
        const keys = [image.PropertyKey.ORIENTATION, image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            let compareData = filesList[i].value
            if(testType === "rawfile"){
              compareData = filesList[i].initValue
            }
            const fileName = filesList[i].fileName
            console.info(testTag + "testGetImageProperties fileName: " + fileName);
            const checkResult = await testGetImageProperties(testTag, keys, compareData, fileName, testType)
            result = result && checkResult
            console.info(testTag + "testGetImageProperties result: " + result);
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperties error ` +  JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0200
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0200';
      try {
        const filesList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v3.jpg"},
          {name: "png", fileName: "test_exif_v3.png"},
          {name: "heif", fileName: "test_exif_v3.heic"},
          {name: "webp", fileName: "test_exif_v3.webp"},
          {name: "dng", fileName: "test_exif_v3.dng"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri", "buffer", "rawfile"]
        const expectedErrorCode = 62980096
        const keys = [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testGetImagePropertiesError(testTag, keys, expectedErrorCode,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e: BusinessError) {
        hilog.info(0x0000, testTag, `getImageProperties error ` + e.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0500
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0500';
      try {
        const filesList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg"},
          {name: "png", fileName: "test_exif_empty_2.png"},
          {name: "heif", fileName: "test_exif_empty_2.heic"},
          {name: "webp", fileName: "test_exif_empty2.webp"},
          {name: "dng", fileName: "test_exif_empty2.dng"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri", "buffer", "rawfile"]
        const keys = [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH,
          image.PropertyKey.GPS_LATITUDE, image.PropertyKey.GPS_LONGITUDE, image.PropertyKey.GPS_LATITUDE_REF]
        const expectedErrorCode = 62980096
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testGetImagePropertiesError(testTag, keys, expectedErrorCode,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperties error ` + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0100';
      try {
        let records:Record<string, string | null> = {};
        records[image.PropertyKey.ORIENTATION as string] = "8";
        records[image.PropertyKey.IMAGE_LENGTH as string] = "65530";
        records[image.PropertyKey.IMAGE_WIDTH as string] = "65535";
        records[image.PropertyKey.GPS_LATITUDE as string] = "39,54,25.16513";
        records[image.PropertyKey.GPS_LONGITUDE as string] = "39,54,25.16513";

        const compareData: Record<string, string | null> = {};
        compareData[image.PropertyKey.ORIENTATION as string] = "Left-bottom";
        compareData[image.PropertyKey.IMAGE_LENGTH as string] = "65530";
        compareData[image.PropertyKey.IMAGE_WIDTH as string] = "65535";
        compareData[image.PropertyKey.GPS_LATITUDE as string] = "39, 54, 25.16513";
        compareData[image.PropertyKey.GPS_LONGITUDE as string] = "39, 54, 25.16513";
        const keys = [image.PropertyKey.ORIENTATION, image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH,
          image.PropertyKey.GPS_LATITUDE, image.PropertyKey.GPS_LONGITUDE]
        const filesList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg"},
          {name: "png", fileName: "test_exif_v2.png"},
          {name: "heif", fileName: "test_exif_v2.heic"},
          {name: "webp", fileName: "test_exif_v2.webp"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testModifyImageProperties(testTag, keys, records, compareData,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ` + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0200
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0200';
      try {
        let records: Record<string, string | null> = {};
        records[image.PropertyKey.IMAGE_LENGTH as string] = "65530";
        records[image.PropertyKey.IMAGE_WIDTH as string] = "65535";
        records[image.PropertyKey.GPS_LATITUDE as string] = "39,54,25.16513";
        records[image.PropertyKey.GPS_LONGITUDE as string] = "39,54,25.16513";

        const compareData: Record<string, string | null> = {};
        compareData[image.PropertyKey.IMAGE_LENGTH as string] = "65530";
        compareData[image.PropertyKey.IMAGE_WIDTH as string] = "65535";
        compareData[image.PropertyKey.GPS_LATITUDE as string] = "39, 54, 25.16513";
        compareData[image.PropertyKey.GPS_LONGITUDE as string] = "39, 54, 25.16513";
        const keys = [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH,
          image.PropertyKey.GPS_LATITUDE, image.PropertyKey.GPS_LONGITUDE]
        const filesList: Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v3.jpg"},
          {name: "png", fileName: "test_exif_v3.png"},
          {name: "heif", fileName: "test_exif_v3.heic"},
          {name: "webp", fileName: "test_exif_v3.webp"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testModifyImageProperties(testTag, keys, records, compareData,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ` +  JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0300
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0300';
      try {
        let records: Record<string, string | null> = {};
        records[image.PropertyKey.IMAGE_LENGTH as string] = "abc";
        records[image.PropertyKey.IMAGE_WIDTH as string] = "abc";

        const filesList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg"},
          {name: "png", fileName: "test_exif_v2.png"},
          {name: "heif", fileName: "test_exif_v2.heic"},
          {name: "webp", fileName: "test_exif_v2.webp"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        const expectedErrorCodes:int = 62980135
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testModifyImagePropertiesError(testTag, records, expectedErrorCodes,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ` + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0400
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0400';
      try {
        let records: Record<string, string | null> = {};
        records[image.PropertyKey.IMAGE_LENGTH as string] = "abc";
        records[image.PropertyKey.IMAGE_WIDTH as string] = "abc";

        const filesList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg"},
          {name: "png", fileName: "test_exif_empty_2.png"},
          {name: "heif", fileName: "test_exif_empty_2.heic"},
          {name: "webp", fileName: "test_exif_empty2.webp"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        const expectedErrorCodes:int = 62980135
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testModifyImagePropertiesError(testTag, records, expectedErrorCodes,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ` +  JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0700
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTIES_PROMISE_STATIC_0700';
      try {
        let records: Record<string, string | null> = {};
        records[image.PropertyKey.ORIENTATION as string] = "8";
        records[image.PropertyKey.IMAGE_LENGTH as string] = "65530";
        records[image.PropertyKey.IMAGE_WIDTH as string] = "65535";

        let compareData: Record<string, string | null> = {};
        compareData[image.PropertyKey.ORIENTATION as string] = "Left-bottom";
        compareData[image.PropertyKey.IMAGE_LENGTH as string] = "65530";
        compareData[image.PropertyKey.IMAGE_WIDTH as string] = "65535";

        // const compareData: PropertyKeyValues = {Orientation:"Left-bottom",ImageLength:"65530", ImageWidth:"65535"}
        const keys = [image.PropertyKey.ORIENTATION, image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
        const filesList:Array<picTypeValue> = [
          {name: "jpeg", fileName: "test_exif_empty_2.jpg"},
          {name: "png", fileName: "test_exif_empty_2.png"},
          {name: "heif", fileName: "test_exif_empty_2.heic"},
          {name: "webp", fileName: "test_exif_empty2.webp"}]
        let result = true
        const createImageSourceTypes = ["fd", "uri"]
        // const compareData = JSON.stringify(values)
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k]
            const checkResult = await testModifyImageProperties(testTag, keys, records, compareData,
              filesList[i].fileName, testType)
            result = result && checkResult
          }
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ` +  JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014800
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014800
     * @tc.desc   modifyImageProperty('ExposureTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014800';
      const key = image.PropertyKey.EXPOSURE_TIME
      const modifyData: string = `16/10`;
      const compareData: string = `1.6 sec.`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"fd");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014900
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014900
     * @tc.desc   modifyImageProperty('ExposureTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_EMPTYIMAGE_PROMISE_STATIC_014900';
      const key = image.PropertyKey.EXPOSURE_TIME
      const modifyData: string = `12/2`;
      const compareData: string = `6 sec.`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_empty.${modfiyFileSuffixs[i]}`,"uri");
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014600
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014600
     * @tc.desc   modifyImageProperty('ExposureTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014600';
      const key = image.PropertyKey.EXPOSURE_TIME
      const modifyData: string = `1696000/1000000000`;
      const compareData: string = `1/590 sec.`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"fd")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014700
     * @tc.number SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014700
     * @tc.desc   modifyImageProperty('ExposureTime')_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(1000)
      const testTag = 'SUB_MULTIMEDIA_EXIF_MODIFYIMAGEPROPERTY_IMAGECONTAINSEXIF_PROMISE_STATIC_014700';
      const key = image.PropertyKey.EXPOSURE_TIME
      const modifyData: string = `4000000000/1000000000`;
      const compareData: string = `4 sec.`;
      try {
        let result: boolean = true
        for(let i=0; i<modfiyFileSuffixs.length; i++){
          const checkResult = await testModifyPromise(testTag, key, modifyData, compareData,
            `test_exif_v2.${modfiyFileSuffixs[i]}`,"uri")
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

  })
}


