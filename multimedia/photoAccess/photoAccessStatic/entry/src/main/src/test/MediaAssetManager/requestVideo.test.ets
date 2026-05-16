/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import media from '@ohos.multimedia.media';
import Context from "application.Context"
import fs from "@ohos.file.fs"
import { BusinessError } from '@ohos.base';
import {
  fetchOption,
  createSandboxFileUri,
  getPermission,
  driveFn,
  sleep,
  createVideoBySandBoxUri
} from '../Common.test.ets'
import hilog from '@ohos.hilog'
import hdrCapability from '@ohos.graphics.hdrCapability';

class TestHandler implements photoAccessHelper.MediaAssetProgressHandler {
  onProgress(progress: int): void {
    console.info(`on video request onProgress: ${progress}`);
  }
}

let globalDone: () => void;

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<Boolean> {
  onDataPrepared(data: Boolean | undefined, map: Map<String, String> | undefined) {
    console.info(`MediaHandler succeed`);
    expect(data).assertTrue();
    globalDone();
  }
}

class FMediaHandler implements photoAccessHelper.MediaAssetDataHandler<Boolean> {
  onDataPrepared(data: Boolean | undefined, map: Map<String, String> | undefined) {
    console.info(` failed`);
    expect(data).assertTrue();
  }
}

class EMediaHandler implements photoAccessHelper.MediaAssetDataHandler<Boolean> {
  onDataPrepared(data: Boolean | undefined, map: Map<String, String> | undefined) {
    console.info(`EMediaHandler GET false failed`);
    expect(false).assertTrue();
  }
}

class ESMediaHandler implements photoAccessHelper.MediaAssetDataHandler<Boolean> {
  onDataPrepared(data: Boolean | undefined, map: Map<String, String> | undefined) {
    console.info(`ESMediaHandler succeed`);
    expect(false).assertTrue();
  }
}

let status = false;

class SMediaHandler implements photoAccessHelper.MediaAssetDataHandler<Boolean> {
  onDataPrepared(data: Boolean | undefined, map: Map<String, String> | undefined) {
    console.info(`SMediaHandler succeed`);
    status = true;
  }
}

let count: number = 0;

class CMediaHandler implements photoAccessHelper.MediaAssetDataHandler<Boolean> {
  onDataPrepared(data: Boolean | undefined, map: Map<String, String> | undefined) {
    console.info(` succeed`);
    count++;
  }
}

