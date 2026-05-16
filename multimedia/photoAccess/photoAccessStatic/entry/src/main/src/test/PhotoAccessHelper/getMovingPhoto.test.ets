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

import { describe, beforeAll, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import fs, { Filter, ListFileOptions } from '@ohos.file.fs'
import { BusinessError } from '@ohos.base'
import { sleep, getPermission, driveFn, photoFetchOption } from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';
const sandboxPath = "/data/storage/el2/base/haps/entry/photos/";
let imageFileName = "ImageFile.jpg";
let videoFileName = "VideoFile.mp4";

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "MovingPhotoHandler::movingPhoto onDataPrepared");
    let imageFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/" + imageFileName;
    let videoFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/" + videoFileName;
    await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(imageFileUri, videoFileUri);
    let photoUri = (movingPhoto as photoAccessHelper.MovingPhoto).getUri();
    hilog.info(domain, tag, `photoUri =====> ${photoUri}`);
    if (photoUri == undefined) {
      hilog.info(domain, tag, `MovingPhotoHandler get moving photo uri fail !`);
      expect(false).assertTrue();
    }
    hilog.info(domain, tag, "moving photo contents retrieved successfully");
  }
}

class PhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "PhotoHandler::movingPhoto onDataPrepared");
    let imageFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_picture.jpg";
    await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
    hilog.info(domain, tag, "moving photo image content retrieved successfully");
  }
}

class VideoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "VideoHandler::movingPhoto onDataPrepared");
    let videoFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_video.mp4";
    await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoFileUri);
    hilog.info(domain, tag, "moving photo video content retrieved successfully");
  }
}

class ArrayBufferHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "ArrayBufferHandler::movingPhoto onDataPrepared");
    let buffer: ArrayBuffer = await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE);
    if (buffer == undefined || buffer.byteLength <= 0) {
      hilog.info(domain, tag, `ArrayBufferHandler :: failed to request content ArrayBuffer !`);
      expect(false).assertTrue();
    }
  }
}

class ErrorHandlerMissingImageUri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "ErrorHandlerMissingImageUri::movingPhoto onDataPrepared");
    let imageFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entryxxxxxxxxx/photos/" +
        imageFileName;
    let videoFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/" + videoFileName;
    try {
      await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(imageFileUri, videoFileUri);
      hilog.info(domain, tag, "ErrorHandlerMissingImageUri: requestContent should have thrown an error");
      expect(false).assertTrue();
    } catch (error: BusinessError) {
      hilog.info(domain, tag, `ErrorHandlerMissingImageUri get moving photo uri fail !`);
      expect(error.code).assertEqual(14000011);
    }
  }
}

class ErrorHandlerMissingVideoUri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "ErrorHandlerMissingVideoUri::movingPhoto onDataPrepared");
    let imageFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/" + imageFileName;
    let videoFileUri: string | undefined = undefined;
    try {

      await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(imageFileUri, videoFileUri! as string);
      hilog.info(domain, tag, "ErrorHandlerMissingVideoUri: requestContent should have thrown an error");
      expect(false).assertTrue();
    } catch (error: BusinessError) {
      hilog.info(domain, tag, `ErrorHandlerMissingImageUri get moving photo uri fail !`);
      expect(error.code).assertEqual(401);
    }
  }
}

class ErrorPhotoHandlerWrongImageuri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "ErrorPhotoHandlerWrongImageuri::movingPhoto onDataPrepared");
    let imageFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entryxxxx/filesxxxxxx/test_picture.jpg";
    try {
      await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
      hilog.info(domain, tag, "moving photo image content retrieved successfully");
      expect(false).assertTrue();
    } catch (error: BusinessError) {
      hilog.info(domain, tag, `ErrorPhotoHandlerWrongImageuri get moving photo uri fail !`);
      expect(error.code).assertEqual(14000011);
    }
  }
}

