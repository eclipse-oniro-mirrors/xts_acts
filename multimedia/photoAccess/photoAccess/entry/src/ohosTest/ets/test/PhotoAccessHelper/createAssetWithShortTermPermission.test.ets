/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { Component, Driver, ON } from '@ohos.UiTest';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { describe, beforeAll, it, expect, Level } from '@ohos/hypium';
import { geoLocationManager } from '@kit.LocationKit'

import {
  sleep,
  driveFn,
  fetchOption,
  getPermission,
  fetchAllOption,
  getFileAsset
} from '../common';

export default function createAssetWithShortTermPermissionTest() {

  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
  let isSupportFileManagement: boolean = true;

  describe('createAssetWithShortTermPermissionTest', () => {

    let driver: Driver | undefined = undefined;

    beforeAll(async () => {
      await getPermission();
      await driveFn();
      driver = Driver.create();
      await sleep(1000);
      isSupportFileManagement = canIUse('SystemCapability.FileManagement.PhotoAccessHelper.Core');
      console.info('isSupportFileManagement is ' + isSupportFileManagement);
    })

    const writeBuffToAsset = async (testNum: string, sourceFileUri: string, targetFileUri: string) => {
      let flag: boolean = true;
      try {
        let targetFile: fileIo.File = fileIo.openSync(targetFileUri, fileIo.OpenMode.READ_WRITE);
        let srcFile:  fileIo.File = fileIo.openSync(sourceFileUri, fileIo.OpenMode.READ_ONLY);
        console.log(`${testNum} :: writeBuffToAsset :: open file success .`);
        let bufSize: number = 2000000;
        let readSize: number = 0;
        let buf = new ArrayBuffer(bufSize);
        let readLen = fileIo.readSync(srcFile.fd, buf, {
          offset: readSize,
          length: bufSize
        });
        if (readLen > 0) {
          readSize += readLen;
          fileIo.writeSync(targetFile.fd, buf, { length: readLen });
        }
        console.log(`${testNum} :: writeBuffToAsset :: write file success .`);
        fileIo.closeSync(srcFile.fd);
        fileIo.closeSync(targetFile.fd);
        console.log(`${testNum} :: writeBuffToAsset :: close fd success .`);
      } catch (error) {
        console.error(`${testNum} :: writeBuffToAsset failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        flag = false;
      }
      return flag;
    }

    const getAssetCount = async (testNum: string) => {
      let count: number = -1;
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOps);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}`);
        count = fetchResult.getCount();
      } catch (error) {
        console.error(`${testNum} :: getAssetCount failed ! errCode = ${error.code}, errMsg = ${error.message}`);
      }
      return count;
    }

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_001
     * @tc.name      createAssetWithShortTermPermission_dialogTest_001
     * @tc.desc      call createAssetWithShortTermPermission twice, click ban button, not return assetUri
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('createAssetWithShortTermPermission_dialogTest_001', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_001';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        };
        for (let i = 0; i < 2; i++) {
          phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
            console.log(`${testNum} :: createAssetWithShortTermPermission :: cycle = ${i + 1} :: data = ${data}`);
            desFileUri = data;
          });
          let button: Component | undefined = await driver?.waitForComponent(ON.text('禁止'), 10000);
          console.log(`${testNum} :: cycle = ${i + 1} :: Component is undefined ? ${button == undefined}`);
          expect(button).not().assertUndefined();
          await button?.click();
          console.log(`${testNum} :: interface call , click button success, cycle = ${i + 1}`);
          console.log(`${testNum} :: desFileUri = ${desFileUri}, cycle = ${i + 1}`);
          expect(desFileUri).assertEqual('');
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_002
     * @tc.name      createAssetWithShortTermPermission_dialogTest_002
     * @tc.desc      call createAssetWithShortTermPermission twice, only first time have dialog under 5 min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('createAssetWithShortTermPermission_dialogTest_002', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_002';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let sourceFileUri: string = context.filesDir + "/01.jpg"
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        };
        let beforeAssetCount: number = await getAssetCount(testNum);
        console.log(`${testNum} :: beforeAssetCount = ${beforeAssetCount}`);
        expect(beforeAssetCount).assertLargerOrEqual(0);
        // first call interface, appear dialog, allow button
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: Before :: data = ${data}`);
          desFileUri = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text('允许'), 10000);
        console.log(`${testNum} :: first call :: Component is undefined ? ${button == undefined}`);
        expect(button).not().assertUndefined();
        await button?.click();
        await sleep(2000);
        console.log(`${testNum} :: fist call, click allow button success, desFileUri = ${desFileUri} .`);
        expect(desFileUri).not().assertEqual('');
        let firstUri: string = desFileUri;
        desFileUri = '';
        await writeBuffToAsset(testNum, sourceFileUri, firstUri);
        await sleep(2000);
        // second call , not appear dialog
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: After :: data = ${data}`);
          desFileUri = data;
        });
        await sleep(2000);
        expect(desFileUri).not().assertEqual('');
        expect(desFileUri).not().assertEqual(firstUri);
        console.log(`${testNum} :: secord call, return data directly, desFileUri = ${desFileUri} .`);
        await writeBuffToAsset(testNum, sourceFileUri, desFileUri);
        await sleep(2000);
        let afterAssetCount: number = await getAssetCount(testNum);
        console.log(`${testNum} :: afterAssetCount = ${afterAssetCount}`);
        expect(afterAssetCount).assertEqual(beforeAssetCount + 2);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_003
     * @tc.name      createAssetWithShortTermPermission_dialogTest_003
     * @tc.desc      call createAssetWithShortTermPermission to create video
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('createAssetWithShortTermPermission_dialogTest_003', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_003';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let sourceFileUri: string = context.filesDir + "/01.mp4"
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: testNum,
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.VIDEO,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: Before :: data = ${data}`);
          desFileUri = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text('允许'), 10000);
        if (button !== undefined) {
          await button?.click();
          await sleep(2000);
          console.log(`${testNum} :: fist call, click allow button success, desFileUri = ${desFileUri} .`);
        }
        expect(desFileUri).not().assertEqual('');
        await writeBuffToAsset(testNum, sourceFileUri, desFileUri);
        await sleep(2000);
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (testNum + ".mp4"));
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testNum, fetchOps);
        expect(asset).not().assertUndefined();
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_004
     * @tc.name      createAssetWithShortTermPermission_dialogTest_004
     * @tc.desc      call createAssetWithShortTermPermission to create image with a title length of 251
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_004', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_004';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let sourceFileUri: string = context.filesDir + "/01.jpg"
        let assetTitle = '1'.repeat(251);
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: assetTitle,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: Before :: data = ${data}`);
          desFileUri = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text('允许'), 10000);
        if (button !== undefined) {
          await button?.click();
          await sleep(2000);
          console.log(`${testNum} :: fist call, click allow button success, desFileUri = ${desFileUri} .`);
        }
        expect(desFileUri).not().assertEqual('');
        await writeBuffToAsset(testNum, sourceFileUri, desFileUri);
        await sleep(2000);
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (assetTitle + ".jpg"));
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testNum, fetchOps);
        expect(asset).not().assertUndefined();
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_005
     * @tc.name      createAssetWithShortTermPermission_dialogTest_005
     * @tc.desc      call createAssetWithShortTermPermission to create image with space title 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_005', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_005';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let sourceFileUri: string = context.filesDir + "/01.jpg"
        let assetTitle = '   ';
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: assetTitle,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: Before :: data = ${data}`);
          desFileUri = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text('允许'), 10000);
        if (button !== undefined) {
          await button?.click();
          await sleep(2000);
          console.log(`${testNum} :: fist call, click allow button success, desFileUri = ${desFileUri} .`);
        }
        expect(desFileUri).not().assertEqual('');
        await writeBuffToAsset(testNum, sourceFileUri, desFileUri);
        await sleep(2000);
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (assetTitle + ".jpg"));
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testNum, fetchOps);
        expect(asset).not().assertUndefined();
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_006
     * @tc.name      createAssetWithShortTermPermission_dialogTest_006
     * @tc.desc      call createAssetWithShortTermPermission to create image with pecial character title
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_006', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_006';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let sourceFileUri: string = context.filesDir + "/01.jpg"
        let assetTitle = '@#$666';
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: assetTitle,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: Before :: data = ${data}`);
          desFileUri = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text('允许'), 10000);
        if (button !== undefined) {
          await button?.click();
          await sleep(2000);
          console.log(`${testNum} :: fist call, click allow button success, desFileUri = ${desFileUri} .`);
        }
        expect(desFileUri).not().assertEqual('');
        await writeBuffToAsset(testNum, sourceFileUri, desFileUri);
        await sleep(2000);
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (assetTitle + ".jpg"));
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testNum, fetchOps);
        expect(asset).not().assertUndefined();
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_007
     * @tc.name      createAssetWithShortTermPermission_dialogTest_007
     * @tc.desc      call createAssetWithShortTermPermission to create image with Chinese title
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_007', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_007';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let desFileUri: string = '';
        let sourceFileUri: string = context.filesDir + "/01.jpg"
        let assetTitle = '你好';
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: assetTitle,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((data) => {
          console.log(`${testNum} :: createAssetWithShortTermPermission :: Before :: data = ${data}`);
          desFileUri = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text('允许'), 10000);
        if (button !== undefined) {
          await button?.click();
          await sleep(2000);
          console.log(`${testNum} :: fist call, click allow button success, desFileUri = ${desFileUri} .`);
        }
        expect(desFileUri).not().assertEqual('');
        await writeBuffToAsset(testNum, sourceFileUri, desFileUri);
        await sleep(2000);
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (assetTitle + ".jpg"));
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testNum, fetchOps);
        expect(asset).not().assertUndefined();
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_008
     * @tc.name      createAssetWithShortTermPermission_dialogTest_008
     * @tc.desc      call createAssetWithShortTermPermission to create image with asset name overlong 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_008', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_008';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let assetTitle = 'z'.repeat(252);
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: assetTitle,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(`${testNum} :: createAssetWithShortTermPermission success`);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, assetTitle + '.jpg');
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let count = fetchResult.getCount();
        console.info(`${testNum} :: asset count is ${count}`);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_009
     * @tc.name      createAssetWithShortTermPermission_dialogTest_009
     * @tc.desc      call createAssetWithShortTermPermission to create image with unsupported special characters title
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_009', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_009';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig;
      let assetTitleArray = ['.', '\\', '/', ':', '*', '?', '"', "'", '`', '<', '>', '|', '{', '}', '[', ']'];
      let fetchOps: photoAccessHelper.FetchOptions;
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
      let count: number;
      for (let i = 0; i < assetTitleArray.length; i++) {
        try {
          photoCreationConfig = {
            title: assetTitleArray[i],
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          };
          console.info(`${testNum} :: title is ${assetTitleArray[i]}`);
          await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
          fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, assetTitleArray[i] + '.jpg');
          fetchResult = await phAccessHelper.getAssets(fetchOps);
          count = fetchResult.getCount();
          console.info(`${testNum} :: asset count is ${count}`);
          expect(count).assertEqual(0);
        } catch (error) {
          console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_010
     * @tc.name      createAssetWithShortTermPermission_dialogTest_010
     * @tc.desc      call createAssetWithShortTermPermission to create image with empty string title
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_010', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_010';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let assetTitle = '';
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: assetTitle,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, assetTitle + '.jpg');
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let count = fetchResult.getCount();
        console.info(`${testNum} :: asset count is ${count}`);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_011
     * @tc.name      createAssetWithShortTermPermission_dialogTest_011
     * @tc.desc      fileNameExtension is jpg but photoType is video
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_011', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_011';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: testNum,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.VIDEO
        };
        await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, testNum + '.jpg');
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let count = fetchResult.getCount();
        console.info(`${testNum} :: asset count is ${count}`);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_012
     * @tc.name      createAssetWithShortTermPermission_dialogTest_012
     * @tc.desc      fileNameExtension is mp4 but photoType is image
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_012', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_012';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: testNum,
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, testNum + '.mp4');
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let count = fetchResult.getCount();
        console.info(`${testNum} :: asset count is ${count}`);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_013
     * @tc.name      createAssetWithShortTermPermission_dialogTest_013
     * @tc.desc      fileNameExtension is invalid suffix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_013', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_013';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: testNum,
          fileNameExtension: 'mp5',
          photoType: photoAccessHelper.PhotoType.VIDEO
        };
        await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, testNum + '.mp5');
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let count = fetchResult.getCount();
        console.info(`${testNum} :: asset count is ${count}`);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    Sub_MultiMedia_MediaLibrary_CreateAssetWithShortTermPermission_Test_014
     * @tc.name      createAssetWithShortTermPermission_dialogTest_014
     * @tc.desc      fileNameExtension length is greater than 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('createAssetWithShortTermPermission_dialogTest_014', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'createAssetWithShortTermPermission_dialogTest_014';
      if (!isSupportFileManagement) {
        console.log(`${testNum} :: do not support FileManagement`);
        done();
        return
      }
      try {
        let extension = 'a'.repeat(256);
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: testNum,
          fileNameExtension: extension,
          photoType: photoAccessHelper.PhotoType.VIDEO
        };
        await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, testNum + '.' + extension);
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let count = fetchResult.getCount();
        console.info(`${testNum} :: asset count is ${count}`);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAssetWithShortTermPermission failed ! errCode = ${error.code}, errMsg = ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  });
}