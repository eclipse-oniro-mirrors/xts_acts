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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Component, Driver, ON } from '@ohos.UiTest';
import fs, { ReadOptions } from '@ohos.file.fs';

import {
  sleep,
  getPermission,
  fetchOption,
  fetchAllOption, driveFn
} from '../common'
import common from '@ohos.app.ability.common';

export default function showAssetsCreationDialogTest() {

  describe('showAssetsCreationDialogTest', () => {

    let driver: Driver | undefined = undefined;

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      driver = Driver.create();
      await sleep(1000);
    });

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    const createAssetByIo = async (sourceFilePath: string, targetFilePath: string, testNum: string, done: Function) => {
      try {
        // 沙箱路径下文件
        let srcFile: fs.File = fs.openSync(sourceFilePath, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
        // 媒体库中照片对象uri
        let targetFile: fs.File = await fs.open(targetFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let bufSize = 10240;
        let readSize = 0;
        let buf = new ArrayBuffer(bufSize);
        let readOptions: ReadOptions = {
          offset: readSize,
          length: bufSize
        };
        let readLen = fs.readSync(srcFile.fd, buf, readOptions);
        console.log(`${testNum} :: souceFile readLen is ${readLen}`);
        while (readLen > 0) {
          readSize += readLen;
          fs.writeSync(targetFile.fd, buf, {length: readLen});
          readOptions.offset = readSize;
          readLen = fs.readSync(srcFile.fd, buf, readOptions);
        }
        console.log(`${testNum} :: write content to medialibrary asset Obj success, then close Stream`);
        fs.closeSync(srcFile);
        fs.closeSync(targetFile);
      } catch (error) {
        console.error(`${testNum} :: createAssetByIo error, msg is ${error}`);
        expect(false).assertTrue();
        done();
      }
    };

    const showAssetCreationDialog = async (done: Function, testNum: string, fileUriList: Array<string>,
      photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig>, allowFlag: boolean) => {
      try {
        let desFileUris: Array<string> = [];
        let buttonText = allowFlag ? '允许' : '禁止';
        phAccessHelper.showAssetsCreationDialog(fileUriList, photoCreationConfigs).then((data) => {
          console.log(`${testNum} :: showAssetsCreationDialog :: data length is ${data.length}`);
          desFileUris = data;
        });
        let button: Component | undefined = await driver?.waitForComponent(ON.text(buttonText), 2000);
        if (button !== undefined) {
          await button.click();
        }
        await sleep(2000);
        console.log(`${testNum} :: allowFlag is ${allowFlag} :: desFileUris.length is ${desFileUris.length}`);
        if (allowFlag) {
          expect(desFileUris.length > 0).assertTrue();
          const ops = fetchAllOption();
          let fetchResult1: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(ops);
          let count_before: number = fetchResult1.getCount();
          console.log(`${testNum} :: before createAssetByIo :: count before is ${count_before}`);
          // 往媒体库照片添加内容
          for (let index = 0; index < fileUriList.length; index++) {
            await createAssetByIo(fileUriList[index], desFileUris[index], testNum, done);
            await sleep(500);
          }
          let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(ops);
          let count_after: number = fetchResult2.getCount();
          console.log(`${testNum} :: after createAssetByIo :: count after is ${count_after}`);
          expect(count_after).assertEqual(count_before + desFileUris.length);
          done();
        } else {
          expect(desFileUris.length).assertEqual(0);
          done();
        }
      } catch (error) {
        console.error(`${testNum} :: showAssetsCreationDialogPromise error, err is ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const showAssetCreationDialogError = async (done: Function, testNum: string, fileUriList: Array<string>,
      photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig>, allowFlag: boolean) => {
        try {
          let desFileUris: Array<string> = [];
          let buttonText = allowFlag ? '允许' : '禁止';
          phAccessHelper.showAssetsCreationDialog(fileUriList, photoCreationConfigs).then((data) => {
          console.log(`${testNum} :: showAssetsCreationDialog :: data length is ${data.length}`);
          desFileUris = data;
          expect(false).assertTrue();
          done();
        });
        } catch (error) {
          console.error(`${testNum} :: showAssetsCreationDialogPromise error, err is ${error}`);
          expect(error.code === 13900020 || error.code === 401).assertTrue();
          done();
        }
      }

    /**
     * @tc.number    : Sub_PhotoAccess_Helper_Show_Creations_Dialog_001
     * @tc.name      : show_asset_create_dialog_001
     * @tc.desc      : show dialog to add mediaLibrary resource, then not allow
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("show_asset_create_dialog_001", 0, async (done: Function) => {
      const testNum = "show_asset_create_dialog_001";
      let fileUriList: Array<string> = [
        "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg"
      ];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialog(done, testNum, fileUriList, photoCreationConfigs, false);
    })

    /**
     * @tc.number    : Sub_PhotoAccess_Helper_Show_Creations_Dialog_002
     * @tc.name      : show_asset_create_dialog_002
     * @tc.desc      : show dialog to add mediaLibrary resource, then allow
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("show_asset_create_dialog_002", 0, async (done: Function) => {
      const testNum = "show_asset_create_dialog_002";
      let fileUriList: Array<string> = [
        "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg"
      ];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialog(done, testNum, fileUriList, photoCreationConfigs, true);
    })

    /**
     * @tc.number    : Sub_PhotoAccess_Helper_Show_Creations_Dialog_003
     * @tc.name      : show_asset_create_dialog_003
     * @tc.desc      : show dialog to add mediaLibrary resource, then not allow,fileUriList is undefined,error code is 13900020 or 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("show_asset_create_dialog_003", 2, async (done: Function) => {
      const testNum = "show_asset_create_dialog_003";
      let fileUriList: ESObject = undefined;
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: '123123',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogError(done, testNum, fileUriList, photoCreationConfigs, false);
    })

  })
}