class ErrorPhotoHandlerMissingImageuri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "ErrorPhotoHandlerMissingImageuri::movingPhoto onDataPrepared");
    let imageFileUri: string =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_picture.jpg";
    try {
      let filrUri: string | undefined = undefined;
      await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, filrUri! as string);
      hilog.info(domain, tag, "moving photo image content retrieved successfully");
      expect(false).assertTrue();
    } catch (error: BusinessError) {
      hilog.info(domain, tag, `ErrorPhotoHandlerMissingImageuri get moving photo uri fail !`);
      expect(error.code).assertEqual(401);
    }
  }
}

class ErrorArrayBufferHandlerMissingType implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, "ErrorArrayBufferHandlerMissingType::movingPhoto onDataPrepared");
    try {
      let resourceType: photoAccessHelper.ResourceType | undefined = undefined;
      let buffer: ArrayBuffer = await (movingPhoto as photoAccessHelper.MovingPhoto).requestContent(resourceType! as photoAccessHelper.ResourceType);
      expect(false).assertTrue();
    } catch (error: BusinessError) {
      hilog.info(domain, tag, `ErrorArrayBufferHandlerMissingType get moving photo uri fail !`);
      expect(error.code).assertEqual(14000011);
    }
  }
}

export default function getMovingPhotoTest() {

  describe("getMovingPhotoTest", (): void => {
    beforeAll(() => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    let testContext: Context = Hypium.get("context") as Context;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    const createMovingPhoto = async (done: () => void, testNum: string): Promise<void> => {
      try {
        let displayName: string = "test_moving_photo.jpeg";
        let createOption: photoAccessHelper.PhotoCreateOptions = {
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        };
        const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'off01.jpg');
        let fetchResult = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let photoUri =
          "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_mov_1.jpg";
        let videoUri =
          "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_mov_1.mp4";
        (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
        (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
        let assertUri: string = ((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getAsset() as photoAccessHelper.PhotoAsset).uri;
        if (assertUri == undefined || assertUri == "") {
          hilog.info(domain, tag, `${testNum}::createMovingPhoto :: failed to create moving Photo !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `getMovingPhotoTest::${testNum}:: failed to createMovingPhoto::${err.code}, ${err} !`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestMovingPhotoContent =
      async (done: () => void, testNum: string, case_num: number, cacelFlag: boolean): Promise<void> => {
        try {
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO as long);
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
          let flag = 2;
          while (flag > 0) {
            assetResult = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
            if (assetResult.getCount() <= 0) {
              await createMovingPhoto(done, testNum);
              flag--;
              continue;
            }
            break;
          }
          if (flag <= 0 || assetResult == undefined) {
            hilog.info(domain, tag, `${testNum}::create moving photo failed !`);
            expect(false).assertTrue();
            done();
          }
          let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
          if (assetResult != undefined) {
            asset = await assetResult.getFirstObject();
          }
          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          };
          let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
          const caseNumString = String(case_num);
          switch (caseNumString) {
            case '0':
              handler = new MovingPhotoHandler();
              hilog.info(domain, tag, `${testNum}::handler::MovingPhotoHandler`);
              break;
            case '1':
              handler = new PhotoHandler();
              hilog.info(domain, tag, `${testNum}::handler::PhotoHandler`);
              break;
            case '2':
              handler = new VideoHandler();
              hilog.info(domain, tag, `${testNum}::handler::VideoHandler`);
              break;
            case '3':
              handler = new ArrayBufferHandler();
              hilog.info(domain, tag, `${testNum}::handler::ArrayBufferHandler`);
              break;
            case '4':
              handler = new ErrorHandlerMissingImageUri();
              hilog.info(domain, tag, `${testNum}::handler::ErrorHandlerMissingImageUri`);
              break;
            case '5':
              handler = new ErrorHandlerMissingVideoUri();
              hilog.info(domain, tag, `${testNum}::handler::ErrorHandlerMissingVideoUri`);
              break;
            case '6':
              handler = new ErrorPhotoHandlerWrongImageuri();
              hilog.info(domain, tag, `${testNum}::handler::ErrorPhotoHandlerWrongImageuri`);
              break;
            case '7':
              handler = new ErrorPhotoHandlerMissingImageuri();
              hilog.info(domain, tag, `${testNum}::handler::ErrorPhotoHandlerMissingImageuri`);
              break;
            case '8':
              handler = new ErrorArrayBufferHandlerMissingType();
              hilog.info(domain, tag, `${testNum}::handler::ErrorArrayBufferHandlerMissingType`);
              break;
            default:
              hilog.info(domain, tag, `${testNum}::requestMovingPhotoContent::illegal case_num: ${case_num}`);
              expect(false).assertTrue();
              done();
          }
          let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext,
            asset as photoAccessHelper.PhotoAsset, requestOptions,
            handler as photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto>);
          if (requestId == undefined) {
            hilog.info(domain, tag, `${testNum}::failed to request moving photo::requestId is undefined !`);
            expect(false).assertTrue();
            done();
          }
          if (cacelFlag) {
            hilog.info(domain, tag, `${testNum}::requestMovingPhotoContent::cacelRequest`);
            await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId);
          }
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag,
            `${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      }

    const checkFileExist = async (done: () => void, testNum: string, filePathDir: string, fileList: Array<string>,
      expectFlag: boolean): Promise<void> => {
      try {
        let flag: number = 0;
        let listFileOption: ListFileOptions = {};
        fs.listFile(filePathDir, listFileOption).then((fileNames: Array<string>) => {
          for (let i = 0; i < fileNames.length; i++) {
            for (let j = 0; j < fileList.length; j++) {
              if (fileNames[i] == fileList[j]) {
                flag++;
              }
            }
          }
          if (!expectFlag && flag > 0) {
            hilog.info(domain, tag, `${testNum}::${fileNames.toString()}::file List in ${filePathDir} !`);
            expect(false).assertTrue();
            done();
          } else if (expectFlag && flag != fileList.length) {
            hilog.info(domain, tag, `${testNum}::${fileNames.toString()}::file List not in ${filePathDir} !`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: Error) => {
          const businessError = err as BusinessError<void>;
          hilog.info(domain, tag, `${testNum}::${filePathDir}::failed to get file count::
           ${businessError.message}, ${businessError.code} !`);
          expect(false).assertTrue();
          done();
        });
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag,
          `${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    const checkMovingPhotoLoadByResource = async (done: () => void, testNum: string, imageFileUri: string,
      videoFileUri: string): Promise<void> => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, videoFileUri);
        if (movingPhoto == undefined || movingPhoto == null) {
          hilog.info(domain, tag, `${testNum} :: loadMovingPhoto failed , movingPhoto is null !`);
          expect(false).assertTrue();
          done();
        }
        hilog.info(domain, tag, `${testNum} :: load moving photo success`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} :: loadMovingPhoto failed , message = ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   request_moving_photo_content_static_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_STATIC_0001
     * @tc.desc   request moving photo content to sandbox, then cacel request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const cacelFlag = true;
        const expectFlag = false;
        const case_num = 0;
        const testNum = 'request_moving_photo_content_static_0001';
        const fileList: Array<string> = ["ImageFile.jpg", "VideoFile.mp4"];
        await requestMovingPhotoContent(done, testNum, case_num, cacelFlag);
        await sleep(3000);
        await checkFileExist(done, testNum, sandboxPath, fileList, expectFlag);
      });

    /**
     * @tc.name   request_moving_photo_content_static_0002
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_STATIC_0002
     * @tc.desc   request moving photo the part of img to sandbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const expectFlag = true;
        const testNum = 'request_moving_photo_content_static_0002';
        const fileList: Array<string> = ["test_picture.jpg"];
        await requestMovingPhotoContent(done, testNum, 1, false);
        await sleep(3000);
        await checkFileExist(done, testNum, sandboxPath, fileList, expectFlag);
      });

    /**
     * @tc.name   cancel_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CANEL_REQUEST_STATIC_0200
     * @tc.desc   cancelRequest by error requestId,error code is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('cancel_request_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'cancel_request_static_002';
        try {
          let requestId: string = '123123';
          await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId);
          console.info(`${testNum} request cancelled successfully`);
          expect(false).assertTrue();
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${testNum} failed with error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        }
      });
  })
}