export default function requestVideoTest() {
  describe('requestVideoTest', (): void => {

    let AVFileDescriptor: media.AVFileDescriptor;
    let testContext: Context = Hypium.get('context') as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let hdrVideoUri =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_hdr_1.mp4";

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await createVideoBySandBoxUri('createHdr001', testContext, hdrVideoUri);
    });

    const createMovingPhoto = async (done: () => void, testNum: string): Promise<void> => {
      try {
        let displayName: string = "hdr_moving_photo.jpeg";
        let createOption: photoAccessHelper.PhotoCreateOptions = {
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        };
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, displayName, createOption);
        let photoUri =
          "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_mov_1.jpg";
        let videoUri =
          "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_mov_1.mp4";
        (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
        (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
        await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
        let assertUri: string = ((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getAsset() as photoAccessHelper.PhotoAsset).uri;
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
    };

    const requestVideoRequestOptions =
      async (testNum: string, done: () => void, requestOptions: photoAccessHelper.RequestOptions): Promise<void> => {
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          hilog.info(0x0000, 'testTag', '%{public}s', `INIT MediaHandler START !`);
          globalDone = done;
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }

    const isHdr = async (testNum: string, fileUri: string): Promise<number | media.HdrType | undefined> => {
      let flag: number | media.HdrType | undefined = -1;
      try {
        let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor() as media.AVMetadataExtractor;
        let fdsrc: media.AVFileDescriptor = {
          fd: fs.openSync(fileUri).fd as int
        };
        avMetadataExtractor.fdSrc = fdsrc;
        let metadata: media.AVMetadata = await avMetadataExtractor.fetchMetadata() as media.AVMetadata;
        flag = metadata.hdrType === undefined ? -1 as number : metadata.hdrType;
      } catch (error) {
        console.error(`handle ${testNum} err:`, error);
      }
      return flag;
    }

    const requestVideoRequestOptionsHdr =
      async (testNum: string, done: () => void, requestOptions: photoAccessHelper.RequestOptions): Promise<void> => {
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
          let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
          let flag = await isHdr(testNum, uri)
          expect(flag).assertEqual(0);
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }

    const requestVideoRequestOptionsError =
      async (testNum: string, done: () => void, requestOptions: photoAccessHelper.RequestOptions): Promise<void> => {
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }

    const requestVideoRequestOptionsErrorHdr =
      async (testNum: string, done: () => void, requestOptions: photoAccessHelper.RequestOptions): Promise<void> => {
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
          let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
          let flag = await isHdr(testNum, uri);
          expect(flag).assertEqual(0);
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }

    const requestVideoPhotoAssetError =
      async (testNum: string, done: () => void, photoAsset: photoAccessHelper.PhotoAsset): Promise<void> => {
        try {
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          };
          const handler = new EMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }

    const requestVideoPhotoAssetErrorCompatible =
      async (testNum: string, done: () => void, photoAsset: photoAccessHelper.PhotoAsset): Promise<void> => {
        try {
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          };
          const handler = new EMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
          let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
          let flag = await isHdr(testNum, uri);
          expect(flag).assertEqual(0);
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }

    const requestVideoPhotoAssetErrorCompatibleOnprogress =
      async (testNum: string, done: () => void, photoAsset: photoAccessHelper.PhotoAsset): Promise<void> => {
        try {
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
            mediaAssetProgressHandler: new TestHandler(),
          };
          const handler = new EMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
          let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
          let flag = await isHdr(testNum, uri);
          expect(flag).assertEqual(0);
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }

    const requestVideoDestUriError =
      async (testNum: string, done: () => void, destUri: string, errCode: string): Promise<void> => {
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          };
          const handler = new EMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
          console.error(`Type of error.code: ${typeof error.code}`);
          console.error(`Type of errCode: ${typeof errCode}`);
          expect(error.code.toString()).assertEqual(errCode.toString());
          done();
        }
      }

    /**
     * @tc.name   request_video_fileUri_test_static_string
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2000
     * @tc.desc   request video with fileUri = 'aaaaa.....mp4'(length = 384)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_fileUri_test_static_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_fileUri_test_static_string';
        let fileUri = ''
        for (let i = 0; i < 380; i++) {
          fileUri += 'a'
        }
        fileUri += '.mp4'
        let errCode = '401'
        await requestVideoDestUriError(testNum, done, fileUri, errCode)
      });

    /**
     * @tc.name   request_video_special_static_chat
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2100
     * @tc.desc   request video with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_special_static_chat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_special_static_chat';
        let fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
        let errCode = '401'
        await requestVideoDestUriError(testNum, done, fileUri, errCode)
      });

    /**
     * @tc.name   request_video_fileUri_extr_long_static_string
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2200
     * @tc.desc   request video with fileUri = 'a...a'(length = 385)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_fileUri_extr_long_static_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_fileUri_extr_long_static_string';
        let fileUri = ''
        for (let i = 0; i < 385; i++) {
          fileUri += 'a'
        }
        let errCode = '401'
        await requestVideoDestUriError(testNum, done, fileUri, errCode)
      });

    /**
     * @tc.name   request_video_photoAsset_static_imageAsset
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2300
     * @tc.desc   request video with photoAsset : imageAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_photoAsset_static_imageAsset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_photoAsset_static_imageAsset';
        try {
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri = createSandboxFileUri(testContext, 'mp4');

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          }
          const handler = new ESMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler)
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   request_video_fileUri_static_image
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2400
     * @tc.desc   request video with fileUri : ***.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_fileUri_static_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_fileUri_static_image';
        try {
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri = createSandboxFileUri(testContext, 'jpg');

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          }
          const handler = new ESMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler)
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   request_video_fileUri_imageUri_photoAsset_static_imageAsset
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2500
     * @tc.desc   request video with fileUri: ***.jpg, photoAsset: imageAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_fileUri_imageUri_photoAsset_static_imageAsset',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_fileUri_imageUri_photoAsset_static_imageAsset';
        try {
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri = createSandboxFileUri(testContext, 'jpg');

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          }
          const handler = new ESMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler)
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   request_video_fileUri_empty_static_string
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_2600
     * @tc.desc   request video with fileUri = 'test.mp4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_video_fileUri_empty_static_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_video_fileUri_empty_static_string';
        let fileUri = ''
        let errCode = '401'
        await requestVideoDestUriError(testNum, done, fileUri, errCode)
      });

    /**
     * @tc.name   request_hdr_video_fileUri_imageUri_photoAsset_compatible_static_onprogress
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_7800
     * @tc.desc   request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_hdr_video_fileUri_imageUri_photoAsset_compatible_static_onprogress',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_hdr_video_fileUri_imageUri_photoAsset_compatible_static_onprogress';
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "test_hdr_1.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');
          status = false;

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
            mediaAssetProgressHandler: new TestHandler(),
          };
          const handler = new SMediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri,
            handler);
          let uri = await createVideoBySandBoxUri(testNum, testContext, destUri);
          let flag = await isHdr(testNum, uri);
          expect(flag).assertEqual(0);
          expect(status).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          done();
        }
      });

    /**
     * @tc.name   request_hdr_video_fileUri_imageUri_photoAsset_static_compatible
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_STATIC_7900
     * @tc.desc   request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_hdr_video_fileUri_imageUri_photoAsset_static_compatible',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_hdr_video_fileUri_imageUri_photoAsset_static_compatible';
        try {
          let fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "test_hdr_1.mp4");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');
          count = 0;
          let opsList: Array<photoAccessHelper.RequestOptions> = [];

          let requestOptions1: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          };

          let requestOptions2: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          };
          opsList.push(requestOptions1, requestOptions2);

          const handler = new CMediaHandler();

          for (let i = 0; i < opsList.length; i++) {
            await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, opsList[i], destUri,
              handler);
            await sleep(3000);
            let uri = await createVideoBySandBoxUri(testNum, testContext, destUri);
            let flag = await isHdr(testNum, uri);
            expect(flag).assertEqual(1);
          }
          expect(count).assertEqual(2);
          done();
        } catch (error) {
          done();
        }
      });
  });
}