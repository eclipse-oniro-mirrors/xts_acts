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


import { describe, it, expect, beforeAll } from "@ohos/hypium";
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { BusinessError } from '@ohos.base';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fs, { Filter, ListFileOptions } from '@ohos.file.fs'
import {
  sleep,
  getPermission, driveFn
} from '../common';
import common from '@ohos.app.ability.common';

export default function getMovingPhotoTest() {
  describe("getMovingPhotoTest", () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const sandboxPath = "/data/storage/el2/base/haps/entry_test/photos/";
    let imageFileName = "ImageFile.jpg";
    let videoFileName = "VideoFile.mp4";

    const createMovingPhoto = async (done: Function, testNum: string) => {
      try {
        let displayName: ESObject = "test_moving_photo.jpeg";
        let createOption: photoAccessHelper.PhotoCreateOptions = {
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        };
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, displayName, createOption);
        let photoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg";
        let videoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.mp4";
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
        await phAccessHelper.applyChanges(assetChangeRequest);
        let assertUri: string = assetChangeRequest.getAsset().uri;
        if (assertUri == undefined || assertUri == "") {
          console.error(`${testNum}::createMovingPhoto :: failed to create moving Photo !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err) {
        console.error(`getMovingPhotoTest::${testNum}:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestMovingPhotoContent = async (done: Function, testNum: string, case_num: number, cacelFlag: boolean) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
        let flag = 2;
        while (flag > 0) {
          assetResult = await phAccessHelper.getAssets(fetchOptions);
          if (assetResult.getCount() <= 0) {
            await createMovingPhoto(done, testNum);
            flag--;
            continue;
          }
          break;
        }
        if (flag <= 0 || assetResult == undefined) {
          console.error(`${testNum}::create moving photo failed !`);
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
        switch (case_num) {
          case 0:
            handler = new MovingPhotoHandler();
            console.log(`${testNum}::handler::MovingPhotoHandler`);
            break;
          case 1:
            handler = new PhotoHandler();
            console.log(`${testNum}::handler::PhotoHandler`);
            break;
          case 2:
            handler = new VideoHandler();
            console.log(`${testNum}::handler::VideoHandler`);
            break;
          case 3:
            handler = new ArrayBufferHandler();
            console.log(`${testNum}::handler::ArrayBufferHandler`);
            break;
          case 4:
            handler = new ErrorHandlerMissingImageUri();
            console.log(`${testNum}::handler::ErrorHandlerMissingImageUri`);
            break;
          case 5:
            handler = new ErrorHandlerMissingVideoUri();
            console.log(`${testNum}::handler::ErrorHandlerMissingVideoUri`);
            break;
          case 6:
            handler = new ErrorPhotoHandlerWrongImageuri();
            console.log(`${testNum}::handler::ErrorPhotoHandlerWrongImageuri`);
            break;
          case 7:
              handler = new ErrorPhotoHandlerMissingImageuri();
              console.log(`${testNum}::handler::ErrorPhotoHandlerMissingImageuri`);
              break; 
          case 8:
            handler = new ErrorArrayBufferHandlerMissingType();
            console.log(`${testNum}::handler::ErrorArrayBufferHandlerMissingType`);
            break; 
          default:
            console.error(`${testNum}::requestMovingPhotoContent::illegal case_num: ${case_num}`);
            expect(false).assertTrue();
            done();
        }
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
        if (requestId == undefined) {
          console.error(`${testNum}::failed to request moving photo::requestId is undefined !`);
          expect(false).assertTrue();
          done();
        }
        if (cacelFlag) {
          console.log(`${testNum}::requestMovingPhotoContent::cacelRequest`);
          await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId);
        }
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestMovingPhotoErrorContent = async (done: Function, testNum: string, cacelFlag: boolean) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
        let flag = 2;
        while (flag > 0) {
          assetResult = await phAccessHelper.getAssets(fetchOptions);
          if (assetResult.getCount() <= 0) {
            await createMovingPhoto(done, testNum);
            flag--;
            continue;
          }
          break;
        }
        if (flag <= 0 || assetResult == undefined) {
          console.error(`${testNum}::create moving photo failed !`);
          expect(false).assertTrue();
          done();
        }
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        let requestOptions = null;
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::handler::MovingPhotoHandler`);
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }

    const checkFileExist = async (done: Function, testNum: string, filePathDir: string, fileList: Array<string>,
      expectFlag: boolean) => {
      try {
        let flag: number = 0;
        let listFileOption: ListFileOptions = {
          filter: {}
        };
        fs.listFile(filePathDir, listFileOption).then((fileNames: Array<string>) => {
          for (let i = 0; i < fileNames.length; i++) {
            for (let j = 0; j < fileList.length; j++) {
              if (fileNames[i] == fileList[j]) {
                flag++;
              }
            }
          }
          if (!expectFlag && flag > 0) {
            console.error(`${testNum}::${fileNames.toString()}::file List in ${filePathDir} !`);
            expect(false).assertTrue();
            done();
          } else if (expectFlag && flag != fileList.length) {
            console.error(`${testNum}::${fileNames.toString()}::file List not in ${filePathDir} !`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${testNum}::${filePathDir}::failed to get file count:: ${err.message}, ${err.code} !`);
          expect(false).assertTrue();
          done();
        });
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    const checkMovingPhotoLoadByResource = async (done: Function, testNum: string, imageFileUri: string,
      videoFileUri: string) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto = await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, videoFileUri);
        if (movingPhoto == undefined || movingPhoto == null) {
          console.error(`${testNum} :: loadMovingPhoto failed , movingPhoto is null !`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${testNum} :: load moving photo success`);
        done();
      } catch (error) {
        console.error(`${testNum} :: loadMovingPhoto failed , message = ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_MOVING_PHOTO_0001
     * @tc.name      : create_moving_photo_001
     * @tc.desc      : create a moving photo by sandbox resourece
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('create_moving_photo_001', 0, async (done: Function) => {
      const testNum = 'create_moving_photo_001';
      await createMovingPhoto(done, testNum);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0001
     * @tc.name      : request_moving_photo_content_0001
     * @tc.desc      : request moving photo content to sandbox, then cacel request
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_0001', 0, async (done: Function) => {
      const cacelFlag = true;
      const expectFlag = false;
      const case_num = 0;
      const testNum = 'request_moving_photo_content_0001';
      const fileList: Array<string> = ["ImageFile.jpg", "VideoFile.mp4"];
      await requestMovingPhotoContent(done, testNum, case_num, cacelFlag);
      await sleep(3000);
      await checkFileExist(done, testNum, sandboxPath, fileList, expectFlag);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0002
     * @tc.name      : request_moving_photo_content_0002
     * @tc.desc      : request moving photo the part of img to sandbox
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_0002', 0, async (done: Function) => {
      const expectFlag = true;
      const testNum = 'request_moving_photo_content_0002';
      const fileList: Array<string> = ["test_picture.jpg"];
      await requestMovingPhotoContent(done, testNum, 1, false);
      await sleep(3000);
      await checkFileExist(done, testNum, sandboxPath, fileList, expectFlag);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0003
     * @tc.name      : request_moving_photo_content_0003
     * @tc.desc      : request moving photo the part of video to sandbox
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_0003', 0, async (done: Function) => {
      const expectFlag = true;
      const testNum = 'request_moving_photo_content_0003';
      const fileList: Array<string> = ["test_video.mp4"];
      await requestMovingPhotoContent(done, testNum, 2, false);
      await sleep(3000);
      await checkFileExist(done, testNum, sandboxPath, fileList, expectFlag);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0004
     * @tc.name      : request_moving_photo_content_0004
     * @tc.desc      : request moving photo the part of ArrayBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_0004', 0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_0004';
      await requestMovingPhotoContent(done, testNum, 3, false);
      done();
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0005
     * @tc.name      : request_moving_photo_content_0005
     * @tc.desc      : request moving photo all content to sandbox
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_0005', 0, async (done: Function) => {
      const cacelFlag = false;
      const expectFlag = true;
      const testNum = 'request_moving_photo_content_0005';
      const fileList: Array<string> = ["ImageFile.jpg", "VideoFile.mp4"];
      await requestMovingPhotoContent(done, testNum, 0, cacelFlag);
      await sleep(3000);
      await checkFileExist(done, testNum, sandboxPath, fileList, expectFlag);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0006
     * @tc.name      : request_moving_photo_content_0006
     * @tc.desc      : request moving photo error code 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('request_moving_photo_content_0006', 2, async (done: Function) => {
      const cacelFlag = false;
      const expectFlag = true;
      const testNum = 'request_moving_photo_content_0006';
      const fileList: Array<string> = ["ImageFile.jpg", "VideoFile.mp4"];
      await requestMovingPhotoErrorContent(done, testNum, cacelFlag);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_LOAD_MOVING_PHOTO_001
     * @tc.name      : load_moving_photo_from_sandbox_001
     * @tc.desc      : load moving photo from sandbox
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('load_moving_photo_from_sandbox_001', 0, async (done: Function) => {
      imageFileName = "testImage.jpg";
      videoFileName = "testVideo.mp4";
      const testNum = 'load_moving_photo_from_sandbox_001';
      const fileList: Array<string> = ["testImage.jpg", "testVideo.mp4"];
      let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/testImage.jpg";
      let videoFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/testVideo.mp4";
      await requestMovingPhotoContent(done, testNum, 0, false);
      await sleep(3000);
      await checkFileExist(done, testNum, sandboxPath, fileList, true);
      checkMovingPhotoLoadByResource(done, testNum, imageFileUri, videoFileUri);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_ERROR_0001
     * @tc.name      : request_moving_photo_content_error_0001
     * @tc.desc      : Test requestContent with missing imageFileUri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_error_0001', 0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_error_0001';
      await requestMovingPhotoContent(done, testNum, 4, false);
      await sleep(1000);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_ERROR_0002
     * @tc.name      : request_moving_photo_content_error_0002
     * @tc.desc      : Test requestContent with missing videoFileUri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_error_0002', 0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_error_0002';
      await requestMovingPhotoContent(done, testNum, 5, false);
      await sleep(1000);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_ERROR_0003
     * @tc.name      : request_moving_photo_content_error_0003
     * @tc.desc      : Test requestContent with missing imageUri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_error_0003', 0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_error_0003';
      await requestMovingPhotoContent(done, testNum, 6, false);
      await sleep(1000);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_ERROR_0004
     * @tc.name      : request_moving_photo_content_error_0004
     * @tc.desc      : Test requestContent with imageUri as undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_error_0004', 0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_error_0004';
      await requestMovingPhotoContent(done, testNum, 7, false);
      await sleep(1000);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_ERROR_0005
     * @tc.name      : request_moving_photo_content_error_0005
     * @tc.desc      : Test requestContent with missing type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_moving_photo_content_error_0005', 0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_error_0005';
      await requestMovingPhotoContent(done, testNum, 8, false);
      await sleep(1000);
      done();
    });

    // export moving photo:: video and photo
    class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("MovingPhotoHandler::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/" + imageFileName;
        let videoFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/" + videoFileName;
        await movingPhoto.requestContent(imageFileUri, videoFileUri);
        let photoUri = await movingPhoto.getUri();
        console.log(`photoUri =====> ${photoUri}`);
        if (photoUri == undefined) {
          console.error(`MovingPhotoHandler get moving photo uri fail !`);
          expect(false).assertTrue();
        }
        console.log("moving photo contents retrieved successfully");
      }
    }

    // export moving photo:: only photo
    class PhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("PhotoHandler::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_picture.jpg";
        await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
        console.log("moving photo image content retrieved successfully");
      }
    }

    // export moving photo:: only video
    class VideoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("VideoHandler::movingPhoto onDataPrepared");
        let videoFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_video.mp4";
        await movingPhoto.requestContent(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoFileUri);
        console.log("moving photo video content retrieved successfully");
      }
    }

    // export moving photo:: ArrayBuffer
    class ArrayBufferHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ArrayBufferHandler::movingPhoto onDataPrepared");
        let buffer: ArrayBuffer = await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE);
        if (buffer == undefined || buffer.byteLength <= 0) {
          console.error(`ArrayBufferHandler :: failed to request content ArrayBuffer !`);
          expect(false).assertTrue();
        }
      }
    }
    // export moving photo:: missing imageuri
    class ErrorHandlerMissingImageUri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ErrorHandlerMissingImageUri::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_testxxxxxxxxx/photos/" + imageFileName;
        let videoFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/" + videoFileName;
        try {
          await movingPhoto.requestContent(imageFileUri, videoFileUri);
          console.error("ErrorHandlerMissingImageUri: requestContent should have thrown an error");
          expect(false).assertTrue();
        } catch (error) {
          console.error(`ErrorHandlerMissingImageUri get moving photo uri fail !`);
          expect(error.code).assertEqual('14000011');
        }
      }
    }
    // export moving photo:: missing imageuri
    class ErrorHandlerMissingVideoUri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ErrorHandlerMissingVideoUri::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/" + imageFileName;
        let videoFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/" + videoFileName;
        try {
          await movingPhoto.requestContent(imageFileUri, undefined);
          console.error("ErrorHandlerMissingVideoUri: requestContent should have thrown an error");
          expect(false).assertTrue();
        } catch (error) {
          console.error(`ErrorHandlerMissingImageUri get moving photo uri fail !`);
          expect(error.code).assertEqual('401');
        }
      }
    }
    // export moving photo:: only photo and missing imageuri
    class ErrorPhotoHandlerWrongImageuri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ErrorPhotoHandlerWrongImageuri::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_testxxxx/photosxxxxxx/test_picture.jpg";
        try {
          await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
          console.log("moving photo image content retrieved successfully");
          expect(false).assertTrue();
        } catch (error) {
          console.error(`ErrorPhotoHandlerWrongImageuri get moving photo uri fail !`);
          expect(error.code).assertEqual('14000011');
        }
      }
    }
    // export moving photo:: only photo and imageuri as undefined
    class ErrorPhotoHandlerMissingImageuri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ErrorPhotoHandlerMissingImageuri::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_picture.jpg";
        try {
          await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined);
          console.log("moving photo image content retrieved successfully");
          expect(false).assertTrue();
        } catch (error) {
          console.error(`ErrorPhotoHandlerMissingImageuri get moving photo uri fail !`);
          expect(error.code).assertEqual('401');
        }
      }
    }
    // export moving photo:: ArrayBuffer missing type
    class ErrorArrayBufferHandlerMissingType implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ErrorArrayBufferHandlerMissingType::movingPhoto onDataPrepared");
        try {
          let buffer: ArrayBuffer = await movingPhoto.requestContent(undefined);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`ErrorArrayBufferHandlerMissingType get moving photo uri fail !`);
          expect(error.code).assertEqual('14000011');
        }
      }
    }
  });

}