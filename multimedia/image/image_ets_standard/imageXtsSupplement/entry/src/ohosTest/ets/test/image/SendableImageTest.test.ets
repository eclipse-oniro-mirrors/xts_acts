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
import { image, sendableImage } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'ImageXts.SendableImage';

export default function SendableImageTest() {
  describe('SendableImageTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_001
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_001
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_001", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_001';
      try {
        AppStorage.setOrCreate('key', null);
        let size:image.Size = AppStorage.get('key') as ESObject;
        let receiver = sendableImage.createImageReceiver(size,image.ImageFormat.JPEG ,1 );
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_002
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_002
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_002", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_002';
      try {
        AppStorage.setOrCreate('key', undefined);
        let size:image.Size = AppStorage.get('key') as ESObject;
        let receiver = sendableImage.createImageReceiver(size,image.ImageFormat.JPEG ,1 );
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_003
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_003
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_003", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_003';
      try {
        AppStorage.setOrCreate('key', '');
        let size:image.Size = AppStorage.get('key') as ESObject;
        let receiver = sendableImage.createImageReceiver(size,image.ImageFormat.JPEG ,1 );
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_004
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_004
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_004", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_004';
      try {
        AppStorage.setOrCreate('key', null);
        let format:image.ImageFormat = AppStorage.get('key') as ESObject;
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        let receiver = sendableImage.createImageReceiver(size,format,1 );
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_005
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_005
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_005", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_005';
      try {
        AppStorage.setOrCreate('key', undefined);
        let format:image.ImageFormat = AppStorage.get('key') as ESObject;
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        let receiver = sendableImage.createImageReceiver(size,format,1 );
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_006
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_006
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_006", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_006';
      try {
        AppStorage.setOrCreate('key', '');
        let format:image.ImageFormat = AppStorage.get('key') as ESObject;
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        let receiver = sendableImage.createImageReceiver(size,format,1 );
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_007
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_007
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_007", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_007';
      try {
        AppStorage.setOrCreate('key', null);
        let messageSequence: rpc.MessageSequence = AppStorage.get('key') as ESObject;
        let pixel_map = sendableImage.createPixelMapFromParcel(messageSequence);
        console.info(TAG,testName,'SUCCEED',pixel_map);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_008
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_008
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_008", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_008';
      try {
        AppStorage.setOrCreate('key', undefined);
        let messageSequence: rpc.MessageSequence = AppStorage.get('key') as ESObject;
        let pixel_map = sendableImage.createPixelMapFromParcel(messageSequence);
        console.info(TAG,testName,'SUCCEED',pixel_map);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_009
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_009
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_009", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_009';
      try {
        AppStorage.setOrCreate('key', '');
        let messageSequence: rpc.MessageSequence = AppStorage.get('key') as ESObject;
        let pixel_map = sendableImage.createPixelMapFromParcel(messageSequence);
        console.info(TAG,testName,'SUCCEED',pixel_map);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })


    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_010
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_010
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_010", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_010';
      try {
        AppStorage.setOrCreate('key', null);
        let surfaceId:string = AppStorage.get('key') as ESObject;
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        sendableImage.createPixelMapFromSurface(surfaceId, region).then(() => {
          console.info(TAG,'Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertUndefined();
          done();
        });
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_011
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_011
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_011", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_011';
      try {
        AppStorage.setOrCreate('key', undefined);
        let surfaceId:string = AppStorage.get('key') as ESObject;
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        sendableImage.createPixelMapFromSurface(surfaceId, region).then(() => {
          console.info(TAG,'Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertUndefined();
          done();
        });
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_012
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_012
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_012", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_012';
      try {
        AppStorage.setOrCreate('key', '');
        let surfaceId:string = AppStorage.get('key') as ESObject;
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        sendableImage.createPixelMapFromSurface(surfaceId, region).then(() => {
          console.info(TAG,'Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertUndefined();
          done();
        });
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_013
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_013
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_013", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_013';
      try {
        AppStorage.setOrCreate('key', null);
        let region:image.Region = AppStorage.get('key') as ESObject;
        sendableImage.createPixelMapFromSurface('', region).then(() => {
          console.info(TAG,'Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('62980105');
          done();
        });
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_014
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_014
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_014", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_014';
      try {
        AppStorage.setOrCreate('key', undefined);
        let region:image.Region = AppStorage.get('key') as ESObject;
        sendableImage.createPixelMapFromSurface('', region).then(() => {
          console.info(TAG,'Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('62980105');
          done();
        });
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_015
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_015
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_015", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_015';
      try {
        AppStorage.setOrCreate('key', '');
        let region:image.Region = AppStorage.get('key') as ESObject;
        sendableImage.createPixelMapFromSurface('', region).then(() => {
          done();
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('62980105');
          done();
        });
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error).assertFail();
        done();
      }
    })

    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_016
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_016
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_016", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_016';
      try {
        AppStorage.setOrCreate('key', null);
        let pixelMap : image.PixelMap = AppStorage.get('key') as ESObject;
        let sendablePixelMap  = sendableImage.convertFromPixelMap(pixelMap);
        console.info(TAG,'SUCCEED',sendablePixelMap);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('62980104');
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_017
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_017
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_017", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_017';
      try {
        AppStorage.setOrCreate('key', undefined);
        let pixelMap : image.PixelMap = AppStorage.get('key') as ESObject;
        let sendablePixelMap  = sendableImage.convertFromPixelMap(pixelMap);
        console.info(TAG,'SUCCEED',sendablePixelMap);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('62980104');
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_018
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_018
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_018", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_018';
      try {
        AppStorage.setOrCreate('key', '');
        let pixelMap : image.PixelMap = AppStorage.get('key') as ESObject;
        let sendablePixelMap  = sendableImage.convertFromPixelMap(pixelMap);
        console.info(TAG,'SUCCEED',sendablePixelMap);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('62980104');
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_019
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_019
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_019", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_019';
      try {
        AppStorage.setOrCreate('key', null);
        let sendablePixelMap : sendableImage.PixelMap = AppStorage.get('key') as ESObject;
        let pixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('62980104');
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_020
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_020
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_020", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_020';
      try {
        AppStorage.setOrCreate('key', undefined);
        let sendablePixelMap : sendableImage.PixelMap = AppStorage.get('key') as ESObject;
        let pixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('62980104');
        done();
      }
    })
    /**
     * @tc.number    SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_021
     * @tc.name      SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_021
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_021", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_021';
      try {
        AppStorage.setOrCreate('key', '');
        let sendablePixelMap : sendableImage.PixelMap = AppStorage.get('key') as ESObject;
        let pixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('62980104');
        done();
      }
    })
  })
}

