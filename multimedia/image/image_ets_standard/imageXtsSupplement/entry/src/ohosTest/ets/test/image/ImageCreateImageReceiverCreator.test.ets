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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'Image.ImageReceiverCreator';

export default function ImageCreateImageReceiverCreator() {
  describe('ImageCreateImageReceiverCreator', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('empty','')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('empty')
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_001
     * @tc.desc   Test createImageReceiver with size:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_001';
      const ImageFormat = image.ImageFormat.JPEG;
      const capacity = 1
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(null,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_002
     * @tc.desc   Test createImageReceiver with size :undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_002';
      const ImageFormat = image.ImageFormat.JPEG;
      const capacity = 1
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(undefined,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_003
     * @tc.desc   Test createImageReceiver with size ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_003';
      let size: image.Size = AppStorage.get('empty') as ESObject;
      const ImageFormat = image.ImageFormat.JPEG;
      const capacity = 1
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(size,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_004
     * @tc.desc   Test createImageReceiver with format:ImageFormat.YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_004';
      let size: image.Size = { height: 8192, width: 8192 }
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(size,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_005
     * @tc.desc   Test createImageReceiver with size null,ImageFormat.YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_005';
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(null,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_006
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_006
     * @tc.desc   Test createImageReceiver with size undefined,ImageFormat.YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_006';
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(undefined,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_007
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_007
     * @tc.desc   Test createImageReceiver with size:'',ImageFormat.YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_SUPP_007';
      let size: image.Size = AppStorage.get('empty') as ESObject;
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let receiver: image.ImageReceiver = image.createImageReceiver(size,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, receiver);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_001
     * @tc.desc   Test createImageCreator with size ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_001';
      let size: image.Size = AppStorage.get('empty') as ESObject;
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(size,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_002
     * @tc.desc   Test createImageCreator with size null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_002';
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(null,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_003
     * @tc.desc   Test createImageCreator with size undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_003';
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(undefined,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_004
     * @tc.desc   Test createImageCreator with ImageFormat :YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_004';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(size,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_005
     * @tc.desc   Test createImageCreator with size:null ImageFormat :YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_005';
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(null,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_006
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_006
     * @tc.desc   Test createImageCreator with size:undefined ImageFormat :YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_006';
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(undefined,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_007
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_007
     * @tc.desc   Test createImageCreator with size:'', ImageFormat :YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_CREATOR_SUPP_007';
      let size: image.Size = AppStorage.get('empty') as ESObject;
      const ImageFormat: image.ImageFormat = image.ImageFormat.YCBCR_422_SP;
      const capacity: number = 100;
      try{
        let creator: image.ImageCreator = image.createImageCreator(size,ImageFormat, capacity);
        console.info(TAG, testName,`receiver success`, creator);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })




  })
}